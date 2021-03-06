(use-package prog-mode
  :custom
  (global-prettify-symbols-mode t)
  :hook
  ((before-save . delete-trailing-whitespace)
   (prog-mode . (lambda () (setq indent-tabs-mode nil
                            tab-width 4
                            truncate-lines t
                            show-trailing-whitespace t)))))

(use-package projectile :ensure t
  :config
  (projectile-mode t)
  :bind
  (:map projectile-mode-map
        ("s-p"   . projectile-command-map)
        ("C-c p" . projectile-command-map)))

(use-package treemacs :ensure t :commands treemacs
  :bind
  (:map treemacs-mode-map
        ([mouse-1] . treemacs-single-click-expand-action)
   :map easy-window-mode-map
        ("M-0" . treemacs-select-window)))

(use-package treemacs-projectile :ensure t :after treemacs projectile)

(use-package treemacs-icons-dired :ensure t :after treemacs dired
  :config
  (treemacs-icons-dired-mode))

(use-package treemacs-magit :ensure t :after treemacs magit)

(use-package paredit :ensure t)

(use-package yasnippet :ensure t
  :config
  (yas/initialize))

(use-package flycheck :ensure t)

(use-package company :ensure t
  :custom
  (global-company-mode t)
  (company-idle-delay 0)
  :bind
  (:map company-active-map
        ("C-n" . #'company-select-next)
        ("C-p" . #'company-select-previous)
        ([tab]    . #'company-select-next)
        ([S-tab]  . #'company-select-previous)
        ([return] . #'company-complete-selection)))

(use-package lsp-mode :ensure t :commands lsp
  :custom
  (lsp-prefer-flymake nil)
  :hook
  ((lsp-mode . lsp-lens-mode)))

(use-package lsp-ui :ensure t :commands lsp-ui-mode
  :config
  (use-package lsp-ui-doc
    :custom
    (lsp-ui-doc-position 'bottom))
  :bind
  (:map lsp-ui-mode-map
        ([remap xref-find-definitions] . #'lsp-ui-peek-find-definitions)
        ([remap xref-find-references]  . #'lsp-ui-peek-find-references)))

(use-package company-lsp :ensure t :commands company-lsp)

(use-package dap-mode :ensure t
  :config
  (dap-mode t)
  (dap-ui-mode t))

(provide 'setup/lang/common)
