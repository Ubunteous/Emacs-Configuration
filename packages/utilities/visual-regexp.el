;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           VISUAL REGEXP            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package visual-regexp
  :defer t
  :general
  ("C-c v e" 'vr/replace
   "C-c v q" 'vr/querry-replace
   "C-c v m" 'vr/mc-mark))


(use-package visual-regexp-steroids
  :defer t
  :after visual-regexp
  :general
  ("C-c v s" 'vr/isearch-forward
   "C-c v r" 'vr/isearch-backward))
