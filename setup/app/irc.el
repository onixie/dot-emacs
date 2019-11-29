
(use-package erc :ensure t
  :custom
  (erc-autojoin-channels-alist '(("freenode.net" 
				  "#lisp" 
				  "#emacs" 
				  "#sbcl" 
				  "#maxima"
				  "#haskell"
				  "#xmonad"
				  )))
  (erc-interpret-mirc-color t)
  (erc-kill-buffer-on-part t)
  (erc-kill-queries-on-quit t)
  (erc-kill-server-buffer-on-quit t)))

(provide 'setup/app/irc)
