;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           OUTLINE-INDENT           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package outline-indent
  :ensure t
  :custom (outline-indent-ellipsis " ▼ ")
  :config
  ;; (setq outline-indent-default-offset 4)
  ;; (setq outline-indent-shift-width 4)
  ;; (setq outline-blank-line t)
  ;; (setq-default search-invisible nil)

  
  ;; indent depending on last non white line level
  ;; This ensures that pressing Enter will insert a new line and indent it.
  (global-set-key (kbd "RET") #'newline-and-indent)

  ;; Indentation based on the indentation of the previous non-blank line.
  (setq-default indent-line-function #'indent-relative-first-indent-point)

  ;; In modes such as `text-mode', pressing Enter multiple times removes
  ;; the indentation. The following fixes the issue and ensures that text
  ;; is properly indented using `indent-relative' or
  ;; `indent-relative-first-indent-point'.
  (setq-default indent-line-ignored-functions '())
  :hook (prog-mode . outline-indent-minor-mode))
