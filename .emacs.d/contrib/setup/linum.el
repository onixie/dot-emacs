(require 'linum)

(defun dotemacs--linum-adjust-window-margin (win)
  (when (bound-and-true-p linum-mode)
    (let* ((overlay (overlay-properties (car linum-overlays)))
           (num-str (or (plist-get overlay 'linum-str) ""))
           (pad-str (or (plist-get overlay 'before-string) ""))
           (width (+ (length num-str) (length pad-str))))
      (set-window-margins win (ceiling (/ (* width (default-font-width)) (frame-char-width))))
      (set-window-parameter win 'linum--set-margins (window-margins win)))))

(advice-add 'linum-update-window :after #'dotemacs--linum-adjust-window-margin)

(mapc (lambda (mode-hook)
	(add-hook mode-hook 'linum-on))
      '(c-mode-hook
	c++-mode-hook
	sh-mode-hook
	lisp-mode-hook
	emacs-lisp-mode-hook
	lisp-interaction-mode-hook
	asm-mode-hook
	haskell-mode))

(with-current-buffer "*Messages*"
  (linum-on))

(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M-<mouse-4>") (kbd "M-+"))
(global-set-key (kbd "<left-magin> <M-mouse-4>") (kbd "M-<mouse-4>"))
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "M-<mouse-5>") (kbd "M--"))
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
