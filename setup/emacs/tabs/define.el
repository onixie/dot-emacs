;;; -*- lexical-binding: t; -*-

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
   (when res
    (replace-regexp-in-string "Project:.*/\\(.*\\)/" "Project: \\1" res))))

(defun dot-emacs::centaur-tabs-buffer-groups (orig-fun &rest args)
  (list
   (cond
    ((or (memq major-mode '(shell-mode term-mode ansi-term-mode eshell-mode)))
     "Shell")
    (t
     (car (apply orig-fun args))))))

(defun dot-emacs::centaur-tabs-hide-tab (orig-fun &rest args)
  (let ((name (format "%s" (car args))))
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
     (string-prefix-p "*system-packages*" name t)
     (string-prefix-p "OmniServer" name t)
     (string-prefix-p "magit: " name t)
     (string-prefix-p "*ansi-term" name t)
     (string-prefix-p "*locals " name t)
     (string-prefix-p "*registers " name t)
     (string-prefix-p "*breakpoints " name t)
     (string-prefix-p "*stack frames " name t)
     (string-prefix-p "*input/output " name t)
     (string-prefix-p "*threads " name t)
     (string-suffix-p "log*" name t)
     (string-suffix-p "Output*" name t)
     (string-suffix-p "*kotlin-ls" name t)
     (string-suffix-p "*rust" name t)
     (string-suffix-p "*cargo" name t)
     ;; (string-prefix-p "*helm" name t)
     (apply orig-fun args)
     )))

(provide 'setup/emacs/tabs/define)
