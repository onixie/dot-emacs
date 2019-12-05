;;; -*- lexical-binding: t; -*-

(defun dot-emacs::swap-key-bindings (key1 key2)
  "Swap key bindings in key-translation-map"
  (define-key key-translation-map key1 key2)
  (define-key key-translation-map key2 key1))

(defun dot-emacs::mouse-start-rectangle-mark (start-event)
  (interactive "e")
  (deactivate-mark)
  (mouse-set-point start-event)
  (rectangle-mark-mode +1)
  (cl-labels ((calculate-column (point)
                                (save-excursion
                                  (goto-char point)
                                  (beginning-of-line)
                                  (- point (point)))))

    (let ((drag-event))
      (track-mouse
        (while (progn
                 (setq drag-event (read-event))
                 (mouse-movement-p drag-event))
          (let ((extra (- (car (posn-actual-col-row (event-end drag-event))) (calculate-column (line-end-position)))))
            (if (> extra 0)
                (rectangle-forward-char extra )))
          (mouse-set-point drag-event))))))

(defun dot-emacs::calendar-exit-with-kill ()
  (interactive)
  (calendar-exit t))

(defun dot-emacs:file-manager ()
  (interactive)
  (shell-command "nautilus $(pwd) || thunar $(pwd)" "*Messages*" "*Messages*"))

(defun dot-emacs:terminal ()
  (interactive)
  (shell-command "gnome-terminal --working-directory=$(pwd) || terminal --working-directory=$(pwd)" "*Messages*" "*Messages*"))

(defun dot-emacs:etags ()
  (interactive)
  (shell-command "find ./ -type f -name '*' -print0 | xargs --null etags -R" "*Messages*" "*Messages*"))

(defun dot-emacs:toggle-wrap-line ()
  (interactive)
  (when visual-line-mode
    (visual-line-mode 0))
  (setq word-wrap nil)
  (if truncate-lines
      (toggle-truncate-lines -1)
    (toggle-truncate-lines 1)))

(defun dot-emacs:isearch-current-word-forward (&optional regexp-p no-recursive-edit)
  (interactive "P\np")
  (isearch-mode t (not (null regexp-p)) nil (not no-recursive-edit))
  (isearch-yank-string (current-word)))

(defun dot-emacs:isearch-current-word-backward (&optional regexp-p no-recursive-edit)
  (interactive "P\np")
  (isearch-mode nil (not (null regexp-p)) nil (not no-recursive-edit))
  (isearch-yank-string (current-word)))

(defun dot-emacs::xah-pop-local-mark-ring ()
  "Move cursor to last mark position of current buffer.
Call this repeatedly will cycle all positions in `mark-ring'.
URL `http://ergoemacs.org/emacs/emacs_jump_to_previous_position.html'
Version 2016-04-04"
  (interactive)
  (set-mark-command t))

(provide 'setup/emacs/keymap/define)
