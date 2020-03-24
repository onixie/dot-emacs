;; -*- lexical-binding: t; -*-

(use-package nix-mode :ensure t
  :mode ("\\.nix\\'" "\\.nix.in\\'")
  :custom
  (nix-indent-function 'nix-indent-line)
  )

(use-package nix-drv-mode
  :ensure nix-mode
  :mode "\\.drv\\'")

(use-package nix-shell
  :ensure nix-mode
  :commands (nix-shell-unpack nix-shell-configure nix-shell-build))

(defun dot-emacs::ctrl+ (c)
  (logand #b10011111 c))

(defun dot-emacs::nix-repl-tab-complete ()
  (interactive)
  (let* ((proc   (get-buffer-process (get-buffer "*Nix-REPL*")))
         (pflt   (process-filter proc))
         (start  (marker-position (process-mark proc)))
         (end    (point))
         (prefix (if (> end start) (buffer-substring start end))))
    (when prefix
      (comint-send-string proc (concat prefix "\t"))
      (set-process-filter proc
       (lambda (proc output)
         ;; flush the outputs
         (funcall pflt proc output)
         (let ((new-start (comint-line-beginning-position)))
           ;; final touch for the last output or auto-completion
           (when (or (string-match comint-prompt-regexp output)                     ; last trunk of output
                     (= (line-number-at-pos start) (line-number-at-pos new-start))) ; auto-completed by nix repl
             (set-process-filter proc pflt)
             (let ((inhibit-read-only t))
               ;; remove read-only property
               (set-text-properties new-start (point) ())
               ;; remove any input so far in nix repl
               (comint-send-string proc (string (dot-emacs::ctrl+ ?a)
                                                (dot-emacs::ctrl+ ?k)))
               ;; use the auto-completed as input instead of original user input
               (when (= (line-number-at-pos start) (line-number-at-pos new-start))
                 (comint-kill-input)
                 (insert (string-remove-suffix (string ?\a) output)))))))))))

(use-package nix-repl
  :ensure nix-mode
  :commands (nix-repl)
  :custom
  (comint-use-prompt-regexp t)
  :bind
  (:map nix-repl-mode-map
        ("<tab>" . dot-emacs::nix-repl-tab-complete))
  :hook
  ((nix-repl-mode . dot-emacs::kill-buffer-and-window-on-process-die)
   (nix-repl-mode . ansi-color-for-comint-mode-on))
  )

(use-package nixos-options
  :defer t)

(provide 'setup/lang/nix)
