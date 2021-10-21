#lang racket

(require "notations.rkt")

(define inet-ip "11000000")
(define rand-b  "10110111")

;;; 0 <-> 1
(define opposite
  (lambda (digit) (cond
                    [(string=? digit "1") "0"]
                    [else "1"])))

(define one?
  (lambda (number) (= number 1)))

;;; Recursive decimal to binary translation
;;; This function will recursively translate any positive decimal number to its
;;; binary counterpart.
(define decimal->binary
  (lambda (decimal) (cond
                      [(> decimal 1)
                      ;; Using the multiple divisions method to find the binary
                      ;; version of a number.
                      (string-append
                        (number->string (remainder decimal 2))
                        (decimal->binary (quotient decimal 2)))]
                      [else "1"])))

;;; Recursive binary to decimal translation
;;; This function accepts a binary number as a string and will convert it to
;;; decimal.
(define binary->decimal
  (lambda (binary) (let ([len (string-length binary)]
                         [dgt (substring binary 0 1)])
                     (cond
                       [(string=? dgt "1")
                         (+ (expt 2 (sub1 len))
                            (binary->decimal (substring binary 1)))]
                       [else 0]))))

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
        "157" (string-reverse (decimal->binary 157)))

(printf "4: converting the binary number ~a to decimal: ~s~%"
        inet-ip (binary->decimal inet-ip))

(printf "5: converting the decimal number ~a to binary ~s~%"
        192 (string-reverse (decimal->binary 192)))
