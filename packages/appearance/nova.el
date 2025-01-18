;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                NOVA                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; not ready yet
(use-package nova
  :defer t
  :after corfu
  :ensure (:host github :repo "thisisran/nova")
  :config
  ;; (setq nova-border-color "#3d5a80"
  ;;       ;; nova-background-color
  ;;       nova-border-size 1
  ;;       nova-title-color "#161c28"
  ;;       nova-title-background-color "#6DB9EF"
  ;;       nova-radius-x 18
  ;;       nova-radius-y 18)

  ;; (require 'nova-corfu-popupinfo)
  ;; (nova-corfu-popupinfo-mode)

  ;; (require 'nova-eldoc)
  ;; (nova-eldoc-mode)

  ;; (require 'vertico-multiform)
  ;; (nova-vertico-mode) ;; needs vertico-posframe
  (require 'nova-corfu)
  :hook
  (prog-mode . nova-corfu-mode))
