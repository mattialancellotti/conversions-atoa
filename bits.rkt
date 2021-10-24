(module bits racket
  (provide one? opposite padding)

  ;;; This function checks if the given number is 1 or not
  (define one?
    (lambda (number) (eq? number 1)))

  ;;; 0 <-> 1
  (define opposite
    (lambda (digit) (cond
                      [(string=? digit "1") "0"]
                      [else "1"])))
  (define padding
    (lambda (bits) (let* ([len (length bits)]
                          [pow (exact-ceiling (log len 2))]
                          [pad (- (expt 2 pow) len)])
                     (cond
                       [(not (zero? pad))
                        (append
                          (build-list pad (lambda (x) 0)) bits)]
                       [else bits])))))
