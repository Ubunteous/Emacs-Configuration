;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             JAVASCRIPT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; skewer and indium for live preview and tools

(use-package js2-mode
  :defer t
  :general
  (:keymaps 'js2-mode-map
	    "M-;" 'js2-jump-to-definition)
  :config
  ;; (setq python-indent-guess-indent-offset t) ;; already t by default
  (setq python-indent-guess-indent-offset-verbose nil) ;; no error message when guessing indentation
  (setq python-shell-interpreter "python3")
  :mode ("\\.js\\'" . js2-mode) ;; major mode
  ;; :mode (("\\.js\\'" . js2-mode)
  ;; 	 ("\\.jsx?\\'" . js2-jsx-mode))
  ;; as minor mode with js-mode for react
  ;; :hook (js-mode . js2-minor-mode)
  :interpreter (("node" . js2-mode)
		("node" . js2-jsx-mode)))

(use-package web-mode
  :defer t
  ;; :mode "\\.jsx?$'" ;; auto-enable for .js/.jsx files
  :mode "\\.html\\'"
  :config
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  :hook
  (web-mode . web-mode-init-hook))

(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 4))

(use-package skewer-mode
  :defer t
  :hook
  ((js2-mode . skewer-mode)
   (css-mode . skewer-css-mode)
   (html-mode . skewer-html-mode)
   (web-mode . skewer-html-mode)))

(use-package simple-httpd
  :defer t
  :config
  ;; needed to use skewer mode with httpd-start
  ;; update HTML: skewer-html-eval-tag: C-M-x
  ;; update javascript: skewer-load-buffer
  (setq httpd-root "~/clojure/"))

;; rjsx for react
;; (use-package rjsx-mode
;;   :defer t
;;   :mode "\\.jsx\\'")
