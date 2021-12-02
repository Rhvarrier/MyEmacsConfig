(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(company-clang-executable nil)
 '(custom-enabled-themes '(doom-vibrant))
 '(custom-safe-themes
   '("4a5aa2ccb3fa837f322276c060ea8a3d10181fecbd1b74cb97df8e191b214313" "e6f3a4a582ffb5de0471c9b640a5f0212ccf258a987ba421ae2659f1eaa39b09" "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "5f19cb23200e0ac301d42b880641128833067d341d22344806cdad48e6ec62f6" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d" "e2c926ced58e48afc87f4415af9b7f7b58e62ec792659fcb626e8cba674d2065" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" default))
 '(display-line-numbers t)
 '(electric-pair-mode t)
 '(elpy-rpc-python-command "python3")
 '(elpy-rpc-virtualenv-path "~/.virtualenvs/rpc")
 '(exwm-floating-border-color "#1c1f24")
 '(fci-rule-color "#62686E")
 '(frame-background-mode 'dark)
 '(helm-adaptive-mode t nil (helm-adaptive))
 '(helm-echo-input-in-header-line nil)
 '(helm-split-window-inside-p t)
 '(highlight-tail-colors
   ((("#2c3636" "#99bb66" "green")
     . 0)
    (("#293b44" "#46D9FF" "brightcyan")
     . 20)))
 '(inhibit-startup-screen t)
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f24" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f24" "#7bc275"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f24" "#484854"))
 '(objed-cursor-color "#ff665c")
 '(org-noter-always-create-frame nil)
 '(package-selected-packages
   '(lsp-java centaur-tabs persistent-scratch evil multiple-cursors yasnippet-snippets whole-line-or-region which-key vterm use-package undo-tree treemacs-projectile treemacs-magit treemacs-icons-dired treemacs-all-the-icons session rainbow-delimiters org-noter-pdftools org-download org-bullets org-brain org-autolist org-attach-screenshot modus-themes lsp-ui lsp-treemacs helm-projectile helm-ag flycheck elpy doom-themes cmake-mode ag))
 '(package-user-dir "~/.emacs.d/elpa")
 '(pdf-tools-enabled-modes
   '(pdf-history-minor-mode pdf-isearch-minor-mode pdf-links-minor-mode pdf-misc-minor-mode pdf-outline-minor-mode pdf-misc-size-indication-minor-mode pdf-misc-menu-bar-minor-mode pdf-annot-minor-mode pdf-sync-minor-mode pdf-misc-context-menu-minor-mode pdf-cache-prefetch-minor-mode pdf-occur-global-minor-mode pdf-virtual-global-minor-mode))
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#242730"))
 '(python-shell-interpreter "python3")
 '(rustic-ansi-faces
   ["#242730" "#ff665c" "#7bc275" "#FCCE7B" "#51afef" "#C57BDB" "#5cEfFF" "#bbc2cf"])
 '(safe-local-variable-values
   '((flycheck-disabled-checkers emacs-lisp-checkdoc)
     (vc-follow-symlinks . t)))
 '(save-interprogram-paste-before-kill t)
 '(session-use-package t nil (session))
 '(vc-annotate-background "#242730")
 '(vc-annotate-color-map
   (list
    (cons 20 "#7bc275")
    (cons 40 "#a6c677")
    (cons 60 "#d1ca79")
    (cons 80 "#FCCE7B")
    (cons 100 "#f4b96e")
    (cons 120 "#eda461")
    (cons 140 "#e69055")
    (cons 160 "#db8981")
    (cons 180 "#d082ae")
    (cons 200 "#C57BDB")
    (cons 220 "#d874b0")
    (cons 240 "#eb6d86")
    (cons 260 "#ff665c")
    (cons 280 "#d15e59")
    (cons 300 "#a35758")
    (cons 320 "#754f56")
    (cons 340 "#62686E")
    (cons 360 "#62686E")))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks 'ask)
 '(warning-minimum-level :error)
 '(which-key-mode t)
 '(x-select-enable-clipboard-manager t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
