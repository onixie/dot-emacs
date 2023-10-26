(use-package yaml-mode :ensure t
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(use-package systemd :ensure t)

(use-package nxml-mode
  :config
  (require 'hideshow)
  (add-to-list 'hs-special-modes-alist
               '(nxml-mode
                 "<!--\\|<[^/>]*[^/]>"
                 "-->\\|</[^/>]*[^/]>"))
  :bind
  (:map nxml-mode-map
        ("<backtab>" . hs-hide-block)
        ("<C-tab>" . hs-show-block))
  :hook
  ((nxml-mode . hs-minor-mode)))

(provide 'setup/lang/markup)
