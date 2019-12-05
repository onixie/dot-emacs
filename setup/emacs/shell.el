
(use-package shell
  :hook
  ((shell-mode . dot-emacs::kill-buffer-and-window-on-process-die)
   (shell-mode . ansi-color-for-comint-mode-on)
   (shell-mode . (lambda ()
                   (face-remap-set-base 'comint-highlight-prompt :inherit nil)))))

(use-package term
  :hook
  ((term-mode . dot-emacs::kill-buffer-and-window-on-process-die)
   (term-mode . ansi-color-for-comint-mode-on)
   (term-mode . (lambda ()
		  (face-remap-set-base 'comint-highlight-prompt :inherit nil)))))

(provide 'setup/emacs/shell)
