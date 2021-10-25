;;; Declaring the 'notations' module
(module notations racket
  (require "bits.rkt")
  (provide signed-notation complement-one)


  ;;; This function will just swap the first bit of the given binary string as the
  ;;; signed notation says.
  (define signed-notation
    (lambda (binary) (unless (empty? binary)
                       (append
                         (list (opposite (first binary)))
                         (list-tail binary 1)))))

  ;;; Recursive 1's complement 
  ;;; This function will recursively iterate through the given list of digits
  ;;; and maps the oppsoite function to each element.
  (define complement-one
    (lambda (binary) (map (lambda (x) (opposite x)) binary))))
