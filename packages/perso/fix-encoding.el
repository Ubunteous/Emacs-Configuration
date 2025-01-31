;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            FIX-ENCODING            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fix-encoding ()
  "Replaces incorrect characters by their UTF-8 equivalent."
  (interactive)
  (let ((pmin (point-min))
	(pmax (point-max)))
    (replace-string "Ã¢" "â" nil pmin pmax)
    (replace-string "�" "â" nil pmin pmax)
    (replace-string "Ã " "à" nil pmin pmax)
    (replace-string "�" "à" nil pmin pmax)
    (replace-string "Ã§" "ç" nil pmin pmax)
    (replace-string "�" "ç" nil pmin pmax)
    (replace-string "Ã©" "é" nil pmin pmax)
    (replace-string "�" "é" nil pmin pmax)
    (replace-string "Ãª" "ê" nil pmin pmax)
    (replace-string "�" "ê" nil pmin pmax)
    (replace-string "Ã¨" "è" nil pmin pmax)
    (replace-string "�" "è" nil pmin pmax)
    (replace-string "Ã®" "î" nil pmin pmax)
    (replace-string "�" "î" nil pmin pmax)
    (replace-string "Ã´" "ô" nil pmin pmax)
    (replace-string "Ã¹" "ù" nil pmin pmax)
    (replace-string "�" "ù" nil pmin pmax)
    (replace-string "û" "û" nil pmin pmax)))
