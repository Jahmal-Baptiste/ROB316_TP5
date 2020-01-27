;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; graph world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain GRAPH)
  (:requirements :strips)
  (:predicates (on ?x)
	       (connect ?x ?y)
	       (transport ?x ?y)
  )

  (:action transport
	     :parameters (?x ?y)
	     :precondition (and (connect ?x ?y) (on ?x))
	     :effect
	     (on ?y)
  )
)
