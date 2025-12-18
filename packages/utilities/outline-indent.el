;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           OUTLINE-INDENT           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package outline-indent
  :ensure t
  :config
  (setq outline-indent-ellipsis " ▼ ")
  ;; (setq outline-indent-default-offset 4)
  ;; (setq outline-indent-shift-width 4)
  ;; (setq outline-blank-line t)
  ;; (setq-default search-invisible nil)
  ;; (setq outline-indent-insert-heading-add-blank-line t)

  ;; indent depending on last non white line level
  ;; This ensures that pressing Enter will insert a new line and indent it.

  ;; Indentation based on the indentation of the previous non-blank line.
  (setq-default indent-line-function #'indent-relative-first-indent-point)

  ;; need experimentations. may be placed in a lambda
  ;; (setq-default make-window-start-visible t)

  ;; In modes such as `text-mode', pressing Enter multiple times removes
  ;; the indentation. The following fixes the issue and ensures that text
  ;; is properly indented using `indent-relative' or
  ;; `indent-relative-first-indent-point'.
  (setq-default indent-line-ignored-functions '())

  (setq outline-blank-line t) ;; between sections
  ;; (setq-default search-invisible nil) ;; prevent search
  ;; :general
  ;; ;; Fold management
  ;; (:keymaps 'outline-indent-minor-mode-map
  ;; 			"C-c o o" 'outline-indent-open-fold     ; Open fold at point
  ;; 			"C-c o c" 'outline-indent-close-fold    ; Close fold at point
  ;; 			"C-c o m" 'outline-indent-close-folds   ; Close all folds
  ;; 			"C-c o r" 'outline-indent-open-folds    ; Open all folds
  ;; 			"C-c o O" 'outline-indent-open-fold-rec ; Open fold recursively
  ;; 			"C-c o TAB" 'outline-indent-toggle-fold ; Toggle fold at point
  ;; 			"C-c o t" 'outline-indent-toggle-level-at-point ; Toggle level at point
  ;; 			;; Selection
  ;; 			"C-c o v" 'outline-indent-select ; Select current indented block

  ;; 			;; Navigation at same indentation level
  ;; 			"C-c o n" 'outline-indent-forward-same-level ; Next heading at same level
  ;; 			"C-c o p" 'outline-indent-backward-same-level ; Previous heading at same level

  ;; 			;; Shift left or right
  ;; 			"C-c o <right>" 'outline-indent-shift-right
  ;; 			"C-c o <left>" 'outline-indent-shift-left

  ;; 			;; Insert heading
  ;; 			"C-c o i" 'outline-indent-insert-heading)
  :hook (prog-mode . outline-indent-minor-mode))
