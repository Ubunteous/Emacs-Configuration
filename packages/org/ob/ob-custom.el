;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            MY-OB-ELIXIR            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ob)

;; optionally define a file extension for this language
(mapcar (lambda (lang) (add-to-list 'org-babel-tangle-lang-exts lang))
		'(("elixir" . "ex")
		  ;; ("rust" . "rs")
		  ;; ("csharp" . "cs")
		  ;; ("powershell" . "ps1")
		  ;; ("nix" . "nix")
		  ))

(defmacro def-org-babel-execute (lang extension command)
  (let ((func-name (intern (format "org-babel-execute:%s" lang))))
	`(defun ,func-name (body _params)
	   ,(format "Execute a block of %s code with org-babel." lang)
	   (let ((in-file (org-babel-temp-file "babel" ,(concat "." extension))))
		 (with-temp-file in-file
		   (insert body))
		 (org-babel-eval
		  (format "%s %s" ,command (org-babel-process-file-name in-file)) "")))))

(def-org-babel-execute elixir "ex" "elixir")
