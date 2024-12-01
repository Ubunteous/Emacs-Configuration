;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             INDENT-BARS            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package indent-bars
  :ensure (indent-bars :type git :host github :repo "jdtsmith/indent-bars")
  :custom
  (indent-bars-treesit-support t)
  (indent-bars-no-descend-string t)
  (indent-bars-treesit-ignore-blank-lines-types '("module"))
  (indent-bars-treesit-wrap '((python argument_list parameters ; for python, as an example
				      list list_comprehension
				      dictionary dictionary_comprehension
				      parenthesized_expression subscript)))
  :config
  (setq
   indent-bars-pattern "."
   indent-bars-width-frac 0.5
   indent-bars-pad-frac 0.25
   indent-bars-color-by-depth nil
   indent-bars-color-by-depth '(:palette ("red" "green") :blend .9))

  :hook ((python-mode python-ts-mode yaml-mode) . indent-bars-mode)) ; or whichever modes you prefer
