(require 'setup/package)

(require 'org)

(custom-set-variables
 '(calendar-mode-hook (quote ((lambda nil (unless (eq org-agenda-diary-file (quote diary-file)) (define-key calendar-mode-map org-calendar-insert-diary-entry-key (quote org-agenda-diary-entry)))) (lambda nil (toggle-truncate-lines 1)) (lambda nil (load "~/.emacs.d/contrib/more-calendar.el")) (lambda nil (progn (setq scroll-margin 0) (setq scroll-step 0) (setq scroll-conservatively 0))))))
 '(org-export-docbook-xsl-fo-proc-command "fop %s %s")
 '(org-export-docbook-xslt-proc-command "xsltproc --output %s /usr/share/docbook2odf/xsl/docbook.xsl %s")
 '(org-hide-leading-stars nil nil nil "Clean View is done by org-startup-indented, this variable has little usage in future.")
 '(org-hierarchical-todo-statistics nil)
 '(org-startup-indented t))

(custom-set-faces
 '(org-hide ((((background dark)) (:inherit default :foreground "default" :inverse-video t)))))

(defun setup-org--org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)	; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")
	(sequence "|" "|" "CANCELED")
	(sequence "计划中" "对应中" "对应完成" "检查中" "检查完成" "|" "取消" "完成")))

(add-hook 'org-after-todo-statistics-hook 'setup-org--org-summary-todo)


(provide 'setup/org)
