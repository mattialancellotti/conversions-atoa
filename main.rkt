#lang racket

(require "notations.rkt")
(require "conversions.rkt")

(define inet-ip "11000000")
(define rand-b  "10110111")

;;; This is an helper function that takes a string as input an will output it
;;; reversed.
(define string-reverse
  (lambda (str) (list->string (reverse (string->list str)))))

;;; Tests
(printf "1: complement 1 of the number ~a: ~s~%"
        inet-ip (complement-one inet-ip))

(printf "2: signed notation of the number ~a: ~s~%"
        rand-b (signed-notation rand-b))

(printf "3: converting the decimal number ~a to binary: ~s~%"
        "157" (decimal->binary 157))

(printf "4: converting the binary number ~a to decimal: ~s~%"
        inet-ip (binary->decimal inet-ip))

(printf "5: converting the decimal number ~a to binary: ~s~%"
        192 (decimal->binary 192))

(printf "6: converting the decimal number ~a to binary: ~s~%"
        174 (base10->baseN 47 2))
