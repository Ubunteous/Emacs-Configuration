;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             AUTO-INSERT            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun org-header ()
  "Add a title to an org file unless it is a capture"
  ;; old outdated strategy with vanilla org roam file names mostly made of numbers
  ;; (unless (string-match-p "[0-9]+-.+.org" (buffer-name))
  ;; (unless org-capture-mode
  (insert (concat "#+title: " (file-name-sans-extension (buffer-name)) "\n\n")))
;; )


(defun insert-header ()
  "Insert a nice header with the current buffer name at the beginning of said buffer."
  (interactive)

  (if comment-start
      (let* ((comment-char (string-to-char comment-start))
	     (border (make-string 40 comment-char))
	     (two-sep (make-string 2 comment-char))
	     (name (upcase (file-name-sans-extension (buffer-name))))
	     (len-name (length name))
	     (nb-spaces (/ (- (length border) len-name 4) 2))
	     (white-insert (make-string nb-spaces ? )))

	;; go to the beginning of the buffer
	;; (goto-char (point-min)) ;; (goto-char 1) works as well
	
	(insert (concat border "\n"
			two-sep white-insert (if (eq 0 (% len-name 2))  "" " ") name white-insert two-sep "\n"
			border "\n\n")))

    ;; Some modes can't support this function.
    (message "Can't place a header here. The current mode does not have a comment-start character" )))


(use-package autoinsert
  :ensure nil
  ;; :straight (:type built-in)
  :defer t
  ;; :init
  :config
  ;; (auto-insert-mode 1)
  (setq auto-insert-query nil)
  (setq auto-insert-alist nil) ;; remove this to restore defaults

  ;; add tempel-x later
  ;; (add-to-list 'auto-insert-alist  '(python-mode . [ (lambda () (tempel-insert 'def_function)) ] ))

  ;; org
  (add-to-list 'auto-insert-alist '(org-mode . [org-header]))

  ;; elisp
  (add-to-list 'auto-insert-alist  '(emacs-lisp-mode . [insert-header]))
  :hook
  (find-file . auto-insert))
