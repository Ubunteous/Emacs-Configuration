;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             CONSULT-DIR            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package consult-dir
  :ensure t
  :general
  ("C-x C-d" 'consult-dir) ;; shadows list-directory
  (:keymaps 'minibuffer-local-completion-map
	    "C-x C-d" 'consult-dir
	    "C-x C-j" 'consult-dir-jump-file)
  :config
  (setq consult-dir-sort-candidates t))
