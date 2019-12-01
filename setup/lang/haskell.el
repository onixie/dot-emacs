(use-package haskell-mode :ensure t
  ;;:config
  ;; (require 'haskell-process)
  ;; (require 'haskell-interactive-mode)
  :custom 
  (haskell-process-type 'cabal-repl)
  (haskell-process-suggest-remove-import-lines t)
  (haskell-process-auto-import-loaded-modules t)
  (haskell-process-log t)
  :hook 
  ((inferior-haskell-mode . eldoc-mode)
   (inferior-haskell-mode . dot-emacs::dot-emacs::kill-buffer-and-window-on-process-die))
  )

(use-package lsp-haskell :ensure t
  :requires (lsp haskell-mode)
  :custom
  (lsp-haskell-process-wrapper-function 
   (lambda (argv)
     (let ((root (lsp-haskell--get-root)))
       (append
	(append (list "nix-shell" "--argstr" "projectRoot" root "-I" "." "--command" )
		(list (mapconcat #'identity argv " ")))
	(list root)))))
  :hook
  ((haskell-mode . lsp)))

(provide 'setup/lang/haskell)
