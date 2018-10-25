(require 'linum)

(defun rescale-window-margin-by-faceremapping (win)
  (let ((width (car (window-margins)))
	(scale (cadr (assoc ':height 
			    (assoc 'default 
				   face-remapping-alist)))))
    (if (numberp scale)
	(progn
	  (set-window-margins win (ceiling (* width scale)) (cdr (window-margins win)))
	  (force-window-update))
      nil)))

(defadvice linum-update-window (after scaling-margin-width last (win) activate)
  (rescale-window-margin-by-faceremapping win)
  ad-return-value)

(mapc (lambda (mode-hook)
	(add-hook mode-hook 'linum-on))
      '(c-mode-hook c++-mode-hook sh-mode-hook lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook asm-mode-hook))

(with-current-buffer "*Messages*"
  (linum-on))

(global-set-key (kbd "M-<mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<left-magin> <M-mouse-4>") (kbd "M-<mouse-4>"))
(global-set-key (kbd "M-<mouse-5>") 'text-scale-decrease)
(global-set-key (kbd "<left-margin> <M-mouse-5>") (kbd "M-<mouse-5>"))

(global-set-key (kbd "C-x M-v") 
		(lambda ()
		  (interactive)
		  (if visual-line-mode 
		      (visual-line-mode 0))
		  (setq word-wrap nil)
		  (if truncate-lines
		      (toggle-truncate-lines -1)
		    (toggle-truncate-lines 1))))

(provide 'setup/linum)
