(system-packages-ensure "fish")

(use-package shell
  :custom
  (shell-prompt-pattern "^[^#$%>\n]*#?[#$%>] *")
  :hook
  ((shell-mode . dot-emacs::kill-buffer-and-window-on-process-die)
   (shell-mode . ansi-color-for-comint-mode-on)))

(use-package term
  :hook
  ((term-mode . dot-emacs::kill-buffer-and-window-on-process-die)
   (term-mode . ansi-color-for-comint-mode-on)))

(provide 'setup/emacs/shell)
