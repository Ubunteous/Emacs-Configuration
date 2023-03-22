;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               CURSOR               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; A mode which should change the cursor color depending on the current mode
;; Right now, it only works when entering (but not leaving!) a mode

;; Ideally, it should act whenever the major mode changes and rely on a dict like list
;; rather than hooks in order to become white when used with an unknown mode

;; colors come from this page:
;; https://github.com/ozh/github-colors/blob/master/colors.json

(use-package emacs
  :straight (:type built-in)
  :hook
  ;; default #ffffff
  ((emacs-lisp-mode . (lambda ()
			(set-cursor-color "#c065db")))
   (org-mode . (lambda ()
		 (set-cursor-color "#77aa99")))

   (python-mode . (lambda ()
		    (set-cursor-color "#3572A5")))
   ))
