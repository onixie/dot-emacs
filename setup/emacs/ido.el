
(use-package ido
  :config 
  (ido-mode 1)
  :bind
  (("C-<f12>" . #'find-file-at-point)
   ("C-S-f" . #'find-grep)))

(provide 'setup/emacs/ido)
