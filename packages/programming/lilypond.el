;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              LILYPOND              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'LilyPond-mode "lilypond-mode")

;; (use-package lilypond
;;   :defer t
;;   :ensure nil
;;   ;; :autoload 'LilyPond-mode
;;   :config
;;   (autoload 'LilyPond-mode "lilypond-mode")
;;   :mode "\\.ly\\'"
;;   :hook
;;   (LilyPond-mode . (lambda () (turn-on-font-lock))))

;; Without use-package
;; (autoload 'LilyPond-mode "lilypond-mode")
;; (setq auto-mode-alist
;;       (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))

;; (add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
