;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            ORG-DOWNLOAD            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-download
  :defer t
  :config
  (setq org-download-image-dir "./images"
        org-download-image-org-width 200)
  :hook
  (org-mode . org-download-enable))

;; (use-package org-download
;; :defer t
;; :config
;; (setq org-download-method 'attach)
;; (setq-default org-download-image-dir "~/Pictures/Org")
;; :hook
;; Drag-and-drop to `dired`
;; (dired-mode . org-download-enable))
