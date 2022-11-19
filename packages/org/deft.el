;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                DEFT                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package deft
  :defer t
  :config
  ;; (setq deft-extensions '("txt" "tex" "org"))
  (setq deft-extensions '("org"))
  (setq deft-directory "~/Deft/notes")
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t) ;; otherwise first line of the file is the name

  ;; Rules to transform the file's title
  ;; (setq deft-file-naming-rules
  ;; 	'((noslash . "-")
  ;;         (nospace . "-")
  ;;         (case-fn . downcase)))
  :general
  ("<f8>" 'deft
   "C-x C-g" 'deft-find-file)
  )

(use-package zetteldeft
  :after deft
  :config
  (zetteldeft-set-classic-keybindings))
