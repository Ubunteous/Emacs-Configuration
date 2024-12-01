;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             ORG-MODERN             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Org Modern List:
(use-package org-modern
  :defer t
  :config
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t
   org-modern-star 'replace
   
   org-modern-hide-stars " "
   org-modern-list '((43 . "+")  ;; +
		     (45 . "-")  ;; -
		     (42 . "•")) ;; *

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…")

  ;; bigger checkboxes
  (setq org-modern-checkbox '((88 . "")
			      (45 .
				  #("–" 0 2
				    (composition
				     ((2)))))
			      (32 . "")))

  ;; Agenda styling
  (setq org-agenda-tags-column 0
	org-agenda-block-separator ?─
	org-agenda-time-grid
	'((daily today require-timed)
	  (800 1000 1200 1400 1600 1800 2000)
	  " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
	org-agenda-current-time-string
	" now ─────────────────────────────────────────────────")
  ;;(org-mode)
  :hook
  ((org-mode . org-modern-mode)
   (org-agenda-finalize . org-modern-agenda)))

;; (global-org-modern-mode))
