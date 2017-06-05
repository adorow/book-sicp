(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range.
; Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000.
; Note the time needed to test each prime.
; Since the testing algorithm has order of growth of (n), you should expect that testing for primes around 10,000 should take about
; 10 times as long as testing for primes around 1000.
; Do your timing data bear this out?
; How well do the data for 100,000 and 1,000,000 support the n prediction?
; Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

(define (search-for-primes start end)
    (define (search-for-primes-iter cur end)
        (timed-prime-test cur)
        (search-for-primes (+ start 2) end))
    (if (even? start)
        (search-for-primes (+ start 1) end)
        (if (< start end)
            (search-for-primes-iter start end))))


; results:
; three smallest primes larger than 1000: 1009, 1013, 1019.
; three smallest primes larger than 10,000: 10007, 10009, 100037.
; three smallest primes larger than 100,000: 100003, 100019, 100043.
; three smallest primes larger than 1,000,000: 1000003, 1000033, 1000037.

