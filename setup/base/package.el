(require 'package)

(defcustom dot-emacs:package-refresh-interval (* 60 60 24 1)
  "Interval to trigger a package-refresh-contents call when starting emacs"
  :type 'integer)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(when (< emacs-major-version 27) 
  (package-initialize))

(dot-emacs::funcall-after dot-emacs:package-refresh-interval #'package-refresh-contents)

(package-install 'use-package)

(provide 'setup/base/package)
