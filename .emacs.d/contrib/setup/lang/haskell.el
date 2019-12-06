(require 'setup/package)

(package-install 'haskell-mode)
(package-install 'lsp-haskell)

(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(require 'lsp)
(require 'lsp-haskell)

(add-hook 'haskell-mode-hook #'lsp)

(setq haskell-process-type 'cabal-repl
      haskell-process-suggest-remove-import-lines t
      haskell-process-auto-import-loaded-modules t
      haskell-process-log t
      lsp-haskell-process-wrapper-function (lambda (argv)
                                             (let ((root (lsp-haskell--get-root)))
                                               (append
                                                (append (list "nix-shell" "--argstr" "projectRoot" root "-I" "." "--command" )
                                                        (list (mapconcat #'identity argv " ")))
                                                (list root)))))

(add-hook 'inferior-haskell-mode-hook (lambda () (eldoc-mode)))
(add-hook 'inferior-haskell-mode-hook (dot-emacs--kill-buffer-and-window-when-process "\\(?:finished\\|exited\\|killed\\|quit\\)"))

(provide 'setup/lang/haskell)
