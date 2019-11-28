;;; dot-emacs configuration

;; Copyright (C) 2019 Yc.S
;; Author: Yc.S <onixie@gmail.com>
;; Keywords: emacs configuration

;; Scan all directories under dot-emacs
(let ((default-directory (file-name-directory (or load-file-name (buffer-file-name)))))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path)
  (push default-directory image-load-path))

(require 'setup/base/defs)
(require 'setup/base/proxy)
(require 'setup/base/package)

(require 'setup/emacs/default)
(require 'setup/emacs/theme)
(require 'setup/emacs/tabs)
(require 'setup/emacs/linum)
;; (require 'setup/emacs/ido)
;; (require 'setup/emacs/project)
;; (require 'setup/emacs/calendar)
;; (require 'setup/emacs/shell)
(require 'setup/emacs/fwb)
(require 'setup/emacs/bindings)

;; (require 'setup/lang/base)
;; (require 'setup/lang/asm)
;; (require 'setup/lang/c)
;; (require 'setup/lang/csharp)
;; (require 'setup/lang/haskell)
;; (require 'setup/lang/java)
;; (require 'setup/lang/lisp)
;; (require 'setup/lang/markup)
;; (require 'setup/lang/nix)
;; (require 'setup/lang/sh)
;; (require 'setup/lang/typescript)
;; (require 'setup/lang/python)

;; (require 'setup/app/org)
;; (require 'setup/app/wiki)
;; ;(require 'setup/app/muse)
;; (require 'setup/app/irc)
;; (require 'setup/app/gnuplot)
;; (require 'setup/app/ess)
;; ;(require 'setup/flim)
;; (require 'setup/app/docker)
;; (require 'setup/app/git)
;; (require 'setup/app/tramp)

;; (require 'tab-display)
;; (require 'weekly-view)
;; (require 'cups-dif)
;; (require 'doxymacs)

;; ;;Custom Setting
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(auto-image-file-mode t)
;;  '(auto-save-file-name-transforms (quote (("." "~/.emacs.d/.auto-save/"))))
;;  '(backup-directory-alist (quote (("." . "/Users/shen/.emacs.d/.backup/"))))
;;  '(display-time-24hr-format t)
;;  '(display-time-day-and-date t)
;;  '(display-time-default-load-average nil)
;;  '(display-time-format "%a %b %d %T %j")
;;  '(display-time-interval 1)
;;  '(display-time-mail-function nil)
;;  '(display-time-mode t)
;;  '(display-time-world-list
;;    (quote
;;     (("PST8PDT" "Seattle")
;;      ("EST5EDT" "New York")
;;      ("GMT0BST" "London")
;;      ("CET-1CDT" "Paris")
;;      ("IST-5:30" "Bangalore")
;;      ("JST-9" "Tokyo")
;;      ("CST-8" "BeiJing"))))
;;  '(display-time-world-time-format "%A %B %d %T %Z")
;;  '(display-time-world-timer-second 1)
;;  '(ecb-options-version "2.40")
;;  '(muse-project-alist nil)
;;  '(package-selected-packages
;;    (quote
;;     (org-beautify-theme vagrant-tramp lxd-tramp lxc-tramp magit dockerfile-mode docker-compose-mode docker ess gnuplot muse flycheck-pycheckers jedi tide typescript-mode xref-js2 js2-refactor js2-mode nix-mode systemd markdown-mode+ markdown-mode yaml-mode scribble-mode geiser slime-docker slime dap-mode lsp-java lsp-haskell haskell-mode omnisharp ecb helm-lsp company-lsp lsp-ui lsp-mode flycheck paredit yasnippet projectile company highlight-current-line smart-mode-line-powerline-theme smart-mode-line minions rainbow-delimiters pp-c-l atom-one-dark-theme use-package session centaur-tabs)))
;;  '(scroll-bar-mode nil))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (xref-js2 vagrant-tramp use-package tide systemd smart-mode-line-powerline-theme slime-docker session scribble-mode rainbow-delimiters projectile pp-c-l paredit org-beautify-theme omnisharp nix-mode muse minions markdown-mode+ magit lxd-tramp lxc-tramp lsp-ui lsp-java lsp-haskell js2-refactor jedi highlight-current-line helm-lsp gnuplot geiser flycheck-pycheckers ess ecb dockerfile-mode docker-compose-mode docker dap-mode company-lsp centaur-tabs atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
