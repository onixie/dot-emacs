;;; dot-emacs configuration

;; Copyright (C) 2019 Yc.S
;; Author: Yc.S <onixie@gmail.com>
;; Keywords: emacs configuration

(add-to-list 'load-path (file-name-directory (or load-file-name (buffer-file-name))))
(require 'setup/boot)

(dot-emacs:boot :emacs/proxy
		:emacs/package
		:emacs/default
		:emacs/theme)

;; (require 'setup/emacs/default)
;; (require 'setup/emacs/theme)
;; (require 'setup/emacs/tabs)
;; (require 'setup/emacs/fwb)
;; (require 'setup/emacs/linum)
;; (require 'setup/emacs/project)
;; (require 'setup/emacs/shell)
;; (require 'setup/emacs/calendar)
;; (require 'setup/emacs/bindings)

;; (require 'setup/lang/common)
;; ;; (require 'setup/lang/c)
;; (require 'setup/lang/csharp)
;; (require 'setup/lang/haskell)
;; (require 'setup/lang/java)
;; ;; (require 'setup/lang/lisp)
;; (require 'setup/lang/markup)
;; (require 'setup/lang/nix)
;; ;; (require 'setup/lang/typescript)
;; (require 'setup/lang/python)
;; (require 'setup/lang/r)

;; (require 'setup/app/org)
;; (require 'setup/app/git)
;; (require 'setup/app/tramp)
;; (require 'setup/app/docker)
;; (require 'setup/app/gnuplot)
;; (require 'setup/app/irc)

;; (require 'setup/flim)

;; (require 'tab-display)
;; (require 'weekly-view)
;; (require 'cups-dif)
;; (require 'doxymacs)
