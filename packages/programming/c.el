;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  C                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package c
  :defer t
  :ensure nil
  :general
  (:keymaps 'c-ts-base-mode-map
	    "C-c C-c" 'recompile)
  :hook
  (c++-ts-mode . (lambda ()
		   (let ((filename (buffer-file-name)))
		     (setq-local compile-command
				 ;; (concat "clang -o output "
				 (concat "g++ -o output "
					 (if filename
					     (shell-quote-argument
					      filename))
					 " && ./output"
					 )))))
  ((c-ts-mode c-ts-base-mode-map) . (lambda ()
				      (let ((filename (buffer-file-name)))

					(setq-local compile-command
						    ;; (concat "clang -o output "
						    (concat "gcc -o output "
							    (if filename
								(shell-quote-argument
								 filename))
							    " && ./output"
							    ;; (file-name-sans-extension filename) ".out"
							    ))))))
