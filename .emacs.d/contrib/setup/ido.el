(require 'ido)

(ido-mode)

(global-set-key (kbd "C-<f12>") 'find-file-at-point)
(global-set-key (kbd "C-S-f") 'find-grep)

(provide 'setup/ido)
