
(define (square n)
    (* n n))

; this version of expmod returns 0 if we find a "nontrivial square root of 1 modulo n",
; that is, a number not equal to 1 or n - 1 whose square is equal to 1 modulo n.
; It is possible to prove that if such a nontrivial square root of 1 exists, then n is not prime.
(define (expmod base exp m)
    (define (non-trivial? a)
        (and
            (not (or (= a 1) (= a (- m 1))))
            (= (remainder (square a) m) 1)))
    (define (non-trivial-square-mod a)
        (if (non-trivial? a)
            0
            (remainder (square a) m)))
    (cond ((= exp 0) 1)
      ((even? exp)
        (non-trivial-square-mod (expmod base (/ exp 2) m)))
      (else
        (remainder (* base (expmod base (- exp 1) m)) m))))


(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; The Miller-Rabin test starts from an alternate form of Fermat's Little Theorem,
; which states that if n is a prime number and a is any positive integer less than n, then a raised to the (n - 1)st power is congruent to 1 modulo n.
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))


(miller-rabin-test 4) ; normal number, returns false
(miller-rabin-test 10) ; normal number, returns false
(miller-rabin-test 55) ; normal number, returns false
(miller-rabin-test 333) ; normal number, returns false

(miller-rabin-test 11) ; prime number, returns true
(miller-rabin-test 31) ; prime number, returns true
(miller-rabin-test 29) ; prime number, returns true
(miller-rabin-test 7) ; prime number, returns true

(miller-rabin-test 561)  ; carmichael number, returns false
(miller-rabin-test 1105) ; carmichael number, returns false
(miller-rabin-test 1729) ; carmichael number, returns false
(miller-rabin-test 2465) ; carmichael number, returns false
(miller-rabin-test 2821) ; carmichael number, returns false
(miller-rabin-test 6601) ; carmichael number, returns false
