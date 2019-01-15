(require 'setup/package)
(require 'setup/lang/common)

(package-install 'jedi)
(jedi:install-server)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

(package-install 'flycheck-pycheckers)
(add-hook 'python-mode-hook 'flycheck-mode)

(provide 'setup/lang/python)
