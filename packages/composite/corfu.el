;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               CORFU                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This package seems to integrate well with embark

(use-package corfu
  :defer t
  :straight (:files (:defaults "extensions/corfu-history.el"))
  :custom-face
  (corfu-default ((t (:background "#2e2e2e"))))
  (corfu-current ((t (:background "#282828"))))
  (eruby-standard-face ((t (:slant italic))))
  :init
  (global-corfu-mode)
  :custom
  (corfu-cycle t) ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-preselect-first nil) ;; Disable candidate preselection
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))
  :general
  (:keymaps 'corfu-map
            "TAB" 'corfu-next/previous
	    ;; ([tab] 'corfu-next)
	    ;; ([backtab] 'corfu-previous)
	    "S-TAB" 'corfu-previous))


(use-package emacs
  :straight (:type built-in)
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

(use-package corfu-history
  :defer t
  :straight nil
  ;; I placed straight and it's repos in an unexpected place
  :load-path "files/straight/straight/repos/corfu/extensions/"
  :after corfu
  :config
  (corfu-history-mode 1)
  (add-to-list 'savehist-additional-variables 'corfu-history))
