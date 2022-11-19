;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DIRED-X              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(use-package dired
;;  :straight (:type built-in)
;;  :defer t)


;; Colourful columns for dired
;;(use-package diredfl
;;  :defer t
;;  :after (dired)
;;  :init (diredfl-global-mode 1))

(use-package dired
  :defer t
  :straight (:type built-in)
  :config (setq dired-dwim-target t))


(use-package dired-x
  :defer t
  :straight (:type built-in)
  :hook ((dired-mode . dired-omit-mode)
	 (dired-mode . dired-hide-details-mode))) ;; buffers/backup
;; :config
;; (use-package diredfl
;; :config (diredfl-global-mode 1)))


(use-package diredfl
  :defer t
  :config (diredfl-global-mode 1))


;; Sort dired output to show directories first
;; For more sorting options, use the variable dired-use-ls-dired
(use-package ls-lisp
  :defer t
  :straight (:type built-in)
  :config
  (setq ls-lisp-dirs-first t
	ls-lisp-use-insert-directory-program nil))


(use-package dired-subtree
  :defer t
  :general (:keymaps 'dired-mode-map
		     "i" 'dired-subtree-insert
		     ";" 'dired-subtree-remove))

;; see git info from dired by using the ")" key
;;(use-package dired-git-info
;;  :general (:map 'dired-mode-map
;;              ")" 'dired-git-info-mode))
