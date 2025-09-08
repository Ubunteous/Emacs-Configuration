;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            SWIPER + IVY            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ivy
  :defer t)

(use-package swiper
  :defer t
  ;; :config
  ;; (setq swiper-action-recenter t)
  :general
  ("C-s" 'swiper-isearch)
  ;; ("C-c s" 'swiper-isearch)
  :custom-face
  ;;there are 4 different  background-match-face and match-face
  (swiper-background-match-face-1 ((t (:background "light sea green"))))
  (swiper-background-match-face-2 ((t (:background "light sea green"))))
  (swiper-background-match-face-3 ((t (:background "light sea green"))))
  (swiper-background-match-face-4 ((t (:background "light sea green"))))
  (swiper-match-face-1 ((t (:background "tomato"))))
  (swiper-match-face-2 ((t (:background "light sea green"))))
  (swiper-match-face-3 ((t (:background "light sea green"))))
  (swiper-match-face-4 ((t (:background "light sea green"))))
  (swiper-line-face ((t (:foreground "unspecified")))))
