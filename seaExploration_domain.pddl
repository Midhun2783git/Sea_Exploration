;Domain describes the environment of the sea exploration by defining the predicates and the types used in predicates,
;additional actions for each problem scenario is included.
(define(domain seaExp_domain )
    (:requirements
         :strips
         :typing
         :equality
    )

    (:types
        location personnel sub kit building monster - object ;types
    )

    (:predicates
       (at ?obj - object ?loc - location)   ;object is at location 
 (conq ?m - monster ?loc - location)   ; monster conquered location 
    (on_sub ?p - personnel ?sub - sub) ; person on submarine
        (have ?p - personnel ?kit - kit) ; person have kit
        (use ?p - personnel ?obj - object) ;person uses object
        (scan ?p - personnel ?loc - location) ;person scans location
        (adjacent ?loc - location ?loc - location) ; A location is adjacent to another location
        (built ?bld - building ?loc - location) ;building is built on the location
    )   

    

    (:action load
        :parameters
            (?sub - sub ?p - personnel ?kit - kit ?from - location)
        :precondition
            (and
             (at ?kit ?from)
             (at ?p ?from) 
             (on_sub ?p ?sub)
            )
        :effect
            (and
             (have ?p ?kit)
             (not (at ?kit ?from))
            )
    )

    (:action move
        :parameters
            (?sub - sub ?p - personnel ?from ?to - location)
        :precondition
            (and
             (at ?sub ?from)
             (on_sub ?p ?sub)
             (adjacent ?from ?to)
            )
        :effect
            (and 
             (at ?sub ?to)
             (not(at ?sub ?from))
            )
    )

    (:action unload
        :parameters
            (?sub - sub ?p - personnel ?kit - kit ?to - location)
        :precondition
            (and
             (have ?p ?kit) 
             (on_sub ?p ?sub)
            )
        :effect
            (and
             (at ?kit ?to)
             (not (have ?p ?kit))
            )
    )

    (:action construct
        :parameters
            (?sub - sub ?p - personnel ?kit - kit ?bld - building ?from ?to - location)
        :precondition
            (and
             (at ?sub ?from)
             (at ?sub ?to) 
             (on_sub ?p ?sub)
             (have ?p ?kit)
            )
        :effect            
             (built ?bld ?to)            
    )

    (:action battle
        :parameters
            (?sub - sub ?p - personnel ?m - monster ?obj - object ?from ?to - location)
        :precondition
            (and
             (at ?sub ?from) 
             (on_sub ?p ?sub)
             (use ?p ?obj)
             (conq ?m ?to)
             (at ?sub ?to)
            )
        :effect                         
             (not(conq ?m ?to))            
    )
    
    (:action analyse
        :parameters
            (?sub - sub ?p - personnel  ?obj - object ?from ?to - location)
        :precondition
            (and
             (at ?sub ?to) 
             (on_sub ?p ?sub)
            )
        :effect
          (and
             (use ?p ?obj)                         
             (scan ?p ?to)
          )               
    )   
)
    
