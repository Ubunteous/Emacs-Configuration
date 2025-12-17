;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                AVY                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package avy
  :defer t
  :config
  ;; ;; shorter paths if close to cursor
  ;; (setq avy-orders-alist
  ;; 		'((avy-goto-char . avy-order-closest)
  ;;         (avy-goto-word-0 . avy-order-closest)))
  
  ;; (setq avy-timeout-seconds .8)

  ;; for more precision
  ;; (setq avy-keys-alist
  ;; 		`((avy-goto-char . ,(number-sequence ?a ?f))
  ;;         (avy-goto-word-1 . (?f ?g ?h ?j))))

  (setq avy-indent-line-overlay t)
  (setq avy-keys '(?a ?r ?s ?t ?g ?m ?n ?e ?i))
  (setq avy-style 'de-bruijn) ;; defaults to at/at-full
  (setq avy-background t)

  ;; New Actions
  (defun avy-action-copy-whole-line (pt)
	(save-excursion
      (goto-char pt)
      (cl-destructuring-bind (start . end)
          (bounds-of-thing-at-point 'line)
		(copy-region-as-kill start end)))
	(select-window
	 (cdr
      (ring-ref avy-ring 0)))
	t)

  (defun avy-action-kill-whole-line (pt)
	(save-excursion
      (goto-char pt)
      (cl-destructuring-bind (start . end)
          (bounds-of-thing-at-point 'line)
		(kill-region start end)))
	(select-window
	 (cdr
      (ring-ref avy-ring 0)))
	t)

  (defun avy-action-yank-whole-line (pt)
	(avy-action-copy-whole-line pt)
	(save-excursion (yank))
	t)
  (setf (alist-get ?y avy-dispatch-alist) 'avy-action-yank ; y
		(alist-get ?w avy-dispatch-alist) 'avy-action-copy ; w
		(alist-get ?W avy-dispatch-alist) 'avy-action-copy-whole-line ; W
		(alist-get ?Y avy-dispatch-alist) 'avy-action-yank-whole-line) ; Y

  (defun avy-action-mark-to-char (pt)
	(activate-mark)
	(goto-char pt))
  (setf (alist-get ?  avy-dispatch-alist) 'avy-action-mark-to-char) ; <space>

  (defun avy-action-teleport-whole-line (pt)
	(avy-action-kill-whole-line pt)
	(save-excursion (yank)) t)
  (setf (alist-get ?t avy-dispatch-alist) 'avy-action-teleport ; t
		(alist-get ?T avy-dispatch-alist) 'avy-action-teleport-whole-line) ; T

  (defun avy-action-flyspell (pt)
	(save-excursion
      (goto-char pt)
      (when (require 'flyspell nil t)
		(flyspell-auto-correct-word)))
	(select-window
	 (cdr (ring-ref avy-ring 0)))
	t)
  (setf (alist-get ?\; avy-dispatch-alist) 'avy-action-flyspell) ; \;

  (defun avy-action-helpful (pt)
	(save-excursion
      (goto-char pt)
      (helpful-at-point))
	(select-window
	 (cdr (ring-ref avy-ring 0)))
	t)
  (setf (alist-get ?h avy-dispatch-alist) 'avy-action-helpful) ; h

  (defun avy-action-embark (pt)
	(unwind-protect
		(save-excursion
          (goto-char pt)
          (embark-act))
      (select-window
       (cdr (ring-ref avy-ring 0))))
	t)
  (setf (alist-get ?. avy-dispatch-alist) 'avy-action-embark)

  (defun avy-eval-last-sexp (pt)
	(save-excursion
      (goto-char pt)
      (eval-last-sexp nil))
	t)
  (setf (alist-get ?E avy-dispatch-alist) 'avy-eval-last-sexp))
