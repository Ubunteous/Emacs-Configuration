;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      HIGHLIGHT-INDENT-GUIDES       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package highlight-indent-guides
  :defer t
  :config
  (setq highlight-indent-guides-method 'character) ;; fill, column, character, bitmap

  highlight-indent-guides-responsive 'stack ;; nil, top, stack
  ;; (set-face-background 'highlight-indent-guides-odd-face "darkgray")
  ;; (set-face-background 'highlight-indent-guides-even-face "dimgray")
  ;; (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
  :hook python-mode)
