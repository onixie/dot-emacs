;; ;;(require 'setup/lang/asm)

;; ;;;;;;;;;;;;;;;; CEDET ;;;;;;;;;;;;;;;;

;; (require 'cedet)
;; (require 'ede)
;; (require 'semantic)
;; (require 'srecode)
;; (require 'traverselisp)
;;                                         ;(require 'cogre)

;;                                         ;(semantic-load-enable-excessive-code-helpers)
;;                                         ;(semantic-load-enable-semantic-debugging-helpers)

;; (global-srecode-minor-mode 1)
;; (global-semantic-stickyfunc-mode -1)

;; (global-ede-mode 1)
;; (remove-hook 'find-file-hook 'ede-turn-on-hook)
;; (add-hook 'find-file-hook 'ede-turn-on-hook t)

;; (when (require 'semantic-tag-folding nil 'noerror)
;;   (global-semantic-tag-folding-mode 1)
;;   (remove-hook 'semantic-init-hook 'semantic-tag-folding-mode)
;;   (add-hook 'semantic-init-hook 'semantic-tag-folding-mode t)

;;   (define-key semantic-tag-folding-mode-map (kbd "C-c -") 'semantic-tag-folding-fold-block)
;;   (define-key semantic-tag-folding-mode-map (kbd "C-c =") 'semantic-tag-folding-show-block)
;;   (define-key semantic-tag-folding-mode-map (kbd "C-c M--") 'semantic-tag-folding-fold-all)
;;   (define-key semantic-tag-folding-mode-map (kbd "C-c M-=") 'semantic-tag-folding-show-all))

;; (defsubst* walk-directory (dirname &key operation (collectp nil) excludes (excludes-subp t) (by-full-pathname t))
;;   (let ((collector-sym (gensym)))
;;     (fset collector-sym (symbol-function (if collectp 'cons 'ignore)))
;;     (cl-labels
;; 	((walk (name)
;; 	       (cond
;; 		((excludesp name) nil)
;; 		((eq t (car (file-attributes name)))
;; 		 (apply collector-sym
;; 			(list (funcall (or operation #'identity) name)
;; 			      (mapcan #'walk (traverse-list-directory name t)))))))
;; 	 (excludesp (name)
;; 		    (and excludes
;; 			 (cond ((not excludes-subp)
;; 				(member (if by-full-pathname
;; 					    name
;; 					  (file-name-nondirectory name))
;; 					excludes))
;; 			       (t (find name excludes
;; 					:test (lambda (n ex)
;; 						(let ((pos (search ex n)))
;; 						  (and (not (null pos))
;; 						       (or (not by-full-pathname)
;; 							   (= pos 0)))))))))))
;;       (walk (expand-file-name dirname)))))

;; (defun add-path-to-sys-include (path)
;;   (semantic-add-system-include path 'c-mode)
;;   (semantic-add-system-include path 'c++-mode))

;; (defvar semantic-user-local-include
;;   (list "include" "inc" "common" "public"
;; 	"../include" "../inc" "../common" "../public"
;; 	"../../include" "../../inc" "../../common" "../../public"))

;; (defvar semantic-sys-spec-include
;;   (list "/usr/include"
;; 	"/usr/local/include"
;; 	;; "/usr/src"
;; 	;; "/usr/local/src"
;; 	))

;; (require 'semantic-c nil 'noerror)
;; (dolist (dirname semantic-sys-spec-include)
;;   (walk-directory dirname :operation #'add-path-to-sys-include))

;; (add-hook 'semantic-init-hook
;; 	  (lambda ()
;; 	    (dolist (dirname semantic-user-local-include)
;; 	      (walk-directory dirname
;; 			      :operation #'add-path-to-sys-include
;; 			      :excludes semantic-sys-spec-include))))

;; (add-hook 'semantic-init-mode-hook (lambda () (senator-force-refresh)) t)
;;                                         ;(enable-visual-studio-bookmarks)

;; ;;;;;;;;;;;;;;;; C/C++ Programming ;;;;;;;;;;;;;;;;
;; (require 'cc-mode)



;; (defun kill-c-comment (&optional arg)
;;   "Kill C/C++ Comment"
;;   (interactive "p")
;;   (kmacro-exec-ring-item (quote ("\223//\\|/\\*\273" 0 "%d")) arg))

;; (defun kill-c-blank-line (&optional arg)
;;   "Kill C/C++ Blank Line"
;;   (interactive "p")
;;   (kmacro-exec-ring-item (quote ("\223^[[:space:]]*$" 0 "%d")) arg))

;; (define-key c-mode-base-map (kbd "C-M-S-c") 'kill-c-comment)
;; (define-key c-mode-base-map (kbd "C-M-S-b") 'kill-c-blank-line)

;; (define-key c-mode-base-map (kbd "<f12>") 'semantic-ia-fast-jump)
;; (define-key c-mode-base-map (kbd "M-<f12>") 'eassist-switch-h-cpp)
;; (define-key c-mode-base-map (kbd "M-S-<f12>") 'semantic-analyze-proto-impl-toggle)

;; (define-key c-mode-base-map (kbd "<f8>") 'ecb-minor-mode)

;; (define-key c-mode-base-map (kbd "<f5>") 'gdb)
;; (define-key c-mode-base-map (kbd "<f6>") 'compile)
;; (define-key c-mode-base-map (kbd "S-<f5>") (lambda ()
;; 					     (interactive)
;; 					     (mapc 'call-interactively '(gdb gdb-many-windows))))
;; (define-key c-mode-base-map (kbd "M-S-<f5>") (lambda ()
;; 					       (interactive)
;; 					       (mapc 'call-interactively '(compile gdb gdb-many-windows))))

;; (tool-bar-add-item "gud" 'gdb 'gdb :visible '(memq major-mode '(c++-mode c-mode)))
;; (tool-bar-add-item "compile" 'compile 'compile :visible '(memq major-mode '(c++-mode c-mode)))

;; ;;;;;;;;;;;;;;;; Compiler ;;;;;;;;;;;;;;;;
;; (defvar compile-output-time 3.0)

;; (add-to-list 'compilation-finish-functions
;; 	     (lambda (buffer string)
;; 	       (when (and (string= (buffer-name buffer) "*compilation*")
;; 			  (not (string-match "exited abnormally" string)))
;; 		 (run-at-time compile-output-time nil 'delete-windows-on buffer))))

;; ;;;;;;;;;;;;;;;; GDB and GUD ;;;;;;;;;;;;;;;;
;; (require 'gud)

;; (defvar gdb-fn-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map (kbd "<f5>") 'gud-go)
;;     (define-key map (kbd "<f9>") (lambda () (interactive) (mapc 'call-interactively '(windmove-source-window gud-break))))
;;     (define-key map (kbd "S-<f9>") (lambda () (interactive) (mapc 'call-interactively '(windmove-source-window gud-remove))))
;;     (define-key map (kbd "<f10>") 'gud-step)
;;     (define-key map (kbd "<f11>") 'gud-next)
;;     (define-key map (kbd "S-<f10>") 'gud-finish)
;;     (define-key map (kbd "ESC") (lambda () (interactive) (mapc 'call-interactively '(windmove-gdb-window comint-send-eof))))
;;     map)
;;   "Keymap for `gdb-fn-mode'.")

;; (define-minor-mode gdb-fn-mode
;;   "Toggle GDB FN Key Available.
;;      With no argument, this command toggles the mode.
;;      Non-null prefix argument turns on the mode.
;;      Null prefix argument turns off the mode.
;;      \{KEYMAP}
;;      When gdb-fn-key-mode mode is enabled, the function key
;;      [f5], [f9], [f10], [f11] are enabled for debugging commands"
;;   ;; The initial value.
;;   :init-value nil
;;   ;; The indicator for the mode line.
;;   :lighter "Gdb-FN"
;;   :global t
;;   ;; The minor mode bindings.
;;   :keymap gdb-fn-mode-map)

;; (define-globalized-minor-mode global-gdb-fn-mode gdb-fn-mode
;;   (lambda ()
;;     (gdb-fn-mode 1))
;;   :require 'gud)

;; (defun gdb-quit-sentinel (proc change)
;;   "Clean up of buffers, fn keys, etc. when GDB quit."
;;   (when (string-match "\\(finished\\|exited\\|killed\\)" change)
;;     (condition-case nil
;; 	(let ((src-buffer (condition-case nil
;; 			      (or (and (not (null gdb-many-windows))
;; 				       (not (null gdb-show-main))
;; 				       (window-buffer gdb-source-window))
;; 				  (gud-find-file gdb-main-file))
;; 			    (error "*scratch*"))))
;; 	  (global-gdb-fn-mode -1)	;Disable GDB's Function Key
;; 	  (delete-other-windows	;Restore Source window
;; 	   (get-buffer-window (switch-to-buffer src-buffer)))
;; 	  (mapc (lambda (name-func) ;Kill all dead buffer associate with GDB
;; 		  (condition-case nil
;; 		      (let ((buffer (get-buffer (funcall name-func))))
;; 			(and (buffer-live-p buffer) (kill-buffer buffer)))
;; 		    (error nil)))
;; 		`(gdb-assembler-buffer-name
;; 		  gdb-memory-buffer-name
;; 		  gdb-stack-buffer-name
;; 		  gdb-registers-buffer-name
;; 		  gdb-threads-buffer-name
;; 		  gdb-locals-buffer-name
;; 		  gdb-breakpoints-buffer-name
;; 		  ,(lambda ()	;This is the gud comint buffer
;; 		     (buffer-name (process-buffer proc)))))
;; 	  (switch-to-buffer src-buffer)
;; 	  (gdb-many-windows -1)	;Disable GDB Many windows
;; 	  (gud-reset)
;; 	  (gdb-reset))
;;       (error nil))))

;; (defun kill-gdb-process ()
;;   "kill gdb process"
;;   (interactive)
;;   (with-current-buffer gud-comint-buffer
;;     (comint-skip-input))
;;   (set-process-query-on-exit-flag (get-buffer-process gud-comint-buffer) nil)
;;   (kill-buffer gud-comint-buffer))

;; (defun easy-gdb ()
;;   "Make gdb easy to use"
;;   ;; Enable and Clean up FN keys
;;   (global-gdb-fn-mode 1)
;;   ;; Close gdb buffer when gdb quit, Clean up windows if multiple windows are shown
;;   (let ((process (get-buffer-process (current-buffer))))
;;     (when (processp process)
;;       (set-process-sentinel process 'gdb-quit-sentinel))))

;; (defun windmove-source-window ()
;;   (interactive)
;;   (other-window-by-name (buffer-name (window-buffer gdb-source-window))))

;; (defun windmove-gdb-window ()
;;   (interactive)
;;   (other-window-by-name (buffer-name gud-comint-buffer)))

;; (mapc (lambda (mode-hook)
;; 	(add-hook mode-hook 'easy-gdb))
;;       '(gdb-mode-hook gud-mode-hook))


;; ;;;;;;;;;;;;;;;; ECB Programming ;;;;;;;;;;;;;;;;
;; (custom-set-variables
;;  '(ecb-options-version "2.40"))
;; (package-install 'ecb)
;; (require 'ecb)


(system-packages-ensure "clang-tools")

(use-package clang-format :ensure t :after (company flycheck)
  :hook
  ((c-mode-common . company-mode)
   (c-mode-common . flycheck-mode)
   (c-mode-common . lsp)))

(use-package google-c-style :ensure t
  :hook
  ((c-mode-common . google-set-c-style)))

(use-package gud :ensure t
  :config
  (setq gdb-many-windows t
        gdb-use-separate-io-buffer t)
  (advice-add 'gdb-setup-windows :after
              (lambda () (set-window-dedicated-p (selected-window) t)))
  :bind
  (:map gud-mode-map
        ("<f5>" . gud-cont)
        ("<f6>" . gud-next)
        ("<f7>" . gud-step)
        ("S-<f7>" . gud-finish))
  (:map c-mode-map
        ("<f5>" . gud-cont)
        ("<f6>" . gud-next)
        ("<f7>" . gud-step)
        ("S-<f7>" . gud-finish)
        ("<left-fringe> S-<mouse-1>" . dot-emacs::gdb-mouse-set-clear-breakpoint)
        ("<left-margin> S-<mouse-1>" . dot-emacs::gdb-mouse-set-clear-breakpoint))
  (:map c++-mode-map
        ("<f5>" . gud-cont)
        ("<f6>" . gud-next)
        ("<f7>" . gud-step)
        ("S-<f7>" . gud-finish)
        ("<left-fringe> S-<mouse-1>" . dot-emacs::gdb-mouse-set-clear-breakpoint)
        ("<left-margin> S-<mouse-1>" . dot-emacs::gdb-mouse-set-clear-breakpoint))
  )

(provide 'setup/lang/c++)
