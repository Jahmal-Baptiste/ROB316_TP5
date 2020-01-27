;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; hanoi world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain HANOI)
    (:requirements :strips)
    (:predicates (onpeg1 ?x)
            (onpeg2 ?x)
            (onpeg3 ?x)
            (clearpeg1)
            (clearpeg2)
            (clearpeg3)
            (clear ?x)
            (on ?x ?y)
            (smaller ?x ?y)
            (holding ?x)
            (handempty)
    )

    (:action freepeg1
	    :parameters (?x)
	    :precondition (and (onpeg1 ?x) (not (clearpeg1)) (clear ?x) (handempty))
	    :effect (and (clearpeg1) (holding ?x) (not (handempty)))
    )
  
    (:action freepeg2
	    :parameters (?x)
	    :precondition (and (onpeg1 ?x) (not (clearpeg2)) (clear ?x) (handempty))
	    :effect (and (clearpeg2) (holding ?x) (not (handempty)))
    )
  
    (:action freepeg3
	    :parameters (?x)
	    :precondition (and (onpeg3 ?x) (not (clearpeg3)) (clear ?x) (handempty))
	    :effect (and (clearpeg3) (holding ?x) (not (handempty)))
    )
    
    (:action stackpeg1
        :parameters (?x)
        :precondition (and (clearpeg1) (holding ?x))
        :effect (and (not (clearpeg1)) (onpeg1 ?x) (handempty) (not (holding ?x)))
    )
    
    (:action stackpeg2
        :parameters (?x)
        :precondition (and (clearpeg2) (holding ?x))
        :effect (and (not (clearpeg2)) (onpeg2 ?x) (handempty) (not (holding ?x)))
    )
    
    (:action stackpeg3
        :parameters (?x)
        :precondition (and (clearpeg3) (holding ?x))
        :effect (and (not (clearpeg3)) (onpeg3 ?x) (handempty) (not (holding ?x)))
    )
    
    (:action remove
        :parameters (?x ?y)
        :precondition (and (clear ?x) (on ?x ?y) (handempty))
        :effect (and (clear ?y) (holding ?x) (not (handempty)))
    )
    
    (:action put
        :parameters (?x ?y)
        :precondition (and (clear ?y) (smaller ?x ?y) (holding ?x))
        :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)))
    )
)
