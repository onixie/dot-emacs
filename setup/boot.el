;;; -*- lexical-binding: t; -*-

(defconst dot-emacs::gc-cons-threshold (expt 2 25)) ; 32mb
(defconst dot-emacs::gc-cons-percentage 0.1)
(defconst dot-emacs::file-name-handler-alist file-name-handler-alist)

(defun dot-emacs::intern* (&rest args)
  "Make an interned symbol by concatenating the strings/numbers/symbols"
  (intern (mapconcat (lambda (name)
                       (cond
                        ((stringp  name) name)
                        ((keywordp name) (substring (symbol-name name) 1))
                        ((symbolp  name) (symbol-name name))
                        ((numberp  name) (number-to-string name))
                        (t (error "unknown type"))))
                     args "")))

(defun dot-emacs::require+ (file)
  (or (require (dot-emacs::intern* "setup/" file) nil t)
      (progn
        (require (dot-emacs::intern* "setup/" file "/define") nil t)
        (require (dot-emacs::intern* "setup/" file "/config") nil t))))

(defun dot-emacs:boot (&rest setups)
  ;; Improve initialization time (idea borrowed from doom-emacs)
  (setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
        gc-cons-percentage 0.6
        file-name-handler-alist nil
        inhibit-message t)

  (add-hook 'emacs-startup-hook
            (lambda ()
              (setq gc-cons-threshold       dot-emacs::gc-cons-threshold
                    gc-cons-percentage      dot-emacs::gc-cons-percentage
                    file-name-handler-alist dot-emacs::file-name-handler-alist
                    inhibit-message         nil)))

  ;; Scan all directories under dot-emacs
  (let ((default-directory (file-name-directory (or load-file-name (buffer-file-name)))))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path)
    (push default-directory image-load-path)

    (mapc #'dot-emacs::require+ setups)))

(defun dot-emacs::kill-buffer-and-window-on (match-regex)
  (lambda ()
    (let ((process (get-buffer-process (current-buffer))))
      (when (processp process)
        (set-process-query-on-exit-flag process nil)
        (set-process-sentinel process
                              (lambda (proc change)
                                (when (string-match match-regex change)
                                  (ignore-errors
                                    (let* ((b (process-buffer proc))
                                           (w (get-buffer-window b)))
                                      (kill-buffer b)
                                      (delete-window w))))))))))

(defun dot-emacs::kill-buffer-and-window-on-process-die ()
  (funcall (dot-emacs::kill-buffer-and-window-on "\\(?:finished\\|exited\\|killed\\|quit\\)")))

(provide 'setup/boot)
