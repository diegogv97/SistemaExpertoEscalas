
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     To execute, merely load, reset and run.
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
   =>
   (assert (ball-value
      (ask-question "Ingrese el numero de l bolita. (1-24): "
                    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18  19 20 21 22 23 24))))


;;;****************
;;;* REPAIR RULES *
;;;****************


(defrule get-ball-value-1 ""
   (ball-value 1)
   (not (response ?))
   =>
   (assert (response "La bolita es 1"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-2 ""
   (ball-value 2)
   (not (response ?))
   =>
   (assert (response "La bolita es 2"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-3 ""
   (ball-value 3)
   (not (response ?))
   =>
   (assert (response "La bolita es 3"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-4 ""
   (ball-value 4)
   (not (response ?))
   =>
   (assert (response "La bolita es 4"))
   (assert (major-scale yes))
   (assert (minor-scale no))   
)

(defrule get-ball-value-5 ""
   (ball-value 5)
   (not (response ?))
   =>
   (assert (response "La bolita es 5"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-6 ""
   (ball-value 6)
   (not (response ?))
   =>
   (assert (response "La bolita es 6"))
   (assert (major-scale yes))
   (assert (minor-scale no))   
)

(defrule get-ball-value-7 ""
   (ball-value 7)
   (not (response ?))
   =>
   (assert (response "La bolita es 7"))
   (assert (major-scale yes))
   (assert (minor-scale no))   
)

(defrule get-ball-value-8 ""
   (ball-value 8)
   (not (response ?))
   =>
   (assert (response "La bolita es 8"))
   (assert (major-scale yes))
   (assert (minor-scale no))
)

(defrule get-ball-value-9 ""
   (ball-value 9)
   (not (response ?))
   =>
   (assert (response "La bolita es 9")) 
   (assert (major-scale yes))
   (assert (minor-scale no))
  
)

(defrule get-ball-value-10 ""
(ball-value 10)
   (not (response ?))
   =>
   (assert (response "La bolita es 10"))
   (assert (major-scale yes))
   (assert (minor-scale no))   
)

(defrule get-ball-value-11 ""
   (ball-value 11)
   (not (response ?))
   =>
   (assert (response "La bolita es 11"))
   (assert (major-scale yes))
   (assert (minor-scale no))   
)

(defrule get-ball-value-12 ""
   (ball-value 12)
   (not (response ?))
   =>
   (assert (response "La bolita es 12"))
   (assert (major-scale yes))
   (assert (minor-scale no))   
)

(defrule get-ball-value-13 ""
   (ball-value 13)
   (not (response ?))
   =>
   (assert (response "La bolita es 13"))
   (assert (major-scale yes))
   (assert (minor-scale no))   
)

(defrule get-ball-value-14 ""
   (ball-value 14)
   (not (response ?))
   =>
   (assert (response "La bolita es 14")))

(defrule get-ball-value-15 ""
   (ball-value 15)
   (not (response ?))
   =>
   (assert (response "La bolita es 15")))

(defrule get-ball-value-16 ""
   (ball-value 16)
   (not (response ?))
   =>
   (assert (response "La bolita es 16")))

(defrule get-ball-value-17 ""
   (ball-value 17)
   (not (response ?))
   =>
   (assert (response "La bolita es 17")))

(defrule get-ball-value-18 ""
   (ball-value 18)
   (not (response ?))
   =>
   (assert (response "La bolita es 18")))

(defrule get-ball-value-19 ""
   (ball-value 19)
   (not (response ?))
   =>
   (assert (response "La bolita es 19")))
   
(defrule get-ball-value-19 ""
   (ball-value 19)
   (not (response ?))
   =>
   (assert (response "La bolita es 19")))

(defrule get-ball-value-20 ""
   (ball-value 20)
   (not (response ?))
   =>
   (assert (response "La bolita es 20")))

(defrule get-ball-value-21 ""
   (ball-value 21)
   (not (response ?))
   =>
   (assert (response "La bolita es 21")))

(defrule get-ball-value-22 ""
   (ball-value 22)
   (not (response ?))
   =>
   (assert (response "La bolita es 22")))

(defrule get-ball-value-23 ""
   (ball-value 23)
   (not (response ?))
   =>
   (assert (response "La bolita es 23")))

(defrule get-ball-value-24 ""
   (ball-value 24)
   (not (response ?))
   =>
   (assert (response "La bolita es 24")))


;;;********************************
;;;* STARTUP AND CONCLUSION RULES *
;;;********************************

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "Proyecto de IA 2: Sistema Experto")
  (printout t crlf crlf))

(defrule print-response ""
  (declare (salience 10))
  (response ?item)
  (major-scale ?iScale)
  =>
  (printout t crlf crlf)
  (printout t "Numero:")
  (printout t crlf crlf)
  (format t " %s%n%n%n" ?item)
   (format t " %s%n%n%n" ?iScale))

