;;; .emacs --- dot emacs configuration

;; Copyright (C) 2010, 2011, 2012
;;   Nixie Shen

;; Author: Nixie Shen <onixie@gmail.com>
;; Keywords: emacs configuration

;;;;;;;;;;;;;;;; Load Packages ;;;;;;;;;;;;;;;;

(require 'cc-mode)
(require 'asm-mode)
(require 'sh-script)
(require 'gud)
(require 'ido)
(require 'linum)
(require 'org)

;; CEDET must be first loaded explicitly, otherwise the old version will mess up new version
(load-file "~/.emacs.d/contrib/cedet/cedet-devel-load.el")

(require 'ede)
(require 'semantic)
(require 'srecode)
(require 'cogre)

;; Scan all directories under .emacs.d
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'color-theme)
(require 'maxframe)
(require 'traverselisp)
(require 'tab-display)
(require 'weekly-view)
(require 'yasnippet)
(require 'auto-complete-config)
(require 'ecb-autoloads)
(require 'muse-mode)
(require 'muse-publish)
(require 'muse-html)
(require 'emacs-wiki)
(require 'w3m-load)
;; (require 'session)
(require 'cups-dif)
(require 'erc)
(require 'paredit)
;; (require 'parenface)
(require 'ibus)
(require 'pp-c-l)
(require 'geiser)
(require 'rainbow-delimiters)
(require 'doxymacs)

;; Use emacs-goodies-el packages
(require 'tabbar)
(require 'highlight-current-line)
(require 'pack-windows)
(require 'quack)

;;;;;;;;;;;;;;;; Customization ;;;;;;;;;;;;;;;;
;;Custom Setting
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.1)
 '(ac-menu-height 30)
 '(ac-quick-help-delay 0.8)
 '(ac-quick-help-height 30)
 '(ac-quick-help-width 100)
 '(ac-use-menu-map nil)
 '(auto-image-file-mode t)
 '(before-save-hook (quote (copyright-update time-stamp)))
 '(browse-url-browser-function (quote w3m-browse-url))
 '(calendar-after-frame-setup-hook nil)
 '(calendar-mark-diary-entries-flag t)
 '(calendar-mark-holidays-flag t)
 '(calendar-mode-hook (quote ((lambda nil (unless (eq org-agenda-diary-file (quote diary-file)) (define-key calendar-mode-map org-calendar-insert-diary-entry-key (quote org-agenda-diary-entry)))) (lambda nil (toggle-truncate-lines 1)) (lambda nil (load "~/.emacs.d/contrib/more-calendar.el")) (lambda nil (progn (setq scroll-margin 0) (setq scroll-step 0) (setq scroll-conservatively 0))))))
 '(calendar-move-hook (quote (calendar-update-mode-line (lambda nil (scroll-down)))) nil nil "Use scroll-down to make it better for auto scrolled when scroll-margin is bigger")
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(comment-fill-column nil)
 '(desktop-base-file-name ".emacs.d/.desktop")
 '(desktop-base-lock-name ".emacs.d/.desktop.lock")
 '(diary-file "~/.emacs.d/diary")
 '(display-buffer-reuse-frames t)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-format "%A %B %d %T %Z")
 '(display-time-interval 1)
 '(display-time-mail-function nil)
 '(display-time-mode t)
 '(display-time-world-list (quote (("PST8PDT" "Seattle") ("EST5EDT" "New York") ("GMT0BST" "London") ("CET-1CDT" "Paris") ("IST-5:30" "Bangalore") ("JST-9" "Tokyo") ("CST-8" "BeiJing"))))
 '(display-time-world-time-format "%A %B %d %T %Z")
 '(display-time-world-timer-second 1)
 '(doxymacs-doxygen-style "C++")
 '(ecb-options-version "2.40")
 '(ede-project-placeholder-cache-file "~/.emacs.d/.projects.ede")
 '(eval-expression-print-length nil)
 '(eval-expression-print-level nil)
 '(gdb-many-windows nil)
 '(geiser-repl-use-other-window nil)
 '(highlight-current-line-globally t nil (highlight-current-line))
 '(highlight-current-line-ignore-regexp "Faces\\|Colors\\| \\*Mini\\|\\*Calendar\\*")
 '(highlight-current-line-whole-line t)
 '(holiday-hebrew-holidays nil)
 '(holiday-islamic-holidays nil)
 '(holiday-solar-holidays nil)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-last-directory-history nil)
 '(ido-max-work-directory-list 0)
 '(ido-max-work-file-list 0)
 '(ido-mode (quote buffer) nil (ido))
 '(ido-record-commands nil)
 '(ielm-noisy nil)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-echo-area-message "nixie")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(initial-scratch-message nil)
 '(kill-do-not-save-duplicates t)
 '(kill-ring-max 500)
 '(legacy-style-world-list (quote (("PST8PDT" "Seattle") ("EST5EDT" "New York") ("GMT0BST" "London") ("CET-1CDT" "Paris") ("IST-5:30" "Bangalore") ("JST-9" "Tokyo") ("CST-8" "BeiJing"))))
 '(make-backup-files nil)
 '(max-specpdl-size 1048576)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 5) ((control)))))
 '(org-export-docbook-xsl-fo-proc-command "fop %s %s")
 '(org-export-docbook-xslt-proc-command "xsltproc --output %s /usr/share/docbook2odf/xsl/docbook.xsl %s")
 '(org-hide-leading-stars nil nil nil "Clean View is done by org-startup-indented, this variable has little usage in future.")
 '(org-hierarchical-todo-statistics nil)
 '(org-startup-indented t)
 '(pp^L-^L-string "                              -* Next Page *-                              ")
 '(pp^L-^L-string-pre "")
 '(quack-browse-url-browser-function (quote quack-w3m-browse-url-other-window))
 '(quack-default-program "racket")
 '(quack-fontify-style (quote emacs))
 '(quack-global-menu-p nil)
 '(quack-pretty-lambda-p t)
 '(quack-programs (quote ("racket" "bigloo" "csi" "csi -hygienic" "gosh" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mred -z" "mzscheme" "mzscheme -il r6rs" "mzscheme -il typed-scheme" "mzscheme -M errortrace" "mzscheme3m" "mzschemecgc" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(rainbow-delimiters-generate-rainbow-faces-p 25)
 '(rainbow-delimiters-stop-cyclic-depth-highlighting-p t)
 '(save-interprogram-paste-before-kill t)
 '(scroll-conservatively 100000)
 '(scroll-margin 3)
 '(scroll-preserve-screen-position nil)
 '(scroll-step 1)
 '(semantic-idle-scheduler-idle-time 0.5)
 '(semantic-inhibit-functions (quote ((lambda nil (or (eq major-mode (quote lisp-mode)) (eq major-mode (quote scheme-mode)) (eq major-mode (quote emacs-lisp-mode)))))))
 '(show-paren-mode t)
 '(slime-header-line-p nil)
 '(slime-kill-without-query-p t)
 '(slime-repl-history-remove-duplicates t)
 '(slime-repl-history-trim-whitespaces t)
 '(speedbar-default-position (quote right))
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 40) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (left-fringe . 0))))
 '(speedbar-frame-plist (quote (minibuffer nil width 40 border-width 0 internal-border-width 0 unsplittable t default-toolbar-visible-p nil has-modeline-p nil menubar-visible-p nil default-gutter-visible-p nil)))
 '(speedbar-query-confirmation-method (quote none-but-delete))
 '(speedbar-show-unknown-files t)
 '(speedbar-tag-hierarchy-method (quote (speedbar-prefix-group-tag-hierarchy speedbar-trim-words-tag-hierarchy speedbar-sort-tag-hierarchy)))
 '(speedbar-verbosity-level 2)
 '(tabbar-background-color "yellow")
 '(tabbar-cycle-scope nil)
 '(tabbar-mode t nil (tabbar))
 '(tabbar-separator (quote (0.2)))
 '(time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S %u@%s")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(w3m-use-cookies t)
 '(x-select-enable-clipboard t)
 '(yank-pop-change-selection t)
 '(yas/trigger-key (kbd "C-x C-y"))
 '(zoneinfo-style-world-list (quote (("America/Los_Angeles" "Seattle") ("America/New_York" "New York") ("Europe/London" "London") ("Europe/Paris" "Paris") ("Asia/Calcutta" "Bangalore") ("Asia/Tokyo" "Tokyo") ("Asia/BeiJing" "BeiJing")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-candidate-face ((t (:background "lightgray" :foreground "black" :height 120))))
 '(ac-completion-face ((t (:foreground "darkgray" :underline t :height 120))))
 '(ac-gtags-candidate-face ((t (:background "lightgray" :foreground "navy" :height 120))))
 '(ac-gtags-selection-face ((t (:background "navy" :foreground "white" :height 120))))
 '(ac-selection-face ((t (:background "steelblue" :foreground "white" :height 120))))
 '(ac-yasnippet-candidate-face ((t (:background "sandybrown" :foreground "black" :height 120))))
 '(ac-yasnippet-selection-face ((t (:background "coral3" :foreground "white" :height 120))))
 '(highlight-current-line-face ((t (:background "black" :slant italic :weight bold :height 1.1))))
 '(org-hide ((((background dark)) (:inherit default :foreground "default" :inverse-video t))))
 '(pp^L-highlight ((((type x w32 mac graphic) (class color)) (:inverse-video t :box (:line-width 1 :style pressed-button)))))
 '(tabbar-default ((((class color grayscale) (background dark)) (:inherit variable-pitch :background "gray50" :foreground "grey75" :weight extra-bold :height 1.1 :width expanded :family "Serif"))))
 '(tabbar-separator ((t (:inherit tabbar-default :height 0.1))))
 '(tabbar-unselected ((t (:inherit tabbar-default :box (:line-width 1 :color "white" :style released-button))))))

(pushnew "~/.emacs.d/" image-load-path :test #'string=)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(fset 'yes-or-no-p 'y-or-n-p)
(put 'set-goal-column 'disabled nil)
(setq ielm-header "")

;;;;;;;;;;;;;;;; Common ;;;;;;;;;;;;;;;;
(defun name-glue (&rest nameparts)
  "Make a symbol by concating the strings/symbols as its name"
  (intern (apply #'concat (mapcar #'(lambda (name)
				      (cond ((symbolp name)
					     (symbol-name name))
					    ((numberp name)
					     (number-to-string name))
					    ((stringp name) name)
					    (t (error "can't be glue together"))))
				     nameparts))))

(defun swap-key-translation (key1 key2)
  "Swap key bindings in key-translation-map"
  (define-key key-translation-map key1 key2)
  (define-key key-translation-map key2 key1))

(defun insert-date ()
  (interactive)
  (insert-string (shell-command-to-string "date")))

;;;;;;;;;;;;;;;; Color-Theme ;;;;;;;;;;
(defvar even-day-p (evenp (time-to-day-in-year (current-time))))

(defun theme-rule-select ()
  (cond
   (even-day-p (color-theme-matrix))
   (t (color-theme-calm-forest))))

(eval-after-load "color-theme"
  '(progn (color-theme-initialize)
	  (theme-rule-select)))

;;;;;;;;;;;;;;;; ibus  ;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook 'ibus-mode-on)
(global-set-key (kbd "C-|") 'ibus-toggle)

;;;;;;;;;;;;;;;; IDO ;;;;;;;;;;;;;;;;
(ido-mode 1)

;;;;;;;;;;;;;;;; CEDET ;;;;;;;;;;;;;;;;
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
(global-srecode-minor-mode 1)
(global-semantic-stickyfunc-mode -1)

(global-ede-mode 1)
(remove-hook 'find-file-hook 'ede-turn-on-hook)
(add-hook 'find-file-hook 'ede-turn-on-hook t)

(when (require 'semantic-tag-folding nil 'noerror)
  (global-semantic-tag-folding-mode 1)
  (remove-hook 'semantic-init-hook 'semantic-tag-folding-mode)
  (add-hook 'semantic-init-hook 'semantic-tag-folding-mode t)

  (define-key semantic-tag-folding-mode-map (kbd "C-c -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c =") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c M--") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-c M-=") 'semantic-tag-folding-show-all))

(defsubst* walk-directory (dirname &key operation (collectp nil) excludes (excludes-subp t) (by-full-pathname t))
  (let ((collector-sym (gensym)))
    (fset collector-sym (symbol-function (if collectp 'cons 'ignore)))
    (labels
	((walk (name)
	       (cond
		((excludesp name) nil)
		((eq t (car (file-attributes name)))
		 (apply collector-sym
			(list (funcall (or operation #'identity) name)
			      (mapcan #'walk (traverse-list-directory name t)))))))
	 (excludesp (name)
		    (and excludes
			 (cond ((not excludes-subp)
				(member (if by-full-pathname
					    name
					  (file-name-nondirectory name))
					excludes))
			       (t (find name excludes
					:test (lambda (n ex)
						(let ((pos (search ex n)))
						  (and (not (null pos))
						       (or (not by-full-pathname)
							   (= pos 0)))))))))))
      (walk (expand-file-name dirname)))))

(defun add-path-to-sys-include (path)
  (semantic-add-system-include path 'c-mode)
  (semantic-add-system-include path 'c++-mode))

(defvar semantic-user-local-include
  (list "include" "inc" "common" "public"
	"../include" "../inc" "../common" "../public"
	"../../include" "../../inc" "../../common" "../../public"))

(defvar semantic-sys-spec-include
  (list "/usr/include"
	"/usr/local/include"
	;; "/usr/src"
	;; "/usr/local/src"
	))

(require 'semantic-c nil 'noerror)
(dolist (dirname semantic-sys-spec-include)
  (walk-directory dirname :operation #'add-path-to-sys-include))

(add-hook 'semantic-init-hook
	  (lambda ()
	    (dolist (dirname semantic-user-local-include)
	      (walk-directory dirname
			      :operation #'add-path-to-sys-include
			      :excludes semantic-sys-spec-include))))

(add-hook 'semantic-init-mode-hook (lambda () (senator-force-refresh)) t)

(enable-visual-studio-bookmarks)
;;;;;;;;;;;;;;;; Yasnippet ;;;;;;;;;;;;;;;;
(yas/initialize)
(yas/load-directory "~/.emacs.d/contrib/yasnippet/snippets")

;;;;;;;;;;;;;;;; Auto-Complete ;;;;;;;;;;;;;;;;
(add-to-list 'ac-dictionary-directories "~/.emacs.d/contrib/auto-complete/dict/")
(ac-config-default)

(setq help-xref-following nil) ;Prevent quick-help yields warning and destroy the C-h function

;;;;;;;;;;;;;;;; Easy-Frame ;;;;;;;;;;;;;;;;
(defcustom default-unfillness 0.85
  "The default ratio of the workarea to fill when unfill it"
  :type 'number
  :group 'easy-frame)

(defcustom auto-smart-fill t
  "Smartly fill new frame automatically"
  :type 'boolean
  :group 'easy-frame)

(defcustom first-frame-x-workarea 'smart
  "Let first frame fill the whole workarea"
  :type 'symbol
  :group 'easy-frame)

(defcustom precise-1 2
  "Internal use for set frame position and size precisely"
  :type 'integer
  :group 'easy-frame)

(defcustom precise-2 0.10
  "Internal use for set frame position and size precisely"
  :type 'number
  :group 'easy-frame)

(defsubst frame-desktop (&optional frame)
  "Return the 0-based index of desktop the frame posed in."
  (condition-case nil
      (or (x-window-property "_NET_WM_DESKTOP" nil "AnyPropertyType" (string-to-int (frame-parameter frame 'outer-window-id)) nil t)
	  (error "_NET_WORKAREA not supported"))
    (error nil 0)))

(defsubst frame-workarea (&optional frame)
  "Return the allowed workarea (x y width height) from Window Manager in current desktop."
  (condition-case nil
      (let ((desk-ind (frame-desktop frame))
	    (workareas (or (x-window-property "_NET_WORKAREA" nil "AnyPropertyType" 0 nil t)
			   (error "_NET_WORKAREA not supported"))))
	(subseq workareas (* 4 desk-ind) (* 4 (1+ desk-ind))))
    (error nil (list 0 0 (display-pixel-width) (display-pixel-height)))))

(defsubst frame-extents (&optional frame)
  "Return the border (left right top bottom) added by Window Manager"
  (condition-case nil
      (or (x-window-property "_NET_FRAME_EXTENTS" nil "AnyPropertyType" (string-to-int (frame-parameter frame 'outer-window-id)) nil t)
	  (error "_NET_FRAME_EXTENTS not supported"))
    (error nil (list 0 0 0 0))))

;;; Kludge: I have to set multiple times to make the resizing precisely.
(defmacro precisely-do (frame &rest body)
  "Get rid of the effect from wm"
  `(macrolet ((redo (&rest body)
		     (let ((i (gensym "precisely-do-is-redo")))
		       `(loop for ,i from 1 to ,precise-1 do (progn ,@body)))))
     (progn
       (redo
	(x-send-client-message nil 0 ,frame "_NET_WM_STATE" 32 '(0 "_NET_WM_STATE_FULLSCREEN" 0))
	(x-send-client-message nil 0 ,frame "_NET_WM_STATE" 32 '(0 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
	(x-send-client-message nil 0 ,frame "_NET_WM_STATE" 32 '(0 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
       (redo
	,@body))))

(defsubst frame-resize (width height &optional frame)
  "Resize the frame in pixel size."
  (precisely-do frame
		(let ((flags (cond ((and (integerp height) (integerp width)) #x0001FC0A)
		      ((integerp width) #x0001F40A)
		      ((integerp height) #x0001F80A)
		      (t #x0001F000))))
     (x-send-client-message nil 0 frame "_NET_MOVERESIZE_WINDOW" 32 `(,flags 0 0 ,(or width 0) ,(or height 0))))))

(defmacro with-frame-sizing-info (frame &rest body)
  `(let* ((extents (frame-extents ,frame))
	  (left-extent (aref extents 0))
	  (right-extent (aref extents 1))
	  (top-extent (aref extents 2))
	  (bottom-extent (aref extents 3))
	  (workarea (frame-workarea ,frame))
	  (left (aref workarea 0))
	  (top (aref workarea 1))
	  (width (aref workarea 2))
	  (height (aref workarea 3)))
     ;; (princ-list left-extent ", " right-extent ", " top-extent ", " bottom-extent ", ")
     ;; (princ-list left ", " top ", " width ", " height)
     ,@body))

(defun frame-fill-workarea (&optional frame dir ratio)
  (interactive)
  (precisely-do frame
   (with-frame-sizing-info frame
    (let ((ratio (if (and (numberp ratio) (<= ratio 1))
		      ratio
		    0.5)))
      (if (>= ratio 1)
	  (frame-fill-workarea frame)
	(modify-frame-parameters frame `((ffw-state . ,(case dir
							((upper down left right upper-left upper-right down-left down-right)
							 dir)
							(t
							 'fill)))))
	(multiple-value-bind (x y w h) (case dir
					((upper)
					 (values left top
						 (- width left-extent right-extent) (- (* height ratio) top-extent bottom-extent)))
					((down)
					 (values left (+ top (* height (- 1 ratio)))
						 (- width left-extent right-extent) (- (* height ratio) top-extent bottom-extent)))
					((left)
					 (values left top
						 (- (* width ratio) left-extent right-extent) (- height top-extent bottom-extent)))
					((right)
					 (values (+ left (* width (- 1 ratio)) ) top
						 (- (* width ratio) left-extent right-extent) (- height top-extent bottom-extent)))
					((upper-left)
					 (values left top
						 (- (* width ratio) left-extent right-extent) (- (* height ratio) top-extent bottom-extent)))
					((upper-right)
					 (values (+ left (* width (- 1 ratio))) top
						 (- (* width ratio) left-extent right-extent) (- (* height ratio) top-extent bottom-extent)))
					((down-left)
					 (values left (+ top (* height (- 1 ratio)))
						 (- (* width ratio) left-extent right-extent) (- (* height ratio) top-extent bottom-extent)))
					((down-right)
					 (values (+ left (* width (- 1 ratio))) (+ top (* height (- 1 ratio)))
						 (- (* width ratio) left-extent right-extent) (- (* height ratio) top-extent bottom-extent)))
					(t 
					 (values left top (- width left-extent right-extent) (- height top-extent bottom-extent))))
	 ;; (princ-list x ", " y ", " w ", " h)
	 (frame-resize (floor w) (floor h) frame)
	 (set-frame-position (or frame (selected-frame)) (floor x) (floor y))))))))

(defun frame-unfill-workarea (&optional frame ratio)
  (interactive)
  (precisely-do frame
   (with-frame-sizing-info frame
    (let ((ratio (if (and (numberp ratio) (<= ratio 1))
		     ratio
		   default-unfillness)))
      (if (>= ratio 1)
	  (frame-fill-workarea frame)
	(modify-frame-parameters frame '((ffw-state . unfill)))
	(multiple-value-bind (x y w h)
	    (values (+ left (/ (* width (- 1 ratio)) 2)) (+ top (/ (* height (- 1 ratio)) 2))
		    (- (* width ratio) left-extent right-extent) (- (* height ratio) top-extent bottom-extent))
	  ;; (princ-list x ", " y ", " w ", " h)	  
	  (frame-resize (floor w) (floor h) frame)
	  (set-frame-position (or frame (selected-frame)) (floor x) (floor y))))))))

(defun frame-toggle-unfill (&optional frame)
  (interactive)
  (if (equalp (frame-parameter frame 'ffw-state) 'unfill)
      (frame-fill-workarea frame)
    (frame-unfill-workarea)))

(defun frame-smart-fill-workarea (&optional frame)
  (interactive)
  (flet ((collect-ffw-state (frame)
			    (let* ((di (frame-desktop frame))
				   (fl (remove-if #'(lambda (fr)
						      (/= di (frame-desktop fr)))
						  (frame-list))))
			      (loop for fr in fl
				    when (not (equalp frame fr))
				    collect (frame-parameter fr 'ffw-state))))
	 (remove-states (s1 s2)
			(loop for s in s1
			      when (not (member s s2))
			      collect s))
	 (contain-states (s1 s2)
			 (subsetp s2 s1 :test #'equalp)))
    (let ((ffw-states (collect-ffw-state (or frame (selected-frame)))))

      (cond ((null ffw-states) (frame-fill-workarea frame))
	    ((member 'fill ffw-states) (frame-unfill-workarea frame))
	    ;; ((member 'unfill ffw-states) (frame-unfill-workarea frame))
	    (t
	     (flet ((remove-mb (dirs s1 &rest ss)
			       (if (member s1 ffw-states)
				   (remove-states dirs (list* s1 ss))
				 dirs)))
	       (let* ((dirs '(upper down left right upper-left upper-right down-left down-right))
		      (dirs (remove-mb dirs 'upper 'upper-left 'upper-right 'left 'right))
		      (dirs (remove-mb dirs 'down 'down-left 'down-right 'left 'right))	
		      (dirs (remove-mb dirs 'left 'upper-left 'down-left 'upper 'down))
		      (dirs (remove-mb dirs 'right 'upper-right 'down-right 'upper 'down))
		      (dirs (remove-mb dirs 'upper-left 'upper 'left))
		      (dirs (remove-mb dirs 'upper-right 'upper 'right))
		      (dirs (remove-mb dirs 'down-right 'down 'right))
		      (dirs (remove-mb dirs 'down-left 'down 'left)))
		 (cond ((null dirs) (frame-unfill-workarea frame))
		       (t
			(frame-fill-workarea frame (first (remove-states dirs ffw-states))))))))))))

(when auto-smart-fill
  ;; Normal
  (add-to-list 'after-make-frame-functions #'(lambda (fr)
					       ;; Make sure it start after all other actions
					       (when auto-smart-fill
						 (run-at-time precise-2 nil #'frame-smart-fill-workarea fr))))

  ;; Speedbar
  (defvar *speedbar-main-frame* nil)
  (defvar *speedbar-main-frame-ffw-state* nil)
  (defvar *speedbar-poped-up* nil)
  (defvar *speedbar-takeup* 0.20)

  (add-hook 'speedbar-after-create-hook
	    (lambda ()
	      (frame-fill-workarea nil 'right *speedbar-takeup*)
	      (define-key speedbar-mode-map (kbd "Q") 
		(lambda ()
		  (interactive)
		  (run-hooks 'speedbar-before-delete-hook)
		  (call-interactively 'delete-frame)))
	      (define-key speedbar-mode-map (kbd "q") (kbd "Q"))))

  (add-hook 'speedbar-before-popup-hook
	    (lambda ()
	      (if (not *speedbar-poped-up*)
		  (progn
		    (setq auto-smart-fill nil)
		    (setq *speedbar-poped-up* t)
		    (setq *speedbar-main-frame* (selected-frame))
		    (setq *speedbar-main-frame-ffw-state* (frame-parameter *speedbar-main-frame* 'ffw-state))
		    (frame-fill-workarea *speedbar-main-frame* 'left (- 1 *speedbar-takeup*))))))

  (add-hook 'speedbar-before-delete-hook 
	    (lambda ()
	      (setq *speedbar-poped-up* nil)
	      (setq auto-smart-fill t)
	      (frame-fill-workarea *speedbar-main-frame* *speedbar-main-frame-ffw-state*))))

(defmacro define-frame-fill-workarea-key (map key dir)
  `(progn
     (unless (fboundp ',(name-glue "frame-fill-" dir "-workarea"))
       (defun ,(name-glue "frame-fill-" dir "-workarea") ()
	 (interactive)
	 (frame-fill-workarea nil ',dir)))
     (define-key ,map ,key #',(name-glue "frame-fill-" dir "-workarea"))))

(defvar easy-frame-mode-map
  (let ((map (make-sparse-keymap)))
    (define-frame-fill-workarea-key map (kbd "M-<up>") upper)
    (define-key map (kbd "<M-kp-up>") (kbd "M-<up>"))
    (define-frame-fill-workarea-key map (kbd "M-<down>") down)
    (define-key map (kbd "<M-kp-down>") (kbd "M-<down>"))
    (define-frame-fill-workarea-key map (kbd "M-<left>") left)
    (define-key map (kbd "<M-kp-left>") (kbd "M-<left>"))
    (define-frame-fill-workarea-key map (kbd "M-<right>") right)
    (define-key map (kbd "<M-kp-right>") (kbd "M-<right>"))
    (define-frame-fill-workarea-key map (kbd "<M-kp-home>") upper-left)
    (define-frame-fill-workarea-key map (kbd "<M-kp-end>") down-left)
    (define-frame-fill-workarea-key map (kbd "<M-kp-next>") down-right)
    (define-frame-fill-workarea-key map (kbd "<M-kp-prior>") upper-right)
    (define-key map (kbd "<M-kp-begin>") #'frame-toggle-unfill)
    (define-key map (kbd "<M-kp-enter>") #'frame-smart-fill-workarea)
    (define-key map (kbd "<M-kp-add>") (kbd "C-x 5 2"))
    (define-key map (kbd "<M-kp-subtract>") (kbd "C-x 5 0"))
    (define-key map (kbd "C-x 9") #'frame-fill-workarea)
    (define-key map (kbd "C-x 7") #'frame-unfill-workarea)
    map))

(add-hook 'window-setup-hook 'easy-frame-mode)

(define-minor-mode easy-frame-mode
  "Minor Mode for Adjust Frame Parameters
   \{KEYMAP}"
  :init-value nil
  :lighter " Easy-F "
  :keymap easy-frame-mode-map
  :group 'easy-frame
  :global t
  :set (run-at-time precise-2 nil
		    (lambda nil
		      (case first-frame-x-workarea
			((fill) (frame-fill-workarea))
			((unfill) (frame-unfill-workarea))
			((upper) (frame-fill-workarea nil 'upper))
			((left) (frame-fill-workarea nil 'left))
			((smart) (frame-smart-fill-workarea))))))


;;;;;;;;;;;;;;;;  Buffer and Window Management ;;;;;;;;;;;;;;;;
(defun kill-other-buffers (&rest buffers-not-to-kill)
  "Kill buffers not listed in arguements. 
If the arguements are nil, all buffers except current buffer will be killed"
  (interactive)
  (let ((buffers-all (buffer-list))
	(buffers-not-to-kill (or buffers-not-to-kill (list (current-buffer))))
	(kill-buffer-query-functions nil))
    (mapc 'kill-buffer
	  (remove-if (lambda (buffer)
		       (memq buffer buffers-not-to-kill))
		     buffers-all))))

(defmacro kill-window-along-direction (direction &optional keymap)
  "Define buffer killing function for direction"
  (if (keymapp (eval keymap))
      (let ((key (concat "<" (symbol-name direction) ">")))
	(define-key (eval keymap) (read-kbd-macro key)
	  ((lambda (direction)
	     (name-glue "kill-" direction "-window")) 
	   direction))))
  
  `(defun ,(name-glue "kill-" direction "-window") ()
     (interactive)
     (save-selected-window
       (if (not (null (condition-case err 
			  (,((lambda (direction)
			       (name-glue "windmove-" direction)) direction))
			(error nil))))
	   ;; Do not kill buffer as such simple way, 
	   ;; or you might lose origninal window.
	   (delete-window)	; (kill-buffer-and-window)
	 ))))

(defun other-window-by-name (name &optional win)
  "Move cursor to the window with buffer named like NAME by other-window"
  (interactive "sName:")
  (let* ((current (or win (selected-window)))
	 (next (next-window current nil t)) ;; minibuffer cannot use other-window
	 (count 1)
	 (run t))
    (while run
      (if (string-match name (buffer-name (window-buffer next)))
	  (progn
	    (other-window count t)
	    (setq run nil))
	(progn 
	  (setq count (1+ count))
	  (setq next (next-window next nil t))))
      (if (eq next current)
	  (setq run nil)))))

(defun switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun switch-to-message ()
  (interactive)
  (switch-to-buffer "*Messages*"))

(defun switch-to-dot-emacs ()
  (interactive)
  (find-file "~/.emacs"))

(defun switch-to-calender ()
  (interactive)
  (if (or (not (fboundp 'calendar-exit)) 
	  (null (calendar-exit)))
      (calendar)))

(defvar max-cycle-header-count 3)
(set-default (make-variable-buffer-local 'cycle-header-count) max-cycle-header-count)
(set-default (make-variable-buffer-local 'cycle-header-format) header-line-format)
(defun cycle-tabbar-press-home ()
  (interactive)
  (let* ((tbl-fmt '(:eval (tabbar-line)))
	 (cmd-key (this-command-keys))
	 (up-p (equalp cmd-key (kbd "S-<up>")))
	 (down-p (equalp cmd-key (kbd "S-<down>"))))
    (setq cycle-header-count
	  (cond (up-p (mod (decf cycle-header-count) max-cycle-header-count))
		(down-p (mod (incf cycle-header-count) max-cycle-header-count))
		(t max-cycle-header-count)))
    (cond ((= cycle-header-count (1- max-cycle-header-count))
	   (unless (equalp header-line-format tbl-fmt)
	     (setq cycle-header-format header-line-format))
	   (setq header-line-format tbl-fmt)
	   (tabbar-press-home))
	  ((= cycle-header-count 0)
	   (unless (equalp cycle-header-format tbl-fmt)
	     (setq header-line-format cycle-header-format))
	   (when (or down-p (equalp cycle-header-format tbl-fmt))
	     (tabbar-press-home)))
	  (t (setq header-line-format tbl-fmt)
	     (when (or up-p (equalp cycle-header-format tbl-fmt))
	       (tabbar-press-home))))))

(defvar easy-buffer-window-mode-map
  (let ((map (make-sparse-keymap)))
    (kill-window-along-direction left map)
    (kill-window-along-direction right map)
    (kill-window-along-direction up map)
    (kill-window-along-direction down map)

    (macrolet ((tabbar-dwim-move (direction)
				 `(defun ,(name-glue "tabbar-dwim-" direction) ()
				    (interactive)
				    (if tabbar--buffer-show-groups
					(progn
					  (call-interactively #',(name-glue "tabbar-" direction "-group"))
					  (call-interactively #'tabbar-press-home))
				      (call-interactively #',(name-glue "tabbar-" direction))))))
      (define-key map (kbd "S-<left>") (tabbar-dwim-move backward))
      (define-key map (kbd "S-<right>") (tabbar-dwim-move forward)))

    (define-key map (kbd "S-<up>") 'cycle-tabbar-press-home)
    (define-key map (kbd "S-<down>") 'cycle-tabbar-press-home)

    (define-key map (kbd "<C-left>") 'windmove-left)
    (define-key map (kbd "<C-right>") 'windmove-right)
    (define-key map (kbd "<C-up>") 'windmove-up)
    (define-key map (kbd "<C-down>") 'windmove-down)

    (define-key map (kbd "<C-kp-left>") 'windmove-left)
    (define-key map (kbd "<C-kp-right>") 'windmove-right)
    (define-key map (kbd "<C-kp-up>") 'windmove-up)
    (define-key map (kbd "<C-kp-down>") 'windmove-down)

    (macrolet ((windmove-diagonal (hori vert)
				  `(defun ,(name-glue "windmove-" hori "-" vert) ()
				     (interactive)
				     (condition-case nil
					 (windmove-do-window-select ',hori)
				       (error
					(mapc #'windmove-do-window-select '(,vert ,hori))
					(return nil)))
				     (windmove-do-window-select ',vert))))
      (define-key map (kbd "<C-kp-home>") (windmove-diagonal left up))
      (define-key map (kbd "<C-kp-prior>") (windmove-diagonal right up))
      (define-key map (kbd "<C-kp-end>") (windmove-diagonal left down))
      (define-key map (kbd "<C-kp-next>") (windmove-diagonal right down)))

    (define-key map (kbd "<delete>") 'kill-buffer-and-window)
    (define-key map (kbd "<kp-delete>") (kbd "<delete>"))
    (if (not window-system)
	(define-key map (kbd "<deletechar>") (kbd "<delete>")))

    (define-key map (kbd "S-<delete>")
      (lambda ()
	(interactive)
	(kill-other-buffers (current-buffer)
			    (get-buffer "*scratch*")
			    (get-buffer "*Messages*")
			    (get-buffer "*ielm*")
			    (get-buffer "*eshell*"))
	(call-interactively 'delete-other-windows)))

    (define-key map (kbd "C-x C-b") 'windmove-list-buffer)
    (define-key map (kbd "C-S-M-g") 'revert-buffer)

    (define-key map (kbd "<f10>") nil) ;Conflict with GDB's key binding for gud-step
    (define-key map (kbd "<f1> <f10>") 'menu-bar-open)

    (define-key map (kbd "C-`") 'switch-to-calender)

    (define-key map (kbd "<home>") 'ielm)
    (define-key map (kbd "<kp-home>") 'ielm)

    (define-key map (kbd "<end>") 'switch-to-dot-emacs)
    (define-key map (kbd "<kp-end>") 'switch-to-dot-emacs)
    (when (not window-system)
      (define-key map (kbd "<select>") 'switch-to-dot-emacs))

    (define-key map (kbd "<insert>") 'switch-to-message)
    (define-key map (kbd "<kp-insert>") 'switch-to-message)
    (when (not window-system)
      (define-key map (kbd "<insertchar>") 'switch-to-message))

    (define-key map (kbd "<kp-left>") 'switch-to-scratch)
    (define-key map (kbd "<kp-up>") 'eshell)
    (define-key map (kbd "<kp-begin>") 'w3m)
    (define-key map (kbd "<kp-down>") 'erc)

    map))

(define-minor-mode easy-buffer-window-mode
  "Make buffer and window management easier by special keymap."
  :lighter " Easy-B&W "
  :keymap easy-buffer-window-mode-map
  :group 'easy-buffer-window
  :global t)

(defun easy-buffer-window-mode-on ()
  (interactive)
  (easy-buffer-window-mode 1))

(defun easy-buffer-window-mode-off ()
  (interactive)
  (easy-buffer-window-mode 0))

(easy-buffer-window-mode-on)

;;;;;;;;;;;;;;;; Tabbar ;;;;;;;;;;;;;;;;
(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
   (cond ((member (buffer-name) '("*scratch*" "*Messages*" "*ielm*" ".emacs"))
	  "Emacs")
	 ((eq major-mode 'dired-mode)
	  "Dired")
	 ((memq major-mode '(help-mode apropos-mode Info-mode Man-mode))
	  "Help")
	 ((or (memq major-mode '(lisp-mode slime-repl-mode sldb-mode slime-thread-control-mode slime-connection-list-mode slime-sprof-browser-mode))
	      (search "*inferior-lisp*" (buffer-name))
	      (search "*slime-events*" (buffer-name)))
	  "Common Lisp")
	 ((or (memq major-mode '(scheme-mode inferior-scheme-mode geiser-doc-mode geiser-debug-mode geiser-repl-mode))
	      (search "*scheme*" (buffer-name)))
	  "Scheme")
	 ((memq major-mode '(c-mode c++-mode objc-mode))
	  "C/C++")
	 ((memq major-mode '(rmail-mode
			     rmail-edit-mode vm-summary-mode vm-mode mail-mode
			     mh-letter-mode mh-show-mode mh-folder-mode
			     gnus-summary-mode message-mode gnus-group-mode
			     gnus-article-mode score-mode gnus-browse-killed-mode))
	  "Mail")
	 ((or (get-buffer-process (current-buffer))
	      ;; Check if the major mode derives from `comint-mode' or
	      ;; `compilation-mode'.
	      (tabbar-buffer-mode-derived-p major-mode '(comint-mode compilation-mode)))
	  "Process")
	 (t
	  ;; Return `mode-name' if not blank, `major-mode' otherwise.
	  (if (and (stringp mode-name)
		   ;; Take care of preserving the match-data because this
		   ;; function is called when updating the header line.
		   (save-match-data (string-match "[^ ]" mode-name)))
	      mode-name
	    (symbol-name major-mode))))))

(defun tabbar-buffer-update-groups ()
  "Update tab sets from groups of existing buffers.
Return the the first group where the current buffer is."
  (let ((bl (sort
             (mapcar
              #'(lambda (b)
                  (with-current-buffer b
                    (list (current-buffer)
                          (buffer-name)
                          (if tabbar-buffer-groups-function
                              (funcall tabbar-buffer-groups-function)
                            '("Emacs")))))
              (and tabbar-buffer-list-function
                   (funcall tabbar-buffer-list-function)))
             #'(lambda (e1 e2)
                 (string-lessp (nth 1 e1) (nth 1 e2))))))
    ;; If the cache has changed, update the tab sets.
    (unless (equal bl tabbar--buffers)
      ;; Add new buffers, or update changed ones.
      (dolist (e bl)
        (dolist (g (nth 2 e))
          (let ((tabset (tabbar-get-tabset g)))
            (if tabset
                (unless (equal e (assq (car e) tabbar--buffers))
                  ;; This is a new buffer, or a previously existing
                  ;; buffer that has been renamed, or moved to another
                  ;; group.  Update the tab set, and the display.
                  (tabbar-add-tab tabset (car e) t)
                  (tabbar-set-template tabset nil))
              (tabbar-make-tabset g (car e))))))
      ;; Remove tabs for buffers not found in cache or moved to other
      ;; groups, and remove empty tabsets.
      (mapc 'tabbar-delete-tabset
            (tabbar-map-tabsets
             #'(lambda (tabset)
                 (dolist (tab (tabbar-tabs tabset))
                   (let ((e (assq (tabbar-tab-value tab) bl)))
                     (or (and e (memq tabset
                                      (mapcar 'tabbar-get-tabset
                                              (nth 2 e))))
                         (tabbar-delete-tab tab))))
                 ;; Return empty tab sets
                 (unless (tabbar-tabs tabset)
                   tabset))))
      ;; The new cache becomes the current one.
      (setq tabbar--buffers bl)))
  ;; Return the first group the current buffer belongs to.
  (car (nth 2 (assq (current-buffer) tabbar--buffers))))

;;;;;;;;;;;;;;;; Buffer List ;;;;;;;;;;;;;;;;
(defun windmove-list-buffer ()
  (interactive)
  (call-interactively 'list-buffers)
  (other-window-by-name "*Buffer List*"))

(define-key Buffer-menu-mode-map (kbd "C-m") 
  (lambda ()
    (interactive)
    (mapc 'call-interactively '(Buffer-menu-this-window delete-other-windows))))

(define-key Buffer-menu-mode-map (kbd "e") (kbd "C-m"))

;;;;;;;;;;;;;;;; Session ;;;;;;;;;;;;;;;;
;;(add-hook 'after-init-hook 'session-initialize)

;;;;;;;;;;;;;;;; Search At Point ;;;;;;;;;;;;;;;;
(defun isearch-current-word-forward (&optional regexp-p no-recursive-edit)
  (interactive "P\np")
  (isearch-mode t (not (null regexp-p)) nil (not no-recursive-edit))
  (isearch-yank-string (current-word)))

(defun isearch-current-word-backward (&optional regexp-p no-recursive-edit)
  (interactive "P\np")
  (isearch-mode nil (not (null regexp-p)) nil (not no-recursive-edit))
  (isearch-yank-string (current-word)))

(global-set-key (kbd "C-*") 'isearch-current-word-forward)
(global-set-key (kbd "C-#") 'isearch-current-word-backward)

(define-key isearch-mode-map (kbd "C-*") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "C-#") 'isearch-repeat-backward)

;;;;;;;;;;;;;;;; Point History BackTrace ;;;;;;;;;;;;;;;;
(defvar group-mode-alist nil
  "A replacement for push curpos when mode-across curpos comes into trouble. e.g. c, c++ mode")

(defvar mode-map-alist nil
  "A replacement for the default mode map naming scheme")

(defsubst group-mode-name (mode)
  "Make a name replacement for mode"
  (symbol-name (or (cdr (assoc mode group-mode-alist)) mode)))

(defsubst mode-map-name (mode-map)
  "Make a name replacement for mode-map"
  (symbol-name (or (cdr (assoc mode-map mode-map-alist)) mode-map)))

(defsubst current-mode-curpos-push ()
  "Return the symbol of which function definition is MODE-push-curpos"
  (name-glue major-mode "-push-curpos"))

(defsubst group-mode-curpos-push ()
  (name-glue (group-mode-name major-mode) "-push-curpos"))

(defsubst curpos-buffer (curpos)
  (car curpos))

(defsubst curpos-point (curpos)
  (cdr curpos))

(defsubst valid-curpos-p (curpos)
  (and (buffer-live-p (curpos-buffer curpos))
       (integer-or-marker-p (curpos-point curpos))
       curpos))

(defsubst current-curpos ()
  (cons (current-buffer) (point)))

(defsubst make-curpos (&optional buffer point)
  (or (valid-curpos-p (cons buffer point))
      (current-curpos)))

(defmacro add-curpos-advice (group-mode &rest adviced-function)
  "Add push-curpos advice for each global defined function. 
The advice call MODE-push-curpos by current major-mode"
  `(progn
     ,@(mapcar (lambda (func)
		 (list 'defadvice func (list 'around (name-glue group-mode "-push-curpos") 'activate)
		       (list 'cond
			     (list (list 'and (list 'called-interactively-p ''interactive) (list 'string-equal (symbol-name group-mode) '(group-mode-name major-mode)))
				   '(cond ((fboundp (current-mode-curpos-push))
					   (funcall (current-mode-curpos-push)))
					  ((fboundp (group-mode-curpos-push))
					   (funcall (group-mode-curpos-push))))
				   'ad-do-it
				   '(cond ((fboundp (current-mode-curpos-push))
					   (funcall (current-mode-curpos-push)))
					  ((fboundp (group-mode-curpos-push))
					   (funcall (group-mode-curpos-push))))
				   'ad-return-value)
			     (list 't
				   'ad-do-it
				   'ad-return-value))))
	       adviced-function)))

(defmacro mode-local-curpos (mode &rest adviced-function)
  "Define mode local curpos, each curpos has MODE name prefixed"
  `(progn
     (defvar ,(name-glue mode "-curpos-history") nil
       "Record the positions of the cursor in the form of (buffer . point)")
     (defvar ,(name-glue mode "-curpos-bottom") nil
       "Oldest curpos in history")
     (defvar ,(name-glue mode "-curpos-top") nil
       "Current push curpos")
     (defvar ,(name-glue mode "-curpos-cur") nil
       "Current backtrack curpos")
     (defvar ,(name-glue mode "-curpos-max-count") 5120
       "Maximum curpos allowed in history")
     (defvar ,(name-glue mode "-curpos-cur-count") 0
       "Current curpos in history")
     
     (defun ,(name-glue mode "-push-curpos") (&optional dont-update-curpos-cur-p)
       "Push current cursor position in curpose-history"
       (let ((newpos (current-curpos)))
	 (cond
	  ((equal newpos ,(name-glue mode "-curpos-top"))
	   nil)
	  ((null ,(name-glue mode "-curpos-history"))
	   (setq ,(name-glue mode "-curpos-top") newpos
		 ,(name-glue mode "-curpos-bottom") newpos
		 ,(name-glue mode "-curpos-history") (cons newpos ,(name-glue mode "-curpos-history")))
	   (incf ,(name-glue mode "-curpos-cur-count"))
	   (unless dont-update-curpos-cur-p
	     (setq ,(name-glue mode "-curpos-cur") ,(name-glue mode "-curpos-history"))))
	  ((< ,(name-glue mode "-curpos-max-count") ,(name-glue mode "-curpos-cur-count"))
	   (setq ,(name-glue mode "-curpos-top") newpos
		 ,(name-glue mode "-curpos-history") (butlast (cons newpos ,(name-glue mode "-curpos-history")))
		 ,(name-glue mode "-curpos-cur") (butlast ,(name-glue mode "-curpos-cur"))
		 ,(name-glue mode "-curpos-bottom") (car (last ,(name-glue mode "-curpos-history"))))
	   (unless dont-update-curpos-cur-p
	     (setq ,(name-glue mode "-curpos-cur") ,(name-glue mode "-curpos-history"))))
	  (t
	   (setq ,(name-glue mode "-curpos-top") newpos
		 ,(name-glue mode "-curpos-history") (cons newpos ,(name-glue mode "-curpos-history")))
	   (incf ,(name-glue mode "-curpos-cur-count"))
	   (unless dont-update-curpos-cur-p
	     (setq ,(name-glue mode "-curpos-cur") ,(name-glue mode "-curpos-history"))))))
       ,(name-glue mode "-curpos-history"))
     
     (defun ,(name-glue mode "-clear-curpos") ()
       "Update curpos-history"
       (setq ,(name-glue mode "-curpos-history") (remove-if-not #'valid-curpos-p ,(name-glue mode "-curpos-history")))
       (setq ,(name-glue mode "-curpos-cur") (or (remove-if-not #'valid-curpos-p ,(name-glue mode "-curpos-cur"))
						 ,(name-glue mode "-curpos-history")))
       (setq ,(name-glue mode "-curpos-top") (car ,(name-glue mode "-curpos-history")))
       (setq ,(name-glue mode "-curpos-bottom") (car (last ,(name-glue mode "-curpos-history"))))
       (setq ,(name-glue mode "-curpos-cur") ,(name-glue mode "-curpos-history"))
       (setq ,(name-glue mode "-curpos-cur-count") (length ,(name-glue mode "-curpos-history"))))

     (defun ,(name-glue mode "-empty-curpos") ()
       "Empty curpos-history"
       (interactive)
       (setq ,(name-glue mode "-curpos-history") nil)
       (setq ,(name-glue mode "-curpos-top") nil)
       (setq ,(name-glue mode "-curpos-bottom") nil)
       (setq ,(name-glue mode "-curpos-cur") nil)
       (setq ,(name-glue mode "-curpos-cur-count") 0))
     
     (defun ,(name-glue mode "-backtrace-curpos") ()
       "Backtrace the curpos-history stack"
       (interactive)
       (let* ((current-curpos (current-curpos))
	      (target-curpos (car ,(name-glue mode "-curpos-cur"))))
	 (unless (valid-curpos-p target-curpos)
	   (,(name-glue mode "-clear-curpos"))
	   (setq target-curpos (car ,(name-glue mode "-curpos-cur"))))
	 (cond ((not (valid-curpos-p target-curpos))
		(,(name-glue mode "-push-curpos") t)
		nil)
	       ((equal current-curpos target-curpos)
		(setq ,(name-glue mode "-curpos-cur") (cdr ,(name-glue mode "-curpos-cur")))
		(,(name-glue mode "-backtrace-curpos")))
	       (t
		(,(name-glue mode "-push-curpos") t)
		(switch-to-buffer (curpos-buffer target-curpos))
		(goto-char (curpos-point target-curpos))
		(,(name-glue mode "-push-curpos") t)))))
     
     (add-curpos-advice ,mode ,@adviced-function) ; Define each advice function for push-curpos

     ,@(mapcar (lambda (group)
		 `(define-key ,(name-glue (mode-map-name group) "-map") (kbd "S-<f12>") ; Define each keymap for curpos-backtrace
		    ',(name-glue mode "-backtrace-curpos")))
	       `(,mode			;All keymaps in group-mode-alist as a group
		 ,@(or (remove nil (mapcar (lambda (pair)
					     (if (eq (cdr pair) mode)
						 (car pair)))
					   group-mode-alist))
		       nil)))))

(setq group-mode-alist '((c++-mode . c-mode-base) ;C/C++ as a group
			 (c-mode . c-mode-base)
			 (asm-mode . c-mode-base)
			 (lisp-interaction-mode . lisp-mode) ;Lisps as a group
			 (emacs-lisp-mode . lisp-mode)))

(setq mode-map-alist '((shell-script-mode . sh-mode)))

(mode-local-curpos c-mode-base		;Notice c-mode-base is a mode-goup instead of mode
		   forward-word
		   backward-word
		   forward-paragraph
		   backward-paragraph
		   forward-sentence
		   backward-sentence
		   end-of-buffer
		   beginning-of-buffer
		   goto-line
		   move-beginning-of-line
		   move-end-of-line
		   isearch-repeat-backward
		   isearch-repeat-forward
		   isearch-current-word-backward
		   isearch-current-word-forward
		   mouse-set-point
		   mouse-drag-region
		   semantic-complete-jump-local
		   semantic-ia-fast-jump
		   find-tag
		   scroll-up
		   scroll-down
		   c-beginning-of-statement
		   c-end-of-statement
		   c-up-conditional
		   c-backward-conditional
		   c-forward-conditional
		   end-of-defun
		   beginning-of-defun)

(mode-local-curpos lisp-mode		;lisp-mode itself is a mode and stands for other two lisp mode as mode-group
		   forward-word
		   backward-word
		   forward-paragraph
		   backward-paragraph
		   forward-sentence
		   backward-sentence
		   forward-page
		   backward-page
		   end-of-buffer 
		   beginning-of-buffer
		   beginning-of-sexp
		   end-of-sexp
		   forward-sexp
		   backward-sexp
		   backward-up-list
		   move-beginning-of-line
		   move-end-of-line
		   goto-line 
		   isearch-repeat-backward
		   isearch-repeat-forward
		   isearch-current-word-backward
		   isearch-current-word-forward
		   mouse-set-point
		   mouse-drag-region
		   semantic-complete-jump-local
		   semantic-ia-fast-jump
		   scroll-up
		   scroll-down
		   slime-edit-definition
		   paredit-forward
		   paredit-backward
		   paredit-forward-up
		   paredit-forward-down
		   paredit-backward-up
		   paredit-backward-down
		   end-of-defun
		   beginning-of-defun)

(mode-local-curpos text-mode 
		   forward-word
		   backward-word
		   forward-paragraph
		   backward-paragraph
		   forward-sentence
		   backward-sentence
		   end-of-buffer
		   beginning-of-buffer 
		   goto-line 
		   move-beginning-of-line
		   move-end-of-line
		   isearch-repeat-backward
		   isearch-repeat-forward
		   isearch-current-word-backward
		   isearch-current-word-forward
		   mouse-set-point
		   mouse-drag-region
		   scroll-up
		   scroll-down)

(mode-local-curpos shell-script-mode
		   forward-word
		   backward-word
		   forward-paragraph
		   backward-paragraph
		   forward-sentence
		   backward-sentence
		   end-of-buffer
		   beginning-of-buffer 
		   goto-line 
		   move-beginning-of-line
		   move-end-of-line
		   isearch-repeat-backward
		   isearch-repeat-forward
		   isearch-current-word-backward
		   isearch-current-word-forward
		   mouse-set-point
		   mouse-drag-region
		   scroll-up
		   scroll-down)

;;;;;;;;;;;;;;;; Org ;;;;;;;;;;;;;;;;
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)	; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")
	(sequence "|" "|" "CANCELED")
	(sequence "计划中" "对应中" "对应完成" "检查中" "检查完成" "|" "取消" "完成")))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;;;;;;;;;;;;;;;; Dired ;;;;;;;;;;;;;;;;
(defun file-manager ()
  (interactive)
  (shell-command "nautilus $(pwd) || thunar $(pwd)" "*Messages*" "*Messages*"))

(defun terminal ()
  (interactive)
  (shell-command "gnome-terminal --working-directory=$(pwd) || terminal --working-directory=$(pwd)" "*Messages*" "*Messages*"))

(defun etags ()
  (interactive)
  (shell-command "find ./ -type f -name '*' -print0 | xargs --null etags -R" "*Messages*" "*Messages*"))

(tool-bar-add-item "file-manager" 'file-manager 'file-manager :visible '(memq major-mode '(dired-mode)))
(tool-bar-add-item "terminal" 'terminal 'terminal :visible '(memq major-mode '(dired-mode)))
(mapc (lambda (mode-hook)
	(add-hook mode-hook (lambda ()
			      (progn
				(define-key dired-mode-map (kbd "N") 'file-manager)
				(define-key dired-mode-map (kbd "b") 'terminal)
				(define-key dired-mode-map (kbd "E") 'etags)))))
      '(dired-mode-hook))

;;;;;;;;;;;;;;;; Linum and Text Rescaling ;;;;;;;;;;;;;;;;
(defun rescale-window-margin-by-faceremapping (win)
  (let ((width (car (window-margins)))
	(scale (cadr (assoc ':height 
			    (assoc 'default 
				   face-remapping-alist)))))
    (if (numberp scale)
	(progn
	  (set-window-margins win (ceiling (* width scale)) (cdr (window-margins win)))
	  (force-window-update))
      nil)))

(defadvice linum-update-window (after scaling-margin-width last (win) activate)
  (rescale-window-margin-by-faceremapping win)
  ad-return-value)

(mapc (lambda (mode-hook)
	(add-hook mode-hook 'linum-on))
      '(c-mode-hook c++-mode-hook sh-mode-hook lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook asm-mode-hook))

(with-current-buffer "*Messages*"
  (linum-on))

(global-set-key (kbd "M-<mouse-4>") 'text-scale-increase)
(global-set-key (kbd "M-<mouse-5>") 'text-scale-decrease)

;;;;;;;;;;;;;;;; Slime ;;;;;;;;;;;;;;;;
(when (or (load (file-truename "~/quicklisp/slime-helper.el") t)
	  (require 'slime))
  
  (defmacro defrun-lisp-impl (name command &rest key-args)
    (setq slime-lisp-implementations
	  (cons `(,name ,(split-string command) ,@key-args) slime-lisp-implementations))
    `(defun ,(name-glue "run-" name) ()
       (interactive)
       (slime ',name)))
  
  (defrun-lisp-impl clisp "clisp" :coding-system utf-8-unix)
  (defrun-lisp-impl ccl "ccl" :coding-system utf-8-unix)
  (defrun-lisp-impl sbcl "sbcl" :coding-system utf-8-unix)
  
  (slime-setup '(slime-fancy ;meta for autodoc, editing-command, fuzzy, scratch, etc.
		 slime-asdf
		 slime-sprof
		 slime-banner))

  (defun slime-repl-insert-prompt ()
    (goto-char slime-repl-input-start-mark)
    (unless slime-repl-suppress-prompt
      (slime-save-marker slime-output-start
	(slime-save-marker slime-output-end
	  (unless (bolp) (insert-before-markers "\n"))
	  (let ((prompt-start (point))
		(prompt (format "%s@%s> " (upcase (slime-lisp-implementation-name)) (slime-lisp-package-prompt-string))))
	    (slime-propertize-region
		'(face slime-repl-prompt-face read-only t intangible t
		       slime-repl-prompt t
		       rear-nonsticky (slime-repl-prompt read-only face intangible)
		       start-open t end-open t)
	      (insert-before-markers prompt))
	    (set-marker slime-repl-prompt-start-mark prompt-start)
	    prompt-start)))))
  
  (setq common-lisp-hyperspec-root (format "file://%s" (file-truename "~/.emacs.d/contrib/hyperspec/")))
  (setq slime-autodoc-use-multiline-p t)

  (add-hook 'slime-mode-hook
  	    (lambda ()
  	      (unless (slime-connected-p)
		(when (eq major-mode 'lisp-mode)
		  (labels ((src-revisit
			    ()
			    (remove-hook 'slime-connected-hook #'src-revisit)
			    (switch-to-buffer (slime-recently-visited-buffer 'lisp-mode))))
		    (add-hook 'slime-connected-hook #'src-revisit t)))
		(slime))))
  
  (add-hook 'slime-connected-hook
	    (lambda ()
	      (define-key easy-buffer-window-mode-map (kbd "C-c s") 'slime-selector) ; Enable Slime-selector
	      (define-key easy-buffer-window-mode-map (kbd "<kp-prior>") (kbd "C-c s r")) ;do not use slime-repl because it changes widnows
	      (define-key easy-buffer-window-mode-map (kbd "<kp-right>") (kbd "C-c s i"))
	      (define-key easy-buffer-window-mode-map (kbd "<kp-next>") (kbd "C-c s v")) ; do not use slime-events-buffer directly, it might create even slime not start
	      (define-key easy-buffer-window-mode-map (kbd "<prior>") (kbd "<kp-prior>"))
	      (define-key easy-buffer-window-mode-map (kbd "<next>") (kbd "<kp-next>"))))

  (defadvice slime-kill-all-buffers (after restore-key-bindings activate)
    (define-key easy-buffer-window-mode-map (kbd "C-c s") nil)
    (define-key easy-buffer-window-mode-map (kbd "<kp-prior>") 'scroll-down) ; Kludge: store then restore must be better than this.
    (define-key easy-buffer-window-mode-map (kbd "<kp-right>") nil)
    (define-key easy-buffer-window-mode-map (kbd "<kp-next>") 'scroll-up)
    (define-key easy-buffer-window-mode-map (kbd "<prior>") 'scroll-down)
    (define-key easy-buffer-window-mode-map (kbd "<next>") 'scroll-up)
    ad-return-value)
  
  (let ((fasls-dir "/tmp/slime-fasls/"))
    (setq slime-compile-file-options '(:fasl-directory fasls-dir))
    (make-directory fasls-dir t)))

;;;;;;;;;;;;;;;; Scheme Programming ;;;;;;;;;;;;;;;;
(defadvice run-geiser (after good-geiser-run last activate)
  (let ((cur-buf (current-buffer)))
    (geiser-syntax--font-lock-buffer)
    (set-process-query-on-exit-flag (get-buffer-process cur-buf) nil)
    (switch-to-buffer cur-buf))
  ad-return-value)

(defadvice run-scheme (after good-quack-run last activate)
  (let ((cur-buf (current-buffer)))
    (set-process-query-on-exit-flag (get-buffer-process cur-buf) nil))
  ad-return-value)

(defadvice geiser-repl--save-remote-data (around no-setq-head-line-format (address) activate)
  (setq geiser-repl--address address)
  ;; (setq header-line-format (and address
  ;;                               (format "Host: %s   Port: %s"
  ;;                                       (geiser-repl--host)
  ;;                                       (geiser-repl--port))))
  )

(mapc (lambda (hook)
	(add-hook hook 
		  (lambda ()
		    (switch-to-buffer (prog1
					  (current-buffer) 
					(switch-to-racket))))
		  t))
      (list 'scheme-mode-hook))

;;;;;;;;;;;;;;;; Lisp/Elisp Programming ;;;;;;;;;;;;;;;;
(defun ielm-quit-sentinel (proc change)
  "Clean up of buffers, when eilm quit."
  (when (string-match "\\(finished\\|exited\\|killed\\|quit\\)" change)
    (condition-case nil
	(kill-buffer (process-buffer proc))
      (error (print "error")))))

(defun delete-sexp (&optional arg)
  "Delete the sexp (balanced expression) following point.
With ARG, delete that many sexps after point.
Negative arg -N means delete N sexps before point.
This command assumes point is not in a string or comment."
  (interactive "p")
  (let ((opoint (point)))
    (forward-sexp (or arg 1))
    (delete-region opoint (point))))

(defun hug-sexp-a-hug ()
  "Insert a pair of parenthesis around the sexp at point"
  (interactive)
  (let ((balance-p (condition-case nil (prog1 t (check-parens))
		     (error nil))))
    (if balance-p
	(progn
	  (insert ?\()
	  (forward-sexp)
	  (insert ?\))
	  (backward-sexp)
	  (forward-char)
	  t)
      nil)))

(defun rip-sexp-a-hug ()
  "Delete surrounding parenthesis and the first sexp in it"
  (interactive)
  (backward-up-list)
  (forward-sexp)
  (backward-delete-char 1)
  (backward-up-list)
  (delete-char 1)
  (kill-sexp))

(defun replace-sexp-at-point ()
  (interactive)
  (save-excursion
    (yank 1)
    (delete-sexp 1)))

(mapc (lambda (hook)
	(add-hook hook 
		  (lambda ()
		    (paredit-mode 1)
		    (rainbow-delimiters-mode 1))))
      (list 'emacs-lisp-mode-hook 'ielm-mode-hook 'lisp-interaction-mode-hook 'lisp-mode-hook 'slime-repl-mode-hook 'inferior-lisp-mode-hook 'scheme-mode-hook 'geiser-repl-mode-hook 'inferior-scheme-mode-hook))

;; (mapc (lambda (hook)
;; 	(add-hook hook 
;; 		  (lambda ()
;; 		    (set-face-foreground 'paren-face "gray70"))))
;;       (list 'emacs-lisp-mode-hook 'ielm-mode-hook 'lisp-interaction-mode-hook 'lisp-mode-hook 'slime-repl-mode-hook 'inferior-lisp-mode-hook))

;; (mapc (lambda (hook)
;; 	(add-hook hook 
;; 		  (lambda ()
;; 		    (rainbow-delimiters-mode 1))))
;;       (list 'scheme-mode-hook 'geiser-repl-mode-hook 'inferior-scheme-mode-hook))

(add-hook 'ielm-mode-hook 
	  (lambda ()
	    (eldoc-mode)
	    (let ((process (get-buffer-process (current-buffer))))
	      (when (processp process)
		(set-process-sentinel process 'ielm-quit-sentinel)))))

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (eldoc-mode)))

(mapc (lambda (map)
	(define-key map (kbd "C-S-r") 'replace-sexp-at-point)
	(define-key map (kbd "C-S-i") 'hug-sexp-a-hug)
	(define-key map (kbd "C-S-o") 'rip-sexp-a-hug))
      (list lisp-mode-map emacs-lisp-mode-map lisp-interaction-mode-map scheme-mode-map))

(mapc (lambda (map)
	(define-key map (kbd "TAB") 'slime-indent-and-complete-symbol))
      (list lisp-mode-map))

					; Switching () and [] keys, I don't like it. 
					; But it really relieves my fingers' wrick :P
;; (swap-key-translation (kbd "(") (kbd "["))
;; (swap-key-translation (kbd ")") (kbd "]"))
;;;;;;;;;;;;;;;; C/C++ Programming ;;;;;;;;;;;;;;;;
(fset 'kill-c-comment
      (lambda (&optional arg) 
	"Kill C/C++ Comment" 
	(interactive "p") 
	(kmacro-exec-ring-item 
	 (quote ("\223//\\|/\\*\273" 0 "%d")) 
	 arg)))

(fset 'kill-c-blank-line
      (lambda (&optional arg) 
	"Kill C/C++ Blank Line" 
	(interactive "p") 
	(kmacro-exec-ring-item 
	 (quote ("\223^[[:space:]]*$" 0 "%d")) 
	 arg)))

(define-key c-mode-base-map (kbd "C-M-S-c") 'kill-c-comment)
(define-key c-mode-base-map (kbd "C-M-S-b") 'kill-c-blank-line)

(define-key c-mode-base-map (kbd "<f12>") 'semantic-ia-fast-jump)
(define-key c-mode-base-map (kbd "M-<f12>") 'eassist-switch-h-cpp)
(define-key c-mode-base-map (kbd "M-S-<f12>") 'semantic-analyze-proto-impl-toggle)

(define-key c-mode-base-map (kbd "<f8>") 'ecb-minor-mode)

(define-key c-mode-base-map (kbd "<f5>") 'gdb)
(define-key c-mode-base-map (kbd "<f6>") 'compile)
(define-key c-mode-base-map (kbd "S-<f5>") (lambda ()
					     (interactive)				     
					     (mapc 'call-interactively '(gdb gdb-many-windows))))
(define-key c-mode-base-map (kbd "M-S-<f5>") (lambda ()
					       (interactive)
					       (mapc 'call-interactively '(compile gdb gdb-many-windows))))

(tool-bar-add-item "gud" 'gdb 'gdb :visible '(memq major-mode '(c++-mode c-mode)))
(tool-bar-add-item "compile" 'compile 'compile :visible '(memq major-mode '(c++-mode c-mode)))

;;;;;;;;;;;;;;;; Compiler ;;;;;;;;;;;;;;;;
(defvar compile-output-time 3.0)

(add-to-list 'compilation-finish-functions
	     (lambda (buffer string)
	       (when (and (string= (buffer-name buffer) "*compilation*")
			  (not (string-match "exited abnormally" string)))
		 (run-at-time compile-output-time nil 'delete-windows-on buffer))))

;;;;;;;;;;;;;;;; GDB and GUD ;;;;;;;;;;;;;;;;
(defvar gdb-fn-mode-map 
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<f5>") 'gud-go)
    (define-key map (kbd "<f9>") (lambda () (interactive) (mapc 'call-interactively '(windmove-source-window gud-break))))
    (define-key map (kbd "S-<f9>") (lambda () (interactive) (mapc 'call-interactively '(windmove-source-window gud-remove))))
    (define-key map (kbd "<f10>") 'gud-step)
    (define-key map (kbd "<f11>") 'gud-next)
    (define-key map (kbd "S-<f10>") 'gud-finish)
    (define-key map (kbd "ESC") (lambda () (interactive) (mapc 'call-interactively '(windmove-gdb-window comint-send-eof))))
    map)
  "Keymap for `gdb-fn-mode'.")

(define-minor-mode gdb-fn-mode
  "Toggle GDB FN Key Available.
     With no argument, this command toggles the mode.
     Non-null prefix argument turns on the mode.
     Null prefix argument turns off the mode.
     \{KEYMAP}
     When gdb-fn-key-mode mode is enabled, the function key
     [f5], [f9], [f10], [f11] are enabled for debugging commands"
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter "Gdb-FN"
  :global t
  ;; The minor mode bindings.
  :keymap gdb-fn-mode-map)

(define-globalized-minor-mode global-gdb-fn-mode gdb-fn-mode 
  (lambda ()
    (gdb-fn-mode 1))
  :require 'gud)

(defun gdb-quit-sentinel (proc change)
  "Clean up of buffers, fn keys, etc. when GDB quit."
  (when (string-match "\\(finished\\|exited\\|killed\\)" change)
    (condition-case nil
	(let ((src-buffer (condition-case nil
			      (or (and (not (null gdb-many-windows)) 
				       (not (null gdb-show-main)) 
				       (window-buffer gdb-source-window))
				  (gud-find-file gdb-main-file))
			    (error "*scratch*"))))
	  (global-gdb-fn-mode -1)	;Disable GDB's Function Key
	  (delete-other-windows	;Restore Source window
	   (get-buffer-window (switch-to-buffer src-buffer)))
	  (mapc (lambda (name-func) ;Kill all dead buffer associate with GDB
		  (condition-case nil
		      (let ((buffer (get-buffer (funcall name-func))))
			(and (buffer-live-p buffer) (kill-buffer buffer)))
		    (error nil)))
		`(gdb-assembler-buffer-name
		  gdb-memory-buffer-name
		  gdb-stack-buffer-name
		  gdb-registers-buffer-name
		  gdb-threads-buffer-name
		  gdb-locals-buffer-name
		  gdb-breakpoints-buffer-name
		  ,(lambda ()	;This is the gud comint buffer
		     (buffer-name (process-buffer proc)))))
	  (switch-to-buffer src-buffer)
	  (gdb-many-windows -1)	;Disable GDB Many windows
	  (gud-reset)
	  (gdb-reset))
      (error nil))))

(defun kill-gdb-process ()
  "kill gdb process"
  (interactive)
  (with-current-buffer gud-comint-buffer 
    (comint-skip-input))
  (set-process-query-on-exit-flag (get-buffer-process gud-comint-buffer) nil)
  (kill-buffer gud-comint-buffer))

(defun easy-gdb ()
  "Make gdb easy to use"
  ;; Enable and Clean up FN keys
  (global-gdb-fn-mode 1)
  ;; Close gdb buffer when gdb quit, Clean up windows if multiple windows are shown
  (let ((process (get-buffer-process (current-buffer))))
    (when (processp process)
      (set-process-sentinel process 'gdb-quit-sentinel))))

(defun windmove-source-window ()
  (interactive)
  (other-window-by-name (buffer-name (window-buffer gdb-source-window))))

(defun windmove-gdb-window ()
  (interactive)
  (other-window-by-name (buffer-name gud-comint-buffer)))

(mapc (lambda (mode-hook)
	(add-hook mode-hook 'easy-gdb))
      '(gdb-mode-hook gud-mode-hook))
;;;;;;;;;;;;;;;; ERC ;;;;;;;;;;;;;;;;
;; Join the #emacs and #erc channels whenever connecting to Freenode.
(setq erc-autojoin-channels-alist '(("freenode.net" 
				     "#emacs" 
				     "#lisp" 
				     "#sbcl" 
				     "#opengl3" 
				     "#blender" 
				     "#blendercn" 
				     "#blenderwiki" 
				     "#blenderpython" 
				     "#gameblender" 
				     "#maxima")))

;; Interpret mIRC-style color commands in IRC chats
(setq erc-interpret-mirc-color t)

;; The following are commented out by default, but users of other
;; non-Emacs IRC clients might find them useful.
;; Kill buffers for channels after /part
(setq erc-kill-buffer-on-part t)
;; Kill buffers for private queries after quitting the server
(setq erc-kill-queries-on-quit t)
;; Kill buffers for server messages after quitting the server
(setq erc-kill-server-buffer-on-quit t)

;;;;;;;;;;;;;;;; Misc ;;;;;;;;;;;;;;;;
;;(set-process-query-on-exit-flag (get-buffer-process (get-buffer "*shell*")) nil)

(global-set-key (kbd "C-x M-v") 
		(lambda ()
		  (interactive)
		  (if visual-line-mode 
		      (visual-line-mode 0))
		  (setq word-wrap nil)
		  (if truncate-lines
		      (toggle-truncate-lines -1)
		    (toggle-truncate-lines 1))))

(global-set-key (kbd "C-<f12>") 'find-file-at-point)
(global-set-key (kbd "C-S-f") 'find-grep)

;;;;;;;;;;;;;;;; PP ControlL ;;;;;;;;;;;;;;;;
(pretty-control-l-mode 1)

(defun ^L-line-ocuppy ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (insert ?\xC)
  (next-line))

(global-set-key (kbd "C-S-l") '^L-line-ocuppy)

;;;;;;;;;;;;;;;; Emacs Wiki ;;;;;;;;;;;;;;;;
(defun emacs-wiki-publish-and-preview-this-page ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (browse-url (emacs-wiki-published-file)))

(setq emacs-wiki-projects
      '(("personal" (emacs-wiki-directories "~/emacs-wiki/src")
	 (emacs-wiki-publishing-directory . "~/emacs-wiki/publish")
	 (emacs-wiki-default-page . "index"))))

(setq emacs-wiki-maintainer "mailto:onixie@gmail.com")

(define-key emacs-wiki-mode-map (kbd "C-c C-y") #'emacs-wiki-publish-and-preview-this-page)

;;;;;;;;;;;;;;;; Muse ;;;;;;;;;;;;;;;;
(defun muse-project-publish-and-preview-this-file ()
  (interactive)
  (let ((muse-project-published-file nil))
    (flet ((setq-published-file () (setq muse-project-published-file output-path)))
      (add-hook 'muse-before-publish-hook #'setq-published-file)
      (muse-project-publish-this-file t)
      (remove-hook 'muse-before-publish-hook #'setq-published-file)
      (browse-url muse-project-published-file))))

(setq muse-project-alist
      '(("personal" ("~/muse/src" :default "index")
	 (:base "html" :path "~/muse/publish"))))

(setq muse-colors-autogen-headings 'outline)

(add-hook 'muse-mode-hook
	  (lambda ()
	    (setq outline-regexp "\\*+ ")
	    (outline-minor-mode)
	    (hide-body)))

(define-key muse-mode-map (kbd "<tab>") #'org-cycle)
(define-key muse-mode-map (kbd "S-<tab>") #'org-shifttab)
(define-key muse-mode-map (kbd "C-c C-y") #'muse-project-publish-and-preview-this-file)

;;;;;;;;;;;;;;;; Startup ;;;;;;;;;;;;;;;;
(eshell)
(ielm)

