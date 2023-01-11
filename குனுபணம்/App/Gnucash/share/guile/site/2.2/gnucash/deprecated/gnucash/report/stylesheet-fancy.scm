
;; stylesheet-fancy.scm
;; Compatibility module for deprecated (gnucash report stylesheet-fancy).
;; This file is autogenerated, do not modify by hand.

(define-module (gnucash report stylesheet-fancy))

(issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Module '(gnucash report stylesheet-fancy)' has been deprecated and will be removed in the future.")
                (issue-deprecation-warning "* WARN <gnc-guile-deprecation> *: Use module '(gnucash report stylesheets footer)' instead.")

(use-modules (gnucash report stylesheets footer))

(let ((i (module-public-interface (current-module))))
     (module-use! i (resolve-interface '(gnucash report stylesheets footer))))