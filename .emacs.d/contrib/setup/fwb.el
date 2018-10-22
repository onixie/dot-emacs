(require 'setup/package)

(package-install 'maxframe)
(require 'maxframe)

;;;;;;;;;;;;;;;; Easy-Frame ;;;;;;;;;;;;;;;;
(require 'easy-frame)
(add-hook 'window-setup-hook 'easy-frame-mode)

;; (when auto-smart-fill

;;   ;; Speedbar
;;   (defvar *speedbar-main-frame* nil)
;;   (defvar *speedbar-main-frame-ffw-state* nil)
;;   (defvar *speedbar-poped-up* nil)
;;   (defvar *speedbar-takeup* 0.20)

;;   (add-hook 'speedbar-after-create-hook
;; 	    (lambda ()
;; 	      (frame-fill-workarea nil 'right *speedbar-takeup*)
;; 	      (define-key speedbar-mode-map (kbd "Q") 
;; 		(lambda ()
;; 		  (interactive)
;; 		  (run-hooks 'speedbar-before-delete-hook)
;; 		  (call-interactively 'delete-frame)))
;; 	      (define-key speedbar-mode-map (kbd "q") (kbd "Q"))))

;;   (add-hook 'speedbar-before-popup-hook
;; 	    (lambda ()
;; 	      (if (not *speedbar-poped-up*)
;; 		  (progn
;; 		    (setq auto-smart-fill nil)
;; 		    (setq *speedbar-poped-up* t)
;; 		    (setq *speedbar-main-frame* (selected-frame))
;; 		    (setq *speedbar-main-frame-ffw-state* (frame-parameter *speedbar-main-frame* 'ffw-state))
;; 		    (frame-fill-workarea *speedbar-main-frame* 'left (- 1 *speedbar-takeup*))))))

;;   (add-hook 'speedbar-before-delete-hook 
;; 	    (lambda ()
;; 	      (setq *speedbar-poped-up* nil)
;; 	      (setq auto-smart-fill t)
;; 	      (frame-fill-workarea *speedbar-main-frame* *speedbar-main-frame-ffw-state*))))

(require 'easy-buffer)
(require 'easy-window)

(provide 'setup/fwb)
