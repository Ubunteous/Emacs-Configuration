;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              DUMB-JUMP             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dumb-jump
  :defer t)

;; (setq xref-show-definitions-function #'xref-show-definitions-completing-read)
;; (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; hydra for efficiency
;; (defhydra dumb-jump-hydra (:color blue :columns 3)
;;   "Dumb Jump"
;;   ("j" dumb-jump-go "Go")
;;   ("o" dumb-jump-go-other-window "Other window")
;;   ("e" dumb-jump-go-prefer-external "Go external")
;;   ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
;;   ("i" dumb-jump-go-prompt "Prompt")
;;   ("l" dumb-jump-quick-look "Quick look")
;;   ("b" dumb-jump-back "Back"))

;; (use-package dumb-jump
;;   :custom
;;   (dumb-jump-aggressive t)
;;   :bind
;;   ([remap xref-find-definitions] . fk/smart-jump-go)
;;   ([remap xref-pop-marker-stack] . fk/smart-jump-back)
;;   ("C-M-S-j" . fk/smart-jump-peek)
;;   :config
;;   (defun fk/smart-jump-go ()
;;     "Fallback `dumb-jump-go' if `xref-find-definitions' cannot find the source."
;;     (interactive)
;;     (condition-case nil
;;         (call-interactively 'xref-find-definitions)
;;       (error (call-interactively 'dumb-jump-go))))

;;   (defun fk/smart-jump-back ()
;;     "Fallback `dumb-jump-back' if xref-pop-marker-stack cannot return back."
;;     (interactive)
;;     (if (string= (frame-parameter (selected-frame) 'name) "*Smart Jump Peek*")
;;         (progn (make-frame-invisible) (delete-frame))
;;       (condition-case nil
;;           (call-interactively 'xref-pop-marker-stack)
;;         (error (call-interactively 'dumb-jump-back)))))

;;   (defun fk/smart-jump-peek ()
;;     "`fk/smart-jump-go' in a new frame.
;; Source: http://tuhdo.github.io/emacs-frame-peek.html"
;;     (interactive)
;;     (let (summary
;;           doc-frame
;;           x y
;;           ;; 1. Find the absolute position of the current beginning of the symbol
;;           ;; at point, in pixels.
;;           (abs-pixel-pos (save-excursion
;;                            (beginning-of-thing 'symbol)
;;                            (window-absolute-pixel-position))))
;;       (setq x (car abs-pixel-pos))
;;       (setq y (+ (cdr abs-pixel-pos) (frame-char-height)))

;;       ;; 2. Create a new invisible frame, with the current buffer in it.
;;       (setq doc-frame (make-frame `((name . "*Smart Jump Peek*")
;;                                     (width . 100)
;;                                     (visibility . nil)
;;                                     (height . 20))))

;;       ;; 3. Position the new frame right under the beginning of the symbol at point.
;;       (set-frame-position doc-frame x y)

;;       ;; 4. Jump to the symbol at point.
;;       (with-selected-frame doc-frame
;;         (fk/smart-jump-go)
;;         (read-only-mode -1)
;;         (recenter-top-bottom 0))

;;       ;; 5. Make frame visible again
;;       (make-frame-visible doc-frame)
;;       (x-focus-frame doc-frame))))
