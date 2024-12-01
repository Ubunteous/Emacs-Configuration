;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        ORG-FANCY-PRIORITIES        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-pretty-tags can also be used to prettify org
(use-package org-fancy-priorities
  :defer t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  ;; can be used to set custom priorities with
  ;; (setq org-fancy-priorities-list '((?A . "❗")))
  (setq org-fancy-priorities-list
	'(" A " " B " " C ")))

;; (setq org-fancy-priorities-list '("Urgent" "Important" "Later" "Chill")))
