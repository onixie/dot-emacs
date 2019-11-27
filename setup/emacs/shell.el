
(use-package setup/base
  :hook ((shell-mode term-mode) . (dot-emacs::kill-buffer-and-window-on "\\(?:finished\\|exited\\|killed\\|quit\\)")))

(provide 'setup/emacs/shell)
