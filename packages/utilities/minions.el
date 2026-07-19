;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              MINIONS               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package minions
  :defer t
  :config (minions-mode 1)
  :bind ("S-<down-mouse-3>" . minions-minor-modes-menu)) ;; Shift + Right click
