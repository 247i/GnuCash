
;; average-balance.scm
;; Compatibility module for deprecated (gnucash report standard-reports average-balance).
;; This file is autogenerated, do not modify by hand.

(define-module (gnucash report standard-reports average-balance))

(issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Module '(gnucash report standard-reports average-balance)' has been deprecated and will be removed in the future.")
                (issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Use module '(gnucash reports example average-balance)' instead.")

(use-modules (gnucash reports example average-balance))

(let ((i (module-public-interface (current-module))))
     (module-use! i (resolve-interface '(gnucash reports example average-balance))))