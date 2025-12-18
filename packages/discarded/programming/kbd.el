;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     PROGRAMMING LANGUAGE: KBD      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; For KMonad

(use-package kbd-mode
  :defer t
  ;; :straight
  ;; (kbd-mode :type git :host github :repo "kmonad/kbd-mode")
  :ensure nil
  (kbd-mode :type git :host github :repo "kmonad/kbd-mode")

  ;; :load-path "~/.config/emacs/elisp/"
  :custom
  (kbd-mode-kill-kmonad "pkill -9 kmonad")
  ;; (kbd-mode-start-kmonad "kmonad ~/path/to/config.kbd")
  )
