
(cl-defun dotemacs--open-shell (path &optional (always-new t))
  (cl-labels ((get-buffer-name (path)
                               (let ((name system-name)
                                     (pos 0))
                                 (block nil
                                   (while (or (string-match ":\\([^:|/]+\\)\\(?:[:|/]\\|$\\)" path pos)
                                              (return name))
                                     (setq name (match-string 1 path)
                                           pos (match-end 0))))))) 
    (let ((default-directory path)
          (buffer-name (get-buffer-name path)))
      (shell (if always-new
                 (generate-new-buffer-name buffer-name)
               buffer-name)))))

(add-hook 'shell-mode-hook (dot-emacs--kill-buffer-and-window-when-process "\\(?:finished\\|exited\\|killed\\|quit\\)"))

(provide 'setup/shell)
