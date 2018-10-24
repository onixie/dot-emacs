;;; .emacs --- dot emacs configuration

;; Copyright (C) 2010, 2011, 2012, 2013, 2018
;;   Nixie Shen

;; Author: Nixie Shen <onixie@gmail.com>
;; Keywords: emacs configuration

;;;;;;;;;;;;;;;; Load Packages ;;;;;;;;;;;;;;;;

;; Scan all directories under .emacs.d
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'setup/proxy)
(require 'setup/package)
(require 'setup/theme)
(require 'setup/goodies)
(require 'setup/fwb)
(require 'setup/linum)
(require 'setup/search-at-point)
(require 'setup/session)

(require 'setup/lang/common)
(require 'setup/lang/asm)
(require 'setup/lang/c)
(require 'setup/lang/lisp)
(require 'setup/lang/haskell)
(require 'setup/lang/sh)

(require 'setup/org)
(require 'setup/wiki)
(require 'setup/muse)
(require 'setup/erc)
(require 'setup/gnuplot)
(require 'setup/ess)
;(require 'setup/flim)
(require 'setup/dired)
(require 'setup/ido)
(require 'setup/tramp)

(require 'tab-display)
(require 'weekly-view)

(require 'cups-dif)

(require 'doxymacs)

;; Use emacs-goodies-el packages
(require 'tabbar)
(require 'highlight-current-line)
(require 'pack-windows)

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
 '(before-save-hook '(copyright-update time-stamp))
 '(browse-url-browser-function 'eww-browse-url)
 '(calendar-after-frame-setup-hook nil)
 '(calendar-mark-diary-entries-flag t)
 '(calendar-mark-holidays-flag t)
 '(calendar-mode-hook
   '((lambda nil
       (unless
           (eq org-agenda-diary-file 'diary-file)
         (define-key calendar-mode-map org-calendar-insert-diary-entry-key 'org-agenda-diary-entry)))
     (lambda nil
       (toggle-truncate-lines 1))
     (lambda nil
       (load "~/.emacs.d/contrib/more-calendar.el"))
     (lambda nil
       (progn
         (setq scroll-margin 0)
         (setq scroll-step 0)
         (setq scroll-conservatively 0)))))
 '(calendar-move-hook '(calendar-update-mode-line (lambda nil (scroll-down))) nil nil "Use scroll-down to make it better for auto scrolled when scroll-margin is bigger")
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
 '(display-time-world-list
   '(("PST8PDT" "Seattle")
     ("EST5EDT" "New York")
     ("GMT0BST" "London")
     ("CET-1CDT" "Paris")
     ("IST-5:30" "Bangalore")
     ("JST-9" "Tokyo")
     ("CST-8" "BeiJing")))
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
 '(ido-create-new-buffer 'always)
 '(ido-enable-last-directory-history nil)
 '(ido-max-work-directory-list 0)
 '(ido-max-work-file-list 0)
 '(ido-record-commands nil)
 '(ielm-noisy nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-echo-area-message "nixie")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(initial-scratch-message nil)
 '(kill-do-not-save-duplicates t)
 '(kill-ring-max 500)
 '(legacy-style-world-list
   '(("PST8PDT" "Seattle")
     ("EST5EDT" "New York")
     ("GMT0BST" "London")
     ("CET-1CDT" "Paris")
     ("IST-5:30" "Bangalore")
     ("JST-9" "Tokyo")
     ("CST-8" "BeiJing")))
 '(make-backup-files nil)
 '(max-specpdl-size 1048576)
 '(mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control))))
 '(org-export-docbook-xsl-fo-proc-command "fop %s %s")
 '(org-export-docbook-xslt-proc-command
   "xsltproc --output %s /usr/share/docbook2odf/xsl/docbook.xsl %s")
 '(org-hide-leading-stars nil nil nil "Clean View is done by org-startup-indented, this variable has little usage in future.")
 '(org-hierarchical-todo-statistics nil)
 '(org-startup-indented t)
 '(package-selected-packages
   '(yasnippet vagrant-tramp tabbar slime session scribble-mode pp-c-l paredit muse monokai-theme maxframe lxc-tramp gnuplot geiser ess ecb docker-tramp auto-complete))
 '(pp^L-^L-string
   "                              -* Next Page *-                              ")
 '(pp^L-^L-string-pre "")
 '(quack-browse-url-browser-function 'quack-w3m-browse-url-other-window)
 '(quack-default-program "racket")
 '(quack-fontify-style 'emacs)
 '(quack-global-menu-p nil)
 '(quack-pretty-lambda-p t)
 '(quack-programs
   '("racket" "bigloo" "csi" "csi -hygienic" "gosh" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mred -z" "mzscheme" "mzscheme -il r6rs" "mzscheme -il typed-scheme" "mzscheme -M errortrace" "mzscheme3m" "mzschemecgc" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))
 '(rainbow-delimiters-generate-rainbow-faces-p 44)
 '(rainbow-delimiters-stop-cyclic-depth-highlighting-p t)
 '(save-interprogram-paste-before-kill t)
 '(scroll-conservatively 100000)
 '(scroll-margin 3)
 '(scroll-preserve-screen-position nil)
 '(scroll-step 1)
 '(select-enable-clipboard t)
 '(semantic-idle-scheduler-idle-time 0.5)
 '(semantic-inhibit-functions
   '((lambda nil
       (or
        (eq major-mode 'lisp-mode)
        (eq major-mode 'scheme-mode)
        (eq major-mode 'emacs-lisp-mode)))))
 '(session-use-package t nil (session))
 '(show-paren-mode t)
 '(slime-header-line-p nil)
 '(slime-kill-without-query-p t)
 '(slime-repl-history-remove-duplicates t)
 '(slime-repl-history-trim-whitespaces t)
 '(speedbar-default-position 'right)
 '(speedbar-frame-parameters
   '((minibuffer)
     (width . 40)
     (border-width . 0)
     (menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (unsplittable . t)
     (left-fringe . 0)))
 '(speedbar-frame-plist
   '(minibuffer nil width 40 border-width 0 internal-border-width 0 unsplittable t default-toolbar-visible-p nil has-modeline-p nil menubar-visible-p nil default-gutter-visible-p nil))
 '(speedbar-query-confirmation-method 'none-but-delete)
 '(speedbar-show-unknown-files t)
 '(speedbar-tag-hierarchy-method
   '(speedbar-prefix-group-tag-hierarchy speedbar-trim-words-tag-hierarchy speedbar-sort-tag-hierarchy))
 '(speedbar-verbosity-level 2)
 '(tabbar-background-color "yellow")
 '(tabbar-cycle-scope nil)
 '(tabbar-mode t nil (tabbar))
 '(tabbar-separator '(0.2))
 '(time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S %u@%s")
 '(uniquify-buffer-name-style 'forward nil (uniquify))
 '(yank-pop-change-selection t)
 '(yas/trigger-key (kbd "C-x C-y"))
 '(zoneinfo-style-world-list
   '(("America/Los_Angeles" "Seattle")
     ("America/New_York" "New York")
     ("Europe/London" "London")
     ("Europe/Paris" "Paris")
     ("Asia/Calcutta" "Bangalore")
     ("Asia/Tokyo" "Tokyo")
     ("Asia/BeiJing" "BeiJing"))))
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
 '(highlight-current-line-face ((t (:background "gray15"))))
 '(org-hide ((((background dark)) (:inherit default :foreground "default" :inverse-video t))))
 '(pp^L-highlight ((((type x w32 mac graphic) (class color)) (:inverse-video t :box (:line-width 1 :style pressed-button)))))
 '(rainbow-delimiters-depth-1-face ((((background light)) (:foreground "#7F1000" :height 1.4886363636363635)) (((background dark)) (:foreground "#FF4E32" :height 1.4886363636363635))) nil :group)
 '(rainbow-delimiters-depth-2-face ((((background light)) (:foreground "#7F2100" :height 1.4772727272727273)) (((background dark)) (:foreground "#FF6932" :height 1.4772727272727273))) nil :group)
 '(rainbow-delimiters-depth-3-face ((((background light)) (:foreground "#7F3300" :height 1.4659090909090908)) (((background dark)) (:foreground "#FF8432" :height 1.4659090909090908))) nil :group)
 '(rainbow-delimiters-depth-4-face ((((background light)) (:foreground "#7F4400" :height 1.4545454545454546)) (((background dark)) (:foreground "#FF9F32" :height 1.4545454545454546))) nil :group)
 '(rainbow-delimiters-depth-5-face ((((background light)) (:foreground "#7F5500" :height 1.4431818181818181)) (((background dark)) (:foreground "#FFBB32" :height 1.4431818181818181))) nil :group)
 '(rainbow-delimiters-depth-6-face ((((background light)) (:foreground "#7F6800" :height 1.4318181818181819)) (((background dark)) (:foreground "#FFD932" :height 1.4318181818181819))) nil :group)
 '(rainbow-delimiters-depth-7-face ((((background light)) (:foreground "#7F7900" :height 1.4204545454545454)) (((background dark)) (:foreground "#FFF432" :height 1.4204545454545454))) nil :group)
 '(rainbow-delimiters-depth-8-face ((((background light)) (:foreground "#747F00" :height 1.4090909090909092)) (((background dark)) (:foreground "#EEFF32" :height 1.4090909090909092))) nil :group)
 '(rainbow-delimiters-depth-9-face ((((background light)) (:foreground "#637F00" :height 1.3977272727272727)) (((background dark)) (:foreground "#D2FF32" :height 1.3977272727272727))) nil :group)
 '(tabbar-default ((((class color grayscale) (background dark)) (:inherit variable-pitch :background "gray50" :foreground "grey75" :weight extra-bold :height 1.1 :width expanded :family "Serif"))))
 '(tabbar-separator ((t (:inherit tabbar-default :height 0.1))))
 '(tabbar-unselected ((t (:inherit tabbar-default :box (:line-width 1 :color "white" :style released-button))))))

(pushnew "~/.emacs.d/" image-load-path :test #'string=)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(fset 'yes-or-no-p 'y-or-n-p)
(put 'set-goal-column 'disabled nil)
(setq ielm-header "")

;;;;;;;;;;;;;;;; Tabbar ;;;;;;;;;;;;;;;;

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
  (dot-emacs--name-glue major-mode "-push-curpos"))

(defsubst group-mode-curpos-push ()
  (dot-emacs--name-glue (group-mode-name major-mode) "-push-curpos"))

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
		 (list 'defadvice func (list 'around (dot-emacs--name-glue group-mode "-push-curpos") 'activate)
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
     (defvar ,(dot-emacs--name-glue mode "-curpos-history") nil
       "Record the positions of the cursor in the form of (buffer . point)")
     (defvar ,(dot-emacs--name-glue mode "-curpos-bottom") nil
       "Oldest curpos in history")
     (defvar ,(dot-emacs--name-glue mode "-curpos-top") nil
       "Current push curpos")
     (defvar ,(dot-emacs--name-glue mode "-curpos-cur") nil
       "Current backtrack curpos")
     (defvar ,(dot-emacs--name-glue mode "-curpos-max-count") 5120
       "Maximum curpos allowed in history")
     (defvar ,(dot-emacs--name-glue mode "-curpos-cur-count") 0
       "Current curpos in history")
     
     (defun ,(dot-emacs--name-glue mode "-push-curpos") (&optional dont-update-curpos-cur-p)
       "Push current cursor position in curpose-history"
       (let ((newpos (current-curpos)))
	 (cond
	  ((equal newpos ,(dot-emacs--name-glue mode "-curpos-top"))
	   nil)
	  ((null ,(dot-emacs--name-glue mode "-curpos-history"))
	   (setq ,(dot-emacs--name-glue mode "-curpos-top") newpos
		 ,(dot-emacs--name-glue mode "-curpos-bottom") newpos
		 ,(dot-emacs--name-glue mode "-curpos-history") (cons newpos ,(dot-emacs--name-glue mode "-curpos-history")))
	   (incf ,(dot-emacs--name-glue mode "-curpos-cur-count"))
	   (unless dont-update-curpos-cur-p
	     (setq ,(dot-emacs--name-glue mode "-curpos-cur") ,(dot-emacs--name-glue mode "-curpos-history"))))
	  ((< ,(dot-emacs--name-glue mode "-curpos-max-count") ,(dot-emacs--name-glue mode "-curpos-cur-count"))
	   (setq ,(dot-emacs--name-glue mode "-curpos-top") newpos
		 ,(dot-emacs--name-glue mode "-curpos-history") (butlast (cons newpos ,(dot-emacs--name-glue mode "-curpos-history")))
		 ,(dot-emacs--name-glue mode "-curpos-cur") (butlast ,(dot-emacs--name-glue mode "-curpos-cur"))
		 ,(dot-emacs--name-glue mode "-curpos-bottom") (car (last ,(dot-emacs--name-glue mode "-curpos-history"))))
	   (unless dont-update-curpos-cur-p
	     (setq ,(dot-emacs--name-glue mode "-curpos-cur") ,(dot-emacs--name-glue mode "-curpos-history"))))
	  (t
	   (setq ,(dot-emacs--name-glue mode "-curpos-top") newpos
		 ,(dot-emacs--name-glue mode "-curpos-history") (cons newpos ,(dot-emacs--name-glue mode "-curpos-history")))
	   (incf ,(dot-emacs--name-glue mode "-curpos-cur-count"))
	   (unless dont-update-curpos-cur-p
	     (setq ,(dot-emacs--name-glue mode "-curpos-cur") ,(dot-emacs--name-glue mode "-curpos-history"))))))
       ,(dot-emacs--name-glue mode "-curpos-history"))
     
     (defun ,(dot-emacs--name-glue mode "-clear-curpos") ()
       "Update curpos-history"
       (setq ,(dot-emacs--name-glue mode "-curpos-history") (remove-if-not #'valid-curpos-p ,(dot-emacs--name-glue mode "-curpos-history")))
       (setq ,(dot-emacs--name-glue mode "-curpos-cur") (or (remove-if-not #'valid-curpos-p ,(dot-emacs--name-glue mode "-curpos-cur"))
                                                            ,(dot-emacs--name-glue mode "-curpos-history")))
       (setq ,(dot-emacs--name-glue mode "-curpos-top") (car ,(dot-emacs--name-glue mode "-curpos-history")))
       (setq ,(dot-emacs--name-glue mode "-curpos-bottom") (car (last ,(dot-emacs--name-glue mode "-curpos-history"))))
       (setq ,(dot-emacs--name-glue mode "-curpos-cur") ,(dot-emacs--name-glue mode "-curpos-history"))
       (setq ,(dot-emacs--name-glue mode "-curpos-cur-count") (length ,(dot-emacs--name-glue mode "-curpos-history"))))

     (defun ,(dot-emacs--name-glue mode "-empty-curpos") ()
       "Empty curpos-history"
       (interactive)
       (setq ,(dot-emacs--name-glue mode "-curpos-history") nil)
       (setq ,(dot-emacs--name-glue mode "-curpos-top") nil)
       (setq ,(dot-emacs--name-glue mode "-curpos-bottom") nil)
       (setq ,(dot-emacs--name-glue mode "-curpos-cur") nil)
       (setq ,(dot-emacs--name-glue mode "-curpos-cur-count") 0))
     
     (defun ,(dot-emacs--name-glue mode "-backtrace-curpos") ()
       "Backtrace the curpos-history stack"
       (interactive)
       (let* ((current-curpos (current-curpos))
	      (target-curpos (car ,(dot-emacs--name-glue mode "-curpos-cur"))))
	 (unless (valid-curpos-p target-curpos)
	   (,(dot-emacs--name-glue mode "-clear-curpos"))
	   (setq target-curpos (car ,(dot-emacs--name-glue mode "-curpos-cur"))))
	 (cond ((not (valid-curpos-p target-curpos))
		(,(dot-emacs--name-glue mode "-push-curpos") t)
		nil)
	       ((equal current-curpos target-curpos)
		(setq ,(dot-emacs--name-glue mode "-curpos-cur") (cdr ,(dot-emacs--name-glue mode "-curpos-cur")))
		(,(dot-emacs--name-glue mode "-backtrace-curpos")))
	       (t
		(,(dot-emacs--name-glue mode "-push-curpos") t)
		(switch-to-buffer (curpos-buffer target-curpos))
		(goto-char (curpos-point target-curpos))
		(,(dot-emacs--name-glue mode "-push-curpos") t)))))
     
     (add-curpos-advice ,mode ,@adviced-function) ; Define each advice function for push-curpos

     ,@(mapcar (lambda (group)
		 `(define-key ,(dot-emacs--name-glue (mode-map-name group) "-map") (kbd "S-<f12>") ; Define each keymap for curpos-backtrace
		    ',(dot-emacs--name-glue mode "-backtrace-curpos")))
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

;;;;;;;;;;;;;;;; Misc ;;;;;;;;;;;;;;;;
;;(set-process-query-on-exit-flag (get-buffer-process (get-buffer "*shell*")) nil)

;;;;;;;;;;;;;;;; Startup ;;;;;;;;;;;;;;;;
(eshell)
(ielm)
