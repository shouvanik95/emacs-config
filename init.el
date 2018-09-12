;;;;;;;;;;;;;;;;;;;;
;;Setting mac keybindings
;;;;;;;;;;;;;;;;;;;;
(setq mac-command-modifier 'meta)
(setq mac-left-option-modifier 'meta)
(setq mac-right-option-modifier 'control)
(setq mac-control-modifier 'control)
(setq mac-function-modifiew 'control)


;;;;;;;;;;;;;;;;;;;;
;;Package Management
;;;;;;;;;;;;;;;;;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;Load and activate packages
(package-initialize)

;;Make sure my packages are installed
(package-install-selected-packages)

;;;;;;;;;;;;;;;;;;;;
;;Customization
;;;;;;;;;;;;;;;;;;;;

;;Start emacs server for synctex
(require 'server)
(unless (and (fboundp 'server-running-p)
	     (server-running-p))
  (server-start))

;;Backup Settings
(setq backup-directory-alist
          `((".*" . ,"~/.emacs-saves")))
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs-saves/" t)))
(setq create-lockfiles nil)

;;Mac shell issues
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;Customization Load Path
(add-to-list 'load-path "~/.emacs.d/customizations")

;;UI settings
(load "ui.el")

;;Editing settings
(load "editing.el")

;;Basic navigation settings
(load "navigation.el")

;;Load general Development settings
(load "dev.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ae3a3bed17b28585ce84266893fa3a4ef0d7d721451c887df5ef3e24a9efef8c" default)))
 '(helm-external-programs-associations (quote (("pdf" . "open"))))
 '(package-selected-packages
   (quote
    (py-autopep8 haskell-mode cider clojure-mode slime speed-type rainbow-delimiters rainbow-delimeters base16-theme flycheck ace-window 0blayout ein elpy spaceline-all-the-icons spaceline spacemacs-theme helm-projectile projectile helm-spotify-plus helm-swoop zenburn-theme yasnippet-snippets use-package solarized-theme smex pdf-tools monokai-theme moe-theme matlab-mode magit linum-relative key-chord ido-vertical-mode ido-completing-read+ helm gruvbox-theme green-phosphor-theme expand-region exec-path-from-shell evil-leader dracula-theme counsel company color-theme-sanityinc-tomorrow avy auctex-latexmk ag)))
 '(pdf-misc-print-programm "/usr/bin/lpr")
 '(pdf-misc-print-programm-args
   (quote
    ("-o media=Letter" "-o fitplot" "-o sides=two-sided-long-edge"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
