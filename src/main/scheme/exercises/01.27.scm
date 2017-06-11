; smallest carmichael numbers: 561, 1105, 1729, 2465, 2821, and 6601

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
     (remainder (square (expmod base (/ exp 2) m))
        m))
    (else
     (remainder (* base (expmod base (- exp 1) m))
        m))))

(define (cheat-fermat n)
    (define (cheat-fermat-iter a n)
        (if (< a n)
            (if (= (expmod a n n) (remainder a n))
                (cheat-fermat-iter (+ a 1) n)
                false)
            true))
    (cheat-fermat-iter 1 n))

; running the algorithm against the given carmichael numbers return true always:
(cheat-fermat 561)  ; true
(cheat-fermat 1105) ; true
(cheat-fermat 1729) ; true
(cheat-fermat 2465) ; true
(cheat-fermat 2821) ; true
(cheat-fermat 6601) ; true
