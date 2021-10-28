(module conversions racket/base
  (require racket/list)
  (require "notations.rkt")
  (require "bits.rkt")

  (provide base10->baseN baseN->base10)

  ;;; Recursive decimal to N base transaltion
  ;;; This funciton takes a decimal number and the base to translate that number
  ;;; to. Will return a list of ordered character composing the new
  ;;; rapresentation.
  (define base10->baseN
    (lambda (number base) (cond
                            [(zero? number) empty]
                            ;; If the number is negative this function will use
                            ;; the signed-notation procedure from notations.rkt
                            ;; to rapresent the `negative` binary number.
                            [(negative? number)
                             (signed-notation
                               (padding (base10->baseN (abs number) base)))]
                            [else
                              (append
                                (base10->baseN (quotient number base) base)
                                (list (remainder number base)))])))

  (define baseN->base10
    (lambda (number base) (let ([len (length number)])
                            (cond
                              [(empty? number) 0]
                              [else
                                (+
                                  (* (first number) (expt base (sub1 len)))
                                  (baseN->base10
                                    (take-right number (sub1 len)) base))])))))
