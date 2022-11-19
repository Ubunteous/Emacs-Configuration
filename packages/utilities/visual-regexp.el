;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           VISUAL REGEXP            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package visual-regexp
  :defer t
  :general
  ("C-c e" 'vr/replace
   "C-c q" 'vr/querry-replace
   "C-c m" 'vr/mc-mark))


(use-package visual-regexp-steroids
  :defer t
  :after visual-regexp
  :general
  ("C-c s" 'vr/isearch-forward
   "C-c r" 'vr/isearch-backward))
