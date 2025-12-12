;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 SH                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package sh
  :ensure nil
  :mode "\\.sh\\'"
  :hook
  (after-save . executable-make-buffer-file-executable-if-script-p))
