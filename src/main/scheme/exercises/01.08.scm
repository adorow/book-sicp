(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                 x)))

; Newton's method as 'improve' procedure
(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
 (< (abs (- (improve guess x) guess))
    (* guess 0.001)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

; sample calls and results
(cube-root 27)      ;
(cube-root 0.00024) ;
(cube-root 1860867) ;