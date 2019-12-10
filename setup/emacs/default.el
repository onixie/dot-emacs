(use-package startup :init (provide 'startup)
  :custom
  (inhibit-startup-buffer-menu t)
  (inhibit-startup-echo-area-message "")
  (inhibit-startup-screen t)
  (initial-buffer-choice (lambda () (prog1 (shell) (delete-other-windows))))
  (initial-scratch-message nil)
  (auto-save-list-file-prefix nil)
  )

(use-package time
  :custom
  (display-time-mode t)
  (display-time-default-load-average nil)
  (display-time-mail-function nil)
  (display-time-24hr-format t)
  (display-time-day-and-date t)
  (display-time-format "%a %b %d %T %j")
  (display-time-interval 1)
  (display-time-world-list '(("PST8PDT" "Seattle")
                             ("EST5EDT" "New York")
                             ("GMT0BST" "London")
                             ("CET-1CDT" "Paris")
                             ("IST-5:30" "Bangalore")
                             ("JST-9" "Tokyo")
                             ("CST-8" "BeiJing")))
  (display-time-world-time-format "%A %B %d %T %Z")
  (display-time-world-timer-second 1))

(use-package image-file
  :custom
  (auto-image-file-mode t))

(use-package files
  :custom
  (backup-inhibited t)
  (make-backup-files nil)
  (auto-save-default nil)
  :hook
  ((before-save . copyright-update)
   (before-save . time-stamp)))

(use-package ido
  :config
  (ido-mode 1))

(use-package simple
  :custom
  (column-number-mode t)
  (mark-ring-max 1024)
  (global-mark-ring-max 1024))

(use-package window :init (provide 'window)
  :config
  (advice-add 'quit-window :around
              (lambda (orig-func &rest args)
                "Forcibly kill the buffer and window."
                (interactive "P")
                (apply orig-func t (rest args)))))

(use-package session :ensure t
  :config
  (session-initialize))

(use-package scroll-bar
  :custom
  (scroll-bar-mode nil))

(tool-bar-mode 0)
(unless (memq window-system '(mac ns))
  (menu-bar-mode 0))
(unless (memq window-system '(x))
  (toggle-frame-fullscreen))

(put 'upcase-region   'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(fset 'yes-or-no-p #'y-or-n-p)



(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'setup/emacs/default)
