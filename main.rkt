#lang racket

(define inet-ip "11000000")
(define rand-b  "10110111")

;;; 0 <-> 1
(define opposite
  (lambda (digit) (if (string=? digit "1") "0" "1")))

;;; This function will just swap the first bit of the given binary string as the
;;; signed notation says.
(define signed-notation
  (lambda (binary) (let ((len (string-length binary)))
                     ;; This will take the first bit and change it to the
                     ;; opposite to make a negative/positive number.
                     (string-append
                       (opposite (substring binary 0 1))
                       (substring binary 1)))))


;;; Recursive 1's complement 
;;; This function will recursively iterate through the given string of digits
;;; until it gets to a single digit to then return the opposite.
(define complement-one
  (lambda (binary) (if (= (string-length binary) 1)
                     ;; If the passed binary number is composed by just one
                     ;; digit there is no need to do further operation other
                     ;; than switching this single digit.
                     (opposite binary)

                     ;;; Otherwise get the first available digit, switch it and
                     ;;; append it to the remaining digits. (recursively)
                     (string-append 
                       (opposite (substring binary 0 1))
                       (complement-one (substring binary 1))))))

;;; Recursive decimal to binary translation
;;; This function will recursively translate any positive decimal number to its
;;; binary counterpart.
(define decimal->binary
  (lambda (decimal) (if (> decimal 1)
                      ;; Using the multiple divisions method to find the binary
                      ;; version of a number.
                      (string-append
                        (number->string (remainder decimal 2))
                        (decimal->binary (quotient decimal 2))) 
                      "1")))

;;; Recursive binary to decimal translation
;;; This function accepts a binary number as a string and will convert it to
;;; decimal.
(define binary->decimal
  (lambda (binary) (let ((len (string-length binary))
                         (dgt (substring binary 0 1)))
                     (if (zero? len)
                       (string->number (substring binary 0 1))
                       (if (string=? dgt "1")
                         (+ (expt 2 (sub1 len))
                            (binary->decimal (substring binary 1)))
                         0)))))

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
        "192" (string-reverse (decimal->binary 192)))
