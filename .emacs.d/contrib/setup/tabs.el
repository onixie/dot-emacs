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
    ((or (string-suffix-p "shell*" (buffer-name) t)
         (string-suffix-p "term*"  (buffer-name) t)
         )
     "Shell")
    (t
     (car (apply orig-fun args))))))

(advice-add 'centaur-tabs-buffer-groups :around #'dotemacs--override-centaur-tabs-buffer-groups)

(defun centaur-tabs-hide-tab (x)
  (let ((name (format "%s" x)))
    (or
     (string-prefix-p "*Completions" name)
     (string-prefix-p "*Packages" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (and (string-prefix-p "magit" name)
          (not (file-name-extension name)))
     )))

(provide 'setup/tabs)
