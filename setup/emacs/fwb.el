(use-package easy-frame
  :requires maxframe
  :if (member system-type '(gnu gnu/linux gnu/kfreebsd))
  :hook ((window-setup-hook . easy-frame-mode))
  :config
  (set-transient-map easy-frame-mode-map (lambda () t))
  )

(use-package easy-buffer
  :custom
  (switch-to-buffer-obey-display-actions t)
  :config
  (set-transient-map easy-buffer-mode-map (lambda () t))
  (add-to-list 'display-buffer-alist
               '("*ansi-term*" (display-buffer-in-side-window)
                 (reusable-frames . visible)
                 (side . bottom))))

(use-package easy-window
  :custom
  (window-sides-vertical t)
  :config
  (set-transient-map easy-window-mode-map (lambda () t)))

(provide 'setup/emacs/fwb)
