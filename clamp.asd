(in-package :asdf-user)

(defsystem "clamp"
  :description "Common Lisp with Arc Macros and Procedures"
  :version "0.3"
  :author "malisper"
  :in-order-to ((test-op (test-op :clamp-tests)))
  :components ((:module "src"
                :components ((:file "package")
                             (:file "defalias" :depends-on ("package"))
                             (:file "aliases"  :depends-on ("defalias"))
                             (:file "base"     :depends-on ("aliases"))
                             (:file "read"     :depends-on ("aliases"))
                             (:file "hof"      :depends-on ("aliases" "base"))
                             (:file "binding"  :depends-on ("hof"))
			     (:file "fns"      :depends-on ("aliases" "base" "binding"))
                             (:file "print"    :depends-on ("aliases" "base" "binding" "hof"))
                             (:file "time"     :depends-on ("aliases" "print"))
                             (:file "macros"   :depends-on ("binding" "print"))
                             (:file "fnops"    :depends-on ("binding" "base" "conditionals"))
                             (:file "setforms" :depends-on ("binding" "macros"))
                             (:file "memoize"  :depends-on ("setforms"))
                             (:file "strings"  :depends-on ("misc"))
                             (:file "iter"     :depends-on ("hof" "macros" "fnops"))
                             (:file "list"     :depends-on ("aliases" "macros" "fns" "base"))
                             (:file "conditionals" :depends-on ("macros" "list" "fns"))
                             (:file "misc"     :depends-on ("macros" "conditionals" "iter" "list" "hof" "fnops"))
                             (:file "sort"     :depends-on ("binding" "list" "iter"))
                             (:file "io"       :depends-on ("iter" "read"))
                             (:file "tables"   :depends-on ("binding" "iter"))
                             (:file "disk"     :depends-on ("macros" "conditionals" "io"))
                             (:file "code"     :depends-on ("iter" "hof" "misc" "read" "io"))
			     (:file "deftem"   :depends-on ("binding" "list" "hof" "macros" "print"))))))
