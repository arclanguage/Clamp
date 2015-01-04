(in-package :clamp)

(mac time10 (expr)
  "Evaluates an expression 10 times and prints information about how
   long it takes to execute."
  `(time (loop repeat 10 ,expr)))

(mac jtime (expr)
  "Equivalent to time but always returns the keyword ':ok'."
  `(do1 ':ok (time ,expr)))

(def since (t1)
  "Returns the number of seconds since universal time T1."
  (- (seconds) t1))

(def minutes-since (t1)
  "Returns the number of minutes since universal time T1."
  (/ (since t1) 60))

(def hours-since (t1)
  "Returns the number of hours since universal time T1."
  (/ (since t1) 3600))

(def days-since (t1)
  "Returns the number of days since universal time T1."
  (/ (since t1) 86400))

(def date (&optional (time (seconds)))
  "Converts the given universal time into a list containg the year,
   the month, and the date. The default value is the current time."
  (mvb (sec min hour date month year day daylight-p zone)
       (decode-universal-time time)
    (declare (ignore sec min hour day daylight-p zone))
    (list year month date)))

(def datestring (&optional (time (seconds)))
  "Converts the given universal time into a string of the form 
   \"YYYY-MM-DD\". The default value is the current time."
  (tostring (apply #'prf "~4,'0D-~2,'0D-~2,'0D" (date time))))