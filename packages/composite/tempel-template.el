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

(jupyter "#+BEGIN_SRC jupyter-python :session py :async yes" n> r> n> "#+END_SRC" n n)
(jupyter-header "#+PROPERTY: header-args:jupyter-python :session py :async yes" n n)
(jupyter-html-preview ":display plain")

(title "#+title: " p n)
(cite "\\cite{" r "}")
(quote "#+begin_quote" n> r> n> "#+end_quote")
(example "#+begin_example" n> r> n> "#+end_example")
(center "#+begin_center" n> r> n> "#+end_center")
(comment "#+begin_comment" n> r> n> "#+end_comment")
(verse "#+begin_verse" n> r> n> "#+end_verse")
(src "#+begin_src " p n> r> n> "#+end_src" :post (org-edit-src-code))
(elisp "#+begin_src emacs-lisp" n> r> n "#+end_src" :post (org-edit-src-code))

;; Local Variables:
;; mode: lisp-data
;; outline-regexp: "[a-z]"
;; End:
