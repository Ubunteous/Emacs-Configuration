;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               KEEPASS              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; interesting but leaks password
;; https://gitlab.com/tay-dev/keepass.el tries to fix it

;; (shell-command-to-string "echo foo | ps aux") can get the password from these lines:
;; (format "echo %s | \
;;          keepassxc-cli %s %s %s 2>&1 | \
;;          egrep -v '[Insert|Enter] password to unlock %s'"
;;         (shell-quote-argument keepass-mode-password)

;; A fix requires process-send-string

(use-package keepass
  :defer t)
