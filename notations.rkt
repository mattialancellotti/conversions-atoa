;;; Declaring the 'notations' module
(module notations racket
  (provide signed-notation complement-one)

  (define one?
    (lambda (number) (eq? number 1)))

  ;;; 0 <-> 1
  (define opposite
    (lambda (digit) (cond
                      [(string=? digit "1") "0"]
                      [else "1"])))

  ;;; This function will just swap the first bit of the given binary string as the
  ;;; signed notation says.
  (define signed-notation
    (lambda (binary) (let ([len (string-length binary)])
                       ;; This will take the first bit and change it to the
                       ;; opposite to make a negative/positive number.
                       (string-append
                         (opposite (substring binary 0 1))
                         (substring binary 1)))))

  ;;; Recursive 1's complement 
  ;;; This function will recursively iterate through the given string of digits
  ;;; until it gets to a single digit to then return the opposite.
  (define complement-one
    (lambda (binary) (if (one? (string-length binary))
                       ;; If the passed binary number is composed by just one
                       ;; digit there is no need to do further operation other
                       ;; than switching this single digit.
                       (opposite binary)

                       ;;; Otherwise get the first available digit, switch it and
                       ;;; append it to the remaining digits. (recursively)
                       (string-append 
                         (opposite (substring binary 0 1))
                         (complement-one (substring binary 1)))))))
