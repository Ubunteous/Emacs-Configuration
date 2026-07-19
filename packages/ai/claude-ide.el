;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             CLAUDE-IDE             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package claude-code-ide
  :ensure (claude-code-ide.el :type git :host github :repo "manzaltu/claude-code-ide.el")
  ;; :bind ("C-c C-'" .
  claude-code-ide-menu) ; Set your favorite keybinding
  :config
  ;; (claude-code-ide-emacs-tools-setup) ; Optionally enable Emacs MCP tools

  ;; (setq claude-code-ide-window-side 'right
  ;;		claude-code-ide-window-width 100)
  (setq claude-code-ide-use-side-window nil))
