; smallest carmichael numbers: 561, 1105, 1729, 2465, 2821, and 6601

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
     (remainder (square (expmod base (/ exp 2) m))
        m))
    (else
     (remainder (* base (expmod base (- exp 1) m))
        m))))

(define (cheats-fermat n)
    (define (cheats-fermat-iter a n)
        (if (< a n)
            (if (= (expmod a n n) (remainder a n))
                (cheats-fermat-iter (+ a 1) n)
                false)
            true))
    (cheats-fermat-iter 1 n))

; running the algorithm against the given carmichael numbers return true always:
(cheats-fermat 561)  ; true
(cheats-fermat 1105) ; true
(cheats-fermat 1729) ; true
(cheats-fermat 2465) ; true
(cheats-fermat 2821) ; true
(cheats-fermat 6601) ; true
