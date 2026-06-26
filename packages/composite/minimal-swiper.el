;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            SWIPER + IVY            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ivy
  :defer t)

(use-package swiper
  :defer t
  :config
  (set-face-attribute 'swiper-background-match-face-1 nil :background "light sea green")
  (set-face-attribute 'swiper-background-match-face-2 nil :background "light sea green")
  (set-face-attribute 'swiper-background-match-face-3 nil :background "light sea green")
  (set-face-attribute 'swiper-background-match-face-4 nil :background "light sea green")

  (set-face-attribute 'swiper-match-face-1 nil :background "light sea green")
  (set-face-attribute 'swiper-match-face-2 nil :background "light sea green")
  (set-face-attribute 'swiper-match-face-3 nil :background "light sea green")
  (set-face-attribute 'swiper-match-face-4 nil :background "light sea green")

  (set-face-attribute 'swiper-line-face nil :foreground "unspecified")
  ;; (setq swiper-action-recenter t)
  :general
  ;; ("C-c s" 'swiper-isearch)
  ("C-s" 'swiper-isearch))
