;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 CSS                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package css-mode
  :ensure nil
  :defer t
  :config
  (defun css-browse-property-documentation (symbol)
	"like css-lookup-symbol but opens documentation in a browser."
	(interactive
	 (list
	  (let* ((sym (css--mdn-find-symbol))
			 (match (seq-contains css--mdn-completion-list sym))
			 (value (if match
						match
					  (completing-read (format-prompt "Describe CSS symbol" sym)
									   css--mdn-completion-list nil nil nil
									   'css--mdn-lookup-history sym))))
		(if (equal value "") sym value))))

	(when symbol
	  ;; If we see a single-colon pseudo-element like ":after", turn it
	  ;; into "::after".
	  (when (and (eq (aref symbol 0) ?:)
				 (member (substring symbol 1) css-pseudo-element-ids))
		(setq symbol (concat ":" symbol)))
	  (let ((url (format css-lookup-url-format symbol)))
		(browse-url url))))
  :bind
  (:map css-mode-map
		("RET" . smart-insert-semicolon)
		("SPC" . smart-insert-colon)))
