; Pascal's Triangle
;
;      1
;     1 1
;    1 2 1
;   1 3 3 1
;  1 4 6 4 1

; the problem doesn't specify how to generate the triangle, so this function returns based on a row and column.
; rows and columns start from 0. The column is column in that specific row.
; ex from the triangle above as (r,c)=value: (4,2)=6; (0,0)=1; (3,1)=3; (3,2)=3


(define (pascal r c)
    (if (or (= c 0) (= c r))
        1
        (+ (pascal (- r 1) (- c 1))
           (pascal (- r 1) c))))