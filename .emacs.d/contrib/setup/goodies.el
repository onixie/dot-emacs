(require 'setup/package)

;; Workaround: since emacs27, old-style backquote syntax became an error
;; Find other line highlighter or wait until someone solves the error.
(when (< emacs-major-version 27)
  (package-install 'highlight-current-line))
(require 'highlight-current-line)

(face-spec-set 'highlight-current-line-face '((t (:background "gray10"))))

(package-install 'tabbar)
(require 'tabbar)

(setq tabbar-background-color monokai-background)
(face-spec-set 'tabbar-default '((((class color grayscale) (background dark)) (:inherit variable-pitch :background "gray50" :foreground "grey75" :weight extra-bold :height 1.1 :width expanded :family "Serif"))))
(face-spec-set 'tabbar-separator '((t (:inherit tabbar-default :height 0.1))))
(face-spec-set 'tabbar-unselected '((t (:inherit tabbar-default :box (:line-width 1 :color "white" :style released-button)))))
(face-spec-set 'tabbar-selected '((t (:inherit tabbar-default :foreground "white" :box (:line-width 1 :color "white" :style pressed-button)))))

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
   (cond ((memq major-mode '(help-mode apropos-mode Info-mode Man-mode))
	  "Help")
         ((or (member (buffer-name) '("*scratch*" "*Messages*" "*ielm*" ".emacs"))
              (memq major-mode '(emacs-lisp-mode)))
          "Emacs")
	 ((member (buffer-name) '("*shell*" "*eshell*" "*Shell Command Output*"))
          "Term")
         ((eq major-mode 'dired-mode)
	  "Dired")
         ((string-match "[*]tramp/.*[*]" (buffer-name))
	  "Tramp")
         ((memq major-mode '(rmail-mode
			     rmail-edit-mode vm-summary-mode vm-mode mail-mode
			     mh-letter-mode mh-show-mode mh-folder-mode
			     gnus-summary-mode message-mode gnus-group-mode
			     gnus-article-mode score-mode gnus-browse-killed-mode))
	  "Mail")
         ((or (memq major-mode '(magit-mode magit-process-mode magit-diff-mode))
              (string-match ".*Magit.*" (buffer-name)))
          "Magit")
         ((or (get-buffer-process (current-buffer))
	      ;; Check if the major mode derives from `comint-mode' or
	      ;; `compilation-mode'.
	      (tabbar-buffer-mode-derived-p major-mode '(comint-mode compilation-mode)))
	  "Process")
	 ((or (memq major-mode '(lisp-mode slime-repl-mode sldb-mode slime-thread-control-mode slime-connection-list-mode slime-sprof-browser-mode slime-xref-mode))
              (member (buffer-name) '("*inferior-lisp*" "*docker-lisp*" "*slime-events*")))
	  "Common Lisp")
	 ((or (memq major-mode '(scheme-mode inferior-scheme-mode geiser-doc-mode geiser-debug-mode geiser-repl-mode))
	      (search "*scheme*" (buffer-name)))
	  "Scheme")
	 ((memq major-mode '(c-mode c++-mode objc-mode))
	  "C/C++")
	 ((or (search "*haskell*" (buffer-name))
	      (memq major-mode '(haskell-mode haskell-cabal-mode haskell-c-mode ghc-core-mode)))
	  "Haskell")
	 (t
	  ;; Return `mode-name' if not blank, `major-mode' otherwise.
	  (if (and (stringp mode-name)
		   ;; Take care of preserving the match-data because this
		   ;; function is called when updating the header line.
		   (save-match-data (string-match "[^ ]" mode-name)))
	      mode-name
	    (symbol-name major-mode))))))

(defun tabbar-buffer-update-groups ()
  "Update tab sets from groups of existing buffers.
Return the the first group where the current buffer is."
  (let ((bl (sort
             (mapcar
              #'(lambda (b)
                  (with-current-buffer b
                    (list (current-buffer)
                          (buffer-name)
                          (if tabbar-buffer-groups-function
                              (funcall tabbar-buffer-groups-function)
                            '("Emacs")))))
              (and tabbar-buffer-list-function
                   (funcall tabbar-buffer-list-function)))
             #'(lambda (e1 e2)
                 (string-lessp (nth 1 e1) (nth 1 e2))))))
    ;; If the cache has changed, update the tab sets.
    (unless (equal bl tabbar--buffers)
      ;; Add new buffers, or update changed ones.
      (dolist (e bl)
        (dolist (g (nth 2 e))
          (let ((tabset (tabbar-get-tabset g)))
            (if tabset
                (unless (equal e (assq (car e) tabbar--buffers))
                  ;; This is a new buffer, or a previously existing
                  ;; buffer that has been renamed, or moved to another
                  ;; group.  Update the tab set, and the display.
                  (tabbar-add-tab tabset (car e) t)
                  (tabbar-set-template tabset nil))
              (tabbar-make-tabset g (car e))))))
      ;; Remove tabs for buffers not found in cache or moved to other
      ;; groups, and remove empty tabsets.
      (mapc 'tabbar-delete-tabset
            (tabbar-map-tabsets
             #'(lambda (tabset)
                 (dolist (tab (tabbar-tabs tabset))
                   (let ((e (assq (tabbar-tab-value tab) bl)))
                     (or (and e (memq tabset
                                      (mapcar 'tabbar-get-tabset
                                              (nth 2 e))))
                         (tabbar-delete-tab tab))))
                 ;; Return empty tab sets
                 (unless (tabbar-tabs tabset)
                   tabset))))
      ;; The new cache becomes the current one.
      (setq tabbar--buffers bl)))
  ;; Return the first group the current buffer belongs to.
  (car (nth 2 (assq (current-buffer) tabbar--buffers))))

(setq tabbar-buffer-list-function
      (lambda ()
        (remove-if (lambda(buffer)
                     (memq (buffer-local-value 'major-mode buffer)
                           '(completion-list-mode Buffer-menu-mode calendar-mode magit-diff-mode)))
                   (tabbar-buffer-list))))

(add-hook 'calendar-mode-hook 'tabbar-local-mode) ;Disable tabbar for calendar mode
(add-hook 'magit-popup-mode-hook 'tabbar-local-mode) ;Disable tabbar for calendar mode

(setq tabbar-cycle-scope nil)

(require 'pack-windows)

(provide 'setup/goodies)
