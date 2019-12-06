(require 'setup/package)

;;; Javascript
(package-install 'js2-mode)
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(package-install 'js2-refactor)
(require 'js2-refactor)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

(package-install 'xref-js2)
(require 'xref-js2)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;;; Typescript 
(require 'ansi-color)
(require 'company)

(package-install 'typescript-mode)
(require 'typescript-mode)

(defun dotemacs--colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))

(add-hook 'compilation-filter-hook #'dotemacs--colorize-compilation-buffer)

(package-install 'tide)
(require 'tide)

(defun dotemacs--setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook #'tide-format-before-save)
(add-hook 'typescript-mode-hook #'dotemacs--setup-tide-mode)

(add-hook 'js2-mode-hook #'dotemacs--setup-tide-mode)
;; configure javascript-tide checker to run after your default javascript checker
(flycheck-add-next-checker 'javascript-eslint #'javascript-tide 'append)

(provide 'setup/lang/typescript)
