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

(define (problem      roverprob5v1)
    (:domain    roverv1)
    (:objects 
            r0 r1 r2    - ROVER
            l0 l1 l2 l3 l4 l5    - LOCATION)
    (:init  (at r0 l2) (has-data-empty r0 empty) (has-bin-empty r0 empty)
            (at r1 l3) (has-data-empty r1 empty) (has-bin-empty r0 empty)
            (at r2 l4) (has-data-empty r1 empty) (has-bin-empty r0 empty)
            (has-cap-soil r0 soil) (has-cap-rock r0 rock) (has-cap-img r0 img)
            (has-cap-rock r1 rock) 
            (has-cap-soil r2 soil) (has-cap-rock r2 rock) (has-cap-img r2 img)
            (path r0 l2 l0) (path r0 l0 l2) (path r0 l2 l1) (path r0 l1 l2) 
            (path r0 l2 l3) (path r0 l3 l2) (path r0 l2 l5) (path r0 l5 l2)
            (path r0 l0 l4) (path r0 l4 l0) 
            (path r1 l3 l0) (path r1 l0 l3) (path r1 l3 l2) (path r1 l2 l3)
            (path r1 l3 l4) (path r1 l4 l3) (path r1 l0 l4) (path r1 l4 l0)
            (path r1 l5 l0) (path r1 l0 l5) 
            (path r2 l4 l0) (path r2 l0 l4) (path r2 l4 l5) (path r2 l5 l4) 
            (path r2 l1 l0) (path r2 l0 l1) (path r2 l3 l0) (path r2 l0 l3)
            (path r2 l2 l5) (path r2 l2 l5)   )
    (:goal  (and (Earth-has-soil l4 soil) (Earth-has-soil l1 soil)
            (Earth-has-rock l3 rock) (Earth-has-rock l2 rock)
            (Earth-has-rock l4 rock) (Earth-has-rock l0 rock) ))    
)

