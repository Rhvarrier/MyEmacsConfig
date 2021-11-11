(defun load-customization-file ()
;; load customize file at the end 
  (setq custom-file "~/.emacs.d/custom.el")
  (load-file custom-file)
  )

(defun delete-current-line ()
  "Delete (not kill) the current line."
  (interactive)
  (save-excursion
    (delete-region
     (progn (forward-visible-line 0) (point))
     (progn (forward-visible-line 1) (point)))))

(global-set-key (kbd "<C-S-backspace>") 'delete-current-line)
