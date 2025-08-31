;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                AVY                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package avy
  :defer t
  :config
  ;; ;; shorter paths if close to cursor
  ;; (setq avy-orders-alist
  ;; 		'((avy-goto-char . avy-order-closest)
  ;;         (avy-goto-word-0 . avy-order-closest)))
  
  ;; (setq avy-timeout-seconds .8)

  ;; for more precision
  ;; (setq avy-keys-alist
  ;; 		`((avy-goto-char . ,(number-sequence ?a ?f))
  ;;         (avy-goto-word-1 . (?f ?g ?h ?j))))

  (setq avy-keys '(?a ?r ?s ?t ?g ?m ?n ?e ?i))
  (setq avy-style 'de-bruijn) ;; defaults to at/at-full
  (setq avy-background t))
