(use-package lsp-java :ensure t
  :config
  (add-hook 'lsp-mode-hook #'lsp-lens-mode)
  :hook
  ((java-mode . lsp)
   (java-mode . lsp-java-boot-lens-mode)))

(use-package dap-java)

(provide 'setup/lang/java)
