;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              SWIPER                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package swiper
  :defer t
  :general
  ("C-s" 'swiper-isearch)
  :config
  ;;there are 4 different  background-match-face and match-face
  (set-face-attribute 'swiper-background-match-face-1 nil :background "light sea green")
  (set-face-attribute 'swiper-background-match-face-2 nil :background "light sea green")
  (set-face-attribute 'swiper-background-match-face-3 nil :background "light sea green")
  (set-face-attribute 'swiper-background-match-face-4 nil :background "light sea green")
  (set-face-attribute 'swiper-match-face-1 nil :background "tomato")
  (set-face-attribute 'swiper-match-face-2 nil :background "light sea green")
  (set-face-attribute 'swiper-match-face-3 nil :background "light sea green")
  (set-face-attribute 'swiper-match-face-4 nil :background "light sea green")
  (set-face-attribute 'swiper-line-face nil :foreground nil))
