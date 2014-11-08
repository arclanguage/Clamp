(in-package :clamp-tests)

(defsuite strings (clamp))

(deftest newstring (strings)
  (assert-eql 5 (len (newstring 5)))
  (assert-eql 10 (len (newstring 10)))
  (assert-eql 10 (len (newstring 10 #\a)))
  (assert-equalp "aaaa" (newstring 4 #\a)))

(deftest whitec (strings)
  (assert-true  (whitec #\space))
  (assert-true  (whitec #\newline))
  (assert-true  (whitec #\tab))
  (assert-true  (whitec #\return))
  (assert-false (whitec #\a))
  (assert-false (whitec #\&)))

(deftest nonwhite (strings)
  (assert-false (nonwhite #\space))
  (assert-false (nonwhite #\newline))
  (assert-false (nonwhite #\tab))
  (assert-false (nonwhite #\return))
  (assert-true  (nonwhite #\a))
  (assert-true  (nonwhite #\&)))

(deftest punc (strings)
  (assert-true  (punc #\.))
  (assert-true  (punc #\,))
  (assert-true  (punc #\;))
  (assert-true  (punc #\:))
  (assert-true  (punc #\!))
  (assert-true  (punc #\?))
  (assert-false (punc #\a))
  (assert-false (punc #\&)))

(deftest tokens (strings)
  (assert-equalp '("abc" "def" "ghi") (tokens "abc def ghi"))
  (assert-equalp '("abc" "def" "ghi")
      (tokens (tostring (prf "abc~%def~%ghi~%"))
              #\newline)))

(deftest upcase (strings)
  (assert-eql #\A (upcase #\a))
  (assert-eql #\A (upcase #\A))
  (assert-eql #\0 (upcase #\0))
  (assert-equal "HELLO" (upcase "HeLLo"))
  (assert-eql 'hello (upcase '|hello|)))

(deftest downcase (strings)
  (assert-eql #\a (downcase #\A))
  (assert-eql #\a (downcase #\a))
  (assert-eql #\0 (downcase #\0))
  (assert-equal "hello" (downcase "HeLLo"))
  (assert-eql '|hello| (downcase 'hello)))

(deftest headmatch (strings)
  (assert-true  (headmatch "abc" "abcde"))
  (assert-false (headmatch "abc" "bcde"))
  (assert-true  (headmatch "abc" "0abcde" 1))
  (assert-false (headmatch "abc" "abcde" 1)))

(deftest begins (strings)
  (assert-true  (begins "abcde" "abc"))
  (assert-false (begins "bcde" "abc"))
  (assert-true  (begins "0abcde" "abc" 1))
  (assert-false (begins "abcde" "abc" 1)))

(deftest ellipsize (strings)
  (assert-equalp "hello..." (ellipsize "hello world" 5))
  (assert-equalp "hello" (ellipsize "hello" 5)))
