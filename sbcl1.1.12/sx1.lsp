(defpackage :it.bese.FiveAM
  (:use :common-lisp :it.bese.arnesi)
  (:nicknames :5am)
  (:export ;; creating tests and test-suites
           #:make-suite
	   #:def-suite
	   #:in-suite
	   #:make-test
	   #:test
	   #:get-test
	   #:rem-test
	   ;; fixtures
	   #:make-fixture
	   #:def-fixture
	   #:with-fixture
	   #:get-fixture
	   #:rem-fixture
	   ;; running checks
           #:is
           #:is-true
           #:is-false
           #:signals
           #:finishes
           #:skip
	   #:pass
	   #:fail
	   #:*test-dribble*
           #:for-all
           #:gen-integer
           #:gen-string
           #:gen-character
	   ;; running tests
           #:run
           #:run-all-tests
           #:explain
           #:explain!
           #:run!
           #:!
           #:!!
           #:!!!
	   #:*debug-on-error*
           #:*debug-on-failure*
           #:*verbose-failures*))