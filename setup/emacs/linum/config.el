
(use-package linum
  :config
  (advice-add 'linum-update-window :after #'dot-emacs::linum-update-window+)

  (dolist (name (list "*scratch*" "*Messages*"))
    (with-current-buffer name (linum-on)))

  :hook ((prog-mode message-buffer-mode) . linum-mode))

(provide 'setup/emacs/linum/config)
