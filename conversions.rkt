(module conversions racket
  (require "notations.rkt")
  (require "bits.rkt")

  (provide decimal->binary binary->decimal)
  (provide base10->baseN)

  ;;; Recursive decimal to binary translation
  ;;; This function will recursively translate any positive decimal number to its
  ;;; binary counterpart.
  (define decimal->binary
    (lambda (decimal) (cond
                        [(> decimal 1)
                         ;; Using the multiple divisions method to find the binary
                         ;; version of a number.
                         (string-append
                           (decimal->binary (quotient decimal 2))
                           (number->string (remainder decimal 2)))]
                        [else "1"])))

  (define base10->baseN
    (lambda (number base) (cond
                            [(zero? number) empty]
                            [else
                              (append
                                (base10->baseN (quotient number base) base)
                                (list (remainder number base)))])))

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
                         [else 0])))))
