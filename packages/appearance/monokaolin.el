;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               THEMES               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-aurora t))

(use-package monokai-pro-theme
  :if (display-graphic-p) ;; makes terminal bg green
  :config
  (load-theme 'monokai-pro-classic t))

;;:config
;;(load-theme 'kaolin-aurora t) ;;(set-face-foreground 'font-lock-string-face "red") ;strings
;;:custom-face ;;see usepackage page
;;(font-lock-comment-face ((nil (:foreground "LavenderBlush4")))) ;;comments
;;(font-lock-comment-delimiter-face ((nil (:foreground "LavenderBlush4")))))
