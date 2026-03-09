;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          SYMBOL-OVERLAY-MC         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; belongs to the package below
;; (use-package symbol-overlay
;;   :defer t)

(use-package symbol-overlay-mc
  :defer t
  :ensure (symbol-overlay-mc :type git :host github :repo "xenodium/symbol-overlay-mc")
  :init
  (defvar-keymap symbol-overlay-map
	:doc "Keymap for miscellaneous bindings to keep around.")
  :config
  (defun symbol-overlay-remove ()
	;; Remove highlighted symbol at point
	(interactive)
	(let* ((symbol (symbol-overlay-get-symbol))
		   (keyword (symbol-overlay-assoc symbol)))
	  (symbol-overlay-adjust-position)
	  (when keyword
		(symbol-overlay-maybe-remove keyword))))
  :general (:keymaps 'symbol-overlay-map
					 "M-n" 'symbol-overlay-switch-forward
					 "M-p" 'symbol-overlay-switch-backward

					 "<" 'symbol-overlay-jump-first
					 ">" 'symbol-overlay-jump-last

					 "d" 'symbol-overlay-remove
					 "D" 'symbol-overlay-remove-all
					 "f" 'symbol-overlay-jump-to-definition ; was "d"
					 "c" 'symbol-overlay-count
					 "m" 'symbol-overlay-mc-mark-all
					 
					 ;; default
					 "e" 'symbol-overlay-echo-mark
					 "h" 'symbol-overlay-map-help
					 "i" 'symbol-overlay-put
					 "n" 'symbol-overlay-jump-next
					 "p" 'symbol-overlay-jump-prev
					 "q" 'symbol-overlay-query-replace
					 "r" 'symbol-overlay-rename
					 "s" 'symbol-overlay-isearch-literally
					 "t" 'symbol-overlay-toggle-in-scope
					 "w" 'symbol-overlay-save-symbol)
  (:keymaps 'personal
			"s" symbol-overlay-map)
  :hook (prog-mode . symbol-overlay-mode))

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
