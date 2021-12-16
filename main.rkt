#lang racket/base

(require racket/list racket/string)
(require "src/display.rkt" "src/notations.rkt")

(define inet-ip '(1 1 0 0 0 0 0 0))
(define rand-b  '(1 0 1 1 0 1 1 1))

;;; Tests
(display-signed-notation inet-ip)
(display-signed-notation  rand-b)
(display-complement  rand-b complement-two)
(display-complement inet-ip complement-one)
(display-conversion  50 10  4)
(display-conversion 307 10 16)
(display-conversion 389 10 20)
