(use-package rect
  :bind (("S-<down-mouse-1>" . #'dot-emacs::mouse-start-rectangle-mark)))

(use-package simple
  :bind
  (("<f7>"   . #'pop-global-mark)
   ("<S-f7>" . #'dot-emacs::xah-pop-local-mark-ring)
   ("C-x M-w". #'dot-emacs:toggle-wrap-line)))

(use-package face-remap
  :bind
  (("M-+" . #'text-scale-increase)
   ("M--" . #'text-scale-decrease)
   ("M-<mouse-4>" . "M-+")
   ("M-<mouse-5>" . "M--")
   ("<left-magin> <M-mouse-4>" . "M-<mouse-4>")
   ("<left-margin> <M-mouse-5>". "M-<mouse-5>")))

(use-package isearch
  :bind
  (("C-*" . #'dot-emacs:isearch-current-word-forward)
   ("C-#" . #'dot-emacs:isearch-current-word-backward)
   :map isearch-mode-map
   ("C-*" . #'isearch-repeat-forward)
   ("C-#" . #'isearch-repeat-backward)
   ))

(use-package dired
  :bind
  (:map dired-mode-map
	("N" . #'dot-emacs:file-manager)
	("b" . #'dot-emacs:terminal)
	("E" . #'dot-emacs:etags)))

(use-package setup/emacs/tabs
  :bind 
  (:map centaur-tabs-mode-map
	("<S-left>" . #'centaur-tabs-backward)
	("<S-right>". #'centaur-tabs-forward)
	("<S-up>"   . #'dot-emacs::centaur-tabs-show-groups)
	("<S-down>" . #'dot-emacs::centaur-tabs-hide-groups)))

(use-package ffap
  :bind
  (("C-<f12>" . #'find-file-at-point)))

(use-package grep
  :bind
  (("C-S-<f12>" . #'find-grep)))

(provide 'setup/emacs/keymap/config)
