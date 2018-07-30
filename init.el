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

