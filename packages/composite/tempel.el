;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               TEMPEL               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package tempel
  :defer t
  ;; Require trigger prefix before template name when completing.
  :init
  (defvar-keymap tempel-keymap
	:doc "Keymap for tempel bindings.")
  ;; ;; Setup completion at point
  ;; (defun tempel-setup-capf ()
  ;;   ;; Add the Tempel Capf to `completion-at-point-functions'.
  ;;   ;; `tempel-expand' only triggers on exact matches. Alternatively use
  ;;   ;; `tempel-complete' if you want to see all matches, but then you
  ;;   ;; should also configure `tempel-trigger-prefix', such that Tempel
  ;;   ;; does not trigger too often when you don't expect it. NOTE: We add
  ;;   ;; `tempel-expand' *before* the main programming mode Capf, such
  ;;   ;; that it will be tried first.
  ;;   (setq-local completion-at-point-functions
  ;;               (cons #'tempel-expand
  ;;                     completion-at-point-functions)))
  ;; :hook
  ;; ((prog-mode text-mode) . tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  ;; (prog-mode . tempel-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
  :general
  ("M-+" 'tempel-expand) ;; alternative tempel-expand
  ("M-n" 'tempel-complete)
  ("M-*" 'tempel-insert)

  (tempel-map
   "C-n" 'tempel-next
   "RET" 'tempel-next ;; risky. but C-o may replace it
   "C-p" 'tempel-previous)

  (tempel-keymap
   "e" 'tempel-expand
   "c" 'tempel-complete
   "i" 'tempel-insert)

  (personal
   "t" (cons "tempel" tempel-keymap))
  :config
  (setq tempel-path "~/.emacs.d/packages/composite/tempel-template")
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
				;; (cons #'tempel-expand completion-at-point-functions))
				(cons #'tempel-expand
					  (cons #'tempel-complete
							completion-at-point-functions))))

  (defun tempel-maximise-capf-priority ()
	;; Put tempel capfs first in completion-at-point-functions
	(setq-local completion-at-point-functions
				(remove 'tempel-complete
						(remove 'tempel-expand
								completion-at-point-functions)))
	(tempel-setup-capf))
  :hook
  (prog-mode . tempel-setup-capf)
  (nxml-mode . tempel-setup-capf)

  ;; make sure eglot-capf appears after tempel-capf in completion-at-point-functions
  (eglot-managed-mode . tempel-maximise-capf-priority))

(use-package tempel-collection
  :defer t
  :after tempel)

;; (use-package eglot-tempel
;;   :defer t
;;   ;; :preface (eglot-tempel-mode)
;;   ;; :init (eglot-tempel-mode t)
;;   :after eglot
;;   :hook (eglot-managed-mode . eglot-tempel-mode t))
