
(global-prettify-symbols-mode)

;;;;;;;;;;;;;;;; Company mode ;;;;;;;;;;;;;;;;
(package-install 'company)

;;;;;;;;;;;;;;;; Projectile mode ;;;;;;;;;;;;;;;;
(package-install 'projectile)

;;;;;;;;;;;;;;;; Yasnippet ;;;;;;;;;;;;;;;;
(package-install 'yasnippet)
(require 'yasnippet)
(yas/initialize)

;; ;;;;;;;;;;;;;;;; Auto-Complete ;;;;;;;;;;;;;;;;
;; (package-install 'auto-complete)
;; (require 'auto-complete-config)

;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/contrib/auto-complete/dict/")
;; (ac-config-default)

;; (setq help-xref-following nil) ;Prevent quick-help yields warning and destroy the C-h function

;;;;;;;;;;;;;;;; Paredit ;;;;;;;;;;;;;;;;
(package-install 'paredit)
(require 'paredit)

;;;;;;;;;;;;;;;; Syntax Checker ;;;;;;;;;;;;;;;;
(package-install 'flycheck)
(require 'flycheck)

;;;;;;;;;;;;;;;; Language server protocol ;;;;;;;;;;;;;;;;
(package-install 'lsp-mode)
(package-install 'lsp-ui)
(package-install 'company-lsp)
(package-install 'helm-lsp)

(require 'lsp-mode)
(require 'lsp-ui)

(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
(setq lsp-ui-doc-position 'bottom)

(provide 'setup/lang/base)
