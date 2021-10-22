(module bits racket
  (provide one? opposite)

  ;;; This function checks if the given number is 1 or not
  (define one?
    (lambda (number) (eq? number 1)))

  ;;; 0 <-> 1
  (define opposite
    (lambda (digit) (cond
                      [(string=? digit "1") "0"]
                      [else "1"]))))
