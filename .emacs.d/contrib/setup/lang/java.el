(require 'setup/package)


(package-install 'lsp-java)
(require 'lsp)
(require 'lsp-java)
(require 'lsp-java-boot)

(add-hook 'java-mode-hook #'lsp)
;(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
;(add-hook 'lsp-mode-hook #'lsp-lens-mode)

(package-install 'dap-mode)
(require 'dap-mode)
(require 'dap-java)
(dap-ui-mode 1)

(provide 'setup/lang/java)
