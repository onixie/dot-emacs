;;; -*- lexical-binding: t; -*-

(defun dot-emacs::intern* (&rest args)
  "Make an interned symbol with name formed by concatenating the strings/numbers/symbols"
  (intern (mapconcat (lambda (name)
                       (cond ((symbolp name) (symbol-name name))
                             ((numberp name) (number-to-string name))
                             ((stringp name) name)
                             (t (error "unknown type"))))
                     args "")))

(defun dot-emacs::swap-key-bindings (key1 key2)
  "Swap key bindings in key-translation-map"
  (define-key key-translation-map key1 key2)
  (define-key key-translation-map key2 key1))

(defun dot-emacs:insert-date ()
  (interactive)
  (insert (shell-command-to-string "date")))

(defun dot-emacs:insert-pretty-control-line ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (insert ?\xC)
  (next-line))

(defun dot-emacs::kill-buffer-and-window-on (match-regex)
  (lambda ()
    (let ((process (get-buffer-process (current-buffer))))
      (when (processp process)
        (set-process-query-on-exit-flag process nil)
        (set-process-sentinel process
                              (lambda (proc change)
                                (when (string-match match-regex change)
                                  (ignore-errors
                                    (let* ((b (process-buffer proc))
                                           (w (get-buffer-window b)))
                                      (kill-buffer b)
                                      (delete-window w))))))))))

(defun dot-emacs::kill-buffer-and-window-on-process-die ()
  (funcall (dot-emacs::kill-buffer-and-window-on "\\(?:finished\\|exited\\|killed\\|quit\\)")))

(defun dot-emacs::open-shell (path)
  (cl-labels ((calc-buffer-name (path)
                                (let ((name system-name)
                                      (pos 0))
                                  (block nil
                                    (while (or (string-match ":\\([^:|/]+\\)\\(?:[:]\\)" path pos)
                                               (return name))
                                      (setq name (match-string 1 path)
                                            pos (match-end 0)))))))
    (let ((buffer (generate-new-buffer (calc-buffer-name path))))
      (setf (buffer-local-value 'default-directory buffer)
            (if (string-suffix-p ":" path)
                (concat path "/") ;Workaround for tramp hang issue
              path))
      (shell buffer))))

(defun dot-emacs::remove-scheme (uri)
  (when uri (replace-regexp-in-string "[^/:]+://" "" uri)))

(defvar dot-emacs::last-refreshed-time nil)
(defun dot-emacs::funcall-after (interval func &rest args)
  (load "~/.emacs.d/last-refreshed-time.el" t)
  (print dot-emacs::last-refreshed-time)
  (unless (and dot-emacs::last-refreshed-time
               interval
               (time-less-p (time-subtract (current-time) dot-emacs::last-refreshed-time)
                            (seconds-to-time interval)))
    (apply func args)
    (write-region (format "(setq dot-emacs::last-refreshed-time '%s)" (current-time)) nil "~/.emacs.d/last-refreshed-time.el") t))

(defun dot-emacs::mouse-start-rectangle-mark (start-event)
  (interactive "e")
  (deactivate-mark)
  (mouse-set-point start-event)
  (rectangle-mark-mode +1)
  (cl-labels ((calculate-column (point)
                                (save-excursion
                                  (goto-char point)
                                  (beginning-of-line)
                                  (- point (point)))))

    (let ((drag-event))
      (track-mouse
        (while (progn
                 (setq drag-event (read-event))
                 (mouse-movement-p drag-event))
          (let ((extra (- (car (posn-actual-col-row (event-end drag-event))) (calculate-column (line-end-position)))))
            (if (> extra 0)
                (rectangle-forward-char extra )))
          (mouse-set-point drag-event))))))

(defun dot-emacs::project-try-find (identifiers)
  (cl-labels ((parent-directory (path)
                                (let ((parent (file-name-directory (directory-file-name path))))
                                  (unless (string-equal path parent)
                                    parent)))
              (find-project (path)
                            (when path
                              (if (cl-intersection (directory-files path) identifiers :test #'string-equal)
                                  (cons 'transient path)
                                (find-project (parent-directory path))))
                            ))
    #'find-project))

(defun dot-emacs::xah-pop-local-mark-ring ()
  "Move cursor to last mark position of current buffer.
Call this repeatedly will cycle all positions in `mark-ring'.
URL `http://ergoemacs.org/emacs/emacs_jump_to_previous_position.html'
Version 2016-04-04"
  (interactive)
  (set-mark-command t))

(defun dot-emacs::sml/center-minions-mode-line ()
  "Setup a mode-line with major and minor modes centered."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((lhs (list (format-mode-line (list
                                "%I " "%p" "%% "
                                mode-line-front-space
                                ;; (when powerline-display-buffer-size
                                ;;    (powerline-buffer-size 'powerline-active1))
                                mode-line-mule-info
                                mode-line-client
                                mode-line-modified
                                mode-line-remote
                                mode-line-frame-identification
                                mode-line-buffer-identification
                                vc-mode))))
                          (rhs (list (format-mode-line (list
                                mode-line-misc-info
                                mode-line-end-spaces))))
                          (center (list (format-mode-line minions-mode-line-modes))))
                     (concat (powerline-render lhs)
                             (powerline-fill-center 'powerline-active1 (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill 'powerline-active1 (powerline-width rhs))
                             (powerline-render rhs)
                             ))))))

(defun dot-emacs:toggle-wrap-line ()
  (interactive)
  (when visual-line-mode
    (visual-line-mode 0))
  (setq word-wrap nil)
  (if truncate-lines
      (toggle-truncate-lines -1)
    (toggle-truncate-lines 1)))

(defun dot-emacs:isearch-current-word-forward (&optional regexp-p no-recursive-edit)
  (interactive "P\np")
  (isearch-mode t (not (null regexp-p)) nil (not no-recursive-edit))
  (isearch-yank-string (current-word)))

(defun dot-emacs:isearch-current-word-backward (&optional regexp-p no-recursive-edit)
  (interactive "P\np")
  (isearch-mode nil (not (null regexp-p)) nil (not no-recursive-edit))
  (isearch-yank-string (current-word)))

(defun dot-emacs:file-manager ()
  (interactive)
  (shell-command "nautilus $(pwd) || thunar $(pwd)" "*Messages*" "*Messages*"))

(defun dot-emacs:terminal ()
  (interactive)
  (shell-command "gnome-terminal --working-directory=$(pwd) || terminal --working-directory=$(pwd)" "*Messages*" "*Messages*"))

(defun dot-emacs:etags ()
  (interactive)
  (shell-command "find ./ -type f -name '*' -print0 | xargs --null etags -R" "*Messages*" "*Messages*"))

(defun dot-emacs::linum-update-window+ (win)
  ;; Adjust window margin with regards to scaled text
  (when (and (bound-and-true-p linum-mode) linum-overlays)
    (let* ((overlay (overlay-properties (car linum-overlays)))
           (num-str (or (plist-get overlay 'linum-str) ""))
           (pad-str (or (plist-get overlay 'before-string) ""))
           (width (+ (length num-str) (length pad-str))))
      (set-window-margins win (ceiling (/ (* width (default-font-width)) (frame-char-width))))
      (set-window-parameter win 'linum--set-margins (window-margins win)))))

(defun dot-emacs::centaur-tabs-show-groups ()
  (interactive)
  (centaur-tabs-buffer-show-groups t)
  (centaur-tabs-display-update))

(defun dot-emacs::centaur-tabs-hide-groups ()
  (interactive)
  (centaur-tabs-buffer-show-groups nil)
  (centaur-tabs-display-update))

(defun dot-emacs::centaur-tabs-project-name (orig-fun &rest args)
  (let ((res (apply orig-fun args)))
    (replace-regexp-in-string "Project:.*/\\(.*\\)/" "Project: \\1" res)))

(defun dot-emacs::centaur-tabs-buffer-groups (orig-fun &rest args)
  (list
   (cond
    ((or (memq major-mode '(shell-mode term-mode ansi-term-mode eshell-mode)))
     "Shell")
    (t
     (car (apply orig-fun args))))))

(defun dot-emacs::centaur-tabs-hide-tab (orig-fun &rest args)
  (let ((name (format "%s" (first args))))
    (or
     (string-prefix-p "*Packages" name t)
     (string-prefix-p "*debug" name t)
     (string-prefix-p "*trace" name t)
     (string-prefix-p "*tramp" name t)
     (string-prefix-p "*xref" name t)
     (string-prefix-p "*Completions" name t)
     (string-prefix-p "*Calendar" name t)
     (string-prefix-p "*Compile-Log*" name t)
     (string-prefix-p "*Buffer List*" name t)
     (string-prefix-p "*Backtrace*" name t)
     (string-prefix-p "*omnisharp" name t)
     (string-prefix-p "*lsp" name t)
     (string-prefix-p "*hie" name t)
     (string-prefix-p "*jdtls" name t)
     (string-prefix-p "*tcp-server-boot-ls" name t)
     (string-prefix-p "OmniServer" name t)
     (string-prefix-p "magit: " name t)
     (string-suffix-p "log*" name t)
     (string-suffix-p "Output*" name t)
     ;; (string-prefix-p "*helm" name t)
     (apply orig-fun args)
     )))

(defun dot-emacs::calendar-exit-with-kill ()
  (interactive)
  (calendar-exit t))

(defun dot-emacs::org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(provide 'setup/base/defs)
