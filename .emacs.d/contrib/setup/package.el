(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(when (< emacs-major-version 27)
  (package-initialize))

(package-refresh-contents)

(provide 'setup/package)
