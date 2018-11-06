
(add-hook 'calendar-mode-hook (lambda nil
                                (load "~/.emacs.d/contrib/more-calendar.el")
                                (toggle-truncate-lines 1)
                                (setq scroll-margin 0
                                      scroll-step 0
                                      scroll-conservatively 0)))

(add-hook 'calendar-move-hook (lambda nil
                                (progn
                                  (calendar-update-mode-line)
                                  (scroll-down))))

(setq calendar-after-frame-setup-hook nil
      calendar-week-start-day 1
      calendar-mark-diary-entries-flag t
      calendar-mark-holidays-flag t)

(provide 'setup/calendar)
