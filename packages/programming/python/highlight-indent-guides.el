;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      HIGHLIGHT-INDENT-GUIDES       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package highlight-indent-guides
  :defer t
  :config
  ;; Face colors are auto calculated
  (setq highlight-indent-guides-auto-enabled nil)

  ;; (set-face-background 'highlight-indent-guides-odd-face "red")
  ;; (set-face-background 'highlight-indent-guides-even-face "blue")
  (set-face-foreground 'highlight-indent-guides-character-face "DarkGoldenrod3")

  (setq highlight-indent-guides-responsive 'stack) ;; nil, top, stack
  (setq highlight-indent-guides-method 'character) ;; fill, column, character, bitmap
  :hook (python-mode python-ts-mode))
