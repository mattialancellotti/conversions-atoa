#lang racket/base

(require racket/string racket/cmdline)
(require "display.rkt" "notations.rkt")

(define start-base (make-parameter 10))
(define end-base   (make-parameter  2))

(define number-to-convert
  (command-line
    #:program "base-converter"

    #:usage-help
    "Converts any given number from a base to another (2-36)."

    #:once-each
    [("-f" "--from-base") from-base
      "Specifies the starting base"
      (start-base (string->number from-base))]
    [("-t" "--to-base")   to-base
      "Specifies the end base"
      (end-base (string->number to-base))]

    #:args (number)
    (string->number number)))

(display-conversion  number-to-convert (start-base) (end-base))
