;;; Declaring the 'notations' module
(module notations racket/base
  (require racket/list)
  (require "bits.rkt")

  (provide signed-notation complement-one complement-two)


  ;;; This function will just swap the first bit of the given binary string as
  ;;; the signed notation says.
  (define signed-notation
    (lambda (binary)
      (unless (empty? binary)
        (append
          (list (opposite (first binary)))
          (list-tail binary 1)))))

  ;;; Recursive 1's complement 
  ;;; This function will recursively iterate through the given list of digits
  ;;; and maps the oppsoite function to each element.
  (define complement-one
    (lambda (binary)
      (map (lambda (x)
             (opposite x)) binary)))

  ;;; Recursive 2's complement
  (define complement-two
    (lambda (binary)
      (let* ([len (length binary)]
             [idx (list-ref binary (sub1 len))])
        (cond
          [(zero? idx)
           ;; This piece of code is just a way to iterate each element without
           ;; doing anything but recursive.
           (append
             (complement-two (take binary (sub1 len)))
             (list idx))]
          ;; This is where the bits get flipped, after the first 1.
          [else
            (append
              (complement-one (take binary (sub1 len)))
              (list idx))])))))
