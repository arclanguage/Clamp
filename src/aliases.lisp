;;;; These are several cl operations which are aliased for clamp.

(in-package :clamp)

;;;; Special Forms
(defalias after unwind-protect)
(defalias do progn)

;;;; Macros
(defalias ++ incf)
(defalias -- decf)
(defalias = setf)
(defalias def defun)
(defalias digit digit-char-p)
(defalias do1 prog1)
(defalias do2 prog2)
(defalias err error)
(defalias errsafe ignore-errors)
(defalias mac defmacro)
(defalias mvb multiple-value-bind)
(defalias mvl multiple-value-list)
(defalias swap rotatef)
(defalias w/file with-open-file)

;;;; Procedures.
(defalias all every)
(defalias alphadig alphanumericp)
(defalias bound boundp)
(defalias call funcall)
(defalias const constantly)
(defalias cut subseq)
(defalias dec 1-)
(defalias dedup delete-duplicates)
(defalias even evenp)
(defalias idfn identity)
(defalias inc 1+)
(defalias inside get-output-stream-string)
(defalias instring make-string-input-stream)
(defalias is eql)
(defalias isa typep)
(defalias iso equalp)
(defalias join append)
(defalias len length)
(defalias letter alpha-char-p)
(defalias macex macroexpand)
(defalias macex1 macroexpand-1)
(defalias maptable maphash)
(defalias no not)
(defalias notf complement)
(defalias nrev nreverse)
(defalias odd oddp)
(defalias outstring make-string-output-stream)
(defalias file-exists probe-file)
(defalias rand random)
(defalias redup remove-duplicates)
(defalias rev reverse)
(defalias table make-hash-table)
(defalias trunc truncate)
(defalias uniq gensym)
(defalias writec write-char)
