(use-package kotlin-mode :ensure t
  :hook
  ((kotlin-mode . lsp)
   )
  :custom
  (lsp-clients-kotlin-server-executable "~/workdir/kotlin-language-server/kotlin-language-server-launcher"))

(provide 'setup/lang/kotlin)
