(require 'setup/package)

(package-install 'haskell-mode)
(package-install 'lsp-haskell)

(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(require 'lsp)
(require 'lsp-haskell)

(add-hook 'haskell-mode-hook #'lsp)

(setq haskell-process-type 'cabal-repl
      haskell-process-suggest-remove-import-lines t
      haskell-process-auto-import-loaded-modules t
      haskell-process-log t
      lsp-haskell-process-wrapper-function (lambda (argv)
                                             (let ((root (lsp-haskell--get-root)))
                                               (append
                                                (append (list "nix-shell" "--argstr" "projectRoot" root "-I" "." "--command" )
                                                        (list (mapconcat #'identity argv " ")))
                                                (list root)))))


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
