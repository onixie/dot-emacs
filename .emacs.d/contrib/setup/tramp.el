(require 'setup/package)

(require 'tramp)

(package-install 'docker-tramp)
(require 'docker-tramp)

(package-install 'lxc-tramp)
(require 'lxc-tramp)

(package-install 'lxd-tramp)
(require 'lxd-tramp)

(unless (member system-type '(ms-dos windows-nt))
  (package-install 'vagrant-tramp)
  (require 'vagrant-tramp))

(setq tramp-smb-conf nil)

(provide 'setup/tramp)
