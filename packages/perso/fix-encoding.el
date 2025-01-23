;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            FIX-ENCODING            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fix-encoding ()
  "Replaces incorrect characters by their UTF-8 equivalent."
  (interactive)

  (let ((pmin (point-min))
	(pmax (point-max)))
    (replace-string "Ã " "à" nil (pmin) (pmax))
    (replace-string "Ã©" "é" nil (pmin) (pmax))
    (replace-string "Ãª" "ê" nil (pmin) (pmax))
    (replace-string "Ã¨" "è" nil (pmin) (pmax))))
