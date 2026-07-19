;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                DEFT                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package deft
  :defer t
  :config
  ;; (setq deft-extensions '("txt" "tex" "org"))
  (setq deft-extensions '("org"))
  (setq deft-directory "~/org/Alter/roam/")
  (setq deft-recursive t) ;; also search in subdirectories
  (setq deft-use-filename-as-title t) ;; otherwise first line of the file is the name

  ;; Rules to transform the file's title
  ;; (setq deft-file-naming-rules
  ;;	'((noslash . "-")
  ;;         (nospace . "-")
  ;;         (case-fn . downcase)))
  :bind
  ;; ("<f8>" . deft)
  ("C-x C-g" . deft-find-file))

(use-package zetteldeft
  :after deft
  :config
  (zetteldeft-set-classic-keybindings) ; only loaded after deft invocation
  (which-key-add-keymap-based-replacements mode-specific-map "d" "zettel")
  :bind
  (:map mode-specific-map
		("d" . zetteldeft-prefix)))
