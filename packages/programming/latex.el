;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     PROGRAMMING LANGUAGE: LaTeX    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package reftex
;;   :ensure nil
;;   :defer t)

;; (use-package auctex
;;   :ensure (auctex :pre-build (("./autogen.sh")
;;                               ("./configure"
;;                                "--with-texmf-dir=$(dirname $(kpsexpand '$TEXMFHOME'))")
;;                               ("make")))
;;   :mode ("\\.tex\\'" . TeX-latex-mode)
;;   :config
;;   (load "latex.el" nil t t)
;;   (load "preview-latex.el" nil t t)
;;   (setq-default preview-scale 1.4
;;                 preview-scale-function
;;                 (lambda () (* (/ 10.0 (preview-document-pt)) preview-scale)))
;;   (setq preview-auto-cache-preamble nil))

;; "auctex"
(use-package auctex
  ;; :defer t
  ;; :straight auctex ;; get from melpa
  :ensure nil
  ;; :ensure (auctex :pre-build (("./autogen.sh")
  ;; 			      ("./configure"
  ;; 			       "--with-texmf-dir=$(dirname $(kpsexpand '$TEXMFHOME'))")
  ;; 			      ("make")))

  ;; :ensure (auctex :pre-build (("./autogen.sh")
  ;; 			      ("./configure"
  ;; 			       "--without-texmf-dir"
  ;; 			       "--with-packagelispdir=./"
  ;; 			       "--with-packagedatadir=./")
  ;; 			      ("make"))
  ;; 		  :build (:not elpaca--compile-info) ;; Make will take care of this step
  ;; 		  :files ("*.el" "doc/*.info*" "etc" "images" "latex" "style")
  ;; 		  :version (lambda (_) (require 'tex-site) AUCTeX-version))
  
  ;; :mode ("\\.tex\\'" . LaTeX-mode)

  ;; activates latex-mode in the end
  ;; :mode ("\\.tex\\'" . tex-mode) ;; does not exist and yet works with C-c s
  :mode ("\\.tex\\'" . TeX-latex-mode) ;; does not exist and yet works with C-c s
  ;; :mode ("\\.tex\\'" . LaTeX-mode)
  ;; :requires reftex
  :general (LaTeX-mode-map "C-c s" 'latex-compile)
  ;; :general (LaTeX-mode-map "C-c s" 'latex-compile)
  ;; :init
  ;; setting variables related to auctex init breaks it LaTeX in elpaca
  ;; (add-hook 'elpaca-after-init-hook (lambda () (setq latexenc-dont-use-TeX-master-flag t)))
  :config
  ;;;;;;;;;;;;;;;;
  ;;   ELPACA   ;;
  ;;;;;;;;;;;;;;;;
  
  ;; (load "latex.el" nil t t)
  ;; (load "preview-latex.el" nil t t)
  ;; (setq-default preview-scale 1.4
  ;;               preview-scale-function
  ;;               (lambda () (* (/ 10.0 (preview-document-pt)) preview-scale)))
  ;; (setq preview-auto-cache-preamble nil)

  ;;;;;;;;;;;;;;;;
  ;;   CONFIG   ;;
  ;;;;;;;;;;;;;;;;

  ;; do not open the master with an incorrect encoding (fr characters)
  (setq latexenc-dont-use-TeX-master-flag t)

  ;; (latex-preview-pane-enable) ;;requires pdf-tools
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
  :hook
  ;;:hook ((visual-line-mode math-mode) . LaTeX-mode)
  (tex-mode-hook . (lambda () (setq ispell-parser 'tex)))
  (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
  (LaTeX-mode-hook . (lambda () (reftex-mode t) (flyspell-mode t)))

  ;; (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  ;; (add-hook 'LaTeX-mode-hook (lambda () (reftex-mode t) (flyspell-mode t)))
  :custom-face
  ;;:set-face-foreground 'font-latex-sedate-face "#66d9ee") ;;unknown keywords
  (font-latex-sedate-face ((t (:foreground "#66d9ee"))))) ;;unknown keywords

(defun latex-compile ()
  "Save file and compile with pdf LaTeX."
  (interactive)
  (save-buffer)
  (TeX-command "LaTeX" 'TeX-master-file))


;; allow remembering risky variables
;; (defun risky-local-variable-p (sym &optional _ignored) nil)
