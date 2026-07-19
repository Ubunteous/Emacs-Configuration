;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 CSS                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package css-mode
  :ensure nil
  :defer t
  :bind
  (:map css-mode-map
		("RET" . smart-insert-semicolon)
		("SPC" . smart-insert-colon)))
