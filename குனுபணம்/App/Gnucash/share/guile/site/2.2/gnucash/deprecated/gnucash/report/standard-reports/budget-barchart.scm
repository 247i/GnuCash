
;; budget-barchart.scm
;; Compatibility module for deprecated (gnucash report standard-reports budget-barchart).
;; This file is autogenerated, do not modify by hand.

(define-module (gnucash report standard-reports budget-barchart))

(issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Module '(gnucash report standard-reports budget-barchart)' has been deprecated and will be removed in the future.")
                (issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Use module '(gnucash reports standard budget-barchart)' instead.")

(use-modules (gnucash reports standard budget-barchart))

(let ((i (module-public-interface (current-module))))
     (module-use! i (resolve-interface '(gnucash reports standard budget-barchart))))