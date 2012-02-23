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
(load-file "~/.emacs.d/contrib/cedet/common/cedet.elc")

(require 'ede)
(require 'semantic)
(require 'srecode)
(require 'cogre)
(require 'cedet-contrib)

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
(require 'parenface)
(require 'ibus)
(require 'pp-c-l)

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
 '(ecb-options-version "2.40")
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
 '(mf-max-height (+ (display-pixel-height) 0))
 '(mf-max-width (- (display-pixel-width) 1))
 '(org-export-docbook-xsl-fo-proc-command "fop %s %s")
 '(org-export-docbook-xslt-proc-command "xsltproc --output %s /usr/share/docbook2odf/xsl/docbook.xsl %s")
 '(org-hide-leading-stars nil nil nil "Clean View is done by org-startup-indented, this variable has little usage in future.")
 '(org-hierarchical-todo-statistics nil)
 '(org-startup-indented t)
 '(pp^L-^L-string "                              -* Next Page *-                              ")
 '(pp^L-^L-string-pre "")
 '(save-interprogram-paste-before-kill t)
 '(scroll-conservatively 100000)
 '(scroll-margin 3)
 '(scroll-preserve-screen-position nil)
 '(scroll-step 1)
 '(semantic-idle-scheduler-idle-time 0.5)
 '(semantic-inhibit-functions (quote ((lambda nil (eq major-mode (quote lisp-mode))) (lambda nil (eq major-mode (quote emacs-lisp-mode))))))
 '(show-paren-mode t)
 '(slime-kill-without-query-p t)
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
 '(highlight-current-line-face ((t (:background "black" :slant italic :weight bold))))
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

(eshell)
(ielm)

;;;;;;;;;;;;;;;; Common ;;;;;;;;;;;;;;;;
(defun name-combinator (&rest names)
  "Make a symbol by combining the strings as its name"
  (intern (mapconcat 'concat names "")))

(defun swap-key-translation (key1 key2)
  "Swap key bindings in key-translation-map"
  (define-key key-translation-map key1 key2)
  (define-key key-translation-map key2 key1))

(defun insert-date ()
  (interactive)
  (insert-string (shell-command-to-string "date")))

;;;;;;;;;;;;;;;; Color-Theme ;;;;;;;;;;
(eval-after-load "color-theme"
  '(progn (color-theme-initialize)
	  (color-theme-calm-forest)))

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

;;;;;;;;;;;;;;;; Maxframe ;;;;;;;;;;;;;;;;
(defvar maxframe-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-x 9") 'maximize-frame) ;Use maximize-frame, for the speedbar, instead of using -mm option
    (define-key map (kbd "C-x 7") 'restore-frame)
    map))

(define-minor-mode maxframe-mode
  "Minor Mode for maximze-frame
   \{KEYMAP}"
  :init-value nil
  :lighter " MaxFrame "
  :keymap maxframe-mode-map
  :require 'maxframe
  :group 'maxframe
  :global t)

(maxframe-mode 1)
(maximize-frame)
(add-hook 'window-setup-hook 'maximize-frame)

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
	     (name-combinator "kill-" (symbol-name direction) "-window")) 
	   direction))))
  
  `(defun ,(name-combinator "kill-" (symbol-name direction) "-window") ()
	    (interactive)
	    (save-selected-window
	      (if (not (null (condition-case err 
				 (,((lambda (direction)
				      (name-combinator "windmove-" (symbol-name direction))) direction))
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

(defvar easy-buffer-window-mode-map
  (let ((map (make-sparse-keymap)))
    (kill-window-along-direction left map)
    (kill-window-along-direction right map)
    (kill-window-along-direction up map)
    (kill-window-along-direction down map)

    (macrolet ((tabbar-dwim-move (direction)
				 `(defun ,(name-combinator "tabbar-dwim-" (symbol-name direction)) ()
				    (interactive)
				    (if tabbar--buffer-show-groups
					(progn
					  (call-interactively #',(name-combinator "tabbar-"
										  (symbol-name direction)
										  "-group"))
					  (call-interactively #'tabbar-press-home))
				      (call-interactively #',(name-combinator "tabbar-"
									      (symbol-name direction)))))))
      (define-key map (kbd "S-<left>") (tabbar-dwim-move backward))
      (define-key map (kbd "S-<right>") (tabbar-dwim-move forward)))
    (define-key map (kbd "S-<up>") 'tabbar-press-home)
    (define-key map (kbd "S-<down>") 'tabbar-press-home)

    (define-key map (kbd "<C-left>") 'windmove-left)
    (define-key map (kbd "<C-right>") 'windmove-right)
    (define-key map (kbd "<C-up>") 'windmove-up)
    (define-key map (kbd "<C-down>") 'windmove-down)

    (define-key map (kbd "<C-kp-left>") 'windmove-left)
    (define-key map (kbd "<C-kp-right>") 'windmove-right)
    (define-key map (kbd "<C-kp-up>") 'windmove-up)
    (define-key map (kbd "<C-kp-down>") 'windmove-down)

    (macrolet ((windmove-diagonal (hori vert)
				  `(defun ,(name-combinator "windmove-" (symbol-name hori) "-" (symbol-name vert)) ()
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
	 ((or (memq major-mode '(slime-repl-mode sldb-mode slime-thread-control-mode slime-connection-list-mode))
	      (search "*inferior-lisp*" (buffer-name))
	      (search "*slime-events*" (buffer-name)))
	  "Slime")
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

;;;;;;;;;;;;;;;; SpeedBar Frame ;;;;;;;;;;;;;;;;
(defvar *speedbar-main-frame* nil)
(defvar *speedbar-main-frame-orig-width* nil)
(defvar *speedbar-x-padding* 5)
(defvar *speedbar-y-padding* 4)
(defvar *speedbar-poped-up* nil)

(defadvice speedbar-frame-mode (around relocation-smartly activate)
  (let ((speedbar-height (+ (frame-height *speedbar-main-frame*) 
			    (tool-bar-lines-needed)
			    *speedbar-y-padding*)))
    ad-do-it
    (speedbar-frame-reposition-smartly)
    (set-frame-height (selected-frame) speedbar-height)
    (define-key speedbar-key-map (kbd "Q") 
      (lambda ()
	(interactive)
	(run-hooks 'speedbar-before-delete-hook)
	(call-interactively 'delete-frame)))
    ad-return-value))

(add-hook 'speedbar-before-popup-hook 
	  (lambda ()
	    (if (not *speedbar-poped-up*)
		(progn
		  (setq *speedbar-poped-up* t)
		  (setq *speedbar-main-frame* (selected-frame))
		  (setq *speedbar-main-frame-orig-width* (frame-width))
		  (set-frame-width (selected-frame) 
				   (- (- (frame-width) 
					 (cdr (assoc 'width speedbar-frame-parameters)))
				      *speedbar-x-padding*))))))

(add-hook 'speedbar-before-delete-hook 
	  (lambda ()
	    (setq *speedbar-poped-up* nil)
	    (set-frame-width *speedbar-main-frame* 
			     *speedbar-main-frame-orig-width*)))

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

(defun group-mode-name (mode)
  "Make a name replacement for mode"
  (symbol-name (or (cdr (assoc mode group-mode-alist))
		   mode)))

(defvar mode-map-alist nil
  "A replacement for the default mode map naming scheme")

(defun mode-map-name (mode-map)
  "Make a name replacement for mode-map"
  (symbol-name (or (cdr (assoc mode-map mode-map-alist))
		   mode-map)))

(defun current-mode-curpos-push ()
  "Return the symbol of which function definition is MODE-push-curpos"
  (name-combinator (symbol-name major-mode) "-push-curpos"))

(defun group-mode-curpos-push ()
  (name-combinator (group-mode-name major-mode) "-push-curpos"))

(defmacro add-curpos-advice (group-mode &rest adviced-function)
  "Add push-curpos advice for each global defined function. 
The advice call MODE-push-curpos by current major-mode"
  `(progn
     ,@(mapcar (lambda (func)
		 (list 'defadvice func (list 'before (name-combinator (symbol-name group-mode) "-push-curpos") 'activate)
		       (list 'if (list 'and (list 'called-interactively-p ''interactive) (list 'string-equal (symbol-name group-mode) '(group-mode-name major-mode)))
			     '(cond ((fboundp (current-mode-curpos-push))
				     (funcall (current-mode-curpos-push)))
				    ((fboundp (group-mode-curpos-push))
				     (funcall (group-mode-curpos-push)))))))
	       adviced-function)))

(defmacro mode-local-curpos (mode &rest adviced-function)
  "Define mode local curpos, each curpos has MODE name prefixed"
  `(progn
     (defconst ,(name-combinator (symbol-name mode) "-curpos-max-record") 512
       "Maximum count of history records")
     
     (defvar ,(name-combinator (symbol-name mode) "-curpos-history") nil
       "Record the positions of the cursor in the form of (buffer . point)")

     (defun ,(name-combinator (symbol-name mode) "-curpos-record-count") ()
       "Return the count of the record in curpos-history"
       (let ((count 0))
	 (dolist (curpos ,(name-combinator (symbol-name mode) "-curpos-history"))
	   (setq count (1+ count)))
	 count))

     (defun ,(name-combinator (symbol-name mode) "-push-curpos") ()
       "Push current cursor position in curpose-history"
       (setq ,(name-combinator (symbol-name mode) "-curpos-history") 
	     (remove nil (remove-duplicates (push (cons (current-buffer) (point)) 
						  ,(name-combinator (symbol-name mode) "-curpos-history")) 
					    :test (lambda (arg1 arg2)
						    (and (equal (car arg1) (car arg2))
							 (equal (cdr arg1) (cdr arg2))))
					    :from-end t))) ;Move the most recent curpos to the first even if it is in history
       (if (< ,(name-combinator (symbol-name mode) "-curpos-max-record") 
	      (,(name-combinator (symbol-name mode) "-curpos-record-count")))
	   (setq ,(name-combinator (symbol-name mode) "-curpos-history") 
		 (butlast ,(name-combinator (symbol-name mode) "-curpos-history")))))

     (defun ,(name-combinator (symbol-name mode) "-empty-curpos") ()
       "Empty curpos-history"
       (interactive)
       (setq ,(name-combinator (symbol-name mode) "-curpos-history") nil))
     
     (defun ,(name-combinator (symbol-name mode) "-pop-curpos") ()
       "Pop up the top curpos in curpos-history"
       (if (null ,(name-combinator (symbol-name mode) "-curpos-history"))
	   nil
	 (prog1 (car ,(name-combinator (symbol-name mode) "-curpos-history"))
	   (setq ,(name-combinator (symbol-name mode) "-curpos-history") 
		 (cdr ,(name-combinator (symbol-name mode) "-curpos-history"))))))
     
     (defun ,(name-combinator (symbol-name mode) "-backtrace-curpos") ()
       "Backtrace the curpos-history stack"
       (interactive)
       (let ((current-buffer (current-buffer))
	     (current-point (point)))
	 (if (and (called-interactively-p 'interactive)
		  (null (position (cons current-buffer current-point) 
			     ,(name-combinator (symbol-name mode) "-curpos-history")
			     :test (lambda (arg1 arg2)
				     (and (equal (car arg1) (car arg2))
					  (equal (cdr arg1) (cdr arg2)))))))
	     (,(name-combinator (symbol-name mode) "-push-curpos")))
	 (let* ((target-curpos (car ,(name-combinator (symbol-name mode) "-curpos-history")))
		(target-buffer (car target-curpos))
		(target-point (cdr target-curpos)))
	   (if (and (equal target-buffer current-buffer)
		    (equal target-point current-point))
	       (setq ,(name-combinator (symbol-name mode) "-curpos-history") 
		     (remove nil (append (cdr ,(name-combinator (symbol-name mode) "-curpos-history")) 
					 (list (,(name-combinator (symbol-name mode) "-pop-curpos"))))))))
	 (let* ((target-curpos (,(name-combinator (symbol-name mode) "-pop-curpos")))
		(target-buffer (car target-curpos))
		(target-point (cdr target-curpos)))
	   (setq ,(name-combinator (symbol-name mode) "-curpos-history") 
		 (remove nil (append ,(name-combinator (symbol-name mode) "-curpos-history") 
				     (list target-curpos))))
	   (if (and (bufferp target-buffer)
		    (integer-or-marker-p target-point))
	       (progn
		 (switch-to-buffer target-buffer)
		 (goto-char target-point))))))

     (add-curpos-advice ,mode ,@adviced-function) ; Define each advice function for push-curpos

     ,@(mapcar (lambda (group)
		 `(define-key ,(name-combinator (mode-map-name group) "-map") (kbd "S-<f12>") ; Define each keymap for curpos-backtrace
		    ',(name-combinator (symbol-name mode) "-backtrace-curpos")))
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
(defun nautilus ()
  (interactive)
  (shell-command "nautilus $(pwd)" "*Messages*" "*Messages*"))

(defun xterm ()
  (interactive)
  (shell-command "gnome-terminal --working-directory=$(pwd)" "*Messages*" "*Messages*"))

(defun etags ()
  (interactive)
  (shell-command "find ./ -type f -name '*' -print0 | xargs --null etags -R" "*Messages*" "*Messages*"))

(tool-bar-add-item "nautilus" 'nautilus 'nautilus :visible '(memq major-mode '(dired-mode)))
(tool-bar-add-item "xterm" 'xterm 'xterm :visible '(memq major-mode '(dired-mode)))
(mapc (lambda (mode-hook)
	(add-hook mode-hook (lambda ()
			      (progn
				(define-key dired-mode-map (kbd "N") 'nautilus)
				(define-key dired-mode-map (kbd "b") 'xterm)
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
(when (load (file-truename "~/quicklisp/slime-helper.el") t) ;Only when quicklisp-slime-helper exist
  (setq slime-lisp-implementations
	`((sbcl ("sbcl" "--noinform" "--no-linedit")
		:coding-system utf-8-unix)
	  (clisp ("clisp"))))

  (slime-setup '(slime-fancy slime-repl slime-scratch slime-editing-commands slime-autodoc))

  (setq common-lisp-hyperspec-root (format "file://%s" (file-truename "~/.emacs.d/contrib/hyperspec/")))
  (setq slime-autodoc-use-multiline-p t)

  (add-hook 'slime-mode-hook
	    (lambda ()
	      (unless (slime-connected-p)
		(save-selected-window (save-excursion (slime)))))) ; Enable slime when a file open

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
    (setq slime-compie-file-options '(:fasl-directory fasls-dir))
    (make-directory fasls-dir t)))

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
		    (set-face-foreground 'paren-face "gray70"))))
      (list 'emacs-lisp-mode-hook 'lisp-mode-hook 'lisp-interaction-mode-hook))

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
      (list lisp-mode-map emacs-lisp-mode-map lisp-interaction-mode-map))

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