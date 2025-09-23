;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                CASE                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package case
  :ensure nil
  :config
  ;;emacs search and buffers are case insensitive
  (setq case-fold-search t)
  :general
  ;; ("M-u" 'upcase-word-at-point)
  ("M-u" 'upcase-word-toggle)
  ("M-l" 'downcase-word-at-point)
  ;; ("M-c" 'capitalize-word-at-point)
  ("M-c" 'capitalize-word-toggle))

;; remove warning
;; (put 'upcase-region 'disabled nil)

(defun downcase-word-at-point ()
  (interactive)
  (word-boundary-at-point-or-region #'downcase-region))

;; (defun upcase-word-at-point ()
;;   (interactive)
;;   (word-boundary-at-point-or-region #'upcase-region))

;; (defun capitalize-previous-word ()
;;   (interactive)
;;   (unless (eq ? (char-after))
;;     (right-word))
;;   (capitalize-word -1))

(defun char-upcasep (letter)
  (eq letter (upcase letter)))

(defun capitalize-word-toggle ()
  (interactive)
  (let ((start
         (car
          (save-excursion
			(beginning-of-thing 'word)
			(bounds-of-thing-at-point 'symbol)
			(when (eq ?' (char-after))
			  (forward-char))))))
	(if start
		(save-excursion
		  (goto-char start)
		  (funcall
		   (if (char-upcasep (char-after))
			   'downcase-region
			 'upcase-region)
		   start (1+ start)))
	  (capitalize-word -1))))


(defun upcase-word-toggle ()
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'symbol))
        (regionp
         (if (eq this-command last-command)
             (get this-command 'regionp)
           (put this-command 'regionp nil)))
        beg end)
    (cond
     ((or (region-active-p) regionp)
      (setq beg (region-beginning)
            end (region-end))
      (put this-command 'regionp t))
     (bounds
      (setq beg (car bounds)
            end (cdr bounds)))
     (t
      (setq beg (point)
            end (1+ beg))))
    (save-excursion
      (goto-char (1- beg))
      (and (re-search-forward "[A-Za-z]" end t)
           (funcall (if (char-upcasep (char-before))
                        'downcase-region
                      'upcase-region)
                    beg end)))))
