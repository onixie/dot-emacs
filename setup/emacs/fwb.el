(use-package easy-frame
  :requires maxframe
  :if (member system-type '(gnu gnu/linux gnu/kfreebsd))
  :hook ((window-setup-hook . easy-frame-mode))
  ) 

(use-package easy-buffer)
(use-package easy-window)

(provide 'setup/emacs/fwb)
