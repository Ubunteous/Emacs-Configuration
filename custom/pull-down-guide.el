;;; use-package --- Summary
;;; Commentary:
;;; Code:

(easy-menu-define custom-menu global-map
  "Guide"
  '("Guide"

    
    ("Basics"
     ["Save Buffer" save-buffer]
     ["Open/Find File" find-file]
     ["Use from Menu Bar" tmm-menubar]
     ["iSearch Forward" isearch-forward]
     ["View mode" view-mode]
     ["dired omit files toggle" omit-mode]
     ["Query Replace" query-replace]
     ["Keyboard Quit" keyboard-quit]
     ["M-x compile" compile]
     ["M-x recompile (g)" recompile]
     ["M-x shell" shell]
     ["M-x named shell (C-u M-x)" execute-extended-command]
     ["M-x shell command on region" shell-command-on-region]
     ["Move beginning buffer" beginning-of-buffer]
     ["Move end buffer" end-of-buffer]
     ["Scroll other Window" scroll-other-window]
     ["Recenter top-bottom" recenter-top-bottom]
     ["Wrap Text/Fill paragraph" fill-paragraph]
     ["Set fill column" set-fill-column]
     ["Recover File" recover-this-file]
     ["Escape^3" keyboard-escape-quit]
     ["Save Buffers Kill Terminal" save-buffers-kill-terminal])


    ("Version Control"
     ["vc-diff" vc-diff]
     ["vc-revision-other-window" vc-revision-other-window]
     ["vc-annotate" vc-annotate]
     ["vc-print-log" vc-print-log])

    
    ("Windows"
     ["Delete window" delete-window]
     ["Delete other windows" delete-other-windows]
     ["Split window below" split-window-below]
     ["Split window right" split-window-right]
     ["window-swap-states" window-swap-states])

    
    ("Move"
     ["move-beginning-of-line" move-beginning-of-line]
     ["move-end-of-line" move-end-of-line]
     [" " 'ignore]
     ["next-line" next-line]
     ["previous-line" previous-line]
     [" " 'ignore]
     ["forward-char" forward-char]
     ["forward-line" forward-line]
     ["forward-page" forward-page]
     ["forward-sexp" forward-sexp]
     ["forward-word" forward-word]
     ["forward-symbol" forward-symbol]
     ["forward-to-word" forward-to-word]
     ["forward-sentence" forward-sentence]
     ["forward-paragraph" forward-paragraph]
     ["forward-whitespace" forward-whitespace]
     [" " 'ignore]
     ["backward-char" backward-char]
     ["backward-line" backward-line]
     ["backward-page" backward-page]
     ["backward-sexp" backward-sexp]
     ["backward-word" backward-word]
     ["backward-symbol" backward-symbol]
     ["backward-to-word" backward-to-word]
     ["backward-sentence" backward-sentence]
     ["backward-paragraph" backward-paragraph]
     ["backward-whitespace" backward-whitespace]
     [" " 'ignore])

    
    ("Select & Kill"
     ["Set Mark" set-mark-command]
     ["Mark Whole Buffer" mark-whole-buffer]
     ["Mark Paragraph" mark-paragraph]
     ["Kill Region" kill-region]
     ["Kill Ring Save" kill-ring-save]
     ["Delete Char" delete-char]
     ["Kill Word" kill-word]
     ["Kill Line" kill-line]
     ["Kill Sentence" kill-sentence]
     ["Yank" yank]
     ["Kill Sexp" kill-sexp]
     ["backward-kill-sexp" backward-kill-sexp]
     ["backward-kill-word" backward-kill-word]
     ["backward-kill-sentence" backward-kill-sentence]
     ["backward-kill-paragraph" backward-kill-paragraph])


    ("Describe+"
     ["Command History" view-lossage]
     ["Key" describe-key]
     ["Mode" describe-mode]
     ["Function" describe-function]
     ["Variable" describe-variable]
     ["Face" describe-face]
     ["Describe Package" describe-package]
     ["Command Bindings" where-is]
     ["Describe Symbol (at point)" describe-symbol]
     ["Find Library" find-library]
     ["Safe Find Library" safe-find-library]
     ["<Prefix> C-h to show bindings" 'ignore]
     ["More Help" help-for-help]
     ["Tutorial" help-with-tutorial])

    
    ("Apropos"
     ["Default" apropos]
     ["Command" apropos-command]
     ["Documentation" apropos-documentation]
     ["Library" apropos-library]
     ["User Option" apropos-user-option]
     ["Value" apropos-value])

    
    ("Occur"
     ["occur" occur]
     ["occur-mode" occur-mode]
     ["occur-next" occur-next]
     ["occur-prev" occur-prev]
     ["occur-edit-mode" occur-edit-mode]
     ["occur-cease-edit" occur-cease-edit]
     ["occur-next-error" occur-next-error]
     ["occur-mode-goto-occurrence" occur-mode-goto-occurrence]
     ["occur-mode-display-occurrence" occur-mode-display-occurrence]
     ["occur-mode-occurrence-other-window" occur-mode-occurrence-other-window])

    
    ("Bookmarks"
     ["bookmark-set" bookmark-set]
     ["bookmark-save" bookmark-save]
     ["bookmark-jump" bookmark-jump]
     ["bookmark-load" bookmark-load]
     ["bookmark-menu" bookmark-menu]
     ["bookmark-write" bookmark-write]
     ["edit-bookmarks" edit-bookmarks]
     ["list-bookmarks" list-bookmarks]
     ["bookmark-delete" bookmark-delete]
     ["bookmark-insert" bookmark-insert]
     ["bookmark-locate" bookmark-locate])

    
    ("Registers"
     ["view-register" view-register]
     ["list-registers" list-registers]
     ["insert-register" insert-register]
     ["copy-to-register" copy-to-register]
     ["jump-to-register" jump-to-register]
     ["point-to-register" point-to-register]
     ["register-to-point" register-to-point]
     ["append-to-register" append-to-register]
     ["prepend-to-register" prepend-to-register]
     ["copy-rectangle-to-register" copy-rectangle-to-register])

    
    ("Macros"
     ["kmacro-cycle-ring-next" kmacro-cycle-ring-next]
     ["kbd-macro-query" kbd-macro-query]
     ["edit-kbd-macro" edit-kbd-macro]
     ["kmacro-end-macro" kmacro-end-macro]
     ["kmacro-end-macro" kmacro-end-macro]
     ["kmacro-swap-ring" kmacro-swap-ring]
     ["kmacro-edit-macro" kmacro-edit-macro]
     ["kmacro-set-format" kmacro-set-format]
     ["kmacro-add-counter" kmacro-add-counter]
     ["kmacro-bind-to-key" kmacro-bind-to-key]
     ["kmacro-set-counter" kmacro-set-counter]
     ["kmacro-start-macro" kmacro-start-macro]
     ["kmacro-to-register" kmacro-to-register]
     ["kmacro-edit-lossage" kmacro-edit-lossage]
     ["kmacro-insert-counter" kmacro-insert-counter]
     ["kmacro-name-last-macro" kmacro-name-last-macro]
     ["kmacro-step-edit-macro" kmacro-step-edit-macro]
     ["kmacro-delete-ring-head" kmacro-delete-ring-head]
     ["kmacro-delete-ring-head" kmacro-delete-ring-head]
     ["kmacro-edit-macro-repeat" kmacro-edit-macro-repeat]
     ["kmacro-end-or-call-macro" kmacro-end-or-call-macro]
     ["kmacro-view-macro-repeat" kmacro-view-macro-repeat]
     ["kmacro-end-and-call-macro" kmacro-end-and-call-macro]
     ["kmacro-cycle-ring-previous" kmacro-cycle-ring-previous]
     ["kmacro-call-ring-2nd-repeat" kmacro-call-ring-2nd-repeat]
     ["kmacro-end-or-call-macro-repeat" kmacro-end-or-call-macro-repeat]
     ["kmacro-start-macro-or-insert-counter" kmacro-start-macro-or-insert-counter]
     ["kbd-macro-query" kbd-macro-query]
     ["end-kbd-macro" end-kbd-macro]
     ["edit-kbd-macro" edit-kbd-macro]
     ["read-kbd-macro" read-kbd-macro]
     ["start-kbd-macro" start-kbd-macro]
     ["insert-kbd-macro" insert-kbd-macro]
     ["defining-kbd-macro" defining-kbd-macro]
     ["call-last-kbd-macro" call-last-kbd-macro]
     ["edit-last-kbd-macro" edit-last-kbd-macro]
     ["name-last-kbd-macro" name-last-kbd-macro])

    
    ("Emacs Lisp"
     ["eval buffer" eval-buffer]
     ["eval region" eval-region]
     ["!!! def not reevaluated" 'ignore])

    
    ("Customize"
     ["Default" customize]
     ["Browse" customize-browse]
     ["Customized" customize-customized]
     ["Changed" customize-changed]
     ["Face" customize-face ]
     ["Group" customize-group]
     ["Mode" customize-mode]
     ["Saved" customize-saved]
     ["Themes" customize-themes])

    
    ("Themes"
     ["Spacemacs Theme" 'ignore]
     ["Monokai Theme" 'ignore]
     ["Sublime Theme" 'ignore]
     ["Kaolin Theme" 'ignore])

    ("Advanced Tools"
     ["Occur Mode" 'ignore]
     ["re-builder" 'ignore]
     ["Hydra" 'ignore]
     ["Completion Families: ivy, selectrum" 'ignore]
     ["eshell" 'ignore])
    )
  )

;;; pull-down-guide ends here
