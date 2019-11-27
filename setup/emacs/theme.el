
(use-package atom-one-dark-theme
  :config (load-theme 'atom-one-dark t))

(use-package minions
  :config (minions-mode))

(use-package smart-mode-line
  :config
  (sml/setup)
  :custom
  (sml/no-confirm-load-theme t))

(use-package smart-mode-line-powerline-theme
  :requires (smart-mode-line minions)
  :config
  (dot-emacs::powerline-center-minions-theme)
  )

(use-package rainbow-delimiters
  :ensure t
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
					       (list (first spec) face-attr))))
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

;;;;;;;;;;;;;;;; Auto Complete ;;;;;;;;;;;;;;;;
(face-spec-set 'ac-candidate-face '((t (:background "lightgray" :foreground "black" :height 120))))
(face-spec-set 'ac-completion-face '((t (:foreground "darkgray" :underline t :height 120))))
(face-spec-set 'ac-gtags-candidate-face '((t (:background "lightgray" :foreground "navy" :height 120))))
(face-spec-set 'ac-gtags-selection-face '((t (:background "navy" :foreground "white" :height 120))))
(face-spec-set 'ac-selection-face '((t (:background "steelblue" :foreground "white" :height 120))))
(face-spec-set 'ac-yasnippet-candidate-face '((t (:background "sandybrown" :foreground "black" :height 120))))
(face-spec-set 'ac-yasnippet-selection-face '((t (:background "coral3" :foreground "white" :height 120))))

;; Workaround: since emacs27, old-style backquote syntax became an error
;; Find other line highlighter or wait until someone solves the error.
(when (< emacs-major-version 27)
  (use-package highlight-current-line
    :config 
    (face-spec-set 'highlight-current-line-face '((t (:background "gray10"))))
    :custom 
    (highlight-current-line-globally t)))

(use-package pp-c-l
  :config
  (face-spec-set 'pp^L-highlight 
		 '((((type x w32 mac graphic) (class color)) (:inverse-video t :box (:line-width 1 :style pressed-button)))))
  (pretty-control-l-mode 1)
  :custom
  (pp^L-^L-string "                              -* Next Page *-                              ")
  (pp^L-^L-string-pre "")
  :bind
  (("C-S-l" . #'dot-emacs:insert-pretty-control-line))
  )

(provide 'setup/emacs/theme)
