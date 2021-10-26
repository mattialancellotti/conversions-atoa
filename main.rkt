#lang racket

(require "bits.rkt")
(require "notations.rkt")
(require "conversions.rkt")

(define inet-ip '(1 1 0 0 0 0 0 0))
(define rand-b  '(1 0 1 1 0 1 1 1))

;;; Tests
(printf "1: complement 1 of the number ~a: ~s~%"
        (build-number inet-ip) (complement-one inet-ip))

(printf "2: signed notation of the number ~a: ~s~%"
        rand-b (signed-notation rand-b))

(printf "6: converting the decimal number ~a to binary: ~s~%"
        174 (base10->baseN 50 4))

(build-number (padding (base10->baseN 307 16)))
(demolish-number
  (build-number (padding (base10->baseN 307 16))))

(signed-notation (padding (base10->baseN 5 2)))

(padding (base10->baseN  5 2) 9)
(base10->baseN -5 2)
(complement-two rand-b)
