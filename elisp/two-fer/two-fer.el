;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:

(defun two-fer (&optional name)
  "One for NAME, one for me."
  (if name
      (format "One for %s, one for me." name)
    (two-fer "you")))

(provide 'two-fer)
;;; two-fer.el ends here
