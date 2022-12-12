;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           EMACS-REFACTOR           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs-refactor
  :defer t
  :general
  (prog-mode-map
   "M-RET" 'emr-show-refactor-menu))
