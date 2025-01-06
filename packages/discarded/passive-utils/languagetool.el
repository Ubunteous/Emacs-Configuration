;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            LANGUAGETOOL            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package flymake-languagetool
  :defer t
  :hook ((text-mode . flymake-languagetool-load)
         (latex-mode . flymake-languagetool-load)
         (org-mode . flymake-languagetool-load)
         (markdown-mode . flymake-languagetool-load))
  ;; :init
  ;; ;; Local Server Configuration
  ;; (setq flymake-languagetool-server-jar
  ;; 	"path/to/LanguageTool-X.X/languagetool-server.jar")
  :config
  ;; (setq flymake-languagetool-check-spelling t)
  (setq flymake-languagetool-language "en-US"))
