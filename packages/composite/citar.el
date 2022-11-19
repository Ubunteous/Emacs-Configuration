;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                CITAR               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package citar
  :defer t
  :custom
  (citar-bibliography '("./references/references.bib"))
  :general
  ("C-c i" 'citar-insert-citation
   :map 'minibuffer-local-map
   "M-b" 'citar-insert-preset)
  :config
  (setq citar-latex-prompt-for-extra-arguments nil
	citar-latex-prompt-for-cite-style nil)
  
  (setq citar-symbols
	`((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
          (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
          (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
  (setq citar-symbol-separator "  "))

;; (use-package citar-embark
;;   :after citar embark
;;   :no-require
;;   :config (citar-embark-mode))

;; org mode only
;; (use-package citar
;;   :no-require
;;   :custom
;;   (org-cite-global-bibliography '("~/bib/references.bib"))
;;   (org-cite-insert-processor 'citar)
;;   (org-cite-follow-processor 'citar)
;;   (org-cite-activate-processor 'citar)
;;   (citar-bibliography org-cite-global-bibliography)
;;   ;; optional: org-cite-insert is also bound to C-c C-x C-@
;;   :bind
;;   (:map org-mode-map :package org ("C-c b" . #'org-cite-insert)))
