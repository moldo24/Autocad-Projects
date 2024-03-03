(defun c:ajax()
  (setq lineSet(ssget (list(cons 0 "LINE"))));crearea unui set de linii si ignorarea tuturor formelor in afara de linie
  (setq count 0); alegerea unui contor pe 0
  (repeat (sslength lineSet);repeta si returneaza numarul de entitati disponibile din setul de selectie
    (setq eachLine(ssname lineSet count))
    (setq lineData(entget eachLine))
    (setq colorCode(cdr(assoc 62 lineData)));grupul de coduri(62 coduri de culori)
    (print (strcat "Line Color Code is " (itoa colorCode)));returneaza culoarea fiecarei linii si o printeaza pentru testare
    (if (= colorCode 3);daca culoarea linii este verde 
      (progn;evalueaza secvential fiecare expresie si returneaza valoarea ultimei expresii
	(setq colorCode(subst (cons 62 2) (assoc 62 lineData) lineData))
	(entmod colorCode);modifica culoarea liniei in galben
      )
    )
    (setq count(+ count(+ count 1))
  )
)    
	
  )