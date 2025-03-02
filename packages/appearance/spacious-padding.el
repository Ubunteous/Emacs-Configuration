;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          SPACIOUS-PADDING          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package spacious-padding
  :ensure (spacious-padding :type git :host github :repo "protesilaos/spacious-padding")
  :defer t
  ;; :config
  ;; (setq spacious-padding-subtle-mode-line nil
  ;; 	spacious-padding-widths
  ;; 	'(
  ;; 	  :internal-border-width 15
  ;; 	  :header-line-width 4
  ;; 	  :mode-line-width 6
  ;; 	  :tab-width 4
  ;; 	  :right-divider-width 30
  ;; 	  :scroll-bar-width
  ;; 	  :fringe-width 8))
  :hook
  elpaca-after-init)
