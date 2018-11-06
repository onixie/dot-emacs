(require 'setup/package)

(require 'org)

(add-hook 'calendar-mode-hook (lambda nil
                                (unless (eq org-agenda-diary-file (quote diary-file))
                                  (define-key calendar-mode-map org-calendar-insert-diary-entry-key (quote org-agenda-diary-entry)))))

;; After org v8, docbook is not included anymore. Use ox-textinfo instead
(when (< (string-to-number (first (split-string org-version "\\."))) 8)
  (require 'org-docbook)
  (setq org-export-docbook-xsl-fo-proc-command "fop %s %s"
	org-export-docbook-xslt-proc-command "xsltproc --output %s /usr/share/docbook2odf/xsl/docbook.xsl %s"))

(setq org-hide-leading-stars nil
      org-hierarchical-todo-statistics nil
      org-startup-indented t)

(face-spec-set 'org-hide '((((background dark)) (:inherit default :foreground "default" :inverse-video t))))

(defun setup-org--org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)	; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")
	(sequence "|" "|" "CANCELED")
	(sequence "计划中" "对应中" "对应完成" "检查中" "检查完成" "|" "取消" "完成")))

(add-hook 'org-after-todo-statistics-hook 'setup-org--org-summary-todo)

(org-babel-do-load-languages 'org-babel-load-languages '((shell . t)))

(provide 'setup/org)
