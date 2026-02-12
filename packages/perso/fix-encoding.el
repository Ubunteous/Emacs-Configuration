;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            FIX-ENCODING            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun convert-ansi-encoding-to-utf8 ()
  ;; windows-1252-dos/iso-latin-1-dos > utf-8
  (interactive)
  (let ((ansi-to-unix-encoding '(
								 ("É" "Ã‰") ;; 311 E aigu
								 ("à" "Ã ") ;; 340 a grave
								 ("è" "Ã¨") ;; 350 e grave
								 ("é" "Ã©") ;; 351 e aigu
								 ("ê" "Ãª") ;; 352 e circonflexe
								 ("î" "Ã®") ;; 356 i circonflexe
								 ("ô" "Ã´") ;; 364 o circonflexe
								 ("ù" "Ã¹") ;; 371 u grave
								 ("’" "'") ;; 222 apostrophe
								 ("–" "â€“") ;; 226 dash
								 ("°" "Â°") ;; 260 numÃ©ro
								 )))
	(mapcar
	 (lambda (pair) (funcall #'replace-string (car pair) (cdr pair) nil (point-min) (point-max)))
	 ansi-to-unix-encoding)))
