;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             COMBOBULATE            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package combobulate
  :ensure (combobulate :type git :host github :repo "mickeynp/combobulate")
  :preface
  (setq combobulate-key-prefix "C-c y")
  :hook
  (python-ts-mode
   js-ts-mode
   html-ts-mode
   css-ts-mode
   yaml-ts-mode
   typescript-ts-mode
   json-ts-mode
   tsx-ts-mode))
