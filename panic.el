;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                PANIC               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Minimal emacs config to use when main config is down
;; start with emacs -q -l ~/.emacs.d/panic.el

;; more with (custom-available-themes)
;; modus-vivendi
;; modus-vivendi-tinted
;; modus-vivendi-tritanopia
;; modus-vivendi-deuteranopia
(load-theme 'modus-vivendi-tritanopia t)
(set-face-attribute 'default nil :height 160 :font "MonoSpace")

;; ignore general keyword
(use-package use-package)
(add-to-list 'use-package-keywords :general)
(defun use-package-handler/:general (name _keyword args rest state)
  "Use-package handler for :general."
  nil)

(defun gen-built-in-path
	(filename)
  "Make the full path to a config file in misc/"
  (concat
   "~/.emacs.d/packages/built-in/"
   filename
   ".el"))

(mapc 'load
	  (mapcar 'gen-built-in-path
			  '("ibuffer"
				"isearch"
				"misc"
				"recentf"
				"repeat"
				"which-key")))
