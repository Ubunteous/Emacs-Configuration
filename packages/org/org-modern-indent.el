;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          ORG-MODERN-INDENT         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-modern-indent
  :defer t
  :ensure (org-modern-indent :type git :host github :repo "jdtsmith/org-modern-indent")
  :hook org-mode)

;; font spacing
;; (set-face-attribute 'fixed-pitch nil :family "Hack" :height 1.0) ; or whatever font family
