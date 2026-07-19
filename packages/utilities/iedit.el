;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                IEDIT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; M-D and M-R to delete and replace are useful
(use-package iedit
  :defer t
  :init
  (defvar-subkeymap mode-specific-map "i" iedit-keymap "Keymap for iedit.")
  :config
  (setq iedit-auto-save-occurrence-in-kill-ring nil)
  :bind
  (:map iedit-keymap
		("." . iedit-execute-last-modification)
		("k s" . iedit-end-and-call-kmacro)
		("k s" . iedit-start-kmacro)

		("o b" . iedit-blank-occurrences)
		("o d" . iedit-delete-occurrences)
		("o c" . iedit-downcase-occurrences)
		("o u" . iedit-upcase-occurrences)

		("e d" . iedit-expand-down-a-line)
		("e D" . iedit-expand-down-to-occurrence)
		("e u" . iedit-expand-up-a-line)
		("e U" . iedit-expand-up-to-occurrence)
		("e n" . iedit-number-occurrences)

		("n" . iedit-next-occurrence)
		("N" . iedit-goto-first-occurrence)
		("p" . iedit-prev-occurrence)
		("P" . iedit-goto-last-occurrence)

		("R" . iedit-rectangle-mode)
		("r" . iedit-replace)
		;; ("r" . iedit-replace-occurrences)
		("m" . iedit-switch-to-mc-mode)
		("t" . iedit-toggle-selection))
  (:map isearch-mode-map
		("C-i" . iedit-mode-from-isearch)))

(defun iedit-replace ()
  ;; quickly enter iedit mode to replace string at point
  (interactive)
  (iedit-mode)
  (iedit-replace-occurrences)
  (iedit--quit))
