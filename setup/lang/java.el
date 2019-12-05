(use-package lsp-java :ensure t
  :config
  (lsp-java--locate-server-jar)
  :hook
  ((java-mode . lsp)
   (java-mode . lsp-java-boot-lens-mode)))

(use-package dap-java)

(provide 'setup/lang/java)
