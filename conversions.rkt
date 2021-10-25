(module conversions racket
  (require "notations.rkt")
  (require "bits.rkt")

  (provide base10->baseN)

  ;;; Recursive decimal to N base transaltion
  ;;; This funciton takes a decimal number and the base to translate that number
  ;;; to. Will return a list of ordered character composing the new
  ;;; rapresentation.
  (define base10->baseN
    (lambda (number base) (cond
                            [(zero? number) empty]
                            [else
                              (append
                                (base10->baseN (quotient number base) base)
                                (list (remainder number base)))]))))
