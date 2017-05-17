 
;; Problem 5. Rovers domain
;;
;; three rovers---rover0, rover1, rover2
;; 6 locations---l0 l1 l2 l3 l4 l5
;;
;; Initial state
;; rover0 is initially at l2
;;        nothing is in its bin
;;        it has no data stored
;;        it can take soil and rock sample
;;        it can take images
;;        it can traverse from
;;        l2 -> l0
;;        l0 -> l2
;;      l1 -> l2
;;        l2 -> l1
;;      l2 -> l3
;;        l3 -> l2
;;      l2 -> l5
;;        l5 -> l2
;;      l0 -> l4
;;        l4 -> l0
;;
;; rover1 is initially at l3
;;        nothing is in its bin
;;        it has no data stored
;;        it is take rock samples
;;        it can traverse from
;;        l3 -> l0
;;        l0 -> l3
;;        l3 -> l2
;;        l2 -> l3
;;      l4 -> l3
;;        l3 -> l4
;;      l0 -> l1
;;        l1 -> l0
;;      l0 -> l5
;;        l5 -> l0
;;
;; rover2 is initially at l4
;;        nothing is in its bin
;;        it has no data stored
;;        it is take soil and rock sample
;;        it can take images
;;        it can traverse from
;;        l4 -> l0
;;        l0 -> l4
;;        l4 -> l5
;;        l5 -> l4
;;      l0 -> l1
;;        l1 -> l0
;;      l0 -> l3
;;        l3 -> l0
;;      l5 -> l2
;;        l2 -> l5
;;
;; Goal:
;; Earth has soil analysis from l4
;; Earth has soil analysis from l1
;; Earth has rock analysis from l3
;; Earth has rock analysis from l2
;; Earth has rock analysis from l4
;; Earch has rock analysis from l0
;; Problem 5. Rovers domain




(define (problem      roverprob5)
(:domain    rover)
(:objects 
r0 r1 r2    - ROVER
l0 l1 l2 l3 l4 l5    - LOCATION)
(:init        (at r0 l2) (no-data r0 empty) (no-sample r0 empty)
        (has-cap r0 soil) (has-cap r0 rock) (has-cap r0 image)
        (path r0 l2 l0) (path r0 l0 l2) (path r0 l1 l2) (path r0 l2 l1) (path r0 l2 l3) 
(path r0 l3 l2) (path r0 l2 l5) (path r0 l5 l2) (path r0 l0 l4) (path r0 l4 l0)

        (at r1 l3) (no-data r1 empty) (no-sample r1 empty)
        (has-cap r1 rock)
        (path r1 l3 l0) (path r1 l0 l3) (path r1 l3 l2) (path r1 l2 l3) (path r1 l4 l3) 
(path r1 l3 l4) (path r1 l0 l1) (path r1 l1 l0) (path r1 l0 l5) (path r1 l5 l0)

            (at r2 l3) (no-data r2 empty) (no-sample r2 empty)
        (has-cap r2 soil) (has-cap r2 rock) (has-cap r2 image)
        (path r2 l4 l0) (path r2 l0 l4) (path r2 l4 l5) (path r2 l5 l4) (path r2 l0 l1) 
(path r2 l1 l0) (path r2 l0 l3) (path r2 l3 l0) (path r2 l5 l2) (path r2 l2 l5)
)
    (:goal        (and (Earth-has l4 soil) (Earth-has l1 soil) (Earth-has l3 rock) (Earth-has l2 rock) (Earth-has l4 rock) (Earth-has l0 rock)))    
)



