;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             JAVASCRIPT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; currently using skewer for live preview and tools
;; see later indium for an alternative

(use-package js2-mode
  :defer t
  :general
  (:keymaps 'js2-minor-mode-map
	    "C-c C-c" 'recompile
	    "M-;" 'js2-jump-to-definition)
  ;; :mode ("\\.js\\'" . js2-mode) ;; major mode
  ;; :mode (("\\.js\\'" . js2-mode)
  ;; 	 ("\\.jsx?\\'" . js2-jsx-mode))
  ;; as minor mode with js-mode for react
  ;; :interpreter (("node" . js2-mode)
  ;; 		("node" . js2-jsx-mode))
  :hook (((js-mode js-ts-mode) . js2-minor-mode)

	 ((js-mode js-ts-mode) . (lambda ()
				   (setq-local compile-command
					       (concat "node "
						       (if buffer-file-name
							   (shell-quote-argument
							    (file-name-sans-extension buffer-file-name)))))))))
;; ;; cannot be lazy loaded easily
;; (use-package js-comint
;;   :defer t
;;   ;; :config
;;   ;; (setq js-comint-program-command "node")
;;   ;; (setq js-comint-program-arguments '("--interactive"))
;;   )
