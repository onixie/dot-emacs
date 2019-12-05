;;; -*- lexical-binding: t; -*-

(defun dot-emacs:insert-date ()
  (interactive)
  (insert (shell-command-to-string "date")))

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

(defun dot-emacs::org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(defmacro org-| (&rest args &key path)
  (cl-flet ((tf (form)
                (list* (car form)
                       (loop for k in (cdr form) by #'cddr
                             for v in (cddr form) by #'cddr
                             collect (list (intern (substring (prin1-to-string k) 1))
                                           (if (stringp v) (prin1-to-string v) v))))))
    (let ((karg (if (keywordp (car (last args 2)))
                    (car (last args 1))
                  ""))
          (args (if (keywordp (car (last args 2)))
                    (nbutlast args 2)
                  args)))
      `(concat "/"
               (format ,(substring (loop repeat (length args) concat "%s|") 0 -1)
                       ,@(mapcar (lambda (arg)
                                   `(let ((ref (string-trim
                                                ,(cond ((symbolp arg) `(org-babel-ref-resolve ,(prin1-to-string arg)))
                                                       ((stringp arg) arg)
                                                       ((consp arg) `(org-sbe ,@(tf arg)))
                                                       (t (error "argument error"))))))
                                      (string-trim ref "[/]+" "[|:]?")))
                                 args))
               ":" ,karg))))

(defun org-/ (ref &rest args)
  (apply #'concatenate 'string (org-babel-ref-resolve ref) args))

(provide 'setup/app/org/define)
