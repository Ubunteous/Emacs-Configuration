;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     PROGRAMMING LANGUAGE: LaTeX    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package auctex
  :defer t
  ;; :ensure nil ; installed via nix
  ;; :ensure (auctex :pre-build (("./autogen.sh")
  ;;				  ("./configure"
  ;;				   "--with-texmf-dir=$(dirname $(kpsexpand '$TEXMFHOME'))")
  ;;				  ("make")))

  ;; :ensure (auctex :pre-build (("./autogen.sh")
  ;;				  ("./configure"
  ;;				   "--without-texmf-dir"
  ;;				   "--with-packagelispdir=./"
  ;;				   "--with-packagedatadir=./")
  ;;				  ("make"))
  ;;		  :build (:not elpaca--compile-info) ;; Make will take care of this step
  ;;		  :files ("*.el" "doc/*.info*" "etc" "images" "latex" "style")
  ;;		  :version (lambda (_) (require 'tex-site) AUCTeX-version))
  ;; :requires reftex

  :init
  (defvar-keymap latex-mode-map
	:doc "Keymap for LaTeX. Loaded earlier than the real one for key binding.")

  ;; to avoid triggering prompts every time a file is opened
  ;; note: C-c C-v used to work but I am now getting missing .dvi file errors. using latex-view-pdf as alternative
  (add-to-list 'safe-local-variable-values '(TeX-view-program-list . '("Evince" "evince 'output/Oeuvres à Découvrir.pdf'")))
  (add-to-list 'safe-local-variable-values '(LaTeX-command . "latex -jobname 'Oeuvres à Découvrir' -output-directory ./output"))
  :config
  (defun latex-compile ()
	"Save file and compile with pdf LaTeX."
	(interactive)
	(save-buffer)
	(TeX-command "LaTeX" #'TeX-master-file nil)) ; TeX-command comes from auctex

  (defun latex-view-pdf ()
	(interactive)
	(save-window-excursion
	  (async-shell-command
	   (if (string= TeX-master "Oeuvres")
		   "evince 'output/Oeuvres à Découvrir.pdf'"
		 (concat "evince " (file-name-base (buffer-file-name)) ".pdf")))))

  ;; could not find any latex related face (7/2026)
  ;; (set-face-attribute 'font-latex-sedate-face nil :foreground "#66d9ee")

  ;; do not open the master with an incorrect encoding (fr characters)
  (setq latexenc-dont-use-TeX-master-flag t)

  ;; (latex-preview-pane-enable) ; requires pdf-tools
  (setq TeX-save-query nil
		;;bibtex-dialect 'biblatex ;; prefer biblatex to default
		;; TeX-PDF-mode t ; should be changed via a command
		TeX-auto-save t ; save style info
		TeX-parse-self t ; parse if no style hook found
		;; TeX-show-compilation nil
		;;TeX-view-program-selection '((output-pdf "PDF Tools"))
		TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o"))
		reftex-plug-into-AUCTeX t
		TeX-source-correlate-start-server t)
  ;; (setq-default TeX-master nil)
  :bind
  (:map latex-mode-map
		("C-c s" . latex-compile)
		("C-c C-v" . latex-view-pdf))
  :hook
  ;; ((visual-line-mode math-mode) . LaTeX-mode)

  ;; for latex (greek chars as unicode) \delta \Delta
  (text-mode . prettify-symbols-mode)
  (LaTeX-mode . reftex-mode)

  ;; flyspell broken with latex in 6/2026 (freezes/hangs)
  (LaTeX-mode . (lambda () (flyspell-mode -1)))
  (LaTeX-mode . latex-mode)
  :mode ("\\.tex\\'" . latex-mode))
