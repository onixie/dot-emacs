;;; -*- lexical-binding: t; -*-

(defun dot-emacs::calendar-exit+ (orig-func &rest args)
  "Forcibly kill the buffer and window."
  (interactive "P")
  (funcall orig-func t))

(provide 'setup/emacs/calendar/define)
