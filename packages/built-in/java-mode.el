;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               JAVA-MODE              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package java-mode
  :defer t
  :straight (:type built-in)

  :hook
  (java-mode . (lambda ()
		 (set (make-local-variable 'compile-command)
		      (concat "javac " buffer-file-name))))
  :general
  (:keymaps 'java-mode-map
	    "C-c C-c" 'java-run))

(defun java-run ()
  (interactive)
  ;; (compile (concat "javac " buffer-file-name))
  (compile (concat "java " buffer-file-name)))
