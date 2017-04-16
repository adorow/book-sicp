; because the condition is wrapper into a procedure,
; the 'applicative-order-evaluation' interpreter will expand all the arguments on 'new-if',
; calling this way the expansion of 'sqrt-iter', and so on, generating an infinite loop and overflowing the stack.