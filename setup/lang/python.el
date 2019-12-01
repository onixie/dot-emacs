(use-package jedi :ensure t
  :config 
  (jedi:install-server)
  :custom
  (jedi:complete-on-dot t) ;; optional  
  :hook
  ((python-mode . jedi:setup)))

(use-package company-jedi :ensure t
  :requires (company jedi)
  :hook
  ((python-mode . (lambda () (add-to-list 'company-backends #'company-jedi)))))

(use-package flycheck-pycheckers :ensure t
  :requires flycheck
  :hook
  ((python-mode . flycheck-mode)))

(provide 'setup/lang/python)
