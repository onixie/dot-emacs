(require 'setup/package)

(package-install 'haskell-mode)
(package-install 'intero)

(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)

(add-hook 'haskell-mode-hook #'intero-mode)
(add-hook 'haskell-mode-hook #'interactive-haskell-mode)

(setq haskell-process-type 'stack-ghci
      haskell-process-suggest-remove-import-lines t
      haskell-process-auto-import-loaded-modules t
      haskell-process-log t
      )

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

;; Brute-force fix: Ensure the setting is injected every time the REPL
;; is selected.
;;
;; Upstream issue: https://github.com/commercialhaskell/intero/issues/569

(defun intero-fix-ghci-panic ()
  "Disable deferring of out of scope variable errors, which
  triggers a bug in the interactive Emacs REPL printing a panic
  under certain conditions."

  (interactive)
  (let* ((root (intero-project-root))
         (package-name (intero-package-name))
         (backend-buffer (intero-buffer 'backend))
         (name (format "*intero:%s:%s:repl*"
                       (file-name-nondirectory root)
                       package-name))
         (setting ":set -fno-defer-out-of-scope-variables\n"))
    (when (get-buffer name)
      (with-current-buffer (get-buffer name)
        (goto-char (point-max))
        (let ((process (get-buffer-process (current-buffer))))
          (when process (process-send-string process setting)))))))

(advice-add 'intero-repl :after (lambda (&rest r) (intero-fix-ghci-panic))
            '((name . intero-panic-fix)))
(advice-add 'intero-repl-load :after (lambda (&rest r) (intero-fix-ghci-panic))
            '((name . intero-panic-fix)))

(provide 'setup/lang/haskell)
