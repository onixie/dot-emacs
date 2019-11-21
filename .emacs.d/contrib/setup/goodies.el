(require 'setup/package)

(require 'pack-windows)


;;;;;;;;;;;;;;;; Rectangle Selection ;;;;;;;;;;;;;;;;
(defun dotemacs--mouse-start-rectangle-mark (start-event)
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

(global-set-key (kbd "S-<down-mouse-1>") #'dotemacs--mouse-start-rectangle-mark)

(provide 'setup/goodies)
