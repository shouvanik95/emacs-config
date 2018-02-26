;;;;;;;;;;;;;;;;;;;;
;;Setting mac keybindings
;;;;;;;;;;;;;;;;;;;;
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'control)
(setq mac-function-modifier 'super)

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

;;;;;;;;;;;;;;;;;;;;
;; Automatically added preferences
;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit avy ido-completing-read+ smex ido-vertical-mode solarized-theme doom-themes dracula-theme monokai-theme zenburn-theme auctex))))
;;Other Custom variables
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
