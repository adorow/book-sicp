;this problem defines \f if n<3 and if n>3, but not if n=3, I'm assuming here n>=3, otherwise there's no solution
;recursive
(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))

;iterative
(define (f n)
    (define (f-iter a b c n)
        (if (= n 0)
            a
            (f-iter b c (+ c (* 2 b) (* 3 a)) (- n 1))))
    (f-iter 0 1 2 n))

