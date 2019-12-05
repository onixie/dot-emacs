
(use-package setup/base/defs
  :hook
  (((shell-mode term-mode) . dot-emacs::kill-buffer-and-window-on-process-die)
   ((shell-mode term-mode) . ansi-color-for-comint-mode-on)
   (shell-mode . (lambda ()
                   (face-remap-set-base 'comint-highlight-prompt :inherit nil)))))

(provide 'setup/emacs/shell)
