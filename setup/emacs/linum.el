
(use-package linum
  :config
  ;; Adjust window margin with regards to scaled text
  (advice-add 'linum-update-window :after
              (lambda (win) 
                (when (and (bound-and-true-p linum-mode) linum-overlays)
                  (let* ((overlay (overlay-properties (car linum-overlays)))
                         (num-str (or (plist-get overlay 'linum-str) ""))
                         (pad-str (or (plist-get overlay 'before-string) ""))
                         (width (+ (length num-str) (length pad-str))))
                    (set-window-margins win (ceiling (/ (* width (default-font-width)) (frame-char-width))))
                    (set-window-parameter win 'linum--set-margins (window-margins win))))))

  (dolist (name (list "*scratch*" "*Messages*"))
    (with-current-buffer name (linum-on)))
  
  :hook ((prog-mode message-buffer-mode) . #'linum-mode))

(provide 'setup/emacs/linum)
