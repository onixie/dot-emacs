
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
     (string-prefix-p "magit: " name t)
     (string-prefix-p "*Completions" name t)
     (string-prefix-p "*Calendar" name t)
     ;; (string-prefix-p "*helm" name t)
     ;; (string-prefix-p "*Compile-Log*" name t)
     ;; (string-prefix-p "*lsp" name t)
     ;; (string-prefix-p "*tramp" name t)
     (apply orig-fun args)
     )))

(use-package centaur-tabs
  :ensure t
  :config
  (setq centaur-tabs-style "wave"
	centaur-tabs-set-modified-marker t
	centaur-tabs-set-icons t
	centaur-tabs-cycle-scope 'tabs)

  (advice-add 'centaur-tabs-project-name :around #'dot-emacs::centaur-tabs-project-name)
  (advice-add 'centaur-tabs-buffer-groups :around #'dot-emacs::centaur-tabs-buffer-groups)
  (advice-add 'centaur-tabs-hide-tab :around #'dot-emacs::centaur-tabs-hide-tab)

  (centaur-tabs-change-fonts "Ubuntu Mono" 120)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)

  (dot-emacs::centaur-tabs-show-groups)

  :bind (("<S-left>" . #'centaur-tabs-backward)
	 ("<S-right>". #'centaur-tabs-forward)
	 ("<S-up>"   . #'dot-emacs::centaur-tabs-show-groups)
	 ("<S-down>" . #'dot-emacs::centaur-tabs-hide-groups)))

(provide 'setup/emacs/tabs)
