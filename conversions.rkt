(module conversions racket/base
  (require racket/list)
  (require "notations.rkt" "bits.rkt")

  (provide base10->baseN baseN->base10)

  ;;; Recursive decimal to N base translation
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
                            ;; This piece of code will recursively divide the
                            ;; given number until it gets to 0. After all the
                            ;; created functions have returned the result of the
                            ;; first instance will be a list of numbers, each of
                            ;; them a digit of that same number rapresented
                            ;; using a different base.
                            [else
                              (append
                                (base10->baseN (quotient number base) base)
                                (list (remainder number base)))])))

  ;;; Recursive N base to decimal translation
  ;;; This function takes a list and a base as input used to translate the given
  ;;; number to its decimal counterpart.
  (define baseN->base10
    (lambda (number base) (let ([len (length number)])
                            (cond
                              [(empty? number) 0]
                              [else
                                ;; Using the multiplications method.
                                (+
                                  (* (first number) (expt base (sub1 len)))
                                  (baseN->base10
                                    (take-right number (sub1 len)) base))])))))
