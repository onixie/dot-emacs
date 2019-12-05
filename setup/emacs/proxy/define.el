;;; -*- lexical-binding: t; -*-

(defun dot-emacs::remove-scheme (uri)
  (when uri (replace-regexp-in-string "[^/:]+://" "" uri)))

(provide 'setup/emacs/proxy/define)
