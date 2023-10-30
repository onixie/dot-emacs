(system-packages-ensure "multimarkdown")

(use-package markdown-mode :ensure t
  :custom
  (markdown-command "multimarkdown")
  :mode
  (("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode)
   ("README\\.md\\'" . gfm-mode)))

(use-package adoc-mode :ensure t)

(provide 'setup/lang/markdown)
