;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                MOODY               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package moody
  ;;:defer t
  :config
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function)

  ;; ;; completely disable incorrect modeline git branch
  ;; (setq vc-handled-backends (delq 'Git vc-handled-backends))
  ;; (setq vc-handled-backends nil)

  (setq moody-mode-line-height 32))

;; :config
;; (let ((line (face-attribute 'mode-line :underline)))
;;   (set-face-attribute 'mode-line          nil :overline   line)
;;   (set-face-attribute 'mode-line-inactive nil :overline   line)
;;   (set-face-attribute 'mode-line-inactive nil :underline  line)
;;   (set-face-attribute 'mode-line          nil :box        nil)
;;   (set-face-attribute 'mode-line-inactive nil :box        nil)
;;   (set-face-attribute 'mode-line-inactive nil :background "#f9f2d9"))

;; (setq x-underline-at-descent-line t))
