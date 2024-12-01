;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              POLYMODE              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Allows you to edit entries directly from org-brain-visualize
(use-package polymode
  :defer t
  :hook (org-brain-visualize-mode . org-brain-polymode))
