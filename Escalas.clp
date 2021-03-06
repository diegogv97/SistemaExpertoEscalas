
;;;======================================================
;;;   Sistema experto para el estudio de Escalas
;;;       Proyecto II de Inteligencia Artifical, ITCR
;;;     EL usuario usa una bolsa de bolitas numeradas
;;;     del 1 al 24, segun el numero, el sistema 
;;;     indica la esacala musical a estudiar.
;;;   Desarrollado en CLIPS Version 6.3 E
;;;
;;;     Para ejecutar, solo load, reset y run.
;;;======================================================

;;****************
;;* DEFFUNCTIONS *
;;****************

(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)


;;;***************
;;;* QUERY RULES *
;;;***************

(defrule get-ball-value ""
   (not (response ?))
   (not (major-scale  ?))
   (not (minor-scale  ?))
   (not (scale  ?))
   =>
   (assert (ball-value
      (ask-question "Ingrese el numero de l bolita. (1-24): "
                    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18  19 20 21 22 23 24))
   )
)

(defrule 5-7-ballValueQuestion ""
   (ball-value ?number)
   (test (<= ?number 7))
   (test (<= 5 ?number))
   =>
   (assert (sharp-or-flat
      (ask-question "¿Desea la escala en sostenidos o bemoles? : "
                    sostenidos bemoles))
   )
)

(defrule 17-19-ballValueQuestion ""
   (ball-value ?number)
   (test (<= ?number 19))
   (test (<= 17 ?number))
   =>
   (assert (sharp-or-flat
      (ask-question "¿Desea la escala en sostenidos o bemoles? : "
                    sostenidos bemoles))
   )
)
;;;****************
;;;* BALL RULES *
;;;****************


;;;****************
;;;*   balls 1-4  *
;;;****************


(defrule get-ball-value-1 ""
   (ball-value 1)
   (not (response ?))
   =>
   (assert (response "La bolita es 1"))
   (assert (major-scale yes))
   (assert (minor-scale no))
   (assert (scale "Sol"))
)

(defrule get-ball-value-2 ""
   (ball-value 2)
   (not (response ?))
   =>
   (assert (response "La bolita es 2"))
   (assert (major-scale yes))
   (assert (minor-scale no))
   (assert (scale "Re"))
)

(defrule get-ball-value-3 ""
   (ball-value 3)
   (not (response ?))
   =>
   (assert (response "La bolita es 3"))
   (assert (major-scale yes))
   (assert (minor-scale no))
   (assert (scale "La"))
)

(defrule get-ball-value-4 ""
   (ball-value 4)
   (not (response ?))
   =>
   (assert (response "La bolita es 4"))
   (assert (major-scale yes))
   (assert (minor-scale no))   
   (assert (scale "Mi"))
)

;;;****************
;;;*  balls 5-7   *
;;;****************


(defrule get-ball-value-5-sharp ""
   (ball-value 5)
   (sharp-or-flat sostenidos)
   (not (response ?))
   =>
   (assert (response "La bolita es 5"))
   (assert (major-scale yes))
   (assert (minor-scale no))
   (assert (scale "Si"))
)

(defrule get-ball-value-6-sharp ""
   (ball-value 6)
   (sharp-or-flat sostenidos)
   (not (response ?))
   =>
   (assert (response "La bolita es 6"))
   (assert (major-scale yes))
   (assert (minor-scale no))
   (assert (scale "Fa sostenido"))
)

(defrule get-ball-value-7-sharp ""
   (ball-value 7)
   (sharp-or-flat sostenidos)
   (not (response ?))
   =>
   (assert (response "La bolita es 7"))
   (assert (major-scale yes))
   (assert (minor-scale no))
   (assert (scale "Do sostenido"))
)

(defrule get-ball-value-5-flat ""
   (ball-value 5)
   (sharp-or-flat bemoles)
   (not (response ?))
   =>
   (assert (calc5-7 (- 12 5)))
   (assert (response "La bolita es 5"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-6-flat ""
   (ball-value 6)
   (sharp-or-flat bemoles)
   (not (response ?))
   =>
   (assert (calc5-7 (- 12 6)))
   (assert (response "La bolita es 6"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-7-flat ""
   (ball-value 7)
   (sharp-or-flat bemoles)
   (not (response ?))
   =>
   (assert (calc5-7 (- 12 7)))
   (assert (response "La bolita es 7"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule getScale5 ""
  (calc5-7 7)
  (ball-value ?)
  (response ?)
   =>
   (assert (scale "Do bemol"))
)

(defrule getScale6 ""
  (calc5-7 6)
  (ball-value ?)
  (response ?)
   =>
   (assert (scale "Sol bemol"))
)

(defrule getScale7 ""
  (calc5-7 5)
  (ball-value ?)
  (response ?)
   =>
   (assert (scale "Re bemol"))
)


;;;****************
;;;*  balls 8-11  *
;;;****************
(defrule get-ball-value-8 ""
   (ball-value 8)
   (not (response ?))
   (not (response ?))
   =>
   (assert (calc8-11 (- 12 8)))
   (assert (response "La bolita es 8"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-9 ""
   (ball-value 9)
   (not (response ?))
   =>
   (assert (calc8-11 (- 12 9)))
   (assert (response "La bolita es 9"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-10 ""
   (ball-value 10)
   (not (response ?))
   =>
   (assert (calc8-11 (- 12 10)))
   (assert (response "La bolita es 10"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-11 ""
   (ball-value 11)
   (not (response ?))
   =>
   (assert (calc8-11 (- 12 11)))
   (assert (response "La bolita es 11"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule getScale8 ""
  (calc8-11 4)
  (ball-value ?)
  (response ?)
   =>
   (assert (scale "La bemol"))
)

(defrule getScale9 ""
  (calc8-11 3)
  (ball-value ?)
  (response ?)
   =>
   (assert (scale "Mi bemol"))
)

(defrule getScale10 ""
  (calc8-11 2)
  (ball-value ?)
  (response ?)
   =>
   (assert (scale "Si bemol"))
)

(defrule getScale11 ""
  (calc8-11 1)
  (ball-value ?)
  (response ?)
   =>
   (assert (scale "Fa"))
)

;;;****************
;;;*   ball 12    *
;;;****************

(defrule get-ball-value-12 ""
   (ball-value 12)
   (not (response ?))
   =>
   (assert (response "La bolita es 12"))
   (assert (major-scale yes))
   (assert (minor-scale no))   
   (assert (scale "Do"))
)

;;;****************
;;;* balls 13-23  *
;;;****************

(defrule get-ball-value-13 ""
   (ball-value 13)
   (not (response ?))
   =>
   (assert (response "La bolita es 13"))
   (assert (calc13-23 (- 13 12)))
   (assert (major-scale no))
   (assert (minor-scale yes))   
   (assert (sharp-or-flat sostenidos))
)

(defrule getScale13 ""
  (calc13-23 1)
  (ball-value ?)
  (response ?)
   =>
   (assert (relative G))
)

(defrule get-ball-value-14 ""
   (ball-value 14)
   (not (response ?))
   =>
   (assert (response "La bolita es 14"))
   (assert (calc13-23 (- 14 12)))
   (assert (major-scale no))
   (assert (minor-scale yes))  
   (assert (sharp-or-flat sostenidos))
)

(defrule getScale14 ""
  (calc13-23 2)
  (ball-value ?)
  (response ?)
   =>
   (assert (relative D))
)

(defrule get-ball-value-15 ""
   (ball-value 15)
   (not (response ?))
   =>
   (assert (response "La bolita es 15"))
   (assert (calc13-23 (- 15 12)))
   (assert (major-scale no))
   (assert (minor-scale yes))   
   (assert (sharp-or-flat sostenidos))  
)

(defrule getScale15 ""
  (calc13-23 3)
  (ball-value ?)
  (response ?)
   =>
   (assert (relative A))
)

(defrule get-ball-value-16 ""
   (ball-value 16)
   (not (response ?))
   =>
   (assert (response "La bolita es 16"))
   (assert (calc13-23 (- 16 12)))
   (assert (major-scale no))
   (assert (minor-scale yes))  
   (assert (sharp-or-flat sostenidos))   
)

(defrule getScale16 ""
  (calc13-23 4)
  (ball-value ?)
  (response ?)
   =>
   (assert (relative E))
)


(defrule get-ball-value-17-sharp ""
   (ball-value 17)
   (sharp-or-flat sostenidos)
   (not (response ?))
   =>
   (assert (response "La bolita es 17"))
   (assert (calc13-23 (- 17 12)))
   (assert (major-scale no))
   (assert (minor-scale yes))
)

(defrule getScale17S ""
  (calc13-23 5)
  (ball-value ?)
  (response ?)
   =>
   (assert (20-23-balls no))
   (assert (relative B))
)

(defrule get-ball-value-17-flat ""
   (ball-value 17)
   (sharp-or-flat bemoles)
   (not (response ?))
   =>
   (assert (calc17-19 (- 12 (- 17 12))))
   (assert (response "La bolita es 17"))
   (assert (major-scale no))
   (assert (minor-scale yes))
)

(defrule getScale17F ""
  (calc17-19 7)
  (ball-value ?)
  (response ?)
   =>
   (assert (20-23-balls no))
   (assert (relative C))
)

(defrule get-ball-value-18-sharp ""
   (ball-value 18)
   (sharp-or-flat sostenidos)
   (not (response ?))
   =>
   (assert (response "La bolita es 18"))
   (assert (calc13-23 (- 18 12)))
   (assert (major-scale no))
   (assert (minor-scale yes))
)

(defrule getScale18S ""
  (calc13-23 6)
  (ball-value ?)
  (response ?)
   =>
   (assert (20-23-balls no))
   (assert (relative F))
)

(defrule get-ball-value-18-flat ""
   (ball-value 18)
   (sharp-or-flat bemoles)
   (not (response ?))
   =>
   (assert (calc17-19 (- 12(- 18 12))))
   (assert (response "La bolita es 18"))
   (assert (major-scale no))
   (assert (minor-scale yes))
)

(defrule getScale18F ""
  (calc17-19 6)
  (ball-value ?)
  (response ?)
   =>
   (assert (20-23-balls no))
   (assert (relative G))
)

(defrule get-ball-value-19-sharp ""
   (ball-value 19)
   (sharp-or-flat sostenidos)
   (not (response ?))
   =>
   (assert (response "La bolita es 19"))
   (assert (calc13-23 (- 19 12)))
   (assert (major-scale no))
   (assert (minor-scale yes))
)

(defrule getScale19S ""
  (calc13-23 7)
  (ball-value ?)
  (response ?)
   =>
   (assert (20-23-balls no))
   (assert (relative C))
)

(defrule get-ball-value-19-flat ""
   (ball-value 19)
   (sharp-or-flat bemoles)
   (not (response ?))
   =>
   (assert (calc17-19 (- 12(- 19 12))))
   (assert (response "La bolita es 19"))
   (assert (major-scale no))
   (assert (minor-scale yes))
)

(defrule getScale19F ""
  (calc17-19 5)
  (ball-value ?)
  (response ?)
   =>
   (assert (20-23-balls no))
   (assert (relative D))
)

(defrule get-ball-value-20 ""
   (ball-value 20)
   (not (response ?))
   =>
   (assert (response "La bolita es 20"))
   (assert (calc20-23  (- 12 (- 20 12))))
   (assert (major-scale no))
   (assert (minor-scale yes)) 
   (assert (sharp-or-flat bemoles))  
)

(defrule getScale20 ""
  (calc20-23 4)
  (ball-value ?)
  (response ?)
   =>
   (assert (relative A))
   (assert (20-23-balls yes))
)

(defrule get-ball-value-21 ""
   (ball-value 21)
   (not (response ?))
   =>
   (assert (response "La bolita es 21"))
   (assert (calc20-23  (- 12 (- 21 12))))
   (assert (major-scale no))
   (assert (minor-scale yes)) 
   (assert (sharp-or-flat bemoles))  
)

(defrule getScale21 ""
  (calc20-23 3)
  (ball-value ?)
  (response ?)
   =>
   (assert (relative E))
   (assert (20-23-balls yes))
)

(defrule get-ball-value-22 ""
   (ball-value 22)
   (not (response ?))
   =>
   (assert (response "La bolita es 22"))
   (assert (calc20-23 (- 12 (- 22 12))))
   (assert (major-scale no))
   (assert (minor-scale yes)) 
   (assert (sharp-or-flat bemoles)) 
)

(defrule getScale22 ""
  (calc20-23 2)
  (ball-value ?)
  (response ?)
   =>
   (assert (relative B))
   (assert (20-23-balls yes))
)

(defrule get-ball-value-23 ""
   (ball-value 23)
   (not (response ?))
   =>
   (assert (response "La bolita es 23"))
   (assert (calc20-23 (- 12 (- 23 12))))
   (assert (major-scale no))
   (assert (minor-scale yes)) 
   (assert (sharp-or-flat bemoles)) 
)

(defrule getScale23 ""
  (calc20-23 1)
  (ball-value ?)
  (response ?)
   =>
   (assert (relative F))
   (assert (20-23-balls yes))
)


;;;****************
;;;* ball  24     *
;;;****************

(defrule get-ball-value-24 ""
   (ball-value 24)
   (not (response ?))
   =>
   (assert (response "La bolita es 24"))
   (assert (major-scale no))
   (assert (minor-scale yes)) 
   (assert (scale "La"))
   (assert (frontier yes))
)



;;;****************
;;;*minor relative*
;;;*     rules    *
;;;****************

(defrule scale-C ""
   (relative C)
   (response ?)
   =>
   (assert (scale "La"))
   (assert (frontier yes))
)

(defrule scale-D ""
   (relative D)
   (response ?)
   =>
   (assert (scale "Si"))
   (assert (frontier yes))
)

(defrule scale-E ""
   (relative E)
   (response ?)
   =>
   (assert (scale "Do"))
   (assert (frontier no))
)

(defrule scale-F ""
   (relative F)
   (response ?)
   =>
   (assert (scale "Re"))
   (assert (frontier yes))
)

(defrule scale-G ""
   (relative G)
   (response ?)
   =>
   (assert (scale "Mi"))
   (assert (frontier yes))
)

(defrule scale-A ""
   (relative A)
   (response ?)
   =>
   (assert (scale "Fa"))
   (assert (frontier no))
)

(defrule scale-B ""
   (relative B)
   (response ?)
   =>
   (assert (scale "Sol"))
   (assert (frontier no))
)

;;;********************************
;;;* STARTUP AND CONCLUSION RULES *
;;;********************************

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "Proyecto de IA 2: Sistema Experto")
  (printout t crlf crlf))

(defrule print-response-Major ""
  (declare (salience 10))
  (response ?)
  (major-scale yes)
  (scale       ?scale)
  =>
  (printout t crlf crlf)
  (format t " Escala:  %s Mayor %n%n%n " ?scale)
)

(defrule print-response-Minor-YesFrontier ""
  (declare (salience 10))
  (minor-scale yes)
  (scale       ?scale)
  (frontier yes)
  (not (20-23-balls ?))
  =>
  (printout t crlf crlf)
  (format t " Escala:  %s Menor %n%n%n " ?scale)
)

(defrule print-response-Minor-NoFrontierSharp ""
  (declare (salience 10))
  (minor-scale yes)
  (scale       ?scale)
  (frontier no)
  (sharp-or-flat sostenidos)
  =>
  (printout t crlf crlf)
  (format t " Escala:  %s Sostenido Menor %n%n%n " ?scale)
)

(defrule print-response-Minor-NoFrontierFlat ""
  (declare (salience 10))
  (minor-scale yes)
  (scale       ?scale)
  (frontier no)
  (sharp-or-flat bemoles)
  (20-23-balls yes)
  =>
    (printout t crlf crlf)
    (format t " Escala:  %s Menor %n%n%n " ?scale)
)

(defrule print-response-Minor-NoFrontierFlat1 ""
  (declare (salience 10))
  (minor-scale yes)
  (scale       ?scale)
  (frontier yes)
  (sharp-or-flat bemoles)
  (20-23-balls yes)
  =>
    (printout t crlf crlf)
    (format t " Escala:  %s Menor %n%n%n " ?scale)
)

(defrule print-response-Minor-yesFrontierFlat2 ""
  (declare (salience 10))
  (minor-scale yes)
  (scale       ?scale)
  (frontier yes)
  (sharp-or-flat bemoles)
  (20-23-balls no)
  =>
    (printout t crlf crlf)
    (format t " Escala:  %s Bemol Menor %n%n%n " ?scale)
)

(defrule print-response-Minor-yesFrontiersharp ""
  (declare (salience 10))
  (minor-scale yes)
  (scale       ?scale)
  (frontier yes)
  (sharp-or-flat sostenidos)
  (20-23-balls no)
  =>
    (printout t crlf crlf)
    (format t " Escala:  %s Sostenido Menor %n%n%n " ?scale)
)