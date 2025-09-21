;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                GODOT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; in godot, go to settings > external editor
;; exec-path emacsclient
;; exec-flags -n {file} +{line}
;; Make sure that emacsclient is not used by terminal instance
;; also check that (server-start) was used by emacs. check var (server-name) non nil

;; server-name can be seen in emacs. omitting this option will lead to selection of a default option
;; hence, no need for socket --socket-name=SOCKET_NAME_HERE -n {file} +{line}

;; lsp is by default on port 127.0.0.1:6005

(use-package gdscript-mode
  :ensure (gdscript-mode
		   :type git
		   :host github
		   :repo "godotengine/emacs-gdscript-mode")
  :config
  ;; (setq gdscript-godot-executable "/path/to/godot")
  ;; (setq gdscript-docs-local-path "/home/gdquest/Documents/docs/godot")

  ;; Save all buffers and format them with gdformat anytime Godot executable is run.
  ;; (setq gdscript-gdformat-save-and-format t)
  ;; (add-to-list 'eglot-server-programs '(gdscript-ts-mode . ("localhost" 6005)))

  ;; (setq gdscript-docs-local-path "~/Documents/Godot Doc")

  ;; overrides default gdscript-mode behaviour
  (with-eval-after-load 'eglot
	(defvar eglot-server-programs)
    (push (cons 'gdscript-mode #'("localhost" 6005))
		  eglot-server-programs))
  :general
  (:keymaps 'gdscript-mode-map
			"RET" 'smart-insert-colon-python)
  :hook
  (gdscript-ts-mode . auto-revert-mode)
  :mode
  ;; ("\\.gd\\'" . gdscript-mode)
  ("\\.gd\\'" . gdscript-ts-mode))
