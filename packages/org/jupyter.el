;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    PROGRAMMING LANGUAGE: JUPYTER   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; can be combined with org
(use-package jupyter
  :defer t
  :general 
  :hook (org-babel-after-execute . org-redisplay-inline-images))
