(use-package easy-frame
  :requires maxframe
  :if (member system-type '(gnu gnu/linux gnu/kfreebsd))
  :hook ((window-setup-hook . easy-frame-mode))
  :config
  (set-transient-map easy-frame-mode-map (lambda () t))
  )

(use-package easy-buffer
  :config
  (set-transient-map easy-buffer-mode-map (lambda () t)))

(use-package easy-window
  :config
  (set-transient-map easy-window-mode-map (lambda () t)))

(provide 'setup/emacs/fwb)
