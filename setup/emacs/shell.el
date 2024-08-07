(system-packages-ensure "fish")
(defun dot-emacs::open-term ()
  (interactive)
  (switch-to-buffer (or (get-buffer "*ansi-term*") (ansi-term "fish"))))

(defun dot-emacs::open-term-bash ()
  (interactive)
  (switch-to-buffer (or (get-buffer "*ansi-term*") (ansi-term "bash"))))

(use-package shell
  :custom
  (shell-prompt-pattern "^[^#$%>\n]*#?[#$%>] *")
  :hook
  ((shell-mode . dot-emacs::kill-buffer-and-window-on-process-die)
   (shell-mode . ansi-color-for-comint-mode-on)))

(use-package term
  :hook
  ((term-mode . dot-emacs::kill-buffer-and-window-on-process-die)
   (term-mode . ansi-color-for-comint-mode-on))
  :bind
  (("M-9" . dot-emacs::open-term)
   ("M-8" . dot-emacs::open-term-bash)))


(provide 'setup/emacs/shell)
