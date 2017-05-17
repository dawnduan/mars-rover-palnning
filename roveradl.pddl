(define (domain roveradl)

          (:requirements :adl :strips :typing :equality)
          
          (:types   LOCATION - OBJ 
                    ROVER - OBJ 
                    DATA - OBJ
                    EMPTY - OBJ
                    PICK - DATA 
                    IMAGE - DATA)
          
          (:constants soil rock - PICK    img - IMAGE    emp - EMPTY)
          
          (:predicates        (path               ?r - ROVER    ?l1 ?l2 - LOCATION)
                              (at                 ?r - ROVER     ?l - LOCATION )
                              (has-cap            ?r - ROVER    ?d - DATA)
                              (has-data           ?r - ROVER     ?d - DATA)
                              (has-bin            ?r - ROVER     ?d - DATA)
                              (no-data            ?r - ROVER    ?e - EMPTY)
                              (no-sample          ?r - ROVER    ?e - EMPTY)
                              (label              ?r - ROVER     ?l - LOCATION    ?d - DATA)
                              (Earth-has          ?l - LOCATION    ?d - DATA) )
          
          (:action move
               :parameters (?r - ROVER    ?from - LOCATION    ?to - LOCATION)
               :precondition (and (at ?r ?from) (path ?r ?from ?to))
               :effect (and (at ?r ?to) (not (at ?r ?from))) )
          
          (:action collect
                    :parameters         (?r - ROVER    ?l - LOCATION    ?d - DATA    ?edata - EMPTY    ?esample - EMPTY)
                    :precondition       (and (at ?r ?l) (has-cap ?r ?d)(no-data ?r ?edata) (no-sample ?r ?esample))
                    :effect (and        (when (and (= ?d img)) 
                                        (and (has-data ?r ?d) 
                                        (label ?r ?l ?d) 
                                        (not (no-data ?r ?edata))) )
                                        (when (not (= ?d img)) 
                                        (and (has-data ?r ?d) (has-bin ?r ?d)
                                        (label ?r ?l ?d)
                                        (not (no-data ?r ?edata)) (not (no-sample ?r ?esample))))))
          
          (:action communicate-empty-data
                    :parameters (?r - ROVER    ?l - LOCATION    ?e - EMPTY    ?d - DATA)
                    :precondition (label ?r ?l ?d)
                    :effect (and (no-data ?r ?e) (Earth-has ?l ?d) (not (label ?r ?l ?d)) (not (has-data ?r ?d))))
          
          
          (:action empty-bin
               :parameters (?r - ROVER    ?e - EMPTY    ?d -DATA)
               :precondition (has-bin ?r ?d)
               :effect (and (no-sample ?r ?e) (not (has-bin ?r ?d))))
)


