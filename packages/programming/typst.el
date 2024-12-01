;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                TYPST               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; archived but does not break like typst-ts-mode
(use-package typst-mode
  :defer t
  :ensure (typst-mode :type git :host github :repo " Ziqi-Yang/typst-mode.el" :files (:defaults "*.el"))
  :mode ("\\.typ\\'" . typst-mode))

;; ;; needs removal of the true part of the condition
;; ;; in typst-ts-utils.el
;; ;; (if (>= emacs-major-version 30)
;; ;; (funcall #'treesit-parser-list buffer language)
;; (use-package typst-ts-mode
;;   :defer t
;;   :ensure (typst-ts-mode :type git :host github :repo "meow_king/typst-ts-mode" :files (:defaults "*.el"))
;;   :config
;;   ;; don't add "--open" if you'd like `watch` to be an error detector
;;   ;; (typst-ts-mode-watch-options "--open")

;;   ;; experimental (needs emacs 30)
;;   ;; (setq typst-ts-mode-enable-raw-blocks-highlight t
;;   ;; 	typst-ts-mode-highlight-raw-blocks-at-startup t)

;;   ;; needs consult-imenu
;;   ;; (setq consult-imenu-config
;;   ;; 	(append consult-imenu-config
;;   ;; 		'((typst-ts-mode :topLevel "Headings" :types
;;   ;; 				 ((?h "Headings" typst-ts-markup-header-face)
;;   ;; 				  (?f "Functions" font-lock-function-name-face))))))
;;   )

(use-package websocket
  :defer t)

(use-package typst-preview
  :defer t
  :ensure (typst-preview :type git :host github :repo "havarddj/typst-preview.el"))

