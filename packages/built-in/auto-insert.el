;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             AUTO-INSERT            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package autoinsert
  :straight (:type built-in)
  :defer t
  :init
  :config
  ;; (auto-insert-mode 1)
  (setq auto-insert-query nil)
  (setq auto-insert-alist nil) ;; remove this like to restore defaults

  ;; add tempel-x later
  ;; (add-to-list 'auto-insert-alist  '(emacs-lisp-mode . [ (lambda () (tempel-insert 'header)) ] )))

  ;; org
  (add-to-list 'auto-insert-alist
	       '(org-mode .
			  [(concat
			    "#+title: "
			    (file-name-sans-extension (buffer-name))
			    "\n\n")]))

  ;; elisp
  (add-to-list 'auto-insert-alist  '(emacs-lisp-mode . [insert-header] ))
  :hook
  (find-file . auto-insert))
