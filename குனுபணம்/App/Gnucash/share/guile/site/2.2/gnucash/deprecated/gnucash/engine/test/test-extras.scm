
;; test-extras.scm
;; Compatibility module for deprecated (gnucash engine test test-extras).
;; This file is autogenerated, do not modify by hand.

(define-module (gnucash engine test test-extras))

(issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Module '(gnucash engine test test-extras)' has been deprecated and will be removed in the future.")
                (issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Use module '(tests test-engine-extras)' instead.")

(use-modules (tests test-engine-extras))

(let ((i (module-public-interface (current-module))))
     (module-use! i (resolve-interface '(tests test-engine-extras))))