;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           SYMBOL-OVERLAY           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package symbol-overlay
  :defer t
  :general
  ("M-i" 'symbol-overlay-put)
  ("M-n" 'symbol-overlay-switch-forward)
  ("M-p" 'symbol-overlay-switch-backward)
  ("<f7>" 'symbol-overlay-mode)
  ("<f8>" 'symbol-overlay-remove-all)
  ("M-v" 'symbol-overlay-map)
  :hook prog-mode)

;; ;; bug: add cursor on current overlay
;; (defun ar/mc-mark-all-symbol-overlays ()
;;   "Mark all symbol overlays using multiple cursors."
;;   (interactive)
;;   (mc/remove-fake-cursors)
;;   (when-let* ((overlays (symbol-overlay-get-list 0))
;; 	      (point (point))
;; 	      (point-overlay (seq-find
;; 			      (lambda (overlay)
;;                                 (and (<= (overlay-start overlay) point)
;;                                      (<= point (overlay-end overlay))))
;; 			      overlays))
;; 	      (offset (- point (overlay-start point-overlay))))
;;     (setq deactivate-mark t)
;;     (mapc (lambda (overlay)
;;             (unless (eq overlay point-overlay)
;; 	      (mc/save-excursion
;; 	       (goto-char (+ (overlay-start overlay) offset))
;; 	       (mc/create-fake-cursor-at-point))))
;;           overlays)
;;     (mc/maybe-multiple-cursors-mode)))
