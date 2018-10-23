
(load-file "~/.emacs.d/contrib/haskell-mode/haskell-site-file.el")

(defun inf-haskell-quit-sentinel (proc change)
  "Clean up of buffers, when ghci quit."
  (when (string-match "\\(finished\\|exited\\|killed\\|quit\\)" change)
    (condition-case nil
	(let ((b (process-buffer proc)))
	  (kill-buffer b)
	  (delete-window (get-buffer-window b)))
      (error (print "error")))))

(add-hook 'inferior-haskell-mode-hook 
	  (lambda ()
	    (eldoc-mode)
	    (let ((process (get-buffer-process (current-buffer))))
	      (when (processp process)
		(set-process-query-on-exit-flag process nil)
		(set-process-sentinel process 'inf-haskell-quit-sentinel)))))

(provide 'setup/lang/haskell)
