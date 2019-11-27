(defun isearch-current-word-forward (&optional regexp-p no-recursive-edit)
  (interactive "P\np")
  (isearch-mode t (not (null regexp-p)) nil (not no-recursive-edit))
  (isearch-yank-string (current-word)))

(defun isearch-current-word-backward (&optional regexp-p no-recursive-edit)
  (interactive "P\np")
  (isearch-mode nil (not (null regexp-p)) nil (not no-recursive-edit))
  (isearch-yank-string (current-word)))

(global-set-key (kbd "C-*") #'isearch-current-word-forward)
(global-set-key (kbd "C-#") #'isearch-current-word-backward)

(define-key isearch-mode-map (kbd "C-*") #'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "C-#") #'isearch-repeat-backward)

(provide 'setup/emacs/search-at-point)
