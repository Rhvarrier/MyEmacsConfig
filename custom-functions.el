(defun load-customization-file ()
;; load customize file at the end 
  (setq custom-file "~/.emacs.d/custom.el")
  (load-file custom-file)
  )
