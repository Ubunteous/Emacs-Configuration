;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               CLOJURE              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package clojure-mode
  :defer t
  :mode "\\.clj\\'")

(use-package clojure-ts-mode
  :defer t
  :config
  ;; do not install libtree-sitter-markdown_inline.so
  (setq clojure-ts-ensure-grammars nil)
  
  ;; (setq clojure-ts-indent-style 'fixed)
  ;; (setq clojure-ts-comment-macro-font-lock-body t)
  ;; (setq clojure-ts-toplevel-inside-comment-form t)
  ;; :mode "\\.clj\\'")
  :mode ("\\.clj\\'" "\\.edn\\'"))

(use-package spinner
  :ensure (spinner :type git :host github :repo "Malabarba/spinner.el")
  :defer t)

(use-package queue
  :ensure (queue :type git :host github :repo "emacs-straight/queue")
  :defer t)

;; cider may compete for completion and eldoc with elgot
(use-package cider
  :after queue
  :defer t
  :config
  ;; load a dev/user.clj file (specified in deps.edn) on jack-in
  (setq cider-clojure-cli-global-options "-A:server:client:dev")
  :hook ((clojure-mode clojure-ts-mode) . cider-mode))


;; (use-package clj-refactor
;;   :defer t
;;   :hook (clojure-mode . my-clojure-mode-hook))

;; (defun my-clojure-mode-hook ()
;;   (clj-refactor-mode 1)
;;   ;; (yas-minor-mode 1) ; for adding require/use/import statements
;;   (cljr-add-keybindings-with-prefix "C-c C-r C-r"))


;; ;; a lighter repl. needs some keybindings
;; (use-package inf-clojure
;;   :defer t
;;   :config
;;   (setq inf-clojure-repl-type 'clojure
;; 	inf-clojure-custom-startup "clojure")
;;   :general (:keymaps 'clojure-ts-mode-map
;; 		     "C-c C-c" 'inf-clojure-eval-buffer
;; 		     "C-x C-e" 'inf-clojure-eval-last-sexp))

