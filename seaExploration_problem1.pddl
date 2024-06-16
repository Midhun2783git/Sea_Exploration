;Problem 1 describes the action to load an construction kit to the submarine,
;move submarine from shallow water to deep water and unload the kit on deep water. 
(define (problem seaExp_problem1)
  (:domain seaExp_domain)
  (:objects
   cmd_cntr deep_water - location
   submarine - sub
   cont_kit - kit 
   pilot engineer - personnel 
  )
  (:init                                   ;initial stage of objects
    (at submarine cmd_cntr)            
    (at cont_kit cmd_cntr)
    (at pilot cmd_cntr)
    (at engineer cmd_cntr)
    (on_sub pilot submarine)
    (on_sub engineer submarine)
    (adjacent cmd_cntr deep_water)
  ) 
  (:goal                                    ;final or goal stage to be achieved by objects
   (and
    (at submarine deep_water)
    (not(at submarine cmd_cntr))
    (at cont_kit deep_water)
    (not(at cont_kit cmd_cntr))
   )
  )
)