
(defun kill-other-buffers (&rest buffers-not-to-kill)
  "Kill buffers not listed in arguements. 
If the arguements are nil, all buffers except current buffer will be killed"
  (interactive)
  (let ((buffers-all (buffer-list))
	(buffers-not-to-kill (or buffers-not-to-kill
				 (list (current-buffer))))
	(kill-buffer-query-functions nil))
    (mapc 'kill-buffer
	  (remove-if (lambda (buffer)
		       (memq buffer buffers-not-to-kill))
		     buffers-all))))

(defmacro def-kill-window-along-direction (direction)
  (let ((key (concat "<" (symbol-name direction) ">")))
    (global-set-key (read-kbd-macro key)
		    ((lambda (direction)
		       (intern (concat "kill-" 
				       (symbol-name direction) 
				       "-window"))) 
		     direction)))
  
  `(defun ,((lambda (direction)
	      (intern (concat "kill-" 
			      (symbol-name direction) 
			      "-window"))) 
	    direction) ()
	    (interactive)
	    (save-selected-window
	      (if (not (null (condition-case err 
				 ( ,((lambda (direction)
				       (intern (concat "windmove-" 
						       (symbol-name direction)))) direction ) )
			       (error nil))))
		  (kill-buffer-and-window)))
	    ))

(def-kill-window-along-direction right)
(def-kill-window-along-direction left)
(def-kill-window-along-direction up)
(def-kill-window-along-direction down)

(global-set-key (kbd "<C-kp-4>") 'windmove-left)
(global-set-key (kbd "<C-kp-6>") 'windmove-right)
(global-set-key (kbd "<C-kp-8>") 'windmove-up)
(global-set-key (kbd "<C-kp-2>") 'windmove-down)

(global-set-key (kbd "<C-kp-7>") (lambda () (interactive) (progn (call-interactively 'windmove-left) (call-interactively 'windmove-up))))
(global-set-key (kbd "<C-kp-9>") (lambda () (interactive) (progn (call-interactively 'windmove-right) (call-interactively 'windmove-up))))
(global-set-key (kbd "<C-kp-1>") (lambda () (interactive) (progn (call-interactively 'windmove-left) (call-interactively 'windmove-down))))
(global-set-key (kbd "<C-kp-3>") (lambda () (interactive) (progn (call-interactively 'windmove-right) (call-interactively 'windmove-down))))

(global-set-key (kbd "<C-left>") 'windmove-left)
(global-set-key (kbd "<C-right>") 'windmove-right)
(global-set-key (kbd "<C-up>") 'windmove-up)
(global-set-key (kbd "<C-down>") 'windmove-down)

(defun other-window-by-name (name &optional win)
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

(global-set-key (kbd "<delete>") 'kill-buffer-and-window)
(global-set-key (kbd "S-<delete>")
		(lambda ()
		  (interactive)
		  (kill-other-buffers (current-buffer) 
				      (get-buffer "*scratch*") 
				      (get-buffer "*Messages*"))
		  (call-interactively 'delete-other-windows)))


;; Change default action for list-buffers' key binding
(global-set-key (kbd "C-x C-b") (lambda ()
				  (interactive)
				  (call-interactively 'list-buffers)
				  (call-interactively 'other-window)))				  

(define-key Buffer-menu-mode-map (kbd "e") (lambda ()
					     (interactive)
					     (call-interactively 'Buffer-menu-this-window)
					     (call-interactively 'delete-other-windows)))

(define-key Buffer-menu-mode-map (kbd "C-m") (lambda ()
					       (interactive)
					       (call-interactively 'Buffer-menu-this-window)
					       (call-interactively 'delete-other-windows)))

;; Resize main frame when speedbar display
(defvar *speedbar-main-frame* nil)
(defvar *speedbar-main-frame-orig-width* nil)
(defvar *speedbar-x-padding* 5)
(defvar *speedbar-y-padding* 4)

(add-hook 'speedbar-before-popup-hook (lambda ()					
					(setq *speedbar-main-frame* (selected-frame))
					(setq *speedbar-main-frame-orig-width* (frame-width))
					(set-frame-width (selected-frame) 
							 (- (- (frame-width) 
							       (cdr (assoc 'width 
									   speedbar-frame-parameters))) *speedbar-x-padding*))))

(add-hook 'speedbar-before-delete-hook (lambda ()
					 (set-frame-width *speedbar-main-frame* 
							  *speedbar-main-frame-orig-width*)))

(defadvice speedbar-frame-mode (around relocation-smartly activate)
  (let ((speedbar-height (+ (frame-height *speedbar-main-frame*) 
			    (tool-bar-lines-needed)
			    *speedbar-y-padding*)))
    ad-do-it
    (speedbar-frame-reposition-smartly)
    (set-frame-height (selected-frame) 
		      speedbar-height)
    (define-key speedbar-key-map (kbd "Q") (lambda ()
					     (interactive)
					     (run-hooks 'speedbar-before-delete-hook)
					     (call-interactively 'delete-frame)))
    ad-return-value))
