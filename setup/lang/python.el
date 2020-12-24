;(system-packages-ensure "python2.7-virtualenv")
;(system-packages-ensure "python3.8-virtualenv")

(use-package python
  :custom
  (python-indent-offset 4)
  :hook
  (inferior-python-mode . dot-emacs::kill-buffer-and-window-on-process-die))

(use-package jedi-core :ensure t
  :config
  (unless (jedi:-env-server-command) (jedi:install-server))
  :custom
  (jedi:complete-on-dot t)
  (jedi:use-shortcuts t)
  :hook
  (python-mode . jedi:setup))

(use-package company-jedi :ensure t :after company
  :hook
  (python-mode . (lambda () (add-to-list 'company-backends #'company-jedi))))

(use-package flycheck-pycheckers :ensure t :after flycheck
  :hook
  ((python-mode . flycheck-mode)))

(provide 'setup/lang/python)
