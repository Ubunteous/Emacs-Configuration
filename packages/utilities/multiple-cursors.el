;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          MULTIPLE CURSORS          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package multiple-cursors
  :defer t
  :general
  ;; poor interactions with meow
  ("C-c v c" 'mc/edit-lines))
