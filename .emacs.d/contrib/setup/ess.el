(require 'setup/package)

(when (member system-type '(gnu gnu/linux gnu/kfreebsd))
  (package-install 'ess)
  (require 'ess))

(provide 'setup/ess)
