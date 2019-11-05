(require 'setup/package)

(package-install 'session)
(require 'session)

(add-hook 'after-init-hook #'session-initialize)

(provide 'setup/session)
