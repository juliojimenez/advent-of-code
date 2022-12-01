(defvar *input* nil)

(defun load-input (filename)
  (with-open-file (stream filename)
    (with-standard-io-syntax
      (setf *input* (loop for line = (read-line stream nil)
			  while line
			  collect (parse-integer line :junk-allowed t))))))

(let ((biggest 0)
      (current 0))
      (dolist (item *input*)
	(if (not item) (progn
		  (if (>= current biggest) (setf biggest current))
		  (setf current 0))
	    (progn
	      (setf current (+ current item))
	      (print biggest)))))

(let ((elves (list))
      (first 0)
      (second 0)
      (third 0)
      (total 0)
      (current 0))
      (dolist (item *input*)
	(if (not item) (progn
			 (push current elves)
			 (setf current 0))
	    (setf current (+ current item))))
  (progn
    (setf elves (sort elves #'>))
    (setf first (pop elves))
    (setf second (pop elves))
    (setf third (pop elves))
    (setf total (+ first second third))
    (print total)))
