;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             SMARTPARENS            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; learn it with sp-cheat-sheet
(use-package smartparens
  :defer t
  :config
  (require 'smartparens-config)

  (transient-define-prefix ts-smartparens ()
    "Prefix with groups in a grid-like arrangement for smartparens."

    [:description
     "SMARTPARENS\n" ; must use slot or macro is confused
     ["Main Commands" ; note, no newline
      ("s" "Slurp" sp-forward-slurp-sexp)
      ("C-s" "Back Slurp" sp-backward-slurp-sexp)
      ("b" "Barf" sp-forward-barf-sexp)
      ("C-b" "Barf" sp-backward-barf-sexp)
      ""
      ("a" "placeholder" newline)] ; note, no newline

     ["Motion\n"
      ("b" "placeholder" newline)]])
  :general (:keymaps 'prog-mode-map
		     "C-r" 'ts-smartparens) ;; shadows isearch-backwards
  ;; smartparens-strict-mode to disable invalid pairing
  :hook prog-mode)
