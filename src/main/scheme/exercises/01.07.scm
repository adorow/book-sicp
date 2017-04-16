; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers.
; > the current implementation uses as measure, that the result is 0.001 close to the input given
; > if we try to get the sqrt of a small number, like 0.00001 (which is 0.001), any result near 0.001 of the resulting number would be accepted, and thus return a wrong result.
; Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers.
; > finding such a small difference (0.001) could take too long for very large numbers, due to how large these numbers are.

; old
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; new
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; exercise: An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess 0.001))) ; the smaller this number, the more precise the results

(define (sqrt x)
  (sqrt-iter 1.0 x))

; sample calls and results
(sqrt 9)            ; 3.00009155413138
(sqrt 0.00024)      ; 1.5503057066706556e-2
(sqrt 15159273129)  ; 123172.29362868053
