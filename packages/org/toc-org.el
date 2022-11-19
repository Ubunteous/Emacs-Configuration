;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               TOC-ORG              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
  :defer t
  :hook
  (org-mode-hook . toc-org)
  ;; enable in markdown, too
  ;; (markdown-mode-hook . toc-org)
  :general
  (:keymaps 'org-mode-map
	    "C-c C-o" 'toc-org-markdown-follow-thing-at-point))
