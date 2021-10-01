;; Set emacs user directory
(setq user-emacs-directory (file-truename "~/emacs.d"))
(setq custom-file "~/.emacs.d/custom.el")
;;(setq custom-functions-file "~/.emacs.d/custom-functions.el")
(load-file custom-file)
;;(load-file custom-functions-file)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Version Control

;; install magit for git repo management
(use-package magit
  :ensure t
  :init
  :bind
  (("C-x g" . magit-status)
   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Documentation

;; install markdown mode for emacs
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python packages

;; install elpy package for python
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General

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


;; install markdown mode for emacs
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python packages

;; install elpy package for python
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General

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


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ ide packages
(add-hook 'c-mode-hook  electric-pair-mode)
(add-hook 'c++-mode-hook  electric-pair-mode)

;; (use-package rtags
;;   :ensure t
;;   :custom
;;   (rtags-autostart-diagnostics t "Start async pcss to receive warnings/errors")
;;   (rtags-completion-enabled t)
;;   :init
;;   (rtags-enable-standard-keybindings)
;;   (rtags-diagnostics)
;;   )

;; (use-package irony
;;   :ensure t
;;   :config
;;   (use-package company-irony
;;     :ensure t
;;     :config
;;     (add-to-list 'company-backends 'company-irony))
;;   (use-package company-irony-c-headers
;;     :ensure t
;;     :config
;;     (add-to-list 'company-backends 'company-irony-c-headers))
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'objc-mode-hook 'irony-mode)
;;   ;; replace the `completion-at-point' and `complete-symbol' bindings in
;;   ;; irony-mode's buffers by irony-mode's function
;;   (defun my-irony-mode-hook ()
;;     (define-key irony-mode-map [remap completion-at-point]
;;       'irony-completion-at-point-async)
;;     (define-key irony-mode-map [remap complete-symbol]
;;       'irony-completion-at-point-async))
;;   (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

 (use-package company
   :ensure t
   :init
  (global-company-mode)
  :bind (("<backtab>" . company-complete-common-or-cycle))
)

;; (use-package flycheck-irony
;;     :ensure t
;;     :config
;;     (eval-after-load 'flycheck
;;     '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;;     )

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
	 (c-mode . lsp)
	 (c++-mode . lsp)
	 )
  :commands lsp
  )

(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode))
  )

 ;; (use-package cmake-ide
 ;;  :ensure t
 ;;  :init
 ;;  (cmake-ide-setup)
 ;;  :bind ("C-c k" . cmake-ide-compile)
 ;;  :hook electric-pair-mode
 ;;  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elisp packages
;;(add-hook 'lisp-mode-hook electric-pair-mode)
