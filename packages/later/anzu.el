;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                ANZU                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package anzu
  :defer t
  :diminish (anzu-mode)
  :config
  (global-anzu-mode)

  (setq anzu-mode-lighter ""
	anzu-deactivate-region t
	anzu-search-threshold 1000
	anzu-replace-threshold 50)
  
  anzu-replace-to-string-separator " => "))
(set-face-attribute 'anzu-mode-line nil :foreground "yellow" :weight 'bold))
