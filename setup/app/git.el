(use-package magit :ensure t
  :config
  (add-to-list 'display-buffer-alist
	           '("\\(magit: .+\\|magit-log.+\\|magit-revision.+\\)"
	             (magit--display-buffer-fullframe)))
  :commands magit)

(provide 'setup/app/git)
