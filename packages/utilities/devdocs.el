;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DEVDOCS              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package devdocs
  :defer t
  :general
  ("C-c D" 'devdocs-lookup
   "C-c E" 'devdocs-at-point)
  :hook
  (python-mode . (lambda () (setq-local devdocs-current-docs '("python~3.11")))))


(defun devdocs-at-point ()
  (interactive)
  (devdocs-lookup)
  (run-at-time "1 sec" nil #'next-history-element))

