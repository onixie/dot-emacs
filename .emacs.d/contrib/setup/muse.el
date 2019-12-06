(require 'setup/package)
(require 'setup/org)

(package-install 'muse)

;;;;;;;;;;;;;;;; Muse ;;;;;;;;;;;;;;;;
(require 'muse-mode)
(require 'muse-publish)
(require 'muse-html)

(defun muse-project-publish-and-preview-this-file ()
  (interactive)
  (let ((muse-project-published-file nil))
    (cl-flet ((setq-published-file () (setq muse-project-published-file output-path)))
      (add-hook 'muse-before-publish-hook #'setq-published-file)
      (muse-project-publish-this-file t)
      (remove-hook 'muse-before-publish-hook #'setq-published-file)
      (browse-url muse-project-published-file))))

(setq muse-project-alist
      '(("personal" ("~/muse/src" :default "index")
	 (:base "html" :path "~/muse/publish"))))

(setq muse-colors-autogen-headings 'outline)

(add-hook 'muse-mode-hook
	  (lambda ()
	    (setq outline-regexp "\\*+ ")
	    (outline-minor-mode)
	    (hide-body)))

(define-key muse-mode-map (kbd "<tab>") #'org-cycle)
(define-key muse-mode-map (kbd "S-<tab>") #'org-shifttab)
(define-key muse-mode-map (kbd "C-c C-y") #'muse-project-publish-and-preview-this-file)

(provide 'setup/muse)
