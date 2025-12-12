;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                JINX                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; if dict not found on NixOS, add this file:
;; ~/.aspell.conf # content: dict-dir /run/current-system/sw/lib/aspell
;; echo "dict-dir /run/current-system/sw/lib/aspell" > ~/.aspell.conf

(use-package jinx
  :defer  t
  ;; :after vertico
  :diminish "Jx"
  :general
  ("M-$" 'jinx-correct
   "C-M-$" 'jinx-languages)
  :config
  (setq jinx-languages "en_GB")
  ;; (add-to-list 'vertico-multiform-categories
  ;;              '(jinx grid (vertico-grid-annotate . 20)))
  ;; (vertico-multiform-mode 1)
  :hook
  ((prog-mode org-mode) . jinx-mode))

;; ;; Alternative 1: Enable Jinx globally
;; (add-hook 'emacs-startup-hook #'global-jinx-mode)

;; ;; Alternative 2: Enable Jinx per mode
;; (dolist (hook '(text-mode-hook prog-mode-hook conf-mode-hook))
;;   (add-hook hook #'jinx-mode))

(defun jinx-toggle-language ()
  "Switch from english to french."
  (interactive)
  
  (if (string= jinx-languages "fr")

      (progn
	(jinx-languages "en")
	(ispell-change-dictionary "en"))

    (progn
      (jinx-languages "fr")
      (ispell-change-dictionary "fr"))))
