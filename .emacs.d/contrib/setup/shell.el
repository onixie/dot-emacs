(defun dotemacs--open-shell (path)
  (cl-labels ((calc-buffer-name (path)
               (let ((name system-name)
                     (pos 0))
                 (block nil
                   (while (or (string-match ":\\([^:|/]+\\)\\(?:[:]\\)" path pos)
                              (return name))
                     (setq name (match-string 1 path)
                           pos (match-end 0)))))))
    (let ((buffer (generate-new-buffer (calc-buffer-name path))))
      (setf (buffer-local-value 'default-directory buffer) 
            (if (string-suffix-p ":" path) 
                (concat path "/") ;Workaround for tramp hang issue
              path))
      (shell buffer))))

(add-hook 'shell-mode-hook (dot-emacs--kill-buffer-and-window-when-process "\\(?:finished\\|exited\\|killed\\|quit\\)"))

(provide 'setup/shell)
