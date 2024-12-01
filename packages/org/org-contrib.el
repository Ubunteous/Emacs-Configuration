;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             ORG-CONTRIB            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-contrib
  :config
  (require 'ox-extra)

  ;; :ignore: exports a section without its header
  (ox-extras-activate '(ignore-headlines)))
