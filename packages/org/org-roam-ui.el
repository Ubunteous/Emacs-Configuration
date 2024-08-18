;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             ORG-ROAM-UI            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-roam-ui
  :defer t
  ;; :after org-roam
  ;; normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;; a hookable mode anymore, you're advised to pick something yourself
  ;; if you don't care about startup time, use
  ;; :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t)
  :general
  ("C-c r u" 'org-roam-ui-mode)
  )

;; (setq org-roam-ui-custom-theme
;;       '((bg . "#1E2029")
;;         (bg-alt . "#282a36")
;;         (fg . "#f8f8f2")
;;         (fg-alt . "#6272a4")
;;         (red . "#ff5555")
;;         (orange . "#f1fa8c")
;;         (yellow ."#ffb86c")
;;         (green . "#50fa7b")
;;         (cyan . "#8be9fd")
;;         (blue . "#ff79c6")
;;         (violet . "#8be9fd")
;;         (magenta . "#bd93f9")))
