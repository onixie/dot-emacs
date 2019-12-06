(require 'emacs-wiki)

(defun emacs-wiki-publish-and-preview-this-page ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (browse-url (emacs-wiki-published-file)))

(setq emacs-wiki-projects
      '(("personal" (emacs-wiki-directories "~/emacs-wiki/src")
	 (emacs-wiki-publishing-directory . "~/emacs-wiki/publish")
	 (emacs-wiki-default-page . "index"))))

(setq emacs-wiki-maintainer "mailto:onixie@gmail.com")

(define-key emacs-wiki-mode-map (kbd "C-c C-y") #'emacs-wiki-publish-and-preview-this-page)

(provide 'setup/wiki)
