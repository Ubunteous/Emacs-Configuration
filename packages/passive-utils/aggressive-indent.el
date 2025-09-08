;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          AGGRESSIVE-INDENT         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package aggressive-indent
  :defer t
  :config
  (setq aggressive-indent-comments-too t)
  
  ;; (setq aggressive-indent-excluded-modes '(haskell-mode))
  ;; (setq aggressive-indent-protected-commands '(undo))

  ;; (setq aggressive-indent-dont-electric-modes '(haskell-mode))
  
  ;; (add-to-list 'aggressive-indent-dont-indent-if
  ;; 			   '(derived-mode-p 'sql-mode)
  ;; 			   '(derived-mode-p 'gdscript-mode))
  ;; (add-to-list
  ;;  'aggressive-indent-dont-indent-if
  ;;  '(and (derived-mode-p 'c++-mode)
  ;;        (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
  ;;                            (thing-at-point 'line)))))
  :hook (prog-mode . (lambda ()
					   (unless (member major-mode '(c-mode c-ts-mode anaconda-mode gdscript-ts-mode sql-mode))
						 (aggressive-indent-mode)))))
