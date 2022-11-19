;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             EASY-KILL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package easy-kill
  :defer t
  :general
  ([remap kill-ring-save] 'easy-kill
   [remap mark-sexp] 'easy-mark))
