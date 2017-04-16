; 'p' is recursively defined in terms of itself
; with 'applicative-order-evaluation', p will be evaluated in 'test', leading to an infinite loop
; with 'normal-order-evaluation', p will not be evaluated, since the if condition is not met, and the evaluation tree will never be expanded to evaluate it