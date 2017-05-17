(define (domain roverv1)

(:types LOCATION ROVER DATABANK-soil DATABANK-rock DATABANK-img DATABANK-empty BIN-soil BIN-rock BIN-empty CAP-soil CAP-rock CAP-img)

(:constants 
    soil        - DATABANK-soil
    rock        - DATABANK-rock
    img        - DATABANK-img
    empty        - DATABANK-empty
    empty        - BIN-empty
    soil        - BIN-soil
    rock        - BIN-rock
    soil        - CAP-soil
    rock        - CAP-rock
    img        - CAP-img)

(:predicates     
	(ROVER    		?r - ROVER)    ;ROVER(x)    - true iff x is a rover
        (LOCATION     		?l - LOCATION)    ;LOCATION(x) - true iff x is a location
	(DATABANK-soil     	?ds - DATABANK-soil)    ;DATABANK-soil(x)    - true iff x is DATABANK-soil
	(DATABANK-rock     	?dr - DATABANK-rock)    ;DATABANK-rock(x)    - true iff x is a DATABANK-soil
	(DATABANK-img    	?di - DATABANK-img)    ;DATABANK-img(x)    - true iff x is a DATABANK-img
	(DATABANK-empty    	?de - DATABANK-empty)    ;DATABANK-empty(x)    - true iff x is a DATABANK-img
        (BIN-empty    		?be - BIN-empty) ;BIN-empty(x)    - true iff x is a bin-empty
        (BIN-soil    		?bs - BIN-soil) ;BIN-soil(x)    - true iff x is a bin-soil
        (BIN-rock     		?br - BIN-rock ) ;BIN-rock (x)    - true iff x is a bin-rock 
        (CAP-soil    		?cs - CAP-soil) ;CAP-soil(x)    - true iff x is a cap-soil
	(CAP-rock    		?cr - CAP-rock) ;CAP-rock(x)    - true iff x is a cap-rock
        (CAP-img    		?ci - CAP-img) ;CAP-img(x)    - true iff x is a cap-img

	(path         		?r - ROVER ?l1 ?l2 - LOCATION) ;path(x, y z)   - true iff r is a rover, y and z are locations; x can go from y to z
	(at       		?r - ROVER ?l - LOCATION ) ;at(x, y) -  true iff x is a rover, y is a location, and x\u2019s location is y
	(has-data-soil        	?r -ROVER     ?ds - DATABANK-soil)  ;true iff r is a rover, ds is databank-soil, and r\u2019s databank has soil
	(has-data-rock     	?r -ROVER     ?dr - DATABANK-rock)  ;true iff r is a rover, ds is databank-rock, and r\u2019s databank has rock
	(has-data-img         	?r -ROVER     ?di - DATABANK-img)  ;true iff r is a rover, ds is databank-img, and r\u2019s databank has img
	(has-data-empty     	?r -ROVER     ?de - DATABANK-empty)  ;true iff r is a rover, ds is databank-empty, and r\u2019s databank is empty
	(has-bin-rock        	?r -ROVER     ?br - BIN-rock)  ;true iff r is a rover, br is a bin-rock, and r\u2019s bin has rock, br
	(has-bin-soil        	?r -ROVER     ?bs - BIN-soil)  ;true iff r is a rover, bs is a bin-soil, and r\u2019s bin has soil, bs
	(has-bin-empty    	?r -ROVER     ?be - BIN-empty)  ;true iff r is a rover, be is a bin-empty, and r\u2019s bin is empty
	(has-cap-soil    	?r -ROVER     ?cs - CAP-soil) ; true iff  r is a rover, cs is a cap-soil, and r has cap-soil cs
	(has-cap-rock    	?r -ROVER     ?cr - CAP-rock) ; true iff  r is a rover, cr is a cap-rock, and r has cap-rock cr
	(has-cap-img    	?r -ROVER     ?ci - CAP-img) ; true iff  r is a rover, ci is a cap-img, and r has cap-img ci
	(label-soil    		?r - ROVER     ?l - LOCATION    ?ds - DATABANK-soil); true iff  r is a rover, its location is l, its databank content is soil
	(label-img    		?r - ROVER     ?l - LOCATION    ?di - DATABANK-img) ;true iff  r is a rover, its location is l, its databank content is img
	(label-rock    		?r - ROVER     ?l - LOCATION    ?dr - DATABANK-rock); true iff  r is a rover, its location is l, its databank content is rock
	(Earth-has-soil        	?l - LOCATION    ?ds - DATABANK-soil); true iff l is a location, ds is a soil sample, and Earth has a soil sample ds taken from l
	(Earth-has-rock    	?l - LOCATION    ?dr - DATABANK-rock) ;true iff the analysis has a rock type and its location is l
	(Earth-has-img    	?l - LOCATION    ?di - DATABANK-img) ;true iff the analysis has a image type and its location is l
	)




	(:action move
     		:parameters (?r - ROVER    ?from - LOCATION    ?to - LOCATION)
     		:precondition (and (at ?r ?from) (path ?r ?from ?to))
     		:effect (and (at ?r ?to) (not (at ?r ?from) ) ))
		
	(:action pick-up-rock 
		:parameters (?r - ROVER    ?l - LOCATION    ?cr - CAP-rock    ?de - DATABANK-empty    ?be - BIN-empty    ?dr - DATABANK-rock        ?br - BIN-rock)
     		:precondition (and (at ?r ?l) 
				(has-cap-rock ?r ?cr) 
				(has-data-empty ?r ?de)
				(has-bin-empty ?r ?be) )
 		:effect (and (has-data-rock ?r ?dr) (has-bin-rock ?r ?br)
				(label-rock ?r ?l ?dr)
			(not (has-bin-empty ?r ?be)) 
			(not (has-data-empty ?r ?de))))

	(:action pick-up-soil
     		:parameters (?r - ROVER     ?l - LOCATION     ?cs - CAP-soil        			?de - DATABANK-empty    ?be - BIN-empty    
			?ds - DATABANK-soil        ?bs - BIN-soil)
     		:precondition     (and (at ?r ?l)
			(has-cap-soil ?r ?cs) 
			(has-data-empty ?r ?de)
			(has-bin-empty ?r ?be))
     		:effect (and (has-data-soil ?r ?ds) (has-bin-soil ?r ?bs) 
        		(label-soil ?r ?l ?ds)
			(not (has-data-empty ?r ?de)) 
			(not (has-bin-empty ?r ?be))))

	(:action take-photo
 		:parameters (?r - ROVER    ?l - LOCATION    ?ci - CAP-img	 ?di - DATABANK-img	?de - DATABANK-empty        ?be - BIN-empty) 
 		:precondition (and (has-cap-img ?r ?ci)  
(has-bin-empty ?r ?be) 
(has-data-empty ?r ?de)
(at ?r ?l))
	 	:effect    (and (has-data-img ?r ?di)
(label-img ?r ?l ?di)
(not (has-data-empty ?r ?de)) (not (has-data-empty ?r ?de))))

	(:action communicate-soil
		:parameters (?r - ROVER    ?l -	LOCATION	?ds - DATABANK-soil        ?de - DATABANK-empty)
		:precondition (label-soil ?r ?l ?ds)
		:effect (and (has-data-empty ?r ?de) (Earth-has-soil ?l ?ds) (not(label-soil ?r ?l ?ds))))

	(:action communicate-rock
		:parameters (?r - ROVER    ?l -	LOCATION	?dr - DATABANK-rock        ?de - DATABANK-empty)
		:precondition (label-rock ?r ?l ?dr)
		:effect (and (has-data-empty ?r ?de) (Earth-has-rock ?l ?dr) 	(not(label-rock ?r ?l ?dr))))

	(:action communicate-img
		:parameters (?r - ROVER	   ?l - LOCATION	?di - DATABANK-img        ?de - DATABANK-empty)
		:precondition (label-img ?r ?l ?di)
		:effect (and (has-data-empty ?r ?de) (Earth-has-img ?l ?di) (not(label-img ?r ?l ?di))))

	 

	(:action empty-bin-soil
     		:parameters (?r - ROVER    ?bs - BIN-soil         ?be - BIN-empty)
     		:precondition (has-bin-soil ?r ?bs)
     		:effect (and (has-bin-empty ?r ?be) (not(has-bin-soil ?r ?bs))) )

	(:action empty-bin-rock
     		:parameters (?r - ROVER    ?br - BIN-rock        ?be - BIN-empty)
     		:precondition (has-bin-rock ?r ?br)
    		:effect (and (has-bin-empty ?r ?be) (not(has-bin-rock ?r ?br))) )
		
	)