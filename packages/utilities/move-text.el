;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              MOVE-TEXT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package move-text
  :defer t
  :init (move-text-default-bindings))

;; this functions seem to be almost as good as this package
(defun move-line-up (arg)
  "Move up the current line."
  (interactive "P")

  (push-mark)
  (let ((n (if arg (prefix-numeric-value arg) 1)))
	(cl-loop
	 repeat n do
	 (progn
	   (transpose-lines 1)
	   (forward-line -2)
	   (indent-according-to-mode)))))

;; (defun move-line-down (arg)
;;   "Move down the current line."
;;   (interactive "P")

;;   (push-mark)
;;   (let ((n (if arg (prefix-numeric-value arg) 1)))
;; 	(cl-loop
;; 	 repeat n do
;; 	 (progn
;; 	   (forward-line 1)
;; 	   (transpose-lines 1)
;; 	   (forward-line -1)
;; 	   (indent-according-to-mode)))))
