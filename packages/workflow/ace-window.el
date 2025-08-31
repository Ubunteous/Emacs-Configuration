;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              ACE WINDOW            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ace-window
  :defer t
  :general
  ("C-x o" 'ace-window-dwim
   "M-o" 'ace-window)
  :config
  ;; azerty friendly list of keys
  ;; (setq aw-keys '(?& ?é ?\" ?' ?\( ?- ?è ?_ ?ç ?à))
  
  ;; azerty home row to change window
  ;; note: j words as per usual if there are less
  ;; than 7 windows. w will add as a replacement if needed
  ;; (setq aw-keys '(?q ?s ?d ?f ?g ?h ?j ?k ?l))

  (defun ace-window-dwim ()
	(interactive)
	;; smarter window management
	(if (= (count-windows) 1)
		(split-window-right)
	  (ace-window nil))

	;; (let ((nb-windows (count-windows)))
	;;   (cond ((= nb-windows 1) (progn
	;; 							(split-window-right)
	;; 							(windmove-right)))
	;; 		((= nb-windows 2) (progn
	;; 							;; (windmove-right)
	;; 							(split-window-below)
	;; 							(windmove-down)))
	;; 		(t (ace-window nil))))
	)

  ;; colemak friendly keys
  (setq aw-keys '(?a ?r ?s ?t ?g ?m ?n ?e ?i))

  (add-to-list 'aw-dispatch-alist '(?w aw-switch-buffer-in-window "Select Buffer")))
