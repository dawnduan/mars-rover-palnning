(define (domain rover)

     (:types LOCATION ROVER DATATYPE EMPTY)

     (:constants soil rock image - DATATYPE    empty - EMPTY)

     (:predicates     
               (ROVER              ?r - ROVER)
               (LOCATION           ?l - LOCATION)
               (DATATYPE           ?d - DATATYPE)
               (EMPTY              ?e - EMPTY)
               (path               ?r - ROVER    ?l1 ?l2 - LOCATION)
               (at                 ?r - ROVER     ?l - LOCATION )
               (has-cap            ?r - ROVER    ?d - DATATYPE)
               (has-data           ?r - ROVER     ?d - DATATYPE)
               (has-bin            ?r - ROVER     ?d - DATATYPE)
               (no-data            ?r - ROVER    ?e - EMPTY)
               (no-sample          ?r - ROVER    ?e - EMPTY)
               (label              ?r - ROVER     ?l - LOCATION    ?d - DATATYPE)
               (Earth-has          ?l - LOCATION    ?d - DATATYPE))
               
     (:action move
          :parameters (?r - ROVER    ?from - LOCATION    ?to - LOCATION)
          :precondition (and (at ?r ?from) (path ?r ?from ?to))
          :effect (and (at ?r ?to) (not (at ?r ?from))))
     
     (:action collect
          :parameters (?r - ROVER    ?l - LOCATION    ?d - DATATYPE    ?edata - EMPTY   ?esample - EMPTY)
          :precondition (and (at ?r ?l) (has-cap ?r ?d) (no-data ?r ?edata) (no-sample ?r ?esample))
          :effect (and (has-data ?r ?d) (has-bin ?r ?d)
               (label ?r ?l ?d)
               (not (no-data ?r ?edata)) (not (no-sample ?r ?esample))))
     
     
     (:action communicate-empty-data
          :parameters (?r - ROVER    ?l - LOCATION    ?e - EMPTY    ?d - DATATYPE)
          :precondition (label ?r ?l ?d)
          :effect (and (no-data ?r ?e) (Earth-has ?l ?d) (not (label ?r ?l ?d)) (not (has-data ?r ?d))))
     
     
     (:action empty-bin
          :parameters (?r - ROVER    ?e - EMPTY    ?d - DATATYPE)
          :precondition (has-bin ?r ?d)
          :effect (and (no-sample ?r ?e) (not (has-bin ?r ?d))))
)

