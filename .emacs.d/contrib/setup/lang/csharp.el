(require 'setup/package)

(package-install 'omnisharp)

(eval-after-load
    'company
  '(add-to-list 'company-backends #'company-omnisharp))

(defun dotemacs--setup-csharp-mode ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (setq indent-tabs-mode nil
        c-syntactic-indentation t)

  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)

  ;; csharp-mode README.md recommends this too
  (if (>= emacs-major-version 25)
      (electric-pair-local-mode 1)
    (electric-pair-mode 1))

  (local-set-key (kbd "C-c r r") #'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") #'recompile))

(add-hook 'csharp-mode-hook #'dotemacs--setup-csharp-mode t)

(omnisharp--install-server nil t)

(provide 'setup/lang/csharp)
