(setq user-emacs-directory (file-truename "~/emacs.d"))
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; update packages list if we are on a new install
(unless package-archive-contents
  (package-refresh-contents))

;; a list of pkgs to programmatically install
;; ensure installed via package.el
(setq my-package-list '(use-package))

;; programmatically install/ensure installed
;; pkgs in your personal list
(dolist (package my-package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; install elpy package for python
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; install magit for git repo management
(use-package magit
  :ensure t
  :init
  )

;; install markdown mode for emacs
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))
;; Helm autocomplete
(use-package helm
  :ensure t
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   :map helm-map
   ("C-j" . helm-next-line)
   ("C-k" . helm-previous-line))
  )

;; C++ ide packages

(use-package flycheck
  :ensure t
  )

(use-package rtags
  :ensure t
  )

(use-package cmake-ide
  :ensure t
  )
(cmake-ide-setup)
