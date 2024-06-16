;Problem 2 describes the action to load structural kit on submarine, move submarine from command center to shallow water
;and construct tidal powered generator on shallow water. 
(define (problem seaExp_problem2)
  (:domain seaExp_domain)
  (:objects
   cmd_cntr shallow_water - location
   submarine - sub
   str_kit - kit 
   engineer - personnel 
   tidal_gen - building 
  )
  (:init                          ;initial stage of objects
    (at engineer cmd_cntr)
    (at str_kit cmd_cntr)
    (at submarine cmd_cntr)
    (on_sub engineer submarine)
    (adjacent cmd_cntr shallow_water)  
  )
  
  (:goal                              ;final or goal stage to be achieved by objects
   (and 
    (at submarine shallow_water)
    (not(at str_kit cmd_cntr))
    (built tidal_gen shallow_water)
   )
  )
)