;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               CORFU                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This package seems to integrate well with embark
(use-package corfu
  :defer t
  :ensure (corfu :files (:defaults "extensions/*"))
  :custom-face
  (corfu-default ((t (:background "#2e2e2e"))))
  (corfu-current ((t (:background "#282828"))))
  (eruby-standard-face ((t (:slant italic))))
  ;; :init
  ;; (global-corfu-mode)
  :config
  (setq corfu-cycle t) ;; Enable cycling for `corfu-next/previous'
  ;; (setq corfu-preselect-first nil) ;; Disable candidate preselection
  (setq corfu-auto t) ;; Enable auto completion
  ;; (setq corfu-auto-prefix 4) ;; number of characters needed to trigger popup
  ;; (setq corfu-separator ?\s)          ;; Orderless field separator
  ;; (setq corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (setq corfu-quit-no-match nil) ;; Never quit, even if there is no match
  ;; (setq corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (setq corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (setq corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (setq corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (setq corfu-scroll-margin 5)        ;; Use scroll margin

  ;; (setq corfu-left-margin-width 1.5)
  (setq corfu-right-margin-width 1)
  :hook prog-mode
  ;; Enable Corfu only for certain modes.
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  :general (:keymaps 'corfu-map
		     "<escape>" 'corfu-quit

		     ;; "TAB" 'corfu-next
		     ;; "S-TAB" 'corfu-previous

		     "C-n" 'corfu-next
		     "TAB" 'corfu-insert
		     "C-p" 'corfu-previous
		     "RET" 'newline))

;; will show most likely candidate transparently
;; cannot be used when corfu-auto is true
;; (use-package corfu-candidate-overlay
;;   :ensure (:type git
;; 		 :repo "https://code.bsdgeek.org/adam/corfu-candidate-overlay"
;; 		 :files (:defaults "*.el"))
;;   :defer t
;;   ;; :after corfu
;;   ;; :config
;;   ;; enable corfu-candidate-overlay mode globally
;;   ;; this relies on having corfu-auto set to nil
;;   ;; (corfu-candidate-overlay-mode +1)
;;   ;; bind Ctrl + TAB to trigger the completion popup of corfu
;;   ;; (global-set-key (kbd "C-<tab>") 'completion-at-point)
;;   ;; bind Ctrl + Shift + Tab to trigger completion of the first candidate
;;   ;; (keybing <iso-lefttab> may not work for your keyboard model)
;;   ;; (global-set-key (kbd "C-<iso-lefttab>") 'corfu-candidate-overlay-complete-at-point))

;;   ;; (setq corfu-auto t) ;; breaks this package
;;   :hook prog-mode . (lambda ()
;; 		      (let ((inhibit-message t))
;; 			(corfu-candidate-overlay-mode +1))))

(use-package emacs
  ;; :straight (:type built-in)
  :ensure nil
  :config
  ;; TAB cycle if there are only few candidates (in this case, 2)
  (setq completion-cycle-threshold 2)
  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))


;; ;; imported in corfu
;; (use-package corfu-popupinfo
;;   :defer t
;;   ;; :straight nil
;; :ensure nil
;;   ;; straight/elpaca repos are in a place unexpected by emacs
;;   ;; :load-path "files/elpaca/repos/corfu/extensions/"
;;   :after corfu
;;   :config
;;   (setq corfu-popupinfo-delay 0.2
;; 	corfu-popupinfo-max-width 70
;; 	corfu-popupinfo-max-height 20)

;;   ;; (corfu-popupinfo-mode 1)
;;   :hook corfu-mode)


;; imported in corfu
(use-package corfu-history
  :defer t
  ;; :straight nil
  :ensure nil
  ;; straight/elpaca repos are in a place unexpected by emacs
  ;; :load-path "files/elpaca/repos/corfu/extensions/"
  :after corfu
  :config
  ;; (corfu-history-mode 1)
  (add-to-list 'savehist-additional-variables 'corfu-history)
  :hook corfu-mode)


(use-package corfu-prescient
  :defer t
  :ensure (corfu-prescient
	   :type git :host github
	   :repo "radian-software/prescient.el")
  
  :after corfu
  :config
  (setq corfu-prescient-override-sorting t)
  :hook corfu-mode)
