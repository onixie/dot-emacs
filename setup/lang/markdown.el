(system-packages-ensure "markdown2")

(use-package markdown-mode :ensure t
  :init (use-package markdown-mode+ :ensure t)
  :custom
  (markdown-command "markdown2")
  :mode ("\\.markdown\\'" "\\.mdown\\'" "\\.mkdn\\'" "\\.mkd\\'" "\\.md\\'"))
