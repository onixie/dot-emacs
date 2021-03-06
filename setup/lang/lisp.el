;; -*- lexical-binding: t; -*-

(use-package slime :ensure t
  :config
  (use-package slime-docker :ensure t)
  (when (or (load (file-truename "~/quicklisp/slime-helper.el") t)
            (require 'slime))

    (setq slime-header-line-p nil
          slime-kill-without-query-p t
          slime-repl-history-remove-duplicates t
          slime-repl-history-trim-whitespaces t
          slime-docker-implementations `((sbcl ("sbcl") :coding-system 'utf-8-unix :mounts (((,(file-truename "~/workdir/") . "/home/lisp/quicklisp/local-projects/"))))))

    (defmacro defrun-lisp-impl (name command &rest key-args)
      (setq slime-lisp-implementations
            (cons `(,name ,(split-string command) ,@key-args) slime-lisp-implementations))
      `(defun ,(dot-emacs::intern* "run-" name) ()
         (interactive)
         (slime ',name)))

    (defrun-lisp-impl clisp "clisp" :coding-system utf-8-unix)
    (defrun-lisp-impl ccl "ccl" :coding-system utf-8-unix)
    (defrun-lisp-impl sbcl "sbcl" :coding-system utf-8-unix)

    (slime-setup '(slime-fancy ;meta for autodoc, editing-command, fuzzy, scratch, etc.
                   slime-asdf
                   slime-sprof
                   slime-banner
                   slime-tramp))

    (defun slime-repl-insert-prompt ()
      (goto-char slime-repl-input-start-mark)
      (unless slime-repl-suppress-prompt
        (slime-save-marker slime-output-start
          (slime-save-marker slime-output-end
            (unless (bolp) (insert-before-markers "\n"))
            (let ((prompt-start (point))
                  (prompt (format "%s@%s> " (upcase (slime-lisp-implementation-name)) (slime-lisp-package-prompt-string))))
              (slime-propertize-region
                  '(face slime-repl-prompt-face read-only t intangible t
                         slime-repl-prompt t
                         rear-nonsticky (slime-repl-prompt read-only face intangible)
                         start-open t end-open t)
                (insert-before-markers prompt))
              (set-marker slime-repl-prompt-start-mark prompt-start)
              prompt-start)))))

    (setq common-lisp-hyperspec-root (format "file://%s" (file-truename "~/.emacs.d/contrib/hyperspec/")))
    (setq slime-autodoc-use-multiline-p t)

    (add-hook 'slime-mode-hook
              (lambda ()
                (unless (slime-connected-p)
                  (when (eq major-mode 'lisp-mode)
                    (cl-labels ((src-revisit
                                 ()
                                 (remove-hook 'slime-connected-hook #'src-revisit)
                                 (switch-to-buffer (slime-recently-visited-buffer 'lisp-mode))))
                      (add-hook 'slime-connected-hook #'src-revisit t)))
                  (slime))))

    (add-hook 'slime-connected-hook
              (lambda ()
                (define-key easy-buffer-mode-map (kbd "C-c s") 'slime-selector) ; Enable Slime-selector
                (define-key easy-buffer-mode-map (kbd "<kp-prior>") (kbd "C-c s r")) ;do not use slime-repl because it changes widnows
                (define-key easy-buffer-mode-map (kbd "<kp-right>") (kbd "C-c s i"))
                (define-key easy-buffer-mode-map (kbd "<kp-next>") (kbd "C-c s v")) ; do not use slime-events-buffer directly, it might create even slime not start
                (define-key easy-buffer-mode-map (kbd "<prior>") (kbd "<kp-prior>"))
                (define-key easy-buffer-mode-map (kbd "<next>") (kbd "<kp-next>"))))

    (defadvice slime-kill-all-buffers (after restore-key-bindings activate)
      (define-key easy-buffer-mode-map (kbd "C-c s") nil)
      (define-key easy-buffer-mode-map (kbd "<kp-prior>") 'scroll-down) ; Kludge: store then restore must be better than this.
      (define-key easy-buffer-mode-map (kbd "<kp-right>") nil)
      (define-key easy-buffer-mode-map (kbd "<kp-next>") 'scroll-up)
      (define-key easy-buffer-mode-map (kbd "<prior>") 'scroll-down)
      (define-key easy-buffer-mode-map (kbd "<next>") 'scroll-up)
      ad-return-value)

    (let ((fasls-dir "/tmp/slime-fasls/"))
      (setq slime-compile-file-options `(:fasl-directory ,fasls-dir))
      (make-directory fasls-dir t))))

;;;;;;;;;;;;;;;; Scheme Programming ;;;;;;;;;;;;;;;;
(use-package quack :ensure t
  :custom
  (quack-browse-url-browser-function 'quack-w3m-browse-url-other-window)
  (quack-default-program "racket")
  (quack-fontify-style 'emacs)
  (quack-global-menu-p nil)
  (quack-pretty-lambda-p t))

(use-package geiser :ensure t)

(use-package scribble-mode :ensure t)

(defadvice run-geiser (after good-geiser-run last activate)
  (let ((cur-buf (current-buffer)))
    (geiser-syntax--font-lock-buffer)
    (set-process-query-on-exit-flag (get-buffer-process cur-buf) nil)
    (switch-to-buffer cur-buf))
  ad-return-value)

(defadvice run-scheme (after good-quack-run last activate)
  (let ((cur-buf (current-buffer)))
    (set-process-query-on-exit-flag (get-buffer-process cur-buf) nil))
  ad-return-value)

(defadvice geiser-repl--save-remote-data (around no-setq-head-line-format (address) activate)
  (setq geiser-repl--address address)
  ;; (setq header-line-format (and address
  ;;                               (format "Host: %s   Port: %s"
  ;;                                       (geiser-repl--host)
  ;;                                       (geiser-repl--port))))
  )

(mapc (lambda (hook)
        (add-hook hook
                  (lambda ()
                    (switch-to-buffer (prog1
                                          (current-buffer)
                                        (switch-to-racket))))
                  t))
      (list 'scheme-mode-hook))

;;;;;;;;;;;;;;;; Lisp/Elisp Programming ;;;;;;;;;;;;;;;;
(defun delete-sexp (&optional arg)
  "Delete the sexp (balanced expression) following point.
With ARG, delete that many sexps after point.
Negative arg -N means delete N sexps before point.
This command assumes point is not in a string or comment."
  (interactive "p")
  (let ((opoint (point)))
    (forward-sexp (or arg 1))
    (delete-region opoint (point))))

(defun hug-sexp-a-hug ()
  "Insert a pair of parenthesis around the sexp at point"
  (interactive)
  (let ((balance-p (condition-case nil (prog1 t (check-parens))
                     (error nil))))
    (if balance-p
        (progn
          (insert ?\()
          (forward-sexp)
          (insert ?\))
          (backward-sexp)
          (forward-char)
          t)
      nil)))

(defun rip-sexp-a-hug ()
  "Delete surrounding parenthesis and the first sexp in it"
  (interactive)
  (backward-up-list)
  (forward-sexp)
  (backward-delete-char 1)
  (backward-up-list)
  (delete-char 1)
  (kill-sexp))

(defun replace-sexp-at-point ()
  (interactive)
  (save-excursion
    (yank 1)
    (delete-sexp 1)))

(setq semantic-idle-scheduler-idle-time 0.5
      semantic-inhibit-functions (list (lambda () (memq major-mode '(lisp-mode scheme-mode emacs-lisp-mode)))))

(defvar dot-emacs::*all-lisp-modes*
  '(emacs-lisp-mode
    ielm-mode
    lisp-interaction-mode
    lisp-mode
    slime-repl-mode
    inferior-lisp-mode
    scheme-mode
    geiser-repl-mode
    inferior-scheme-mode))

(mapc (lambda (mode)
        (add-hook (dot-emacs::intern* mode "-hook")
                  (lambda ()
                    (eldoc-mode 1)
                    (paredit-mode 1)
                    (rainbow-delimiters-mode 1)

                    (let ((map (symbol-value (dot-emacs::intern* mode "-map"))))
                      (define-key map (kbd "C-S-r") #'replace-sexp-at-point)
                      (define-key map (kbd "C-S-i") #'hug-sexp-a-hug)
                      (define-key map (kbd "C-S-o") #'rip-sexp-a-hug)))))
      dot-emacs::*all-lisp-modes*)

(mapc (lambda (hook)
        (dot-emacs::kill-buffer-and-window-on "\\(?:finished\\|exited\\|killed\\|quit\\)"))
      '(ielm-mode-hook
        inferior-scheme-mode-hook))

(define-key lisp-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)

(setq magic-mode-alist nil)
(add-to-list 'magic-mode-alist '("#lang[[:space:]]+racket" . scheme-mode))
(add-to-list 'magic-mode-alist '("#!\\(.+/\\)*racket[[:space:]]*$" . scheme-mode))
(add-to-list 'magic-mode-alist '("#lang[[:space:]]+scribble" . scribble-mode))
(add-to-list 'magic-mode-alist '("#!\\(.+/\\)*sbcl[[:space:]]+--script$" . lisp-mode))

;; ;; Switching () and [] keys, I don't like it.
;; ;; But it really relieves my fingers' wrick :P
;; (swap-key-translation (kbd "(") (kbd "["))
;; (swap-key-translation (kbd ")") (kbd "]"))

(provide 'setup/lang/lisp)
