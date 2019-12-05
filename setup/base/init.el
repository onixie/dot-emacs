(defconst dot-emacs::gc-cons-threshold (expt 2 25)) ; 32mb
(defconst dot-emacs::gc-cons-percentage 0.1)
(defconst dot-emacs::file-name-handler-alist file-name-handler-alist)

(defun dot-emacs:bootstrap (&optional setups)
  ;; Improve initialization time (idea borrowed from doom-emacs)
  (setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
        gc-cons-percentage 0.6
        file-name-handler-alist nil)

  (add-hook 'emacs-startup-hook
            (lambda ()
              (setq gc-cons-threshold       dot-emacs::gc-cons-threshold
                    gc-cons-percentage      dot-emacs::gc-cons-percentage
                    file-name-handler-alist dot-emacs::file-name-handler-alist)))

  ;; Scan all directories under dot-emacs
  (let ((default-directory (file-name-directory (or load-file-name (buffer-file-name)))))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path)
    (push default-directory image-load-path))

  (mapc #'require setups))

(provide 'setup/base/init)
