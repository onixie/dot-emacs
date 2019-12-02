(use-package jedi-core :ensure t
  :config 
  (jedi:install-server)
  :custom
  (jedi:complete-on-dot t)
  (jedi:use-shortcuts t)
  :hook
  (python-mode . jedi:setup))

(use-package company-jedi :ensure t
  :hook
  (python-mode . (lambda () (add-to-list 'company-backends #'company-jedi))))

(use-package flycheck-pycheckers :ensure t
  :requires flycheck
  :hook
  ((python-mode . flycheck-mode)))

(provide 'setup/lang/python)
