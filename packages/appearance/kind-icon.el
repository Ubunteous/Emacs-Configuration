;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              KIND-ICON             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package svg-lib
  :ensure (svg-lib :type git :host github :repo "rougier/svg-lib")
  :defer t)

(use-package kind-icon
  ;; :defer t
  :after corfu svg-lib
  :ensure (kind-icon :type git :host github :repo "jdtsmith/kind-icon")
  ;; :custom
  ;; (kind-icon-default-face 'corfu-default) ;; to compute blended backgrounds correctly
  :config
  ;; if t, breaks corfu because of wrong size or font setting
  (setq kind-icon-use-icons t)
  ;; (setq kind-icon-default-style '(:padding 1 :stroke 0 :margin 5 :radius 0 :height 0.1 :scale 0.1 :background nil))
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))
