;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              WEB-UTILS             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package web-mode
  :defer t
  ;; :mode "\\.jsx?$'" ;; auto-enable for .js/.jsx files
  :mode "\\.html\\'"
  :config
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (setq web-mode-markup-indent-offset 4))
;; :hook
;; (web-mode . web-mode-init-hook))

;; (defun web-mode-init-hook ()
;;   "Hooks for Web mode.  Adjust indent."
;;   (setq web-mode-markup-indent-offset 4))

;; to use it
;; + create a js file containing alert("Hello");
;; M-x run-skewer
;; C-x C-e to update web page
(use-package skewer-mode
  :defer t
  :hook
  (((js-mode js-ts-mode typescript-ts-mode) . skewer-mode)
   (css-mode . skewer-css-mode)
   (html-mode . skewer-html-mode)
   (web-mode . skewer-html-mode)))

;; needed by skewer-mode
(use-package simple-httpd
  :defer t
  :config
  ;; needed to use skewer mode with httpd-start
  ;; update HTML: skewer-html-eval-tag: C-M-x
  ;; update javascript: skewer-load-buffer
  ;; (setq httpd-root "~/Documents/javascript")
  (setq httpd-root "~/clojure/"))

;; auto update HTML page in real time
;; 1) M-x httpd-start
;; 2) M-x impatient-mode
;; 3) Point your browser to http://localhost:8080/imp/ and select a buffer
;; (use-package impatient-mode
;;   :defer t
;;   :hook web-mode)

;; rjsx for react
;; (use-package rjsx-mode
;;   :defer t
;;   :mode "\\.jsx\\'")
