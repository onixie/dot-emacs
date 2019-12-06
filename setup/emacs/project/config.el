
(use-package project
  :config
  (add-to-list 'project-find-functions 
	       (dot-emacs::project-try-find dot-emacs::project-identifiers) t))

(provide 'setup/emacs/project/config)
