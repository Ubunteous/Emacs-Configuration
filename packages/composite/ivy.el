;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 IVY                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ivy
  :defer t
  :init (setq ivy-re-builders-alist '((swiper . ivy--regex-plus)
				      (t . ivy--regex-fuzzy)))
  :config
  (setq ivy-use-virtual-buffers t
	ivy-count-format "(%d/%d)"
	;; search without caring about uppercase
	ivy-display-style nil
	ivy-initial-inputs-alist nil
	ivy-mode 1)
  :general
  ("C-x b" 'ivy-switch-buffer
   "C-c v" 'ivy-push-view
   "C-c V" 'ivy-pop-view))


;; (use-package ivy-prescient
;;   :defer t
;;   :after counsel
;;   :init (ivy-prescient-mode +1))


(use-package all-the-icons-ivy-rich
  :defer t
  :after counsel
  :init (all-the-icons-ivy-rich-mode 1)
  :config
  ;; Whether display the icons
  (setq all-the-icons-ivy-rich-icon t)

  ;; Whether display the colorful icons.
  ;; It respects `all-the-icons-color-icons'.
  (setq all-the-icons-ivy-rich-color-icon t)

  ;; The icon size
  (setq all-the-icons-ivy-rich-icon-size 1.0)

  ;; Whether support project root
  (setq all-the-icons-ivy-rich-project t)

  ;; Maximum truncation width of annotation fields.
  ;; This value is adjusted depending on the `window-width'.
  (setq all-the-icons-ivy-rich-field-width 80)

  ;; Slow Rendering
  ;; If you experience a slow down in performance when rendering multiple icons simultaneously,
  ;; you can try setting the following variable
  ;; (setq inhibit-compacting-font-caches t)

  ;; Definitions for ivy-rich transformers.
  ;; See `ivy-rich-display-transformers-list' for details."
  all-the-icons-ivy-rich-display-transformers-list)


(use-package ivy-rich
  :defer t
  :after all-the-icons-ivy-rich
  :init (ivy-rich-mode 1)
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (setq ivy-rich-path-style 'abbrev))
