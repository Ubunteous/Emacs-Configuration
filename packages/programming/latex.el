;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     PROGRAMMING LANGUAGE: LaTeX    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package reftex
  :defer t)


;; "auctex"
(use-package tex
  :defer t
  :straight auctex
  :mode ("\\.tex\\'" . LaTeX-mode)
  ;;:requires reftex
  :general (LaTeX-mode-map "C-c s" 'latex-compile)
  :init
  ;; do not open the master with an incorrect encoding (fr characters)
  (setq latexenc-dont-use-TeX-master-flag t)
  :config  
  ;;(latex-preview-pane-enable) ;;requires pdf-tools
  (setq TeX-PDF-mode t
	;;bibtex-dialect 'biblatex ;; prefer biblatex to default
	TeX-save-query nil
	reftex-plug-into-AUCTeX t
	TeX-auto-save t
	TeX-parse-self t
	TeX-show-compilation nil
	;;TeX-view-program-selection '((output-pdf "PDF Tools"))
	TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o"))
	TeX-source-correlate-start-server t)
  (setq-default TeX-master nil)
  ;;:hook ((visual-line-mode math-mode) . LaTeX-mode)
  :hook
  (tex-mode-hook . (lambda () (setq ispell-parser 'tex)))
  (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
  (LaTeX-mode-hook . (lambda () (reftex-mode t) (flyspell-mode t)))
  
  ;; (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  ;; (add-hook 'LaTeX-mode-hook (lambda () (reftex-mode t) (flyspell-mode t)))
  :custom-face (font-latex-sedate-face ((t (:foreground "#66d9ee"))))) ;;unknown keywords
;;:set-face-foreground 'font-latex-sedate-face "#66d9ee") ;;unknown keywords


(defun latex-compile ()
  "LaTeX compile."
  (interactive)
  (save-buffer)
  (TeX-command "LaTeX" 'TeX-master-file))

