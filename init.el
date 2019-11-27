;;; dot emacs configuration

;; Copyright (C) 2018, 2019 Yc.S

;; Author: Yc.S <onixie@gmail.com>
;; Keywords: emacs configuration

;;;;;;;;;;;;;;;; Load Packages ;;;;;;;;;;;;;;;;

;; Scan all directories under .emacs.d

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(push "~/.emacs.d/" image-load-path)

(require 'setup/base/defs)
(require 'setup/base/proxy)
(require 'setup/base/package)

(require 'setup/emacs/default)
(require 'setup/emacs/session)
(require 'setup/emacs/goodies)
(require 'setup/emacs/tabs)
(require 'setup/emacs/fwb)

(require 'setup/emacs/theme)
(require 'setup/emacs/linum)
(require 'setup/emacs/search-at-point)
(require 'setup/emacs/dired)
(require 'setup/emacs/ido)
(require 'setup/emacs/project)
(require 'setup/emacs/calendar)
(require 'setup/emacs/shell)

(require 'setup/lang/base)
(require 'setup/lang/asm)
(require 'setup/lang/c)
(require 'setup/lang/csharp)
(require 'setup/lang/haskell)
(require 'setup/lang/java)
(require 'setup/lang/lisp)
(require 'setup/lang/markup)
(require 'setup/lang/nix)
(require 'setup/lang/sh)
(require 'setup/lang/typescript)
(require 'setup/lang/python)

(require 'setup/app/org)
(require 'setup/app/wiki)
(require 'setup/app/muse)
(require 'setup/app/irc)
(require 'setup/app/gnuplot)
(require 'setup/app/ess)
;(require 'setup/flim)
(require 'setup/app/docker)
(require 'setup/app/git)
(require 'setup/app/tramp)

(require 'tab-display)
(require 'weekly-view)
(require 'cups-dif)
(require 'doxymacs)

;;Custom Setting
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
