;;; -*- lexical-binding: t; -*-

(defun dot-emacs:insert-pretty-control-line ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (insert ?\xC)
  (next-line))

(defun dot-emacs::sml/center-minions-mode-line ()
  "Setup a mode-line with major and minor modes centered."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((lhs (list (format-mode-line (list
                                                        "%I " "%p" "%% "
                                                        mode-line-front-space
                                                        ;; (when powerline-display-buffer-size
                                                        ;;    (powerline-buffer-size 'powerline-active1))
                                                        mode-line-mule-info
                                                        mode-line-client
                                                        mode-line-modified
                                                        mode-line-remote
                                                        mode-line-frame-identification
                                                        mode-line-buffer-identification
                                                        vc-mode))))
                          (rhs (list (format-mode-line (list
                                                        mode-line-misc-info
                                                        mode-line-end-spaces))))
                          (center (list (format-mode-line minions-mode-line-modes))))
                     (concat (powerline-render lhs)
                             (powerline-fill-center 'powerline-active1 (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill 'powerline-active1 (powerline-width rhs))
                             (powerline-render rhs)
                             ))))))

(provide 'setup/emacs/theme/define)
