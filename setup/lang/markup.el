(use-package yaml-mode :ensure t
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(use-package markdown-mode :ensure t
  :init (use-package markdown-mode+ :ensure t)
  :mode ("\\.markdown\\'" "\\.mdown\\'" "\\.mkdn\\'" "\\.mkd\\'" "\\.md\\'"))

(use-package systemd :ensure t)

(provide 'setup/lang/markup)
