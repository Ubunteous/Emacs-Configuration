;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               HYDRA                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package hydra
  :defer t)

(use-package dash
  :defer t)

(use-package s
  :defer t)

(use-package posframe
  :defer t)

(use-package hydra-posframe
  :defer t
  :straight
  (hydra-posframe :type git :host github :repo "ladicle/hydra-posframe")
  :config
  (hydra-posframe-mode)
  (setq hydra-posframe-border-width 5
	hydra-posframe-poshandler 'posframe-poshandler-p0.5p0-to-w0.5p1)
  ;; hydra-posframe-poshandler 'posframe-poshandler-frame-center)
  :custom-face
  (hydra-posframe-face ((t (:background "Black"))))
  (hydra-posframe-border-face ((t (:background "Teal")))))

(use-package major-mode-hydra
  :defer t
  :general
  ("C-c q" 'major-mode-hydra))

(major-mode-hydra-define emacs-lisp-mode nil
  ("Eval"
   (("b" eval-buffer "buffer")
    ("e" eval-defun "defun")
    ("r" eval-region "region"))
   "REPL"
   (("I" ielm "ielm"))
   "Test"
   (("t" ert "prompt")
    ("T" (ert t) "all")
    ("F" (ert :failed) "failed"))
   "Doc"
   (("d" describe-foo-at-point "thing-at-pt")
    ("f" describe-function "function")
    ("v" describe-variable "variable")
    ("i" info-lookup-symbol "info lookup"))))

;;(defhydra hydra-zoom (global-map "<f9>")
;;  "zoom"
;;  ("g" text-scale-increase "in")
;;  ("l" text-scale-decrease "out"))

;;** Example 5: mini-vi
;; (defun hydra-vi/pre ()
;;   (set-cursor-color "#e52b50"))

;; (defun hydra-vi/post ()
;;   (set-cursor-color "#ffffff"))

;; (when (bound-and-true-p hydra-examples-verbatim)
;;   (global-set-key
;;    (kbd "C-z")
;;    (defhydra hydra-vi (:pre hydra-vi/pre :post hydra-vi/post :color amaranth)
;;      "vi"
;;      ("l" forward-char)
;;      ("h" backward-char)
;;      ("j" next-line)
;;      ("k" previous-line)
;;      ("m" set-mark-command "mark")
;;      ("a" move-beginning-of-line "beg")
;;      ("e" move-end-of-line "end")
;;      ("d" delete-region "del" :color blue)
;;      ("y" kill-ring-save "yank" :color blue)
;;      ("q" nil "quit")))
;;   (hydra-set-property 'hydra-vi :verbosity 1))
