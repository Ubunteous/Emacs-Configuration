;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                FIRA                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; FiraCode:
;; Bold
;; Light
;; Medium
;; Regular
;; Retina
;; SemiBold

;; These characters should look different than usual: => != ...<=

;; Fonts: Code, Mono
;; Options: PL and Italic
;; Bold
;; SemiBold
;; (Regular) => leave it blank
;; SemiLight
;; Light
;; ExtraLight

(use-package ligature
  :config
  (set-face-attribute 'default nil :height 160 :font "Fira Code Medium")

  ;; Enable the www ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))

  ;; Enable ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
									   ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
									   "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
									   "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" "/*" "/**"
									   "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
									   "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
									   "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
									   "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
									   "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
									   "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
  ;; remove ";;"
  (global-ligature-mode 't))
