;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                POET                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package poet-theme
  :defer t
  :config
  (set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 160)
  (set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono")
  (set-face-attribute 'variable-pitch nil :family "IBM Plex Serif")
  :hook (org-mode . (lambda () (variable-pitch-mode 1))))
