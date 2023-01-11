
;; de_DE.scm
;; Compatibility module for deprecated (gnucash report locale-specific de_DE).
;; This file is autogenerated, do not modify by hand.

(define-module (gnucash report locale-specific de_DE))

(issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Module '(gnucash report locale-specific de_DE)' has been deprecated and will be removed in the future.")
                (issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Use module '(gnucash reports locale-specific de_DE taxtxf)' instead.")

(use-modules (gnucash reports locale-specific de_DE taxtxf))

(let ((i (module-public-interface (current-module))))
     (module-use! i (resolve-interface '(gnucash reports locale-specific de_DE taxtxf))))