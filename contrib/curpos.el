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
  (dot-emacs::intern* major-mode "-push-curpos"))

(defsubst group-mode-curpos-push ()
  (dot-emacs::intern* (group-mode-name major-mode) "-push-curpos"))

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
		 (list 'defadvice func (list 'around (dot-emacs::intern* group-mode "-push-curpos") 'activate)
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
     (defvar ,(dot-emacs::intern* mode "-curpos-history") nil
       "Record the positions of the cursor in the form of (buffer . point)")
     (defvar ,(dot-emacs::intern* mode "-curpos-bottom") nil
       "Oldest curpos in history")
     (defvar ,(dot-emacs::intern* mode "-curpos-top") nil
       "Current push curpos")
     (defvar ,(dot-emacs::intern* mode "-curpos-cur") nil
       "Current backtrack curpos")
     (defvar ,(dot-emacs::intern* mode "-curpos-max-count") 5120
       "Maximum curpos allowed in history")
     (defvar ,(dot-emacs::intern* mode "-curpos-cur-count") 0
       "Current curpos in history")
     
     (defun ,(dot-emacs::intern* mode "-push-curpos") (&optional dont-update-curpos-cur-p)
       "Push current cursor position in curpose-history"
       (let ((newpos (current-curpos)))
	 (cond
	  ((equal newpos ,(dot-emacs::intern* mode "-curpos-top"))
	   nil)
	  ((null ,(dot-emacs::intern* mode "-curpos-history"))
	   (setq ,(dot-emacs::intern* mode "-curpos-top") newpos
		 ,(dot-emacs::intern* mode "-curpos-bottom") newpos
		 ,(dot-emacs::intern* mode "-curpos-history") (cons newpos ,(dot-emacs::intern* mode "-curpos-history")))
	   (incf ,(dot-emacs::intern* mode "-curpos-cur-count"))
	   (unless dont-update-curpos-cur-p
	     (setq ,(dot-emacs::intern* mode "-curpos-cur") ,(dot-emacs::intern* mode "-curpos-history"))))
	  ((< ,(dot-emacs::intern* mode "-curpos-max-count") ,(dot-emacs::intern* mode "-curpos-cur-count"))
	   (setq ,(dot-emacs::intern* mode "-curpos-top") newpos
		 ,(dot-emacs::intern* mode "-curpos-history") (butlast (cons newpos ,(dot-emacs::intern* mode "-curpos-history")))
		 ,(dot-emacs::intern* mode "-curpos-cur") (butlast ,(dot-emacs::intern* mode "-curpos-cur"))
		 ,(dot-emacs::intern* mode "-curpos-bottom") (car (last ,(dot-emacs::intern* mode "-curpos-history"))))
	   (unless dont-update-curpos-cur-p
	     (setq ,(dot-emacs::intern* mode "-curpos-cur") ,(dot-emacs::intern* mode "-curpos-history"))))
	  (t
	   (setq ,(dot-emacs::intern* mode "-curpos-top") newpos
		 ,(dot-emacs::intern* mode "-curpos-history") (cons newpos ,(dot-emacs::intern* mode "-curpos-history")))
	   (incf ,(dot-emacs::intern* mode "-curpos-cur-count"))
	   (unless dont-update-curpos-cur-p
	     (setq ,(dot-emacs::intern* mode "-curpos-cur") ,(dot-emacs::intern* mode "-curpos-history"))))))
       ,(dot-emacs::intern* mode "-curpos-history"))
     
     (defun ,(dot-emacs::intern* mode "-clear-curpos") ()
       "Update curpos-history"
       (setq ,(dot-emacs::intern* mode "-curpos-history") (remove-if-not #'valid-curpos-p ,(dot-emacs::intern* mode "-curpos-history")))
       (setq ,(dot-emacs::intern* mode "-curpos-cur") (or (remove-if-not #'valid-curpos-p ,(dot-emacs::intern* mode "-curpos-cur"))
                                                            ,(dot-emacs::intern* mode "-curpos-history")))
       (setq ,(dot-emacs::intern* mode "-curpos-top") (car ,(dot-emacs::intern* mode "-curpos-history")))
       (setq ,(dot-emacs::intern* mode "-curpos-bottom") (car (last ,(dot-emacs::intern* mode "-curpos-history"))))
       (setq ,(dot-emacs::intern* mode "-curpos-cur") ,(dot-emacs::intern* mode "-curpos-history"))
       (setq ,(dot-emacs::intern* mode "-curpos-cur-count") (length ,(dot-emacs::intern* mode "-curpos-history"))))

     (defun ,(dot-emacs::intern* mode "-empty-curpos") ()
       "Empty curpos-history"
       (interactive)
       (setq ,(dot-emacs::intern* mode "-curpos-history") nil)
       (setq ,(dot-emacs::intern* mode "-curpos-top") nil)
       (setq ,(dot-emacs::intern* mode "-curpos-bottom") nil)
       (setq ,(dot-emacs::intern* mode "-curpos-cur") nil)
       (setq ,(dot-emacs::intern* mode "-curpos-cur-count") 0))
     
     (defun ,(dot-emacs::intern* mode "-backtrace-curpos") ()
       "Backtrace the curpos-history stack"
       (interactive)
       (let* ((current-curpos (current-curpos))
	      (target-curpos (car ,(dot-emacs::intern* mode "-curpos-cur"))))
	 (unless (valid-curpos-p target-curpos)
	   (,(dot-emacs::intern* mode "-clear-curpos"))
	   (setq target-curpos (car ,(dot-emacs::intern* mode "-curpos-cur"))))
	 (cond ((not (valid-curpos-p target-curpos))
		(,(dot-emacs::intern* mode "-push-curpos") t)
		nil)
	       ((equal current-curpos target-curpos)
		(setq ,(dot-emacs::intern* mode "-curpos-cur") (cdr ,(dot-emacs::intern* mode "-curpos-cur")))
		(,(dot-emacs::intern* mode "-backtrace-curpos")))
	       (t
		(,(dot-emacs::intern* mode "-push-curpos") t)
		(switch-to-buffer (curpos-buffer target-curpos))
		(goto-char (curpos-point target-curpos))
		(,(dot-emacs::intern* mode "-push-curpos") t)))))
     
     (add-curpos-advice ,mode ,@adviced-function) ; Define each advice function for push-curpos

     ,@(mapcar (lambda (group)
		 `(define-key ,(dot-emacs::intern* (mode-map-name group) "-map") (kbd "S-<f12>") ; Define each keymap for curpos-backtrace
		    ',(dot-emacs::intern* mode "-backtrace-curpos")))
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
