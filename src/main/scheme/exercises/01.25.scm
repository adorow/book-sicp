; the algorithm suggested by Alyssa can produce the right result, but too slowly to be used by fast-prime;
; the reason is that the entire exponentiation would result in very large numbers, which would take long to process;
; while the original algorithm proposed on 01.22 takes care of that by using a neat math trick, keeping the numbers low while processing the exponentiation.