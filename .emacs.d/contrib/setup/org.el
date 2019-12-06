(require 'setup/package)

(require 'org)

(require 'setup/shell)
(org-link-set-parameters "shell" :follow #'dotemacs--open-shell)
(org-link-set-parameters "exec" :follow #'org--open-shell-link)

;; After org v8, docbook is not included anymore. Use ox-textinfo instead
(when (< (string-to-number (first (split-string org-version "\\."))) 8)
  (require 'org-docbook)
  (setq org-export-docbook-xsl-fo-proc-command "fop %s %s"
	org-export-docbook-xslt-proc-command "xsltproc --output %s /usr/share/docbook2odf/xsl/docbook.xsl %s"))

(setq org-hide-leading-stars nil
      org-hierarchical-todo-statistics nil
      org-startup-indented t
      org-confirm-babel-evaluate nil
      org-src-tab-acts-natively t
      org-image-actual-width nil
      org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar"
      org-todo-keywords '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")
                          (sequence "|" "|" "CANCELED")
                          (sequence "计划中" "对应中" "对应完成" "检查中" "检查完成" "|" "取消" "完成")))

(mapc (lambda (arg) (setcdr arg (list (downcase (cadr arg)))))
      org-structure-template-alist)

(org-babel-do-load-languages 'org-babel-load-languages
                             '((shell . t)
                               (plantuml . t)
                               (org . t)
                               (gnuplot . t)))

(defun dotemacs--org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)	; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook #'dotemacs--org-summary-todo)
(add-hook 'org-babel-after-execute-hook #'org-redisplay-inline-images)

(defmacro org-| (&rest args &key path)
  (cl-flet ((tf (form) 
                (list* (first form) 
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

(provide 'setup/org)
