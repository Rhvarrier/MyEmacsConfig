(defcustom cmake-ide-run-target-exe-path
  ""
  "Command to run the cmake target"
  :group 'cmake-ide
  :safe #'stringp)

(defcustom cmake-ide-run-target-exe-args
  ""
  "Command to run the cmake target"
  :group 'cmake-ide
  :safe #'stringp)


(defun cmake-ide-run-target ()
  "Run target after compilation"
  (interactive)
  (if (file-readable-p cmake-ide-run-target-exe-path)
      ;; if executable exists run the executable
      (shell-command cmake-ide-run-target-exe-path cmake-ide-run-target-exe-args)
    ;;else if executable does not exists
    (progn (cmake-ide-compile)
	    (if (file-readable-p cmake-ide-run-target-exe-path)
		(shell-command cmake-ide-run-target-exe-path cmake-ide-run-target-exe-args)
	      (message "comilation failed")
	      )
	    )
    )
  )
	   
