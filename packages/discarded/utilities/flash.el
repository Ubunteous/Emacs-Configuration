;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                FLASH               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package flash
  :ensure (flash :type git :host github :repo "Prgebish/flash")
  :commands flash-jump ;; (flash-jump flash-tree sitter)
  :config
  (flash-isearch-mode 1)

  (setq flash-labels "arstgmneio")
  ;; (setq flash-label-uppercase t)
  ;; (setq flash-multi-window nil)
  (setq flash-autojump t)
  ;; (setq flash-backdrop nil) ; no dimming
  (setq flash-rainbow t)
  ;; (setq flash-rainbow-shade 2) ; 1-9: pastel to dark
  ;; (setq flash-highlight-matches nil)
  ;; (setq flash-label-position 'overlay) ; overlay, after, before, eol
  ;; (setq flash-nohlsearch t) ; clear highlight after jump
  ;; (setq flash-search-history t) ; add search to emacs history
  :general ("C-c c t" flash-jump)) ;; shadows avy-goto-char-timer
