
;; welcome-to-gnucash.scm
;; Compatibility module for deprecated (gnucash report welcome-to-gnucash).
;; This file is autogenerated, do not modify by hand.

(define-module (gnucash report welcome-to-gnucash))

(issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Module '(gnucash report welcome-to-gnucash)' has been deprecated and will be removed in the future.")
                (issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Use module '(gnucash reports standard dashboard)' instead.")

(use-modules (gnucash reports standard dashboard))

(let ((i (module-public-interface (current-module))))
     (module-use! i (resolve-interface '(gnucash reports standard dashboard))))