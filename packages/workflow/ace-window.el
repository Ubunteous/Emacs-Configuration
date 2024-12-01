;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              ACE WINDOW            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ace-window
  :defer t
  :general
  ("C-x o" 'ace-window
   "M-o" 'ace-window)
  :config
  ;; azerty friendly list of keys
  ;; (setq aw-keys '(?& ?é ?\" ?' ?\( ?- ?è ?_ ?ç ?à))
  
  ;; azerty home row to change window
  ;; note: j words as per usual if there are less
  ;; than 7 windows. w will add as a replacement if needed
  ;; (setq aw-keys '(?q ?s ?d ?f ?g ?h ?j ?k ?l))

  ;; colemak friendly keys
  (setq aw-keys '(?a ?r ?s ?t ?g ?m ?n ?e ?i))
  
  (add-to-list 'aw-dispatch-alist '(?w aw-switch-buffer-in-window "Select Buffer")))
