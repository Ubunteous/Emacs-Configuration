;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                GUILE               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package guile
  :defer t
  :ensure nil
  :mode ("\\.scm\\'" . scheme-mode)
  :interpreter ("guile" . scheme-mode))

;; Chez => geiser-chez
;; Chibi => geiser-chibi
;; Chicken => geiser-chicken
;; Gambit => geiser-gambit
;; Gauche => geiser-gauche
;; Guile => geiser-guile
;; GNU Kawa => geiser-kawa
;; MIT/GNU Scheme => geiser-mit
;; Racket => geiser-racket
;; Stklos => geiser-stklos 

;; Note that geiser-eval-* shows the output in the message area
;; Open a split with the *Geiser Debug* buffer for more details

(use-package geiser-guile
  :defer t
  :hook (scheme-mode . geiser-mode)
  :config
  (setq geiser-active-implementations '(guile)))
