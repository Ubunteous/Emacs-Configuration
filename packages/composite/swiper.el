;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              SWIPER                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package swiper
  :defer t
  :general
  ("C-s" 'swiper-isearch)
  :custom-face
  ;;there are 4 different  background-match-face and match-face
  (swiper-background-match-face-1 ((nil (:background "light sea green"))))
  (swiper-background-match-face-2 ((nil (:background "light sea green"))))
  (swiper-background-match-face-3 ((nil (:background "light sea green"))))
  (swiper-background-match-face-4 ((nil (:background "light sea green"))))
  (swiper-match-face-1 ((nil (:background "tomato"))))
  (swiper-match-face-2 ((nil (:background "light sea green"))))
  (swiper-match-face-3 ((nil (:background "light sea green"))))
  (swiper-match-face-4 ((nil (:background "light sea green"))))
  (swiper-line-face ((nil (:foreground nil)))))
