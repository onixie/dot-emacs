
;;;;;;;;;;;;;;;; Dired ;;;;;;;;;;;;;;;;
(defun file-manager ()
  (interactive)
  (shell-command "nautilus $(pwd) || thunar $(pwd)" "*Messages*" "*Messages*"))

(defun terminal ()
  (interactive)
  (shell-command "gnome-terminal --working-directory=$(pwd) || terminal --working-directory=$(pwd)" "*Messages*" "*Messages*"))

(defun etags ()
  (interactive)
  (shell-command "find ./ -type f -name '*' -print0 | xargs --null etags -R" "*Messages*" "*Messages*"))

(tool-bar-add-item "file-manager" 'file-manager 'file-manager :visible '(memq major-mode '(dired-mode)))
(tool-bar-add-item "terminal" 'terminal 'terminal :visible '(memq major-mode '(dired-mode)))
(mapc (lambda (mode-hook)
	(add-hook mode-hook (lambda ()
			      (progn
				(define-key dired-mode-map (kbd "N") 'file-manager)
				(define-key dired-mode-map (kbd "b") 'terminal)
				(define-key dired-mode-map (kbd "E") 'etags)))))
      '(dired-mode-hook))

(provide 'setup/dired)
