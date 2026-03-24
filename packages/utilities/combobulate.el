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
   tsx-ts-mode)
  :general (:keymaps 'combobulate-javascript-map
					 "M-<down>" nil
					 "M-<up>" nil))
