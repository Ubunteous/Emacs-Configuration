;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DIRED-X              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Colourful columns for dired
;;(use-package diredfl
;;  :defer t
;;  :after (dired)
;;  :init (diredfl-global-mode 1))

(use-package dired
  :defer t
  :ensure nil
  ;; :commands (dired)
  ;; :straight (:type built-in)
  :config
  (setq dired-dwim-target t)
  (setq dired-free-space nil)
  ;; (setq dired-recursive-copies 'always)
  ;; (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t) ;; pairs well with trash package
  (setq dired-listing-switches "--group-directories-first -al"))


(use-package dired-x
  :defer t
  :ensure nil
  ;; :straight (:type built-in)
  :hook ((dired-mode . dired-omit-mode)
	 (dired-mode . hl-line-mode)
	 (dired-mode . dired-hide-details-mode)) ;; buffers/backup
  :config
  ;; (use-package diredfl
  ;; :config (diredfl-global-mode 1)))
  ;; (setq dired-omit-files "\\`[.]?#\\|\\`[.][.]?\\'\\|.log$\\|.out$")

  ;; Hide .log and .out files (useful in latex directories)
  ;; (setq dired-omit-files
  ;; (concat dired-omit-files "\\|.log$\\|.out$"))
  )


(use-package diredfl
  :defer t
  :config (diredfl-global-mode 1))


;; Sort dired output to show directories first
;; For more sorting options, use the variable dired-use-ls-dired
(use-package ls-lisp
  :defer t
  :ensure nil
  ;; :straight (:type built-in)
  :config
  (setq ls-lisp-dirs-first t
	ls-lisp-use-insert-directory-program nil))


(use-package dired-subtree
  :defer t
  :after dired
  :config
  (setq dired-subtree-use-backgrounds nil)
  :general (:keymaps 'dired-mode-map
		     "i" 'dired-subtree-insert
		     ";" 'dired-subtree-remove
		     "TAB" 'dired-subtree-toggle
		     "S-TAB" 'dired-subtree-remove))

;; ;; danger. rapport selon lequel tout a été détruit hors corbeille
;; (use-package trashed
;;   :defer t
;;   :commands (trashed)
;;   :config
;;   (setq trashed-action-confirmer 'y-or-n-p)
;;   (setq trashed-use-header-line t)
;;   (setq trashed-sort-key '("Date deleted" . t))
;;   (setq trashed-date-format "%Y-%m-%d %H:%M:%S"))

;; see git info from dired by using the ")" key
;;(use-package dired-git-info
;;  :general (:map 'dired-mode-map
;;              ")" 'dired-git-info-mode))
