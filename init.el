(require 'org)
(setq vc-follow-symlinks 2)
(org-babel-load-file "~/.emacs.d/MyConfig.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-java yasnippet-snippets whole-line-or-region which-key vterm use-package undo-tree treemacs-projectile treemacs-magit treemacs-icons-dired treemacs-all-the-icons session request rainbow-delimiters persistent-scratch org-noter-pdftools org-download org-bullets org-brain org-autolist org-attach-screenshot multiple-cursors modus-themes lsp-ui helm-projectile helm-ag goto-chg flycheck elpy doom-themes dap-mode cmake-mode centaur-tabs ag))
 '(safe-local-variable-values
   '((flycheck-disabled-checkers emacs-lisp-checkdoc)
     (vc-follow-symlinks . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
