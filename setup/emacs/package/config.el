(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(when (< emacs-major-version 27)
  (package-initialize))

(dot-emacs::funcall-after #'package-refresh-contents
                          dot-emacs:package-refresh-interval)

(package-install 'use-package t)

(provide 'setup/emacs/package/config)
