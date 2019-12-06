(require 'setup/package)

(package-install 'docker)
(package-install 'docker-compose-mode)
(package-install 'dockerfile-mode)

(require 'docker)

(provide 'setup/docker)
