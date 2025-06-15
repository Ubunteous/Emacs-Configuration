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

  (setq isearch-allow-scroll t)
  ;; (setq isearch-allow-motion t)
  ;; (setq isearch-allow-prefix nil)
  ;; (setq isearch-hide-immediately nil) ;; for invisible matches
  ;; (setq-isearch-wrap-pause 'no-ding) ;; wrap if no match found
  ;; (setq isearch-yank-on-move t) ;; motion keys select til occurrence
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


;; go to the end of a match when using isearch-backward
(advice-add 'isearch-exit :after (lambda ()
                                   (when (not isearch-forward)
                                     (goto-char isearch-other-end))))
