(defcustom cmake-ide-run-target-command
  ""
  "Command to run the cmake target"
  :group 'cmake-ide
  :safe #'stringp)

(defun cmake-ide-run-target ()
  "Run target after compilation"
  (interactive)
  (shell-command cmake-ide-run-target-command)
  )
