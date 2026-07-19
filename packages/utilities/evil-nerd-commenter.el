;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        EVIL-NERD-COMMENTER         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package evil-nerd-commenter
  :defer t
  :bind
  ("M-;" . xref-find-definitions)
  ("C-c ." . evilnc-comment-or-uncomment-lines)
  ;; ("C-c l" . evilnc-quick-comment-or-uncomment-to-the-line)
  ;; ("C-c c" . evilnc-copy-and-comment-lines)
  ;; ("C-c C-t C-l" . evilnc-kill-to-line)
  ;; ("C-c C-t C-l" . evilnc-copy-to-line)
  ;; ("C-c o" . evilnc-comment-or-uncomment-paragraphs)
  ("C-c M-." . evilnc-copy-and-comment-lines)
  (:map override-global-map
		;; will not be overriden like with (bind-keys*)
		("M-." . evilnc-comment-or-uncomment-lines)))
