(require 'setup/package)

;;;;;;;;;;;;;;;; Monokai-Theme ;;;;;;;;;;;;;;;;
(package-install 'monokai-theme)
(load-theme 'monokai t)
;;;;;;;;;;;;;;;; Color-Theme ;;;;;;;;;;;;;;;;
;; (package-install 'color-theme)
;; (package-install 'color-theme-monokai)
;; (require 'color-theme)

;; (defun theme-rule-select ()
;;   (cl-case (mod (time-to-day-in-year (current-time)) 3)
;;     (0 (color-theme-monokai))
;;     (1 (color-theme-matrix))
;;     (otherwise (color-theme-calm-forest))))

;; (eval-after-load "color-theme"
;;   '(progn (color-theme-initialize)
;; 	  (theme-rule-select)))

;;;;;;;;;;;;;;;; Parenface ;;;;;;;;;;;;;;;;
;; (package-install 'parenface)
;; (require 'parenface)

;;;;;;;;;;;;;;;; PP ControlL ;;;;;;;;;;;;;;;;
(custom-set-variables
 '(pp^L-^L-string "                              -* Next Page *-                              ")
 '(pp^L-^L-string-pre ""))

(package-install 'pp-c-l)
(require 'pp-c-l)

(pretty-control-l-mode 1)

(defun setup-theme--^L-line-ocuppy ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (insert ?\xC)
  (next-line))

(global-set-key (kbd "C-S-l") 'setup-theme--^L-line-ocuppy)

;;;;;;;;;;;;;;;; Rainbow-delimiters ;;;;;;;;;;;;;;;;
(custom-set-variables
 '(rainbow-delimiters-generate-rainbow-faces-p 44)
 '(rainbow-delimiters-stop-cyclic-depth-highlighting-p t))

(require 'rainbow-delimiters)

(provide 'setup/theme)
