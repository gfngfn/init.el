(provide 'gfn-local-environment)

(defun format-message (s &rest args)
  (message (apply 'format s args)))
