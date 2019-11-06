(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(when (< emacs-major-version 27)
  (package-initialize))

(defcustom dotemacs-package-refresh-interval (* 60 60 24 1)
  "Interval to trigger a package-refresh-contents call when starting emacs"
  :type 'integer)

(defun dotemacs--call-after (interval func)
  (let ((last-refreshed-time nil))
    (load "~/.emacs.d/last-refreshed-time.el" t)
    (print last-refreshed-time)
    (unless (and last-refreshed-time
		 interval
		 (time-less-p (time-subtract (current-time) last-refreshed-time)
			      (seconds-to-time interval)))
      (funcall func)
      (write-region (format "(setq last-refreshed-time '%s)" (current-time)) nil "~/.emacs.d/last-refreshed-time.el") t)))

(dotemacs--call-after dotemacs-package-refresh-interval #'package-refresh-contents)

(provide 'setup/package)
