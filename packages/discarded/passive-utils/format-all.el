;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             FORMAT-ALL             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package format-all
  ;; :commands format-all-mode
  :hook prog-mode
  ;; :ensure nil
  :config
  (setq format-all-show-errors 'always) ;; 'warnings 'errors 'never

  (setq-default format-all-formatters
                '(("Python" (ruff))
		  ;; ("Shell" (shfmt "-i" "4" "-ci"))
		  )))

