;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   PROGRAMMING LANGUAGE: FOUNTAIN   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Requires screenplain for pdf export: pip install 'screenplain[PDF]'
;;(set-face-attribute 'fountain-scene-heading nil :foreground "#202226" :weight 'bold)
;;(add-hook 'after-save-hook #'export-to-pdf) ;; need to create function export-to-pdf
;;(add-to-list 'fountain-export-command-profiles
(use-package fountain-mode
  :defer t
  :config
  (setq fountain-export-command-profiles
	'(("screenplain" . "screenplain %B.fountain %B.pdf")
	  ("ord-fountain" . "ord-fountain"))) ;; uses my own code (ord-fountain.sh)
  :hook (fountain-mode . olivetti-mode))
