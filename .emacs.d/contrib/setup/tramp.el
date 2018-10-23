(require 'setup/package)

(require 'tramp)

(package-install 'docker-tramp)
(require 'docker-tramp)

(package-install 'lxc-tramp)
(require 'lxc-tramp)

(package-install 'vagrant-tramp)
(require 'vagrant-tramp)

(provide 'setup/tramp)
