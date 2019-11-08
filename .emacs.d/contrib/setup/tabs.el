(require 'setup/package)

(package-install 'centaur-tabs)
(require 'centaur-tabs)

(setq centaur-tabs-style "wave"
      centaur-tabs-set-modified-marker t
      centaur-tabs-set-icons t
      centaur-tabs-cycle-scope 'tabs)

(centaur-tabs-change-fonts "Ubuntu Mono" 120)
(centaur-tabs-headline-match)
(centaur-tabs-mode t)

(defun dotemacs--override-centaur-tabs-project-name (orig-fun &rest args)
  (let ((res (apply orig-fun args)))
    (replace-regexp-in-string "Project:.*/\\(.*\\)/" "Project: \\1" res)))

(advice-add 'centaur-tabs-project-name :around #'dotemacs--override-centaur-tabs-project-name)

(defun dotemacs--override-centaur-tabs-buffer-groups (orig-fun &rest args)
  (list
   (cond
    ((or (memq major-mode '(shell-mode term-mode ansi-term-mode eshell-mode)))
     "Shell")
    (t
     (car (apply orig-fun args))))))

(advice-add 'centaur-tabs-buffer-groups :around #'dotemacs--override-centaur-tabs-buffer-groups)

(defun dotemacs--override-centaur-tabs-hide-tab (orig-fun &rest args)
  (let ((name (format "%s" (first args))))
    (or
     (string-prefix-p "*Packages" name t)
     (string-prefix-p "*debug" name t)
     (string-prefix-p "*trace" name t)
     (string-prefix-p "magit: " name t)
     ;; (string-prefix-p "*Completions" name t)
     ;; (string-prefix-p "*helm" name t)
     ;; (string-prefix-p "*Compile-Log*" name t)
     ;; (string-prefix-p "*lsp" name t)
     ;; (string-prefix-p "*tramp" name t)
     (apply orig-fun args)
     )))

(advice-add 'centaur-tabs-hide-tab :around #'dotemacs--override-centaur-tabs-hide-tab)

(provide 'setup/tabs)
