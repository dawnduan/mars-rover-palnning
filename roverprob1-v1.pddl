;; Problem 1. Rovers domain
;; one rover---rover0
;; 4 locations---l0 l1 l2 l3
;;
;; Initial state
;; rover0 is initially at l3
;;        nothing is in its bin
;;        it has no data stored
;;        it can take soil and rock sample
;;        it can take images
;;        it can traverse from
;;        l3 -> l0
;;        l0 -> l3
;;        l3 -> l1
;;        l1 -> l3
;;        l1 -> l2
;;        l2 -> l1
;;
;; Goal:
;; Earth has soil analysis from l2
;; Earth has rock analysis from l3
;; Earth has image from l1.

(define (problem      roverprob1)
(:domain    rover)
(:objects 
    r0        - ROVER
    l0 l1 l2 l3    - LOCATION)
(:init        (at r0 l3) (has-data-empty r0 empty) (has-bin-empty r0 empty)
(has-cap-soil r0 soil) (has-cap-rock r0 rock) (has-cap-img r0 img)
    (path r0 l3 l0) (path r0 l0 l3) (path r0 l3 l1) (path r0 l1 l3) 
(path r0 l1 l3) (path r0 l1 l2) (path r0 l2 l1)   
)
    (:goal        (and (Earth-has-soil l2 soil) (Earth-has-rock l3 rock) (Earth-has-img l1 img) ))    
)
