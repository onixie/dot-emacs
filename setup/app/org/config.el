(use-package ob-rust :ensure t)
(use-package org :ensure t :after session ob-rust
  :config
  (if (display-graphic-p)
      (use-package org-beautify-theme :ensure t
        :config
        (load-theme 'org-beautify t)
        (face-spec-set 'org-hide '((((background dark)) (:inherit default :foreground "default" :inverse-video t))))
        (face-spec-set 'org-block '((t (:background "gray10"))))))

  (use-package org-bullets :ensure t
    :hook
    ((org-mode . (lambda () (org-bullets-mode 1)))))

  (use-package htmlize :ensure t)

  ;; Redefine shell link type
  (org-link-set-parameters "shell" :follow #'dot-emacs::open-shell)
  (org-link-set-parameters "exec"  :follow #'org--open-shell-link)

  ;; After org v8, docbook is not included anymore. Use ox-textinfo instead
  (use-package org-docbook
    :if  (< 0 (string-to-number (car (split-string org-version "\\."))) 8)
    :custom
    (org-export-docbook-xsl-fo-proc-command "fop %s %s")
    (org-export-docbook-xslt-proc-command "xsltproc --output %s /usr/share/docbook2odf/xsl/docbook.xsl %s"))

  ;; Downcase all templates
  (mapc (lambda (arg) (setcdr arg (downcase (cdr arg))))
        org-structure-template-alist)

  (org-babel-lob-ingest "library.org")

  :hook
  ((org-babel-after-execute   . org-redisplay-inline-images)
   (org-babel-after-execute   . dot-emacs::babel-color-result)
   (org-after-todo-statistics . dot-emacs::org-summary-todo)
   (after-save . org-babel-tangle))
  :custom
  (org-confirm-babel-evaluate nil)
  (org-hide-leading-stars nil)
  (org-hierarchical-todo-statistics nil)
  (org-startup-indented t)
  (org-src-tab-acts-natively t)
  (org-image-actual-width nil)
  (org-export-headline-levels 5)
  (org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
  (org-babel-load-languages '((emacs-lisp . t)
                              (shell      . t)
                              (plantuml   . t)
                              (gnuplot    . t)
                              (org        . t)
                              (rust       . t)
                              (C          . t)
                              ))
  (org-todo-keywords '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")
                       (sequence "|" "|" "CANCELED")
                       (sequence "计划中" "对应中" "对应完成" "检查中" "检查完成" "|" "取消" "完成"))))

(provide 'setup/app/org/config)
