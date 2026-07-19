;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                SCSS                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package scss-mode
  :ensure nil
  :defer t
  :bind
  (:map scss-mode-map
		("RET" . smart-insert-semicolon)
		("SPC" . smart-insert-colon)))
