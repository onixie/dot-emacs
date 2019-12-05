
(use-package calendar
  :hook ((calendar-mode . (lambda ()
			    (calendar-recalculate-total-monthes)
			    (toggle-truncate-lines 1)
			    (setq scroll-margin 0
				  scroll-step 0
				  scroll-conservatively 0)))
	 (calendar-move . (lambda ()
			    (calendar-update-mode-line)
			    (scroll-down))))
  :config
  (advice-add 'calendar-exit :around #'dot-emacs::calendar-exit+)

  (setq calendar-week-start-day 1
	calendar-mark-diary-entries-flag t
	calendar-mark-holidays-flag t))

(use-package more-calendar
  :after calendar
  :commands calendar-recalculate-total-monthes)

(provide 'setup/emacs/calendar/config)
