;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            COMMON-LISP             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package common-lisp-mode
  :defer t
  :ensure nil
  :mode ("\\.cl\\'"))

(use-package slime
  :defer t
  :config
  (setq inferior-lisp-program "sbcl")
  (peek-command slime-describe-symbol "fundamental-mode") ; *slime-description* buffer
  (cl-defun slime-show-description (string package &optional (select slime-description-autofocus))
	(let ((bufname (slime-buffer-name :description)))
	  (slime-with-popup-buffer (bufname :package package
										:connection t
										:select select)
		(princ string)
		(goto-char (point-min))
		(when (string= "*slime-description*" (buffer-name))
		  (slime-description-mode)))))

  (define-generic-mode slime-description-mode
	;; comments
	'(?\;)

	;; keywords
	'("Lambda-list"
	  "Documentation"
	  "Source file")

	;; font lock
	'("^\\([A-Z0-9-]\\)+:";  namespace
	  "\[[a-z]+]" ; args
	  )

	nil ;; AUTO-MODE-LIST
	nil ;; FUNCTION-LIST
	"Common lisp documentation mode.")
  :bind
  ([remap slime-describe-symbol] . peek-slime-describe-symbol)
  (:map slime-popup-buffer-mode-map
		("q" . peek-restore-window-configuration)
		("n" . next-line)
		("p" . previous-line))
  :hook lisp-mode)

;; (use-package sly
;;   :defer t
;;   :config
;;   (setq inferior-lisp-program "sbcl")
;;   :hook lisp-mode)
