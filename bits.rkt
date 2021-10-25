(module bits racket
  (provide opposite padding build-number)

  ;;; Checks if the given number 'z' is between is between 'x' and 'y'
  (define between?
    (lambda (z x y) (if (and (>= z x) (<= z y)) #t #f)))

  ;;; 0 <-> 1
  (define opposite
    (lambda (digit) (cond
                      [(zero? digit) 1]
                      [else 0])))

  ;;; This function will add padding before the given number based on the power
  ;;; of 2. For example if the list has 3 elements the added padding will be
  ;;; only 1.
  (define padding
    (lambda (bits) (let* ([len (length bits)]
                          [pow (exact-ceiling (log len 2))]
                          [pad (- (expt 2 pow) len)])
                     (cond
                       ;; If the calculated padding is not zero this will append
                       ;; a list of 0s before the given list.
                       [(not (zero? pad))
                        (append
                          (build-list pad (lambda (x) 0)) bits)]
                       [else bits]))))

  ;;; This function will convert every number in the list to the right char
  ;;; according the standard. For example A => 10..
  (define build-number
    (lambda (nlist) (list->string
                      ;; Executing the function on every element of the list
                      (map (lambda (x)
                             (cond
                               [(between? x  0  9) (integer->char (+ x 48))]
                               [(between? x 10 15) (integer->char (+ x 55))]
                               [else x]))
                           nlist)))))
