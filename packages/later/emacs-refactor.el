;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           EMACS-REFACTOR           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs-refactor
  :defer t
  :bind
  (:map prog-mode-map
   ("M-RET" . emr-show-refactor-menu))
