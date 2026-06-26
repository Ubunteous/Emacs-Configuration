;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     PROGRAMMING LANGUAGE: LaTeX    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package auctex
  :ensure nil ; installed via nix
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
  :custom-face
  ;; :set-face-foreground 'font-latex-sedate-face "#66d9ee") ; unknown keywords
  (font-latex-sedate-face ((t (:foreground "#66d9ee")))) ; unknown keywords
  ;; LaTeX and latex modes are the same
  ;; :mode ("\\.tex\\'" . LaTeX-mode) ; or latex-mode

  ;; somehow, putting rubbish makes TeX-command available
  ;; (but the following becomes necessary at file bottom - except in master):
  ;; %%% Local Variables:
  ;; %%% mode: latex
  ;; %%% TeX-master: "master file name without extension"
  ;; %%% End:
  :mode ("\\.tex\\'" . rubbish-here)
  :config
  ;; to avoid triggering prompts every time a file is opened
  (add-to-list 'safe-local-variable-values '(TeX-view-program-list . '("Evince" "evince 'output/Oeuvres à Découvrir.pdf'")))
  (add-to-list 'safe-local-variable-values '(LaTeX-command . "latex -jobname 'Oeuvres à Découvrir' -output-directory ./output"))

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

  (defun latex-compile ()
	"Save file and compile with pdf LaTeX."
	(interactive)
	(save-buffer)
	(TeX-command "LaTeX" 'TeX-master-file))
  :general (:keymaps 'LaTeX-mode-map
					 "C-c s" 'latex-compile)
  :hook
  ;; ((visual-line-mode math-mode) . LaTeX-mode)

  ;; for latex (greek chars as unicode) \delta \Delta
  (text-mode . prettify-symbols-mode)
  (LaTeX-mode . reftex-mode)

  ;; flyspell broken with latex in 6/2026 (freezes/hangs)
  (LaTeX-mode . (lambda () (flyspell-mode -1))))
