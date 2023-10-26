
(if (display-graphic-p)
    (use-package atom-one-dark-theme :ensure t
      :config (load-theme 'atom-one-dark t))
  (load-theme 'manoj-dark t))

(use-package minions :ensure t
  :config (minions-mode))

(use-package powerline :ensure t)

(use-package smart-mode-line :ensure t :after powerline minions
  :config
  (sml/setup)
  (dot-emacs::sml/center-minions-mode-line)
  :custom
  (sml/no-confirm-load-theme t)
  (sml/vc-mode-show-backend t))

(if (display-graphic-p)
    (use-package smart-mode-line-atom-one-dark-theme :ensure t :after smart-mode-line
      :custom
      (sml/theme 'atom-one-dark))
  (sml/apply-theme 'dark))

(use-package rainbow-delimiters :ensure t
  :config
  (defvar rainbow-delimiters-max-face-count 9)
  (defun hsv->rgb (hue saturation value)
    " hue: 0~360, saturation/value: 0.0~1.0, red/green/blue:00~FF "
    (let (red green blue int-hue fract pp qq tt ww)
      (if (= saturation 0.0)
          (setq red value
                green value
                blue value)
        (setq hue (/ hue 60.0)
              int-hue (floor hue)
              fract (- hue int-hue)
              pp (* value (- 1 saturation))
              qq (* value (- 1 (* saturation fract)))
              ww (* value (- 1 (* saturation (- 1 fract)))))
        (case int-hue
          ((0 6) (setq red value
                       green ww
                       blue pp))
          (1 (setq red qq
                   green value
                   blue pp))
          (2 (setq red pp
                   green value
                   blue ww))
          (3 (setq red pp
                   green qq
                   blue value))
          (4 (setq red ww
                   green pp
                   blue value))
          (otherwise (setq red value
                           green pp
                           blue qq))))
      (mapcar #'(lambda (color)
                  (floor (* 255 color)))
              (list red green blue))))

  (defun rainbow-foreground (band primaries &optional saturation value)
    " generate #XXXXXX format color string"
    (destructuring-bind (red green blue)
        (hsv->rgb (/ (* 360 band) primaries) (or saturation 1.0) (or value 1.0))
      (format "#%02X%02X%02X" red green blue)))

  (defmacro rainbow-delimiters-rainbow-faces (primaries &rest facebody)
    " generate bunch of defface or custom-set-faces for specified spectrum primaries"
    (let ((primaries (eval primaries)))
      (prog1
          (destructuring-bind (specs &rest restbody)
              facebody
            `(progn
               ,@(loop for depth from 1 to primaries
                       collect
                       (let* ((face (intern (concat (symbol-name 'rainbow-delimiters-depth-) (format "%d" depth) (symbol-name '-face))))
                              (newspec (loop for spec in specs
                                             collect
                                             (let* ((face-attr (copy-tree (second spec)))
                                                    (foreground-args (getf face-attr :foreground))
                                                    (foreground-brightness (getf foreground-args :brightness))
                                                    (foreground-saturation (getf foreground-args :saturation))
                                                    (height-range (getf face-attr :height))
                                                    (height-from (getf height-range :from))
                                                    (height-to (getf height-range :to))
                                                    (height-delta (and height-to height-from (/ (* (- height-to height-from) depth) primaries)))
                                                    (height (and height-delta (+ height-from height-delta))))
                                               ;;destructuring op safety here?
                                               (setf (getf face-attr :foreground) (rainbow-foreground depth primaries
                                                                                                      (and (floatp foreground-saturation) foreground-saturation)
                                                                                                      (and (floatp foreground-brightness) foreground-brightness)))
                                               (when height
                                                 (setf (getf face-attr :height) height))
                                               (list (car spec) face-attr))))
                              (defbody `(,face
                                         ',newspec
                                         ,@restbody))
                              (cusbody `(,face
                                         ,newspec
                                         ,@restbody)))
                         (if (facep face)
                             `(custom-set-faces ',cusbody)
                           `(defface ,@defbody))))))
        (setq rainbow-delimiters-max-face-count primaries))))

  (defcustom rainbow-delimiters-generate-rainbow-faces-p nil ;(
    "Generate rainbow-like faces automatically"
    :tag "Generate rainbow faces?"
    :type 'integer
    :group 'rainbow-delimiters-toggle-delimiter-highlighting
    :set (lambda (symbol value)
           (set-default symbol value)
           (when (natnump value)
             (rainbow-delimiters-rainbow-faces value
                                               ((((background light)) (:foreground (:brightness 0.5 :saturation 1.0) :height (:from 1.5 :to 1.0)))
                                                (((background dark)) (:foreground (:brightness 1.0 :saturation 0.8) :height (:from 1.5 :to 1.0))))
                                               "Generated rainbow faces for nested delimiters."
                                               :group 'rainbow-delimiters-faces)))
    )
  (setq rainbow-delimiters-generate-rainbow-faces-p 44
        rainbow-delimiters-stop-cyclic-depth-highlighting-p t))

;; Workaround: since emacs27, old-style backquote syntax became an error
;; Find other line highlighter or wait until someone solves the error.
(if (< emacs-major-version 27)
  (use-package highlight-current-line :ensure t
    :config
    (face-spec-set 'highlight-current-line-face '((t (:background "gray25"))))
    :custom
    (highlight-current-line-globally t))
  (global-hl-line-mode 1))

;; (use-package pp-c-l :ensure t
;;   :config
;;   (face-spec-set 'pp^L-highlight
;;                  '((((type x w32 mac graphic) (class color)) (:inverse-video t :box (:line-width 1 :style pressed-button)))))
;;   (pretty-control-l-mode 1)
;;   :custom
;;   (pp^L-^L-string "                              -* Next Page *-                              ")
;;   (pp^L-^L-string-pre "")
;;   :bind
;;   (("C-S-l" . #'dot-emacs:insert-pretty-control-line))
;;   )

(provide 'setup/emacs/theme/config)
