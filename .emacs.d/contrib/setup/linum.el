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
(global-set-key (kbd "M-<mouse-5>") 'text-scale-decrease)

(provide 'setup/linum)