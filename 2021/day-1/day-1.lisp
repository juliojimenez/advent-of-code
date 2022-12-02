(defvar *input* nil)

(defun load-input (filename)
  (with-open-file (stream filename)
    (with-standard-io-syntax
      (setf *input* (loop for line = (read-line stream nil)
			  while line
			  collect (parse-integer line))))))

(let ((change -1)
      (current 0))
  (progn
    (load-input "~/code/advent-of-code/2021/day-1/input.txt")
    (dolist (item *input*)
      (if (>= item current) (progn
			      (incf change 1)))
      (setf current item))
    (print change)))

(let ((change -1)
      (current 0)
      (sliding-window ()))
  (progn
    (load-input "~/code/advent-of-code/2021/day-1/input.txt")
    (loop as i from 0 to (- (list-length *input*) 3)
	  do (push (+ (nth i *input*) (nth (+ i 1) *input*) (nth (+ i 2) *input*)) sliding-window))
    (dolist (item sliding-window)
      (if (>= item current) (incf change 1))
      (setf current item))
    (print change)))
      
