(require 'setup/package)

;;;;;;;;;;;;;;;; Monokai-Theme ;;;;;;;;;;;;;;;;
;; (package-install 'monokai-theme)
;; (load-theme 'monokai t)
(package-install 'atom-one-dark-theme)
(load-theme 'atom-one-dark t)
;;(package-install 'spacemacs-theme)
;;(load-theme 'spacemacs-dark)

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
(package-install 'pp-c-l)
(require 'pp-c-l)

(setq pp^L-^L-string "                              -* Next Page *-                              "
      pp^L-^L-string-pre "")

(face-spec-set 'pp^L-highlight 
               '((((type x w32 mac graphic) (class color)) (:inverse-video t :box (:line-width 1 :style pressed-button)))))

(pretty-control-l-mode 1)

(defun dotemacs--^L-line-ocuppy ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (insert ?\xC)
  (next-line))

(global-set-key (kbd "C-S-l") 'dotemacs--^L-line-ocuppy)

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

;;;;;;;;;;;;;;;; Minions Line ;;;;;;;;;;;;;;;;
(package-install 'minions)
(require 'minions)

;;;;;;;;;;;;;;;; Smart Mode Line ;;;;;;;;;;;;;;;;
(package-install 'smart-mode-line)
(package-install 'smart-mode-line-powerline-theme)
(setq sml/no-confirm-load-theme t)
(sml/setup)

(defun dotemacs--powerline-center-minions-theme ()
  "Setup a mode-line with major and minor modes centered."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face0 (if active 'powerline-active0 'powerline-inactive0))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" face0 'l)
                                     (when powerline-display-buffer-size
                                       (powerline-buffer-size face0 'l))
                                     (powerline-buffer-id `(mode-line-buffer-id ,face0) 'l)
                                     (powerline-raw " " face0)
                                     (funcall separator-left face0 face1)
                                     (powerline-narrow face1 'l)
                                     (powerline-vc face1)))
                          (rhs (list (when (window-full-width-p)
                                       (powerline-raw global-mode-string face1 'r))
                                     (powerline-raw "%4l" face1 'r)
                                     (powerline-raw ":" face1)
                                     (powerline-raw "%3c" face1 'r)
                                     (funcall separator-right face1 face0)
                                     (powerline-raw " " face0)
                                     (powerline-raw "%6p" face0 'r)
                                     (when powerline-display-hud
                                       (powerline-hud face2 face1))
                                     (powerline-fill face0 0)))
                          (center (list (powerline-raw " " face1)
                                        (funcall separator-left face1 face2)
                                        (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                          (powerline-raw erc-modified-channels-object face2 'l))
                                        (if (bound-and-true-p minions-mode)
                                            (powerline-raw minions-mode-line-modes face2)
                                          (powerline-major-mode face2 'l)
                                          (powerline-process face2)
                                          (powerline-raw " :" face2)
                                          (powerline-minor-modes face2 'l)
                                          (powerline-raw " " face2))
                                        (funcall separator-right face2 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill-center face1 (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill face1 (powerline-width rhs))
                             (powerline-render rhs)))))))

(dotemacs--powerline-center-minions-theme)

;;;;;;;;;;;;;;;; Highlight Current Lines ;;;;;;;;;;;;;;;;
;; Workaround: since emacs27, old-style backquote syntax became an error
;; Find other line highlighter or wait until someone solves the error.
(when (< emacs-major-version 27)
  (package-install 'highlight-current-line))
(require 'highlight-current-line)

(face-spec-set 'highlight-current-line-face '((t (:background "gray10"))))

;;;;;;;;;;;;;;;; Org Mode ;;;;;;;;;;;;;;;;
(require 'setup/org)
(package-install 'org-beautify-theme)
(load-theme 'org-beautify t)
(face-spec-set 'org-hide '((((background dark)) (:inherit default :foreground "default" :inverse-video t))))

(provide 'setup/theme)
