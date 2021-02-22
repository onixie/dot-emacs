(use-package kotlin-mode :ensure t
  :hook
  ((kotlin-mode . lsp)
   )
  :custom
  (lsp-clients-kotlin-server-executable "~/workdir/kotlin-language-server/launcher.sh"))

(provide 'setup/lang/kotlin)
