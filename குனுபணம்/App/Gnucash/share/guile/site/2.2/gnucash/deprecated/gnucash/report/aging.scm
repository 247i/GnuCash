
;; aging.scm
;; Compatibility module for deprecated (gnucash report aging).
;; This file is autogenerated, do not modify by hand.

(define-module (gnucash report aging))

(issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Module '(gnucash report aging)' has been deprecated and will be removed in the future.")
                (issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Use module '(gnucash reports aging)' instead.")

(use-modules (gnucash reports aging))

(let ((i (module-public-interface (current-module))))
     (module-use! i (resolve-interface '(gnucash reports aging))))