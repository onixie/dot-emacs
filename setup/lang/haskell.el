(defun dot-emacs::haskell-process-nix-wrapper (argv)
  (let ((root (lsp-haskell--get-root)))
    (list "nix-shell" "-I" "."
          "--argstr" "projectRoot" root
          "--command" (mapconcat #'identity argv " ")
          root)))

(use-package haskell-mode :ensure t
  :custom
  (haskell-process-wrapper-function #'dot-emacs::haskell-process-nix-wrapper)
  (haskell-process-type 'cabal-new-repl)
  (haskell-process-suggest-remove-import-lines t)
  (haskell-process-auto-import-loaded-modules t)
  (haskell-process-log t)
  :hook
  ((haskell-mode . flycheck-mode)
   (haskell-mode . interactive-haskell-mode)
   (interactive-haskell-mode . eldoc-mode)
   (interactive-haskell-mode . dot-emacs::kill-buffer-and-window-on-process-die)))

(use-package lsp-haskell :ensure t :after haskell-mode
  :custom
  (lsp-haskell-process-wrapper-function #'dot-emacs::haskell-process-nix-wrapper)
  :bind
  (:map haskell-mode-map
        ("<f12>" . lsp-find-definition))
  :hook
  ((haskell-mode . lsp)))

(provide 'setup/lang/haskell)
