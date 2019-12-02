(use-package omnisharp :ensure t
  :config
  (omnisharp--install-server nil t)
  :hook
  ((csharp-mode . omnisharp-mode)
   (csharp-mode . flycheck-mode)
   (csharp-mode
    . (lambda ()
	(setq indent-tabs-mode nil
	      c-syntactic-indentation t
	      c-basic-offset 4
	      truncate-lines t
	      tab-width 4)

	(c-set-style "ellemtel")

	;; csharp-mode README.md recommends this too
	(if (>= emacs-major-version 25)
	    (electric-pair-local-mode 1)
	  (electric-pair-mode 1))
	
	(add-to-list 'company-backends #'company-omnisharp))))
  :bind
  (:map csharp-mode-map
	("C-c r r" . omnisharp-run-code-action-refactoring)
	("C-c C-c" . recompile)
	("M-." . omnisharp-go-to-definition)))

(provide 'setup/lang/csharp)
