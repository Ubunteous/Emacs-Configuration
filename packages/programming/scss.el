;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                SCSS                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (eq system-type 'windows-nt)

    (use-package css-mode
      :ensure nil
      :defer t
      :general
      (:keymaps 'css-mode-map
		"RET" 'smart-insert-semicolon
		"SPC" 'smart-insert-colon))

  (use-package scss-mode
    :ensure nil
    :defer t
    :general
    (:keymaps 'scss-mode-map
	      "RET" 'smart-insert-semicolon
	      "SPC" 'smart-insert-colon)))

