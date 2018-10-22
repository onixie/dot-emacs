(require 'setup/package)

;; Workaround: since emacs27, old-style backquote syntax became an error
;; Find other line highlighter or wait until someone solves the error.
(when (< emacs-major-version 27)
  (package-install 'highlight-current-line)
  (require 'highlight-current-line))

(package-install 'tabbar)
(require 'tabbar)

(provide 'setup/goodies)
