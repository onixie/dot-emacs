;;; .emacs --- dot emacs configuration

;; Copyright (C) 2018, 2019 Yc.S

;; Author: Yc.S <onixie@gmail.com>
;; Keywords: emacs configuration

;;;;;;;;;;;;;;;; Load Packages ;;;;;;;;;;;;;;;;

;; Scan all directories under .emacs.d
(when (file-directory-p "~/.emacs.d/elpa/")
  (let ((default-directory "~/.emacs.d/elpa/"))
    (normal-top-level-add-subdirs-to-load-path)))

(let ((default-directory "~/.emacs.d/contrib/"))
  (normal-top-level-add-subdirs-to-load-path)
  (push default-directory load-path))

(require 'setup/proxy)
(require 'setup/package)
(require 'setup/theme)
(require 'setup/goodies)
(require 'setup/fwb)
(require 'setup/linum)
(require 'setup/search-at-point)
(require 'setup/session)
(provide 'setup/calendar)

(require 'setup/lang/common)
(require 'setup/lang/markup)
(require 'setup/lang/asm)
(require 'setup/lang/c)
(require 'setup/lang/lisp)
(require 'setup/lang/haskell)
(require 'setup/lang/sh)
(require 'setup/lang/python)
(require 'setup/lang/nix)

(require 'setup/org)
(require 'setup/wiki)
(require 'setup/muse)
(require 'setup/erc)
(require 'setup/gnuplot)
(require 'setup/ess)
;(require 'setup/flim)
(require 'setup/dired)
(require 'setup/ido)
(require 'setup/tramp)
(require 'setup/docker)
(require 'setup/git)

(require 'tab-display)
(require 'weekly-view)

(require 'cups-dif)

(require 'doxymacs)

;; Use emacs-goodies-el packages

;;;;;;;;;;;;;;;; Customization ;;;;;;;;;;;;;;;;
;;Custom Setting
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.1)
 '(ac-menu-height 30)
 '(ac-quick-help-delay 0.8)
 '(ac-quick-help-height 30)
 '(ac-quick-help-width 100)
 '(ac-use-menu-map nil)
 '(auto-image-file-mode t)
 '(before-save-hook '(copyright-update time-stamp))
 '(browse-url-browser-function 'eww-browse-url)
 '(column-number-mode t)
 '(comment-fill-column nil)
 '(desktop-base-file-name ".emacs.d/.desktop")
 '(desktop-base-lock-name ".emacs.d/.desktop.lock")
 '(diary-file "~/.emacs.d/diary")
 '(display-buffer-reuse-frames t)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-format "%A %B %d %T %Z")
 '(display-time-interval 1)
 '(display-time-mail-function nil)
 '(display-time-mode t)
 '(display-time-world-list
   '(("PST8PDT" "Seattle")
     ("EST5EDT" "New York")
     ("GMT0BST" "London")
     ("CET-1CDT" "Paris")
     ("IST-5:30" "Bangalore")
     ("JST-9" "Tokyo")
     ("CST-8" "BeiJing")))
 '(display-time-world-time-format "%A %B %d %T %Z")
 '(display-time-world-timer-second 1)
 '(doxymacs-doxygen-style "C++")
 '(ecb-options-version "2.40")
 '(ede-project-placeholder-cache-file "~/.emacs.d/.projects.ede")
 '(eval-expression-print-length nil)
 '(eval-expression-print-level nil)
 '(gdb-many-windows nil)
 '(highlight-current-line-globally t nil (highlight-current-line))
 '(highlight-current-line-ignore-regexp "Faces\\|Colors\\| \\*Mini\\|\\*Calendar\\*")
 '(highlight-current-line-whole-line t)
 '(holiday-hebrew-holidays nil)
 '(holiday-islamic-holidays nil)
 '(holiday-solar-holidays nil)
 '(ido-create-new-buffer 'always)
 '(ido-enable-last-directory-history nil)
 '(ido-max-work-directory-list 0)
 '(ido-max-work-file-list 0)
 '(ido-record-commands nil)
 '(ielm-noisy nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-echo-area-message "")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(initial-scratch-message nil)
 '(kill-do-not-save-duplicates t)
 '(kill-ring-max 500)
 '(legacy-style-world-list
   '(("PST8PDT" "Seattle")
     ("EST5EDT" "New York")
     ("GMT0BST" "London")
     ("CET-1CDT" "Paris")
     ("IST-5:30" "Bangalore")
     ("JST-9" "Tokyo")
     ("CST-8" "BeiJing")))
 '(make-backup-files nil)
 '(max-specpdl-size 1048576)
 '(mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control))))
 '(package-selected-packages
   '(nix-mode flycheck-pycheckers flycheck jedi systemd intero markdown-mode+ markdown-mode yaml-mode magit docker yasnippet vagrant-tramp slime session scribble-mode pp-c-l paredit muse monokai-theme maxframe lxc-tramp gnuplot geiser ess ecb docker-tramp auto-complete))
 '(save-interprogram-paste-before-kill t)
 '(scroll-conservatively 100000)
 '(scroll-margin 3)
 '(scroll-preserve-screen-position nil)
 '(scroll-step 1)
 '(select-enable-clipboard t)
 '(session-use-package t nil (session))
 '(show-paren-mode t)
 '(speedbar-default-position 'right)
 '(speedbar-frame-parameters
   '((minibuffer)
     (width . 40)
     (border-width . 0)
     (menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (unsplittable . t)
     (left-fringe . 0)))
 '(speedbar-frame-plist
   '(minibuffer nil width 40 border-width 0 internal-border-width 0 unsplittable t default-toolbar-visible-p nil has-modeline-p nil menubar-visible-p nil default-gutter-visible-p nil))
 '(speedbar-query-confirmation-method 'none-but-delete)
 '(speedbar-show-unknown-files t)
 '(speedbar-tag-hierarchy-method
   '(speedbar-prefix-group-tag-hierarchy speedbar-trim-words-tag-hierarchy speedbar-sort-tag-hierarchy))
 '(speedbar-verbosity-level 2)
 '(time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S %u@%s")
 '(uniquify-buffer-name-style 'forward nil (uniquify))
 '(yank-pop-change-selection t)
 '(yas/trigger-key (kbd "C-x C-y"))
 '(zoneinfo-style-world-list
   '(("America/Los_Angeles" "Seattle")
     ("America/New_York" "New York")
     ("Europe/London" "London")
     ("Europe/Paris" "Paris")
     ("Asia/Calcutta" "Bangalore")
     ("Asia/Tokyo" "Tokyo")
     ("Asia/BeiJing" "BeiJing"))))

(pushnew "~/.emacs.d/" image-load-path :test #'string=)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(fset 'yes-or-no-p 'y-or-n-p)
(put 'set-goal-column 'disabled nil)
(setq ielm-header "")

;;;;;;;;;;;;;;;; Misc ;;;;;;;;;;;;;;;;
;;(set-process-query-on-exit-flag (get-buffer-process (get-buffer "*shell*")) nil)

;;;;;;;;;;;;;;;; Startup ;;;;;;;;;;;;;;;;
(eshell)
(ielm)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
