;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            MEOW-TREESIT            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package meow-tree-sitter
  :defer t
  :ensure (meow-tree-sitter :type git :host github :repo "skissue/meow-tree-sitter")
  :config
  (meow-tree-sitter-register-defaults)

  ;; configurations
  ;; (setq meow-tree-sitter-can-expand nil
  ;; 	meow-tree-sitter-can-jump-forward nil
  ;; 	meow-tree-sitter-extra-queries t
  ;; 	meow-tree-sitter-major-mode-language-alist [ alist ]
  ;; 	meow-tree-sitter-queries-dir [ defaults to queries/ ])
  
  ;; custom keybindings
  ;; (meow-tree-sitter-register-thing ?F "function")
  ;; (meow-tree-sitter-register-thing ?P "parameter")
  ;; (meow-tree-sitter-register-thing ?B '("function" "class"))

  ;; custom queries
  ;; (meow-tree-sitter-register-thing
  ;;  ?f "function"
  ;;  '(("python" . ((function_definition
  ;;                  body: (block) :? @function.inside) @function.around))
  ;;    ("rust" . "(function_item
  ;;               body: (_) @function.inside) @function.around")))
  )
