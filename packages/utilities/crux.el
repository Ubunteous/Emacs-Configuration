;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                CRUX                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package crux
  :defer t
  :general
  (
   ;; "C-c k" 'crux-kill-other-buffers

   ;; remapping
   "C-a" 'crux-move-beginning-of-line
   "C-k" 'crux-smart-kill-line))
