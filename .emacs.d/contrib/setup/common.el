(require 'setup/package)

(defun dot-emacs--name-glue (&rest nameparts)
  "Make a symbol by concating the strings/symbols as its name"
  (intern (apply #'concat (mapcar #'(lambda (name)
				      (cond ((symbolp name)
					     (symbol-name name))
					    ((numberp name)
					     (number-to-string name))
					    ((stringp name) name)
					    (t (error "can't be glue together"))))
				  nameparts))))

(defun dot-emacs--swap-key-translation (key1 key2)
  "Swap key bindings in key-translation-map"
  (define-key key-translation-map key1 key2)
  (define-key key-translation-map key2 key1))

(defun dot-emacs--insert-date ()
  (interactive)
  (insert-string (shell-command-to-string "date")))

(provide 'setup/common)
