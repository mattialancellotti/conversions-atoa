#lang racket/base

(require racket/list racket/string)
(require "bits.rkt" "notations.rkt" "conversions.rkt")

(define inet-ip '(1 1 0 0 0 0 0 0))
(define rand-b  '(1 0 1 1 0 1 1 1))

(define display-signed-notation
  (lambda (number)
    (when (list? number)
      (printf ":: signed notation of the number ~a: ~s~%"
              (build-number number) (complement-one number)))))

(define display-complement
  (lambda (number func)
    (when (list? number)
      (printf ":: complement of the number ~a: ~s~%"
              (build-number number) (func number)))))

(define display-conversion
  (lambda (number baseStart baseEnd)
    (when (number? number)
      (printf ":: conversion of number ~a from base ~a to ~a: ~s~%"
              number baseStart baseEnd
              (convert number baseStart baseEnd)))))
;;; Tests
(display-signed-notation inet-ip)
(display-signed-notation  rand-b)
(display-complement  rand-b complement-two)
(display-complement inet-ip complement-one)
(display-conversion  50 10  4)
(display-conversion 307 10 16)
(display-conversion 389 10 20)
