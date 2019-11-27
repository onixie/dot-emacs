;;; -*- lexical-binding: t; -*-

(defun dot-emacs::intern* (&rest args)
  "Make an interned symbol with name formed by concatenating the strings/numbers/symbols"
  (intern (mapconcat (lambda (name)
                       (cond ((symbolp name) (symbol-name name))
                             ((numberp name) (number-to-string name))
                             ((stringp name) name)
                             (t (error "unknown type"))))
                     args "")))

(defun dot-emacs::swap-key-bindings (key1 key2)
  "Swap key bindings in key-translation-map"
  (define-key key-translation-map key1 key2)
  (define-key key-translation-map key2 key1))

(defun dot-emacs:insert-date ()
  (interactive)
  (insert (shell-command-to-string "date")))

(defun dot-emacs::kill-buffer-and-window-on (match-regex) 
  (lambda ()
    (let ((process (get-buffer-process (current-buffer))))
      (when (processp process)
        (set-process-query-on-exit-flag process nil)
        (set-process-sentinel process 
                              (lambda (proc change)
                                (when (string-match match-regex change)
                                  (ignore-errors 
                                    (let* ((b (process-buffer proc))
                                           (w (get-buffer-window b)))
                                      (kill-buffer b)
                                      (delete-window w))))))))))

(defun dot-emacs::open-shell (path)
  (cl-labels ((calc-buffer-name (path)
				(let ((name system-name)
				      (pos 0))
				  (block nil
				    (while (or (string-match ":\\([^:|/]+\\)\\(?:[:]\\)" path pos)
					       (return name))
				      (setq name (match-string 1 path)
					    pos (match-end 0)))))))
    (let ((buffer (generate-new-buffer (calc-buffer-name path))))
      (setf (buffer-local-value 'default-directory buffer) 
	    (if (string-suffix-p ":" path) 
		(concat path "/") ;Workaround for tramp hang issue
	      path))
      (shell buffer))))

(defun dot-emacs::remove-scheme (uri)
  (when uri (replace-regexp-in-string "[^/:]+://" "" uri)))

(defvar dot-emacs::last-refreshed-time nil)
(defun dot-emacs::funcall-after (interval func &rest args)
  (load "~/.emacs.d/last-refreshed-time.el" t)
  (print dot-emacs::last-refreshed-time)
  (unless (and dot-emacs::last-refreshed-time
	       interval
	       (time-less-p (time-subtract (current-time) dot-emacs::last-refreshed-time)
			    (seconds-to-time interval)))
    (apply func args)
    (write-region (format "(setq dot-emacs::last-refreshed-time '%s)" (current-time)) nil "~/.emacs.d/last-refreshed-time.el") t))

(defun dot-emacs::mouse-start-rectangle-mark (start-event)
  (interactive "e")
  (deactivate-mark)
  (mouse-set-point start-event)
  (rectangle-mark-mode +1)
  (cl-labels ((calculate-column (point)
                                (save-excursion
                                  (goto-char point)
                                  (beginning-of-line)
                                  (- point (point)))))

    (let ((drag-event))
      (track-mouse
        (while (progn
                 (setq drag-event (read-event))
                 (mouse-movement-p drag-event))
          (let ((extra (- (car (posn-actual-col-row (event-end drag-event))) (calculate-column (line-end-position)))))
            (if (> extra 0)
                (rectangle-forward-char extra )))
          (mouse-set-point drag-event))))))

(defun dot-emacs::project-try-find (identifiers)
  (cl-labels ((parent-directory (path)
				(let ((parent (file-name-directory (directory-file-name path))))
				  (unless (string-equal path parent)
				    parent)))
	      (find-project (path)
			    (when path
			      (if (cl-intersection (directory-files path) identifiers :test #'string-equal)
				  (cons 'transient path)
				(find-project (parent-directory path))))
			    ))
    #'find-project))

(provide 'setup/base/defs)
