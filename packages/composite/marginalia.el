;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              MARGINALIA             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable richer annotations using the Marginalia package
;; Inherits from completions annotations which may print underlined text
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :defer t
  :general
  ("M-A" 'marginalia-cycle)
  (:map 'minibuffer-local-map
	"M-A" 'marginalia-cycle)
  :init
  (marginalia-mode))
