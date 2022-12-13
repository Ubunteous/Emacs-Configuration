;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             AUTO-INSERT            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun org-header ()
  "Add a title to an org file.
   Roam file which start with an ID do not need an extra title"
  (unless (string-match-p "[0-9]+-.+.org" (buffer-name))
    (insert (concat "#+title: " (file-name-sans-extension (buffer-name)) "\n\n"))))


(use-package autoinsert
  :straight (:type built-in)
  :defer t
  :init
  :config
  ;; (auto-insert-mode 1)
  (setq auto-insert-query nil)
  (setq auto-insert-alist nil) ;; remove this to restore defaults

  ;; add tempel-x later
  ;; (add-to-list 'auto-insert-alist  '(emacs-lisp-mode . [ (lambda () (tempel-insert 'header)) ] )))
  
  ;; org
  (add-to-list 'auto-insert-alist '(org-mode . [org-header]))

  ;; elisp
  (add-to-list 'auto-insert-alist  '(emacs-lisp-mode . [insert-header]))
  :hook
  (find-file . auto-insert))
