;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               ISEARCH              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package isearch
  :ensure nil
  ;; :straight (:type built-in)
  :defer t
  :config
  (setq isearch-repeat-on-direction-change t)

  (setq isearch-lazy-count t
	lazy-count-prefix-format nil
	lazy-count-suffix-format "  (%s/%s)")
  :custom-face
  (isearch ((t (
		:weight bold
		;; :underline  (:color foreground-color :style line)
		:foreground "light sea green"
		:background "black"
		))))

  (lazy-highlight ((t (:foreground "light sea green" :background "black"))))
  (isearch-fail ((t (:foreground "black"  :background "MediumPurple"))))
  :general
  ;; (:keymaps 'minibuffer-local-isearch-map
  ;; 	    "<left>" 'isearch-reverse-exit-minibuffer
  ;; 	    "<right>" 'isearch-forward-exit-minibuffer)

  (:keymaps 'isearch-mode-map
	    ;; "<left>" 'isearch-ring-advance 
	    ;; "<right>" 'isearch-forward
	    "<up>" 'isearch-repeat-backward
	    "<down>" 'isearch-repeat-forward))


(defadvice isearch-exit (after my-goto-match-beginning activate)
  "Go to end of match."
  (when (not isearch-forward)
    (goto-char isearch-other-end)))
