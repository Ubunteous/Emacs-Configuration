;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               TEMPEL               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package tempel
  :defer t
  ;; Require trigger prefix before template name when completing.
  :custom
  (tempel-trigger-prefix "<")
  (tempel-path "~/.emacs.d/packages/composite/tempel-template.el")
  :init
  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also configure `tempel-trigger-prefix', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried first.
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))
  :hook
  (prog-mode . tempel-setup-capf)
  (text-mode . tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  (prog-mode . tempel-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
  :general
  ("M-+" 'tempel-complete) ;; Alternative tempel-expand
  ("M-*" 'tempel-insert)

  (tempel-map
   "C-n" 'tempel-next
   "C-p" 'tempel-previous))
