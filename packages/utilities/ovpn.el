;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                OVPN                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ovpn-mode
  :defer t
  :config
  ;; (setq ovpn-mode-check-authinfo t) ; defaults to t
  ;; ovpn-mode-browser-options ;; check later if needed
  ;; (setq ovpn-mode-ipv6-auto-toggle nil)
  ;; (setq ovpn-mode-switch-to-buffer-on-stop nil)

  (setq ovpn-mode-base-directory "~/Documents/vpn/default")
  (setq ovpn-mode-preferred-browser "firefox")
  (setq ovpn-mode-preferred-terminal "wezterm")

  ;; flag used by terminal to execute a command (wezterm -e)
  (setq ovpn-mode-preferred-terminal-exec-flag "-e"))
