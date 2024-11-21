(use-package rustic :ensure t :after lsp-mode
  :custom
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  :bind
  (:map rustic-mode-map
        ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;(setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'dot-emacs::rustic-mode-hook)
  (add-to-list 'display-buffer-alist
	           '("\\*\\(rustfmt\\|cargo-.*\\)\\*"
	             (display-buffer-reuse-window display-buffer-pop-up-window)
	             (window-width . 120)
                 (window-parameters . (
                                       ;(no-other-window . t)
                                       ;(no-delete-other-windows . t)
                                       ))
                 (dedicated . t)
	             (side . right)
                 (slot . 3)))

  )

(defun dot-emacs::rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

(provide 'setup/lang/rust)
