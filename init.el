;;; dot-emacs configuration

;; Copyright (C) 2019, 2020, 2021 Yc.S
;; Author: Yc.S <onixie@gmail.com>
;; Keywords: emacs configuration

(let ((default-directory (file-name-directory (or load-file-name (buffer-file-name)))))
  (load-file "setup/boot.el"))

(dot-emacs:boot
 ;; Emacs setups
 :emacs/proxy
 :emacs/package
 :emacs/default
 :emacs/theme
 :emacs/tabs
 :emacs/fwb
 :emacs/linum
 :emacs/project
 :emacs/shell
 :emacs/calendar
 :emacs/keymap
 ;; Application setups
 :app/gnuplot
 :app/git
 :app/org
 :app/irc
 :app/tramp
 :app/docker
 ;; Language setups
 :lang/common
 :lang/csharp
 :lang/java
 :lang/haskell
 :lang/python
 :lang/markup
 :lang/nix
 :lang/c
 :lang/r
 :lang/typescript
 :lang/lisp
 :lang/kotlin
 :lang/sql
 )

;; (require 'setup/flim)
;; (require 'tab-display)
;; (require 'weekly-view)
;; (require 'cups-dif)
;; (require 'doxymacs)
