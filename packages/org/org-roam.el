;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              ORG-ROAM              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-roam
  :defer t
  ;; :hook org-mode
  ;; EXTENSIONS: protocol, graph, dailies, export
  ;; :custom (org-roam-directory (file-truename "~/.emacs.d/files/org/")) ;; handled by no-littering
  :general ("C-c n l" 'org-roam-buffer-toggle
	    "C-c n f" 'org-roam-node-find
	    "C-c n g" 'org-roam-graph
	    "C-c n i" 'org-roam-node-insert
	    "C-c n c" 'org-roam-capture)
  :config
  ;; (org-roam-db-autosync-mode)
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))))
