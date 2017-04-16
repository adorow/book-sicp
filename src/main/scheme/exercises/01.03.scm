(define (square n)
    (* n n))

(define (sum-of-squares a b)
    (+ (square a) (square b)))

(define (>= a b)
    (or (> a b) (= a b)))

(define (<= a b)
    (or (< a b) (= a b)))

(define (larger a b c)
    (max a b c))

(define (second-larger a b c)
    (cond
        ((= a (max a b c)) (max b c))
        ((= b (max a b c)) (max a c))
        (else (max a b))))

(define (square-sum-of-two-larger a b c)
    (sum-of-squares (larger a b c) (second-larger a b c)))