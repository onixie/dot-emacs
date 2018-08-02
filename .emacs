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
(require 'setup/lang/sh)

(require 'setup/org)
(require 'setup/muse)
(require 'setup/erc)
(require 'setup/gnuplot)
(require 'setup/ess)
;(require 'setup/flim)

(require 'ido)
;; Haskell-Mode
(load-file "~/.emacs.d/contrib/haskell-mode/haskell-site-file.el")

(require 'tab-display)
(require 'weekly-view)
(require 'emacs-wiki)
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
 '(before-save-hook (quote (copyright-update time-stamp)))
 '(browse-url-browser-function (quote eww-browse-url))
 '(calendar-after-frame-setup-hook nil)
 '(calendar-mark-diary-entries-flag t)
 '(calendar-mark-holidays-flag t)
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
 '(ede-project-placeholder-cache-file "~/.emacs.d/.projects.ede")
 '(eval-expression-print-length nil)
 '(eval-expression-print-level nil)
 '(gdb-many-windows nil)
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
 '(indent-tabs-mode nil)
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
 '(save-interprogram-paste-before-kill t)
 '(scroll-conservatively 100000)
 '(scroll-margin 3)
 '(scroll-preserve-screen-position nil)
 '(scroll-step 1)
 '(show-paren-mode t)
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
 '(highlight-current-line-face ((t (:background "gray15"))))
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

;;;;;;;;;;;;;;;; IDO ;;;;;;;;;;;;;;;;
(ido-mode 1)

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
	     (dot-emacs--name-glue "kill-" direction "-window")) 
	   direction))))
  
  `(defun ,(dot-emacs--name-glue "kill-" direction "-window") ()
     (interactive)
     (save-selected-window
       (if (not (null (condition-case err 
			  (,((lambda (direction)
			       (dot-emacs--name-glue "windmove-" direction)) direction))
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
				 `(defun ,(dot-emacs--name-glue "tabbar-dwim-" direction) ()
				    (interactive)
				    (if tabbar--buffer-show-groups
					(progn
					  (call-interactively #',(dot-emacs--name-glue "tabbar-" direction "-group"))
					  (call-interactively #'tabbar-press-home))
				      (call-interactively #',(dot-emacs--name-glue "tabbar-" direction))))))
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
				  `(defun ,(dot-emacs--name-glue "windmove-" hori "-" vert) ()
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
    (define-key map (kbd "<kp-begin>") 'eww)
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
	 ((or (memq major-mode '(lisp-mode slime-repl-mode sldb-mode slime-thread-control-mode slime-connection-list-mode slime-sprof-browser-mode slime-xref-mode))
	      (search "*inferior-lisp*" (buffer-name))
	      (search "*slime-events*" (buffer-name)))
	  "Common Lisp")
	 ((or (memq major-mode '(scheme-mode inferior-scheme-mode geiser-doc-mode geiser-debug-mode geiser-repl-mode))
	      (search "*scheme*" (buffer-name)))
	  "Scheme")
	 ((memq major-mode '(c-mode c++-mode objc-mode))
	  "C/C++")
	 ((or (search "*haskell*" (buffer-name))
	      (memq major-mode '(haskell-mode haskell-cabal-mode haskell-c-mode ghc-core-mode)))
	  "Haskell")
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

;;;;;;;;;;;;;;;; Haskell Programming ;;;;;;;;;;;;;;;;
(defun inf-haskell-quit-sentinel (proc change)
  "Clean up of buffers, when ghci quit."
  (when (string-match "\\(finished\\|exited\\|killed\\|quit\\)" change)
    (condition-case nil
	(let ((b (process-buffer proc)))
	  (kill-buffer b)
	  (delete-window (get-buffer-window b)))
      (error (print "error")))))

(add-hook 'inferior-haskell-mode-hook 
	  (lambda ()
	    (eldoc-mode)
	    (let ((process (get-buffer-process (current-buffer))))
	      (when (processp process)
		(set-process-query-on-exit-flag process nil)
		(set-process-sentinel process 'inf-haskell-quit-sentinel)))))


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

;;;;;;;;;;;;;;;; Startup ;;;;;;;;;;;;;;;;
(eshell)
(ielm)
