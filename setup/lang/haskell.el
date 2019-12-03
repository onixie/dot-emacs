(use-package haskell-mode :ensure t
  :custom
  (haskell-process-type 'cabal-repl)
  (haskell-process-suggest-remove-import-lines t)
  (haskell-process-auto-import-loaded-modules t)
  (haskell-process-log t)
  :hook
  ((haskell-mode . flycheck-mode)
   (haskell-mode . interactive-haskell-mode)
   (interactive-haskell-mode . eldoc-mode)
   (interactive-haskell-mode . dot-emacs::kill-buffer-and-window-on-process-die)))

(use-package lsp-haskell :ensure t
  :custom
  (lsp-haskell-process-wrapper-function
   (lambda (argv)
     (let ((root (lsp-haskell--get-root)))
       (list "nix-shell" "-I" "."
             "--argstr" "projectRoot" root
             "--command" (mapconcat #'identity argv " ")
             root))))
  :bind
  (:map interactive-haskell-mode-map
        ("M-." . lsp-find-definition))
  :hook
  ((haskell-mode . lsp)
   (haskell-mode . (lambda () (add-to-list 'company-backends #'company-lsp)))))

(provide 'setup/lang/haskell)
