;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            ORG-CLIPLINK            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-cliplink
  :defer t
  :bind (:map org-mode-map ("C-c u" . org-cliplink))) ;; consult now uses C-c u
