;; Set emacs user directory
(setq user-emacs-directory (file-truename "~/.emacs.d"))
;;(setq custom-functions-file "~/.emacs.d/custom-functions.el")
;;(load-file custom-functions-file)
(defalias 'yes-or-no-p 'y-or-n-p)
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

(global-set-key (kbd "<kp-enter>") (kbd "RET"))

;; persistant session
(use-package session
  :ensure t
  :config
  (add-hook 'after-init-hook 'session-initialize)
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Aesthetic

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

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

;; Treemacs
(use-package treemacs
  :ensure t
  :init
    :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ;; ("C-x t B"   . treemacs-bookmark)
	;;("C-x t C-t" . treemacs-find-file)
        ;;("C-x t M-t" . treemacs-find-tag))
	)
  )

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-global-mode t)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "C-<tab>") #'yas-expand)
  (add-to-list #'yas-snippet-dirs "my-personal-snippets")
  (yas-reload-all)
  (setq yas-prompt-functions '(yas-ido-prompt))
  (defun help/yas-after-exit-snippet-hook-fn ()
    (prettify-symbols-mode)
    (prettify-symbols-mode))
  (add-hook 'yas-after-exit-snippet-hook #'help/yas-after-exit-snippet-hook-fn)
  :diminish yas-minor-mode)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  )

(use-package vterm
  :ensure t
  :config
  (defalias 'sh 'vterm)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Orgmode

(use-package org
  :hook
  (org-mode . visual-line-mode)
  :config
  (setq org-startup-indented nil)
  (setq org-startup-numerated t)
  (setq org-image-actual-width (list 200))
  )

(use-package org-bullets
  :ensure t
  :hook
  (org-mode . org-bullets-mode)
  )

(use-package org-download
  :ensure t
  :hook
  (org-mode . org-download-enable)
  :bind
  ("<f6> y" . org-download-clipboard)
  

)
(use-package org-noter
  :ensure t
  :bind
  ("C-c n" . org-noter)
  :mode
  ("\\.pdf\\'" . org-noter-mode)
  )

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))

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

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

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
;; C++ ide packages
(add-hook 'c-mode-hook  electric-pair-mode)
(add-hook 'c++-mode-hook  electric-pair-mode)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
	 (c-mode . lsp)
	 (c++-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp
  )

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package company
   :ensure t
   :init
  (global-company-mode)
  :bind (("<backtab>" . company-complete-common-or-cycle))
  )

(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elisp packages
(add-hook 'lisp-mode-hook electric-pair-mode)

;; load customize file at the end 
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
