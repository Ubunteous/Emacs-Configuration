;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        EVIL-NERD-COMMENTER         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package evil-nerd-commenter
  :defer t
  :general
  ("M-;" 'evilnc-comment-or-uncomment-lines
   "C-c l" 'evilnc-quick-comment-or-uncomment-to-the-line
   ;; "C-c c" 'evilnc-copy-and-comment-lines
   ;; "C-c C-t C-l" 'evilnc-kill-to-line
   ;; "C-c C-t C-l" 'evilnc-copy-to-line
   "C-c o" 'evilnc-comment-or-uncomment-paragraphs))
