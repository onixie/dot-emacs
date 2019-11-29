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
(require 'setup/emacs/fwb)
(require 'setup/emacs/linum)
(require 'setup/emacs/project)
(require 'setup/emacs/shell)
(require 'setup/emacs/calendar)
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

(require 'setup/app/org)
(require 'setup/app/git)
(require 'setup/app/tramp)
(require 'setup/app/docker)
(require 'setup/app/gnuplot)
(require 'setup/app/irc)
;; (require 'setup/app/ess)
;; ;(require 'setup/flim)

;; (require 'tab-display)
;; (require 'weekly-view)
;; (require 'cups-dif)
;; (require 'doxymacs)
