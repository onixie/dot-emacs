
(use-package setup/base/defs
  :hook ((shell-mode term-mode) . #'dot-emacs::kill-buffer-and-window-on-process-die))

(provide 'setup/emacs/shell)
