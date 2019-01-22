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

;;;;;;;;;;;;;;;; Tool Bar ;;;;;;;;;;;;;;;;
(tool-bar-mode 0)

;;;;;;;;;;;;;;;; PP ControlL ;;;;;;;;;;;;;;;;

(package-install 'pp-c-l)
(require 'pp-c-l)

(setq pp^L-^L-string "                              -* Next Page *-                              "
      pp^L-^L-string-pre "")

(face-spec-set 'pp^L-highlight '((((type x w32 mac graphic) (class color)) (:inverse-video t :box (:line-width 1 :style pressed-button)))))

(pretty-control-l-mode 1)

(defun setup-theme--^L-line-ocuppy ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (insert ?\xC)
  (next-line))

(global-set-key (kbd "C-S-l") 'setup-theme--^L-line-ocuppy)

;;;;;;;;;;;;;;;; Rainbow-delimiters ;;;;;;;;;;;;;;;;
(require 'rainbow-delimiters)

(setq rainbow-delimiters-generate-rainbow-faces-p 44
      rainbow-delimiters-stop-cyclic-depth-highlighting-p t)

;;;;;;;;;;;;;;;; Auto Complete ;;;;;;;;;;;;;;;;
(face-spec-set 'ac-candidate-face '((t (:background "lightgray" :foreground "black" :height 120))))
(face-spec-set 'ac-completion-face '((t (:foreground "darkgray" :underline t :height 120))))
(face-spec-set 'ac-gtags-candidate-face '((t (:background "lightgray" :foreground "navy" :height 120))))
(face-spec-set 'ac-gtags-selection-face '((t (:background "navy" :foreground "white" :height 120))))
(face-spec-set 'ac-selection-face '((t (:background "steelblue" :foreground "white" :height 120))))
(face-spec-set 'ac-yasnippet-candidate-face '((t (:background "sandybrown" :foreground "black" :height 120))))
(face-spec-set 'ac-yasnippet-selection-face '((t (:background "coral3" :foreground "white" :height 120))))

;;;;;;;;;;;;;;;; Org ;;;;;;;;;;;;;;;;
(face-spec-set 'org-hide '((((background dark)) (:inherit default :foreground "default" :inverse-video t))))

;;;;;;;;;;;;;;;; Smart Mode Line ;;;;;;;;;;;;;;;;

(package-install 'smart-mode-line)
(package-install 'smart-mode-line-powerline-theme)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(powerline-default-theme)

(provide 'setup/theme)
