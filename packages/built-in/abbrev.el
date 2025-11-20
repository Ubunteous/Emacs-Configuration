;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               ABBREV               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Maybe use Dabbrev with Corfu! => don't, hippie is better
;; hippie can copy paths, lines and code structure like int foo(int a, int) with bar( and even from kill-ring
;; Dabbrev/hippie are called manually and read your buffer to find previous similar words to suggest completions
(use-package abbrev
  :ensure nil
  ;; Use C-x a <...> to find abbrev functions
  :general
  ;; Swap M-/ and C-M-/
  ("M-:" 'hippie-expand
   ;; "C-M-:" 'dabbrev-expand
   "M-/" 'eval-expression
   [remap dabbrev-expand] 'hippie-expand) ;; like (global-set-key [...] '...)
  :config
  (define-abbrev-table 'global-abbrev-table
	'(
	  ;; Progress
	  ("todo"  "TODO")
	  ("fixme" "FIXME")
	  ;; ("debug"  "DEBUG")
	  ;; ("done"  "DONE")

	  ;; Common english typos
	  ("accidentaly" "accidentally")
	  ("acheive" "achieve")
	  ("acknowlege" "acknowledge")
	  ("aknowledge" "acknowledge")
	  ("aquaintance" "acquaintance")
	  ("aquire" "acquire")
	  ("anually" "annually")
	  ("annualy" "annually")
	  ("aparent" "apparent")
	  ("begining" "beginning")
	  ("beleive" "believe")
	  ("buisness" "business")
	  ("cauhgt" "caught")
	  ("cemetary" "cemetery")
	  ("cheif" "chief")
	  ("colum" "column")
	  ("comming" "coming")
	  ("commited" "committed")
	  ("comitted" "committed")
	  ("comparsion" "comparison")
	  ("conceed" "concede")
	  ("consciencious" "conscientious")
	  ("concious" "conscious")
	  ("consious" "conscious")
	  ("concensus" "consensus")
	  ("decieve" "deceive")
	  ("defintion" "definition")
	  ("definitly" "definitely")
	  ("diffrence" "difference")
	  ("dilema" "dilemma")
	  ("dissapoint" "disappoint")
	  ("disasterous" "disastrous")
	  ("embarass" "embarrass")
	  ("excede" "exceed")
	  ("existance" "existence")
	  ("extreem" "extreme")
	  ("facinating" "fascinating")
	  ("foriegn" "foreign")
	  ("fourty" "forty")
	  ("freind" "friend")
	  ("fullfil" "fulfil")
	  ("guage" "gauge")
	  ("gratefull" "grateful")
	  ("greatful" "grateful")
	  ("garantee" "guarantee")
	  ("garentee" "guarantee")
	  ("garanty" "guarantee")
	  ("guidence" "guidance")
	  ("harrass" "harass")
	  ("heigth" "height")
	  ("heirarchy" "hierarchy")
	  ("hygene" "hygiene")
	  ("hiygeine" "hygiene")
	  ("hygeine" "hygiene")
	  ("ignorence" "ignorance")
	  ("immitate" "imitate")
	  ("imediately" "immediately")
	  ("independant" "independent")
	  ("indispensible" "indispensable")
	  ("inteligence" "intelligence")
	  ("libary" "library")
	  ("lisence" "license")
	  ("lightening" "lightning")
	  ("maintainance" "maintenance")
	  ("millenium" "millennium")
	  ("milennium" "millennium")
	  ("mischievious" "mischievous")
	  ("mispell" "misspell")
	  ("neccessary" "necessary")
	  ("necessery" "necessary")
	  ("nieghbor" "neighbour")
	  ("noticable" "noticeable")
	  ("occassion" "occasion")
	  ("occasionaly" "occasionally")
	  ("occassionally" "occasionally")
	  ("occurrance" "occurrence")
	  ("occurence" "occurrence")
	  ("occured" "occurred")
	  ("ommision" "omission")
	  ("omision" "omission")
	  ("orignal" "original")
	  ("outragous" "outrageous")
	  ("percieve" "perceive")
	  ("perseverence" "perseverance")
	  ("personel" "personnel – persone")
	  ("posession" "possession")
	  ("possesion" "possession")
	  ("preceed" "precede")
	  ("presance" "presence")
	  ("principal" "principle")
	  ("privelege" "privilege")
	  ("promiss" "promise")
	  ("pronounciation" "pronunciation")
	  ("publically" "publicly")
	  ("quarentine" "quarantine")
	  ("realy" "really")
	  ("recieve" "receive")
	  ("reciept" "receipt")
	  ("recomend" "recommend")
	  ("refered" "referred")
	  ("refrence" "reference")
	  ("relevent" "relevant")
	  ("rythm" "rhythm")
	  ("sieze" "seize")
	  ("seperate" "separate")
	  ("similer" "similar")
	  ("succesful" "successful")
	  ("sucessful" "successfull")
	  ("supercede" "supersede")
	  ("suprise" "surprise")
	  ("teh" "the")
	  ("tommorow" "tomorrow")
	  ("twelth" "twelfth")
	  ("tyrany" "tyranny")
	  ("underate" "underrate")
	  ("untill" "until")
	  ("visious" "vicious")
	  ("wat" "what")
	  ("wierd" "weird")
	  ("wether" "whether")
	  ("withold" "withhold")
	  ("writting" "writing")))

  ;; ;; define abbrev for specific major mode
  ;; (progn
  ;; 	(when (boundp 'go-mode-abbrev-table)
  ;;     (clear-abbrev-table go-mode-abbrev-table))
  ;; 	(define-abbrev-table 'go-mode-abbrev-table
  ;;     '(
  ;; 		("p" "fmt.Printf(\"%v\\n\", hh▮)")
  ;; 		("eq" "=="))))

  ;; (setq save-abbrevs nil) ;; save word abbrevs when file saved
  ;; (setq dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'"))
  :hook (prog-mode org-mode))

;; ;; Notes: alternative to tempel which leverages built-in tools
;; ;; Risk of issue if another ###<n>### is found in the file
;; ;; Also, perhaps a bit slow as it iterates from the document beginning
;; (defun abbrev--replace-placeholders ()
;;   "Replace placeholders ###1###, ###2###, ... with minibuffer input.
;; If ###@### is found, remove it and place point there at the end."
;;   (let ((cursor-pos nil))
;; 	(save-excursion
;; 	  (goto-char (point-min))
;; 	  (let ((loop 0)
;; 			(values (make-hash-table :test 'equal)))
;; 		(while (re-search-forward "###\\([0-9]+\\|@\\)###" nil t)
;; 		  (setq loop (1+ loop))
;; 		  (let* ((index (match-string 1))
;; 				 (start (match-beginning 0))
;; 				 (end (match-end 0)))
;; 			(cond
;; 			 ((string= index "@")
;; 			  (setq cursor-pos start)
;; 			  (delete-region start end))
;; 			 (t
;; 			  (let* ((key (format "###%s###" index))
;; 					 (val (or (gethash key values)
;; 							  (let ((input (read-string (format "Value for %s: " key))))
;; 								(puthash key input values)
;; 								input))))
;; 				(goto-char start)
;; 				(delete-region start end)
;; 				(insert val)
;; 				(goto-char (+ start (length val))))))))))
;; 	(when cursor-pos
;; 	  (goto-char cursor-pos))))

;; (define-abbrev-table 'global-abbrev-table
;;   '(
;; 	;; ORG
;; 	("ocb" "#+BEGIN_SRC @\n\n#+END_SRC"
;; 	 (lambda () (search-backward "@") (delete-char 1)))
;; 	("oheader" "#+TITLE: ###1###\n#+AUTHOR: ###2###\n#+EMAIL: ###3###\n#+OPTIONS: toc:nil\n"
;; 	 abbrev--replace-placeholders)

;; 	;; JS/TS snippets
;; 	("imp" "import { ###1### } from '###2###';"
;; 	 abbrev--replace-placeholders)
;; 	("fn" "function ###1### () {\n ###@### ;\n};"
;; 	 abbrev--replace-placeholders)
;; 	("clog" "console.log(\">>> LOG:\", { ###@### })"
;; 	 abbrev--replace-placeholders)
;; 	("cwarn" "console.warn(\">>> WARN:\", { ###@### })"
;; 	 abbrev--replace-placeholders)
;; 	("cerr" "console.error(\">>> ERR:\", { ###@### })"
;; 	 abbrev--replace-placeholders)
;; 	("afn" "async function() {\n  \n}"
;; 	 (lambda () (search-backward "}") (forward-line -1) (end-of-line)))
;; 	("ife" "(function() {\n  \n})();"
;; 	 (lambda () (search-backward ")();") (forward-line -1) (end-of-line)))
;; 	("esdeps" "// eslint-disable-next-line react-hooks/exhaustive-deps"
;; 	 (lambda () (search-backward ")();") (forward-line -1) (end-of-line)))
;; 	("eshooks" "// eslint-disable-next-line react-hooks/rules-of-hooks"
;; 	 (lambda () (search-backward ")();") (forward-line -1) (end-of-line)))
;; 	))
