(require 'setup/package)

(package-install 'yaml-mode)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

(package-install 'markdown-mode)
(package-install 'markdown-mode+)

(provide 'setup/lang/markup)
