;Problem 3 describes the action to move submarine from shallow water to deep water
;battle with kraken and return to command center.
(define (problem seaExp_problem3)
  (:domain seaExp_domain)
  (:objects
   shallow_water deep_water cmd_cntr - location
   submarine - sub
   shield - kit 
   pilot - personnel
   kraken - monster 
  )
  (:init                                  ;initial stage of objects
    (at submarine shallow_water)              
    (at shield shallow_water)
    (at pilot shallow_water)
    (on_sub pilot submarine)
    
    (conq kraken deep_water)
    (use pilot shield)

    (adjacent shallow_water deep_water)
    (adjacent deep_water cmd_cntr)
  )
  (:goal                                  ;final or goal stage to be achieved by objects
   (and
    (not(at submarine shallow_water))
    (not(conq kraken deep_water))
    (not(at submarine deep_water))    
    (at submarine cmd_cntr)
   )
  )
)