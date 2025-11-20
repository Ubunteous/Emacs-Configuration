;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             COMPLETION             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package completion-preview
  :ensure nil
  :defer t
  :config
  (setq completion-preview-completion-styles '(orderless-first-prefix))

  ;; (setq completion-preview-sort-function 'minibuffer--sort-by-length-alpha)
  
  ;; (setq completion-preview-minimum-symbol-length 3) ;; default
  (setq completion-preview-idle-delay 2) ;; in seconds

  ;; commands which triger completion-preview
  ;; (setq completion-preview-command '(insert-char delete-backward-char backward-delete-char-untabify analyze-text-conversion completion-preview-complete))

  ;; (add-to-list 'completion-preview-command
  ;; 			   '(org-self-insert-command
  ;; 				 org-delete-backward-char
  ;; 				 self-insert-command
  ;; 				 meow-backward-char)
  :general
  ;; "M-i" 'completion-preview-complete
  (:keymaps 'completion-preview-active-mode-map
			"<escape>" 'completion-preview-hide

			;; "RET" 'newline
			;; "TAB" 'completion-preview-insert/complete
			"C-n" 'completion-preview-next-candidate
			"C-p" 'completion-preview-prev-candidate)
  :hook emacs-lisp-mode)

;; :config
;; Most of these variables will be introduced in emacs 29
;; (setq completions-format 'one-column)
;; (setq completions-header-format nil)
;; (setq completions-max-height 20)
;; (setq completions-auto-select nil)
;; )
