;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               COMPANY              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; auto-completion
(use-package company
  :defer t
  :config
  (setq company-dabbrev-other-buffers t) ;; candidates from current buffer only
  ;;(add-to-list 'company-backends '(company-capf :with company-dabbrev))
  :hook
  ((prog-mode . company-mode)
   (after-init . global-company-mode)))


(use-package company-prescient
  :defer t
  :after company
  :init (company-prescient-mode +1))


(use-package company-auctex
  :defer t
  :after company
  :init (company-auctex-init)) ;;init replaces add-to-list 'company-backends


(use-package company-anaconda
  ;;:defer t ;;should not be deferred
  :after company
  :config (add-to-list 'company-backends 'company-anaconda))
