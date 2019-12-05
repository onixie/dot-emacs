;;; -*- lexical-binding: t; -*-

(defcustom dot-emacs:package-refresh-interval (* 60 60 24 1)
  "Interval to trigger a package-refresh-contents call when starting emacs"
  :type 'integer)

(defvar dot-emacs::last-refreshed-time nil)

(defun dot-emacs::funcall-after (func interval &rest args)
  (let ((default-directory user-emacs-directory))
    (load-file "last-refreshed-time.el")
    (unless (and dot-emacs::last-refreshed-time
                 interval
                 (time-less-p (time-subtract (current-time) dot-emacs::last-refreshed-time)
                              (seconds-to-time interval)))
      (apply func args)
      (write-region (format "(setq dot-emacs::last-refreshed-time '%s)" (current-time)) nil "last-refreshed-time.el") t)))

(provide 'setup/emacs/package/define)
