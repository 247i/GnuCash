
;; payables.scm
;; Compatibility module for deprecated (gnucash report payables).
;; This file is autogenerated, do not modify by hand.

(define-module (gnucash report payables))

(issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Module '(gnucash report payables)' has been deprecated and will be removed in the future.")
                (issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Use module '(gnucash reports standard payables)' instead.")

(use-modules (gnucash reports standard payables))

(let ((i (module-public-interface (current-module))))
     (module-use! i (resolve-interface '(gnucash reports standard payables))))