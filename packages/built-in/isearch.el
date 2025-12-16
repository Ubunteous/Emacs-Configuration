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

  (defun isearch-exit-other-end ()
	"Exit isearch, but at the other end of the search string.
This is useful when followed by an immediate kill."
	(interactive)
	(isearch-exit)
	(goto-char isearch-other-end))

  ;; (defun isearch-yank-symbol ()
  ;; 	"*Put symbol at current point into search string."
  ;; 	(interactive)
  ;; 	(let ((sym (thing-at-point 'symbol)))
  ;;     (if sym
  ;;         (progn
  ;; 			(setq isearch-regexp t
  ;;                 isearch-string (concat "\\_<" (regexp-quote sym) "\\_>")
  ;;                 isearch-message (mapconcat 'isearch-text-char-description isearch-string "")
  ;;                 isearch-yank-flag t))
  ;; 		(ding)))
  ;; 	(isearch-search-and-update))

  ;;   (defun isearch-other-window (regexp-p)
  ;;     "Function to isearch-forward in the next window.

  ;; With prefix arg REGEXP-P, perform a regular expression search."
  ;;     (interactive "P")
  ;;     (unless (one-window-p)
  ;;       (with-selected-window (other-window-for-scrolling)
  ;;         (isearch-forward regexp-p))))

  (defun isearch-consult ()
    "Invoke `consult-line' from isearch."
    (interactive)
    (let ((query (if isearch-regexp
                     isearch-string
                   (regexp-quote isearch-string))))
      (isearch-update-ring isearch-string isearch-regexp)
      (let (search-nonincremental-instead)
        (ignore-errors (isearch-done t t)))
      (consult-line query)))
  :custom-face
  (isearch ((t (
				:weight bold
				;; :underline  (:color foreground-color :style line)
				:foreground "light sea green"
				:background "black"))))

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
			"<down>" 'isearch-repeat-forward
			"C-<return>" 'isearch-exit-other-end
			"C-a" 'avy-isearch
			"C-o" 'isearch-consult))


;; go to the end of a match when using isearch-backward
(advice-add 'isearch-exit :after (lambda ()
                                   (when (not isearch-forward)
                                     (goto-char isearch-other-end))))
