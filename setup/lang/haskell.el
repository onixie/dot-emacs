(use-package haskell-mode :ensure t
  :custom 
  (haskell-process-type 'cabal-repl)
  (haskell-process-suggest-remove-import-lines t)
  (haskell-process-auto-import-loaded-modules t)
  (haskell-process-log t)
  :hook 
  ((inferior-haskell-mode . eldoc-mode)
   (inferior-haskell-mode . dot-emacs::dot-emacs::kill-buffer-and-window-on-process-die)))

(use-package lsp-haskell :ensure t
  :custom
  (lsp-haskell-process-wrapper-function 
   (lambda (argv)
     (let ((root (lsp-haskell--get-root)))
       (append
	(append (list "nix-shell" "--argstr" "projectRoot" root "-I" "." "--command" )
		(list (mapconcat #'identity argv " ")))
	(list root)))))
  :hook
  ((haskell-mode . lsp)
   (haskell-mode . (lambda () (add-to-list 'company-backends #'company-lsp)))))

(provide 'setup/lang/haskell)
