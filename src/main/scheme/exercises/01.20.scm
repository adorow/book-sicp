(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; applicative-order
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (gcd 6 (remainder 40 6))
; (gcd 6 4)
; (gcd 4 (remainder 6 4))
; (gcd 4 2)
; (gcd 2 (remainder 4 2))
; (gcd 2 0)
; 2
;; remainder is called 4 times


;; normal-order
; (gcd 206 40)

; (if (= 40 0)
;   206
;   (gcd 40 (remainder 206 40)))

; (if (= 40 0)
;   206
;   (if (= (remainder 206 40) 0)
;       40
;       (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))

; (if (= 40 0)
;   206
;   (if (= (remainder 206 40) 0)
;       40
;       (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))

; (if (= 40 0)
;   206
;   (if (= (remainder 206 40) 0)
;       40
;       (if (= (remainder 40 (remainder 206 40)) 0))
;           (remainder 206 40)
;           (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

; (if (= 40 0)
;   206
;   (if (= (remainder 206 40) 0)
;       40
;       (if (= (remainder 40 (remainder 206 40)) 0)
;           (remainder 206 40)
;           (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;               (remainder 40 (remainder 206 40))
;               (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (reminder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))))

; (if (= 40 0)
;   206
;   (if (= (remainder 206 40) 0) ; 1 time in this line
;       40
;       (if (= (remainder 40 (remainder 206 40)) 0) ; 2 times in this line
;           (remainder 206 40)
;           (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; 4 times in this line
;               (remainder 40 (remainder 206 40))
;               (if (= (reminder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ; 7 times in this line
;                   (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; 4 times on this line (this is the end result)
;                   (gcd (reminder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;                        (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (reminder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))))))

;; remainder is called 18 times