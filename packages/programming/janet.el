;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                JANET               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package janet-ts-mode
  :defer t
  :ensure (:host github
		 :repo "sogaiu/janet-ts-mode"
		 :files ("*.el"))
  :mode "\\.janet\\'"
  :general (:keymaps 'janet-ts-mode-map
		     "C-c s" '(lambda () (interactive)
				(if (get-buffer "*ajrepl-repl*")
				    (ajrepl-send-buffer)
				  (ajrepl))))
  ;; dirty. janet-mode always comes back in auto-mode-alist
  ;; :hook janet-mode ;; potentially makes org mode hang
  )

;; used by org-babel
(use-package janet-mode
  :defer t)

(use-package ajrepl
  :defer t
  :ensure (:host github
		 :repo "sogaiu/ajrepl"
		 :files ("*.el" "ajrepl"))
  :hook (janet-ts-mode . ajrepl-interaction-mode))

;; need to add janet to flycheck-compile list
;; (use-package flycheck-janet
;;   :defer t
;;   :ensure (:host github
;; 		 :repo "sogaiu/flycheck-janet"
;; 		 :files ("*.el")))
