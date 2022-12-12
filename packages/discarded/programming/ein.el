;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                EIN                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; jupyter (ipython notebook) => org may be better>emacs-jupyter
(use-package ein
  :defer t)

;; START
;; C-c C-o
;; M-x ein:run => launches new jupyter process from emacs
;; M-x ein:login => launch running jupyter server
;; M-x ein:stop => halt local and remote jupyter services

;; Image display
;; M-x customize-group RET ein
;; Ein:Output Area Inlined Images

;; C-c C-/ e and C-c C-/ r send current statement/region to kernel
;; If regionnot set, C-c C-/ r sends the entire buffer
;; You must manually inspect the *ein:shared output* buffer for errors.

;; Key             Binding
;; -------------------------------------------------------------------------------
;; C-<down>             ein:worksheet-goto-next-input-km
;; C-<up>               ein:worksheet-goto-prev-input-km
;; M-S-<return>         ein:worksheet-execute-cell-and-insert-below-km
;; M-<down>             ein:worksheet-not-move-cell-down-km
;; M-<up>               ein:worksheet-not-move-cell-up-km

;; C-x C-s              ein:notebook-save-notebook-command-km
;; C-x C-w              ein:notebook-rename-command-km

;; M-RET                ein:worksheet-execute-cell-and-goto-next-km
;; M-,                  ein:pytools-jump-back-command
;; M-.                  ein:pytools-jump-to-source-command

;; C-c C-a              ein:worksheet-insert-cell-above-km
;; C-c C-b              ein:worksheet-insert-cell-below-km
;; C-c C-c              ein:worksheet-execute-cell-km
;; C-u C-c C-c          ein:worksheet-execute-all-cells
;; C-c C-e              ein:worksheet-toggle-output-km
;; C-c C-f              ein:file-open-km
;; C-c C-k              ein:worksheet-kill-cell-km
;; C-c C-l              ein:worksheet-clear-output-km
;; C-c RET              ein:worksheet-merge-cell-km
;; C-c C-n              ein:worksheet-goto-next-input-km
;; C-c C-o              ein:notebook-open-km
;; C-c C-p              ein:worksheet-goto-prev-input-km
;; C-c C-q              ein:notebook-kill-kernel-then-close-command-km
;; C-c C-r              ein:notebook-reconnect-session-command-km
;; C-c C-s              ein:worksheet-split-cell-at-point-km
;; C-c C-t              ein:worksheet-toggle-cell-type-km
;; C-c C-u              ein:worksheet-change-cell-type-km
;; C-c C-v              ein:worksheet-set-output-visibility-all-km
;; C-c C-w              ein:worksheet-copy-cell-km
;; C-c C-y              ein:worksheet-yank-cell-km
;; C-c C-z              ein:notebook-kernel-interrupt-command-km
;; C-c C-S-l            ein:worksheet-clear-all-output-km
;; C-c C-#              ein:notebook-close-km
;; C-c C-$              ein:tb-show-km
;; C-c C-/              ein:notebook-scratchsheet-open-km
;; C-c C-;              ein:shared-output-show-code-cell-at-point-km
;; C-c <down>           ein:worksheet-move-cell-down-km
;; C-c <up>             ein:worksheet-move-cell-up-km
;; C-c C-x C-r          ein:notebook-restart-session-command-km
;; C-c M-w              ein:worksheet-copy-cell-km

;; More config
;;   :commands ein:run
;;   :custom-face
;;   (ein:cell-input-area ((t (:background "#21262E"))))
