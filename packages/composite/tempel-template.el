;; ~/.config/emacs/templates

fundamental-mode ;; Available everywhere

(today (format-time-string "%Y-%m-%d"))


prog-mode

(fixme (if (derived-mode-p 'emacs-lisp-mode) ";; " comment-start) "FIXME ")
(todo (if (derived-mode-p 'emacs-lisp-mode) ";; " comment-start) "TODO ")
(bug (if (derived-mode-p 'emacs-lisp-mode) ";; " comment-start) "BUG ")
(hack (if (derived-mode-p 'emacs-lisp-mode) ";; " comment-start) "HACK ")


latex-mode

(begin "\\begin{" (s env) "}" r> n> "\\end{" (s env) "}")
(frac "\\frac{" p "}{" q "}")
(enumerate "\\begin{enumerate}\n\\item " r> n> "\\end{enumerate}")
(itemize "\\begin{itemize}\n\\item " r> n> "\\end{itemize}")


lisp-mode emacs-lisp-mode ;; Specify multiple modes

(lambda "(lambda (" p ")" n> r> ")")


emacs-lisp-mode

(header (insert-header))
(use-package "(use-package " p n> ":defer t" n> ":config" n> "(setq " q "))")

(autoload ";;;###autoload")
(pt "(point)")
(lambda "(lambda (" p ")" n> r> ")")
(var "(defvar " p "\n  \"" p "\")")
(local "(defvar-local " p "\n  \"" p "\")")
(const "(defconst " p "\n  \"" p "\")")
(custom "(defcustom " p "\n  \"" p "\"" n> ":type '" p ")")
(face "(defface " p " '((t :inherit " p "))\n  \"" p "\")")
(group "(defgroup " p " nil\n  \"" p "\"" n> ":group '" p n> ":prefix \"" p "-\")")
(macro "(defmacro " p " (" p ")\n  \"" p "\"" n> r> ")")
(alias "(defalias '" p " '" p ")")
(fun "(defun " p " (" p ")\n  \"" p "\"" n> r> ")")
(iflet "(if-let (" p ")" n> r> ")")
(whenlet "(when-let (" p ")" n> r> ")")
(iflet* "(if-let* (" p ")" n> r> ")")
(whenlet* "(when-let* (" p ")" n> r> ")")
(andlet* "(and-let* (" p ")" n> r> ")")
(cond "(cond" n "(" q "))" >)
(pcase "(pcase " (p "scrutinee") n "(" q "))" >)
(let "(let (" p ")" n> r> ")")
(let* "(let* (" p ")" n> r> ")")
(rec "(letrec (" p ")" n> r> ")")
(dotimes "(dotimes (" p ")" n> r> ")")
(dolist "(dolist (" p ")" n> r> ")")
(loop "(cl-loop for " p " in " p " do" n> r> ")")
(command "(defun " p " (" p ")\n  \"" p "\"" n> "(interactive" p ")" n> r> ")")
(advice "(defun " (p "adv" name) " (&rest app)" n> p n> "(apply app))" n>
        "(advice-add #'" (p "fun") " " (p ":around") " #'" (s name) ")")
(provide "(provide '" (file-name-base (or (buffer-file-name) (buffer-name))) ")" n
         ";;; " (file-name-nondirectory (or (buffer-file-name) (buffer-name))) " ends here" n)


eshell-mode

(for "for " (p "i") " in " p " { " q " }")
(while "while { " p " } { " q " }")
(until "until { " p " } { " q " }")
(if "if { " p " } { " q " }")
(ife "if { " p " } { " p " } { " q " }")
(unl "unless { " p " } { " q " }")
(unle "unless { " p " } { " p " } { " q " }")


org-mode

(jupyter-python "#+BEGIN_SRC jupyter-python :session py :async yes" n> r> n> "#+END_SRC" n n)
(jupyter-javascript "#+BEGIN_SRC jupyter-javascript :session js :async yes" n> r> n> "#+END_SRC" n n)
(jupyter-header-py "#+PROPERTY: header-args:jupyter-python :session py :async yes" n n
		   ;; "# Local Variables:" n "# electric-indent-mode: nil" n "# End:" nn
		   )
(jupyter-header-js "#+PROPERTY: header-args:jupyter-javascript :session js :async yes" n n)
(jupyter-html-preview ":display plain")

;; (title (make-string (length title) ?=) n (p "Title: " title) n (make-string (length title) ?=) n)(
(python-methods "\[x for x in dir(" p ") if not x.startswith('_')\]")
(python-header "#+PROPERTY: header-args :results output" n n)

;; (javascript-methods "console.log(Object.getOwnPropertyNames(" p "));")
(javascript-methods "console.log(Object.getOwnPropertyNames(" q ").filter(" n
		    "function (p) {" n
		    "return typeof Math[p] === 'function';" n
		    "}" n
		    "));")

(class "class " p "(" p "):" n> q)
(common-import-ddict "from collections import defaultdict")
(def_function "def " p "(" p "):" n> q)
(enumerate "for i, data" " in enumerate(" p "):" n> q)
(for "for " p " in " p ":" n> q)
(from "from " p " import " q)
(function_docstring "def " p "(" p "):" n> "\"\"\"" p "\"\"\"" n> q)
(help "help( " p ")")
(if "if " p ":" n> q)
(ife "if " p ":" n> p n> "else:" n> q)
(import "import " p q)
(init "def __init__(self" p "):" n> q)
(lambda "lambda " p ": " q)
(list "[" p " for " p " in " p "]")
(list_node "class ListNode():" n> "next = None" n n> "def __init__(self, data=None):" n> "self.data = data" n n q)
(logger_name "logger = logging.getLogger(__name__)")
(logging "logger = logging.getLogger(\"" p "\")" n> "logger.setLevel(logging." p ")")
(method "def " p "(self" p "):" n> q)
(pass "pass")
(print "print(" p ")")
(reg p " = re.compile(r\"" p "\")")
(__repr__ "def __repr__(self):" n> q)
(return "return " q)
(tree_node "class TreeNode():" n> "left = None" n> "right = None" n n> "def __init__(self, data=None):" n> "self.data = data" n n q)
(while "while " p ":" n> q)

(title "#+title: " p n)
(cite "\\cite{" r "}")
(quote "#+begin_quote" n> r> n> "#+end_quote")
(example "#+begin_example" n> r> n> "#+end_example")
(center "#+begin_center" n> r> n> "#+end_center")
(comment "#+begin_comment" n> r> n> "#+end_comment")
(verse "#+begin_verse" n> r> n> "#+end_verse")
(src "#+begin_src " p n> r> n> "#+end_src" :post (org-edit-src-code))
(elisp "#+begin_src emacs-lisp" n> r> n "#+end_src" :post (org-edit-src-code))


python-ts-mode
(def_function "def " p "(" p "):" n> q)

nix-ts-mode
(nix-direnv "# 1) save this as shell.nix" n
	    "# run in the same directory:" n
	    "# 2) echo \"use nix\" >> .envrc" n
	    "# 3) direnv allow" n
	    "echo \"use nix\" > .envrc && direnv allow" n n
	    
	    "{ pkgs ? import <nixpkgs> { } }:" n n
	    "pkgs.mkShell { packages = with pkgs; [ " q  " ]; }")

(nix-ld "with import <nixpkgs> { };" n
	"mkShell {" n
	"NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [ " q " ];" n
	"NIX_LD = lib.fileContents \"${stdenv.cc}/nix-support/dynamic-linker\";" n
	"}")

(nix-shell "with (import <nixpkgs> { });" n
	   "mkShell {" n>
	   "buildInputs = [ " q " ];" n
	   "}")

(nix-devshell "{" n>
	      "devShells.default = pkgs.mkShell {" n> >
	      "buildInputs = with pkgs; [ " q " ];" n>
	      "};" n
	      "}")

(nix-module "{ config, lib, ... }:" n n
	    "with lib;" n
	    "let" n>
	    "cfg = config.lab.module;" n>
	    "labcfg = config.lab;" n>
	    "in {" n n>
	    "options.lab.module = { enable = mkEnableOption \"Enables support for module\"; };" n n>
	    "config = mkIf (labcfg.enable && cfg.enable) {" n q n "};" n n
	    "}"
	    )


gdscript-mode
(def_function "func " p "(" p "):" n> q)

c-ts-mode
(include "#include <stdio.h>" n "#include <stdlib.h>" n)
(if "if (" p ") {" n> q ";" n "}")
(for "for (int i=" p "; i<" p "; i++) {" n> q n "}")
(while "while (" p ") {" n> q n "}")
(echo "printf(\"%d\\n\", " q ");")
(main "int main() {" n> q n "return 0;" n "}")
(struct "typedef struct " (s struct) " {" n> q n "} " (s struct) ";")
(malloc (s type) " *" p " = (" (s type)"*) malloc(" q " * sizeof(" (s type) "));")

just-mode
(just-default "default:" n>
	      "just --list" n n

	      "command var=\"default\":" n>
	      "command {{var}}" q)


;; Local Variables:
;; mode: lisp-data
;; outline-regexp: "[a-z]"
;; End:
