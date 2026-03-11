;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             PERSPECTIVE            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package perspective
  :defer t
  :init (persp-mode)
  ;; :custom
  ;; (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here

  ;; ;; for perspective + consult mode
  ;; (consult-customize consult--source-buffer :hidden t :default nil)
  ;; (add-to-list 'consult-buffer-sources persp-consult-source)
  ;; :config
  ;; ;; for perspective + consult mode
  ;; (consult-customize consult--source-buffer :hidden t :default nil)
  ;; (add-to-list 'consult-buffer-sources persp-consult-source)

  ;; (setq persp-sort 'name) ; name, access, created, oldest
  ;; (setq persp-protected nil) ; disable persp on error
  ;; (setq persp-switch-wrap t) ; for persp-next/prev                      

  ;; (setq persp-save-dir "~/.emacs.d/files/persp-mode/")
  ;; (setq persp-state-default-file nil) ; persp-state-save/load

  ;; (setq persp-show-modestring t)
  ;; (setq persp-modestring-short nil)
  ;; (setq persp-modestring-dividers '("[" "]" "|"))

  ;; (setq persp-initial-frame-name "main")
  ;; (setq persp-frame-global-perspective-name "GLOBAL")

  ;; (setq persp-interactive-completion-function #'completing-read)
  ;; (setq persp-frame-global-perspective-include-scratch-buffer t)

  ;; Note: 3 variables auto kill buffers on save (with exceptions)
  :general
  ;;("C-x b" 'persp-switch-to-buffer*)
  ;;("C-x k" 'persp-kill-buffer*)
  ;; ("C-c b" 'persp-list-buffers)

  (:keymaps 'perspective-map
			;; 0-9 'switch-to-n
			;; "<left>" 'persp-prev
			;; "<right>" 'persp-next
			;; "A" 'persp-set-buffer
			;; "B" 'persp-switch-to-scratch-buffer
			;; "C-l" 'persp-state-load
			;; "C-s" 'persp-state-save
			;; "`" 'persp-switch-by-number
			;; "a" 'persp-add-buffer
			;; "b" 'persp-switch-to-buffer
			;; "c" 'persp-kill
			"f" 'persp-forget-buffer
			"C-f" 'persp-forget-frame-global-buffer
			"g" 'persp-add-buffer-to-frame-global
			"C-g" 'persp-remove-frame-global-buffer
			"i" 'persp-ibuffer ; shadows persp-import
			"I" 'persp-ibuffer-set-filter-groups
			"C-k" 'persp-remove-buffer
			"k" 'persp-kill-buffer*
			"l" 'persp-switch-last
			;; "m" 'persp-merge
			;; "n" 'persp-next
			"S-o" 'persp-kill-others ; perspectives
			"C-o" 'persp-kill-other-buffers
			;; "p" 'persp-prev
			"q" 'persp-switch-quick
			;; "r" 'persp-rename
			;; "s" 'persp-switch
			"S" 'persp-ivy-switch-buffer
			;; "u" 'persp-unmerge
			"*" 'persp-switch-to-buffer*
			)
  (:keymaps 'personal
			"i" (cons "persp" 'perspective-map)))
