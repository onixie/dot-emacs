(require 'setup/package)

;;;;;;;;;;;;;;;; Yasnippet ;;;;;;;;;;;;;;;;
(package-install 'yasnippet)
(require 'yasnippet)
(yas/initialize)

;;;;;;;;;;;;;;;; Auto-Complete ;;;;;;;;;;;;;;;;
(package-install 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/contrib/auto-complete/dict/")
(ac-config-default)

(setq help-xref-following nil) ;Prevent quick-help yields warning and destroy the C-h function

;;;;;;;;;;;;;;;; Paredit ;;;;;;;;;;;;;;;;
(package-install 'paredit)
(require 'paredit)

(provide 'setup/lang/common)
