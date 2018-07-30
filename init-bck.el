;;;;;;;;;;;;;;;;;;;;
;;Setting mac keybindings
;;;;;;;;;;;;;;;;;;;;
(setq mac-option-modifier 'control)
(setq mac-command-modifier 'meta)
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

;;Ensure use-package exists for organization
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

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

;;;;;;;;;;;;;;;;;;;;;;;;;
;;Define UI settings
;;;;;;;;;;;;;;;;;;;;;;;;;

(load "ui.el")

;;Editing settings
(load "editing.el")

;;Basic navigation settings
(load "navigation.el")

;;Load general Development settings
(load "dev.el")

;;;;;;;;;;;;;;;;;;;;
;; Added by emacs customize
;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (expand-region use-package evil-leader company linum-relative key-chord evil yasnippet yasnippet-snippets auctex exec-path-from-shell magit avy ido-completing-read+ smex ido-vertical-mode solarized-theme doom-themes dracula-theme monokai-theme zenburn-theme))))
;;Other Custom variables
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

