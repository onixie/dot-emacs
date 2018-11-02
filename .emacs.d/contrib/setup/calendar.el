
(add-hook 'calendar-mode-hook
          (lambda nil
            (unless
                (eq org-agenda-diary-file 'diary-file)
              (define-key calendar-mode-map org-calendar-insert-diary-entry-key 'org-agenda-diary-entry))
            (toggle-truncate-lines 1)
            (load "~/.emacs.d/contrib/more-calendar.el")
            (progn
              (setq scroll-margin 0)
              (setq scroll-step 0)
              (setq scroll-conservatively 0))))

(add-hook 'calendar-move-hook
          (lambda nil
            (progn
              (calendar-update-mode-line)
              (scroll-down))))

(setq calendar-after-frame-setup-hook nil
      calendar-week-start-day 1
      calendar-mark-diary-entries-flag t
      calendar-mark-holidays-flag t)

(provide 'setup/calendar)
