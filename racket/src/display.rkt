#lang racket/base

(require racket/list racket/string)
(require "bits.rkt" "notations.rkt" "conversions.rkt")

(provide display-signed-notation display-complement display-conversion)

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
    (when (and (positive? baseStart) (positive? baseEnd))
      (printf ":: conversion of number ~a from base ~a to ~a: ~s~%"
              number baseStart baseEnd
              (convert number baseStart baseEnd)))))
