;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               SOLAIRE              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; this package can only work with themes which support it
(use-package solaire-mode
  :defer t
  :init
  (solaire-global-mode +1))

;; fix modeline problems
;; (dolist (face '(mode-line mode-line-inactive))
;;   (setf (alist-get face solaire-mode-remap-modeline) nil))

;; for non file visiting buffers
;; (add-to-list 'solaire-mode-themes-to-face-swap 'doom-vibrant)
