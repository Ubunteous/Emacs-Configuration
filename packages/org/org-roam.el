;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              ORG-ROAM              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; EXTENSIONS: protocol, graph, dailies, export
(use-package org-roam
  :defer t
  :custom
  (org-roam-directory (file-truename "~/org/org-roam"))
  ;; (org-roam-db (file-truename "~/org/org-roam/database/org-roam.db"))
  ;; (org-roam-completion-everywhere t)
  :general
  ("C-c r l" 'org-roam-buffer-toggle
   ;; "C-c r d" 'org-roam-buffer-display-dedicated

   "C-c r i" 'org-roam-node-insert
   "C-c r c" 'org-roam-capture
   "C-c r f" 'org-roam-node-find

   "C-c r g" 'org-roam-graph)
  :config
  ;; exclude headlines with the "ATTACH" tag
  ;; (setq org-roam-db-node-include-function
  ;; 	(lambda ()
  ;;         (not (member "ATTACH" (org-get-tags)))))

  ;; Configure org-roam popup buffer
  ;; (add-to-list 'display-buffer-alist
  ;;              '("\\*org-roam\\*"
  ;; 		 (display-buffer-in-direction)
  ;; 		 (direction . right)
  ;; 		 (window-width . 0.33)
  ;; 		 (window-height . fit-window-to-buffer)
  ;; 		 (window-parameters . ((no-other-window . t)
  ;;                                      (no-delete-other-windows . t)))))

  ;; Note: org roam ignores newline add the end of the capture
  ;; org roam capture template (remove title as it is already provided by org auto-insert.el)
  (setq org-roam-capture-templates
	'(("d" "default" plain "%?" :target
	   ;; (file "%<%Y%m%d%H%M%S>-${slug}.org")
	   (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
	   :unnarrowed t
	   :empty-lines 1)))
  
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template
	(concat "${title:*} "
		(propertize "${tags:10}" 'face 'org-tag)))
  :hook
  ((org-roam-mode . org-roam-db-autosync-mode)))


;; Bind this to C-c r I
;; (defun org-roam-node-insert-immediate (arg &rest args)
;; "When working on a note, create a new note and insert current note's link without switching buffer"
;;   (interactive "P")
;;   (let ((args (cons arg args))
;;         (org-roam-capture-templates (list (append (car org-roam-capture-templates)
;;                                                   '(:immediate-finish t)))))
;;     (apply #'org-roam-node-insert args)))


;; .dir-locals.el is a file which lets a user have multiple org-roam directories
;; ((nil . ((org-roam-directory . "/path/to/alt/org-roam-dir")
;;          (org-roam-db-location . "/path/to/alt/org-roam-dir/org-roam.db"))))

;; Use this instead within .dir-locals.el to rely on functions
;; ((nil . ((eval . (setq-local
;;                   org-roam-directory (expand-file-name (locate-dominating-file
;;                                                         default-directory ".dir-locals.el"))))
;;          (eval . (setq-local
;;                   org-roam-db-location (expand-file-name "org-roam.db"
;;                                                          org-roam-directory))))))
