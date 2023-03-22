;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              ORG-BRAIN             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-brain
  :defer t
  :init
  (setq org-brain-path "~/.emacs.d/files/org/")
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/files/org/.org-id-locations")
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
	org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)
  (setq org-brain-include-file-entries nil
        org-brain-file-entries-use-title nil)
  :hook (before-save-hook . org-brain-ensure-ids-in-buffer)
  :general
  (:keymaps 'org-mode-map
	    "C-c n" 'org-brain-prefix-map))

;; limit to healine entries
;; (setq org-brain-include-file-entries nil)
;; (setq org-brain-file-entries-use-title nil)
;; (setq org-brain-headline-entry-name-format-string "%2$s")
;; (setq my/default-org-brain-file "brain")
;; (setq org-brain-default-file-parent my/default-org-brain-file)

;; Limiting org-brain to file entries
;; (setq org-brain-scan-for-header-entries nil)
