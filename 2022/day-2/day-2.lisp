(defvar *input* nil)

(defun get-play (play)
  (print play)
  (if (or (string= play "A") (string= play "X")) 1)
  (if (or (string= play "B") (string= play "Y")) 2)
  (if (or (string= play "C") (string= play "Z")) 3))

(defun make-play (players)
  (print players)
  (list (get-play (nth 0 players)) (get-play (nth 1 players))))

(defun plays (play)
  (print play)
  (loop for (first second) across (coerce play 'vector)
	collect (make-play (first second))))

(defun load-input (filename)
  (with-open-file (stream filename)
    (with-standard-io-syntax
      (setf *input* (loop for line = (read-line stream nil)
			  while line
			  collect (plays (str:split " " line)))))))
