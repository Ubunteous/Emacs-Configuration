;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              IBUFFER               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ibuffer
  :defer t
  :ensure nil
  ;; :straight (:type built-in)
  :config
  (setq ibuffer-saved-filter-groups
		'(("home"
		   ("emacs-config" (or (filename . ".emacs.d")
							   (filename . "emacs-config")))
           ;; ("martinowen.net" (filename . "martinowen.net"))
		   ("Godot" (or (mode . gdscript-ts-mode)
						(filename . "\\tscn\\'")))

		   ("C#" (or (mode . csharp-mode)
					 (mode . nxml-mode)
					 (filename . "\\resx\\'")
					 (filename . "\\sln\\'")
					 (filename . "\\csproj\\'")))

		   ("dape" (or (mode . dape-repl-mode)
					   (name . "\*dape-info.*")))

		   ("LaTeX" (mode . LaTeX-mode))
		   ("Python" (mode . python-mode))
		   ("Nix" (mode . nix-ts-mode))
		   ("Clojure" (or (mode . clojure-ts-mode)
						  (mode . clojure-ts-clojurescript-mode)))
		   ("Org" (or (mode . org-mode)
					  (filename . "OrgMode")))
           ;; ("code" (filename . "code"))
		   ("JS" (or
				  (mode . js-ts-mode)
				  (mode . typescript-ts-mode)
				  (mode . html-mode)
				  (mode . css-mode)))
		   ;; ("Subversion" (name . "\*svn"))
		   ("Magit" (name . "\*magit"))
		   ;; ("ERC" (mode . erc-mode))
		   ("Help" (or (name . "\*Help\*")
					   (name . "\*Apropos\*")
					   (name . "\*info\*"))))))
  
  (setq ibuffer-expert t) ;; kill buffers without a query
  (setq ibuffer-show-empty-filter-groups nil)
  :hook (ibuffer-mode . (lambda () (ibuffer-switch-to-saved-filter-groups "home")))
  :general ("C-x C-b" 'ibuffer))

;; (defun ibuffer-collapse-all-filter-groups ()
;;   "Collapse all filter groups at once"
;;   (interactive)
;;   (setq ibuffer-hidden-filter-groups
;; 	(mapcar #'car (ibuffer-current-filter-groups-with-position)))
;;   (ibuffer-update nil t))

;; (defun ibuffer-expand-all-filter-groups ()
;;   "Expand all filter groups"
;;   (interactive)
;;   (setq ibuffer-hidden-filter-groups nil)
;;   (ibuffer-update nil t))

;; open buffer menu instead of list buffer => replaced by ibuffer
;; "C-x C-b" #'(lambda () (interactive) (list-buffers) (pop-to-buffer "*Buffer List*"))
