
(setq inhibit-startup-buffer-menu t
      inhibit-startup-echo-area-message ""
      inhibit-startup-screen t)

(setq initial-buffer-choice (lambda nil (shell) (delete-other-windows))
      initial-scratch-message nil)

(setq display-time-mode t
      display-time-default-load-average nil
      display-time-mail-function nil
      display-time-24hr-format t
      display-time-day-and-date t
      display-time-format "%a %b %d %T %j"
      display-time-interval 1
      display-time-world-list '(("PST8PDT" "Seattle")
                                ("EST5EDT" "New York")
                                ("GMT0BST" "London")
                                ("CET-1CDT" "Paris")
                                ("IST-5:30" "Bangalore")
                                ("JST-9" "Tokyo")
                                ("CST-8" "BeiJing"))
      display-time-world-time-format "%A %B %d %T %Z"
      display-time-world-timer-second 1)

(setq auto-image-file-mode t)

(tool-bar-mode 0)

(menu-bar-mode 0)

(column-number-mode nil)

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)

(put 'set-goal-column 'disabled nil)

(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'backup-directory-alist
             (cons (expand-file-name "~/") (expand-file-name "~/.emacs.d/.backup/")))

(add-to-list 'auto-save-file-name-transforms
             (list "~/\\([^/]*/\\)*\\([^/]*\\)$" "~/.emacs.d/.auto-save/\\2" t))

(add-to-list 'before-save-hook #'copyright-update)
(add-to-list 'before-save-hook #'time-stamp)

(provide 'setup/default)
