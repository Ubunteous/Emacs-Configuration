;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              ORG-ROAM              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package emacsql
;;   :defer t
;;   :ensure (emacsql :type git :host github :repo "magit/emacsql"))

;; EXTENSIONS: protocol, graph, dailies, export
(use-package org-roam
  :defer t
  ;; :after emacsql
  :custom-face
  (org-roam-link-current ((nil (:background "#e24888" :underline t))))
  (org-roam-link ((nil (:background "#e24888" :underline t))))
  :custom
  (org-roam-directory (file-truename "~/org/Alter/roam"))
  ;; (org-roam-db (file-truename "~/org/org-roam/database/org-roam.db"))
  ;; (org-roam-completion-everywhere t)

  ;; ;; to save db locally
  ;; (setq-local org-roam-directory
  ;; 			  (expand-file-name
  ;; 			   (concat
  ;; 				(locate-dominating-file default-directory ".dir-locals.el")
  ;; 				"org-roam")))
  :general
  ("C-c r g" 'org-roam-buffer-toggle
   ;; "C-c r d" 'org-roam-buffer-display-dedicated

   ;; if a new file has a name similar to another one, use ido-select-text
   "C-c r i" 'org-roam-node-insert
   "C-c r c" 'org-roam-capture
   "C-c r f" 'org-roam-node-find
   "C-c l" 'org-roam-node-find

   ;; "C-c r o" 'org-id-get-create
   "C-c r t" 'org-roam-tag-add
   ;; "C-c r a" 'org-roam-alias-add

   ;; "C-c r r" 'org-roam-node-random
   ;; "C-c r g" 'org-roam-graph

   ;; "C-c r y" 'org-id-get-create
   "C-c r n" 'capture-slipbox

   "C-c r d" 'delve-index

   "C-c r s" 'org-roam-db-sync
   )
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

  ;; ;; Make sure the backlinks buffer always shows up in a side window
  ;; (add-to-list 'display-buffer-alist
  ;;              '("\\*org-roam\\*"
  ;;                (display-buffer-in-side-window)
  ;;                (side . right)
  ;;                (window-width . 0.4)
  ;;                (window-height . fit-window-to-buffer)))

  ;; makes org-roam-find-file easier => not sure if the following var exists
  ;; (setq org-roam-completion-system 'ido)

  ;; Note: org roam ignores newline at the end of the capture
  ;; org roam capture template (remove title as it is already provided by org auto-insert.el)

  ;; add the following .dir-locals.el to avoid auto-insert clash
  ;; ((org-mode . ((auto-insert-alist . nil))))
  (setq org-roam-capture-templates
		'(("d" "default" plain "%?" :target
		   ;; (file "%<%Y%m%d%H%M%S>-${slug}.org")
		   (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
		   ;; :immediate-finish t
		   :unnarrowed t
		   :empty-lines 1)

		  ("a" "alter" plain "%?"
		   :if-new (file+head "${slug}.org"
							  "#+title: ${title}")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ("c" "alter-character" plain "%?"
		   :if-new (file+head "characters/${slug}.org"
							  "#+title: ${title}\n#+filetags: :character:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ;; ("p" "alter-plot" plain "%?"
		  ;;  :if-new (file+head "${slug}.org"
		  ;; 		      "#+title: ${title}\n#+filetags: :plot:\n\n")
		  ;; :immediate-finish t
		  ;; :empty-lines 1
		  ;; :unnarrowed t)

		  
		  ("b" "alter-boite-a-idees" plain "%?"
		   :if-new (file+head "idees/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)
		  
		  ("w" "alter-worldbuilding" plain "%?"
		   :if-new (file+head "$worldbuilding/{slug}.org"
							  "#+title: ${title}\n#+filetags: :worldbuilding:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  
		  ("e" "alter-écriture" plain "%?"
		   :if-new (file+head "écriture/${slug}.org"
							  "#+title: ${title}\n#+filetags: :écriture:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ("g" "alter-gamedesign" plain "%?"
		   :if-new (file+head "gamedesign/${slug}.org"
							  "#+title: ${title}\n#+filetags: :gamedesign:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ("i" "alter-index" plain "%?"
		   :if-new (file+head "index/${slug}.org"
							  "#+title: ${title}\n#+filetags: :index:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ("l" "alter-lieux" plain "%?"
		   :if-new (file+head "lieux/${slug}.org"
							  "#+title: ${title}\n#+filetags: :worldbuilding:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ;; ("f" "fiction" plain "%?"
		  ;;  :if-new (file+head "${title}.org"
		  ;; 		      "#+title: ${title}")
		  ;;  ;; :immediate-finish t
		  ;;  :empty-lines 1
		  ;;  :unnarrowed t)

		  ;; ("m" "musique" plain "%?"
		  ;;  :if-new (file+head "${title}.org"
		  ;; 		      "#+title: ${title}")
		  ;;  ;; :immediate-finish t
		  ;;  :empty-lines 1
		  ;;  :unnarrowed t)

		  ;; ("r" "rêves" plain "%?"
		  ;;  :if-new (file+head "${title}.org"
		  ;; 		      "#+title: ${title}")
		  ;; :immediate-finish t
		  ;; :empty-lines 1
		  ;; :unnarrowed t)

		  ("s" "scènes")
		  ("sp" "prélude" plain "%?"
		   :if-new (file+head "scene/prélude/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)
		  
		  ("se" "cité-ambre" plain "%?"
		   :if-new (file+head "scene/cité-ambre/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ("sf" "académie-florale" plain "%?"
		   :if-new (file+head "scene/académie-florale/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ("sk" "arène-kinétis" plain "%?"
		   :if-new (file+head "scene/arène-kinétis/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ("si" "fort-intérieur" plain "%?"
		   :if-new (file+head "scene/fort-intérieur/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)
		  
		  ("sa" "cathédrale-albâtre" plain "%?"
		   :if-new (file+head "scene/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)
		  
		  ("sc" "ile-céleste" plain "%?"
		   :if-new (file+head "scene/ile-céleste/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)
		  
		  ("sh" "hangdoc" plain "%?"
		   :if-new (file+head "scene/hangdoc/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ("ss" "showdown" plain "%?"
		   :if-new (file+head "scene/showdown/${slug}.org"
							  "#+title: ${title}\n#+filetags: :scene:\n\n")
		   ;; :immediate-finish t
		   :empty-lines 1
		   :unnarrowed t)

		  ))

  (cl-defmethod org-roam-node-type ((node org-roam-node))
    "Return the TYPE of NODE."
    (condition-case nil
		(file-name-nondirectory
		 (directory-file-name
          (file-name-directory
           (file-relative-name (org-roam-node-file node) org-roam-directory))))
      (error "")))

  ;; appearance in vertico completion buffer
  (setq org-roam-node-display-template
		(concat
		 ;; "${type:8} ${title:*} "
		 "${type:13} > "
		 (propertize "${title:40} " 'face 'org-tag)
		 (propertize "${tags:14}" 'face 'org-verbatim) ;; does not work anymore
		 ))

  ;; (setq org-roam-db-update-on-save t)
  :hook
  ((org-roam-mode . org-roam-db-autosync-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          CONSULT-ORG-ROAM          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package consult-org-roam
  :ensure t
  :after org-roam
  ;; :init
  ;; (require 'consult-org-roam)
  ;; Activate the minor mode
  ;; (consult-org-roam-mode 1)
  ;; :custom
  :config
  ;; Use `ripgrep' for searching with `consult-org-roam-search'
  (setq consult-org-roam-grep-func #'consult-ripgrep)
  ;; Configure a custom narrow key for `consult-buffer'
  (setq consult-org-roam-buffer-narrow-key ?r)
  ;; Display org-roam buffers right after non-org-roam buffers
  ;; in consult-buffer (and not down at the bottom)
  (setq consult-org-roam-buffer-after-buffers t)
  ;; :config
  ;; Eventually suppress previewing for certain functions
  ;; (consult-customize
  ;;  consult-org-roam-forward-links
  ;;  :preview-key (kbd "M-."))
  :general
  ;; Define some convenient keybindings as an addition
  ("C-c r e" 'consult-org-roam-file-find
   "C-c r b" 'consult-org-roam-backlinks
   "C-c r l" 'consult-org-roam-forward-links
   "C-c r r" 'consult-org-roam-search)
  :hook
  ((org-roam-mode . consult-org-roam-mode)))


;; avoid confirmation prompt if cancel capture
(defun my/return-t (orig-fun &rest args) t)

(defun my/disable-yornp (orig-fun &rest args)
  (advice-add 'yes-or-no-p :around #'my/return-t)
  (advice-add 'y-or-n-p :around #'my/return-t)
  (let ((res (apply orig-fun args)))
    (advice-remove 'yes-or-no-p #'my/return-t)
    (advice-remove 'y-or-n-p #'my/return-t)
    res))
(advice-add 'org-roam-capture--finalize :around #'my/disable-yornp)

(defun capture-slipbox ()
  (interactive)
  "Send a capture directly to the roam inbox."
  (org-capture "slipbox" "s"))

;; Every Zettel is a Draft until Declared otherwise
;; (defun my/tag-new-node-as-draft ()
;;   (org-roam-tag-add '("draft")))
;; (add-hook 'org-roam-capture-new-node-hook #'my/tag-new-node-as-draft)


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

;;;;;;;;;;;;;;;
;; QUICKROAM ;;
;;;;;;;;;;;;;;;

;; (use-package quickroam
;;   :ensure (quickroam :type git :host github :repo "meedstrom/quickroam")
;;   :after org
;;   :config (quickroam-mode)
;;   ;; suggestion
;;   ;; (global-set-key (kbd "<f2> f") #'quickroam-find)
;;   ;; (global-set-key (kbd "<f2> i") #'quickroam-insert)
;;   )

