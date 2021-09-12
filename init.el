(setq user-emacs-directory (file-truename "~/emacs.d"))
(setq custom-file "~/.emacs.d/custom.el")
(setq custom-functions-file "~/.emacs.d/custom-functions.el")
(load-file custom-file)
(load-file custom-functions-file)
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
  :preface (require 'helm-config)
  :ensure t
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x b" . helm-buffers-list)
   :map helm-map
   ("C-j" . helm-next-line)
   ("C-k" . helm-previous-line))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ ide packages

(use-package rtags
  :ensure t
  :custom
  (rtags-autostart-diagnostics t "Start async pcss to receive warnings/errors")
  (rtags-completion-enabled t)
  :init
  (rtags-enable-standard-keybindings)
  (rtags-diagnostics)
  )

(use-package company
  :ensure t
  :config (delete 'company-backends 'company-clang))
  :hook (('after-init-hook . 'global-company-mode))
  )
(use-package        
(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode))
  )

(use-package cmake-ide
  :ensure t
  :init
  (cmake-ide-setup)
  :bind ("C-c k" . cmake-ide-compile)
  )
