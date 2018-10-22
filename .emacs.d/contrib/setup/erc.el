(require 'erc)

;; Join the #emacs and #erc channels whenever connecting to Freenode.
(setq erc-autojoin-channels-alist '(("freenode.net" 
				     "#emacs" 
				     "#lisp" 
				     "#sbcl" 
				     "#opengl3" 
				     "#blender" 
				     "#blendercn" 
				     "#blenderwiki" 
				     "#blenderpython" 
				     "#gameblender" 
				     "#maxima")))

;; Interpret mIRC-style color commands in IRC chats
(setq erc-interpret-mirc-color t)

;; The following are commented out by default, but users of other
;; non-Emacs IRC clients might find them useful.
;; Kill buffers for channels after /part
(setq erc-kill-buffer-on-part t)
;; Kill buffers for private queries after quitting the server
(setq erc-kill-queries-on-quit t)
;; Kill buffers for server messages after quitting the server
(setq erc-kill-server-buffer-on-quit t)

(provide 'setup/erc)