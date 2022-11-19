;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            ORG-SUPERSTAR           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-superstar
  :defer t
  :config
  (setq org-superstar-special-todo-items t
	org-superstar-cycle-headline-bullets nil
	org-hide-leading-stars t)

  (setq org-superstar-item-bullet-alist '((42 . 9672)
					  (43 . 9673)
					  (45 . 9674)))
  ;; (org-superstar-configure-like-org-bullets)
  ;; (setq org-superstar-prettify-item-bullets nil) ;; do not change +
  ;; (setq inhibit-compacting-font-caches t) ;; prevent slowdown
  :hook (org-mode . (lambda () (org-superstar-mode 1))))
