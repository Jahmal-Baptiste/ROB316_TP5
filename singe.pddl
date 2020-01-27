;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; singe world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain SINGE)
    (:requirements :strips)
    (:predicates (positionsinge ?x)
            (positioncaisse ?x)
            (positionbanane ?x)
	        (monte)
	        (mainpleine)
    )

    (:action aller
	    :parameters (?x ?y)
	    :precondition (and (positionsinge ?x) (not (monte)))
	    :effect (positionsinge ?y)
    )
  
    (:action pousser
        :parameters (?x ?y)
        :precondition (and (positionsinge ?x) (positioncaisse ?x) (not (monte)))
        :effect (and (positionsinge ?y) (positioncaisse ?y))
    )
  
    (:action monter
        :parameters (?x)
        :precondition (and (positionsinge ?x) (positioncaisse ?x) (not (monte)))
        :effect (monte)
    )
    
    (:action descendre
        :parameters (?x)
        :precondition (and (positionsinge ?x) (positioncaisse ?x) (monte))
        :effect (not (monte))
    )
    
    (:action attraper
        :parameters (?x)
        :precondition (and (positionsinge ?x) (positioncaisse ?x) (monte) (positionbanane ?x) (not (mainpleine)))
        :effect (mainpleine)
    )
    
    (:action lacher
        :precondition (mainpleine)
        :effect (not (mainpleine))
    )
)
