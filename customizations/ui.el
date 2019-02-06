;;This file defines my UI settings for Emacs. To load it add (load "ui.el") to init.el

;;Hide and configure toolbars.
;;There is no point to hiding the menubar on MacOS. They're not very intrusive.
;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;Show line numbers
(global-linum-mode 1)
;; (require 'linum-relative)
;; (linum-relative-global-mode)
;; (setq linum-relative-current-symbol "")

;; Highlight current line
(global-hl-line-mode 1)

;;Scroll normally
(setq scroll-conservatively 100)

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;;Visual bell settings (don't beep in my ears!)
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;;Hide Initial Messages
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;;Cursor settings
(blink-cursor-mode 1)
(setq-default cursor-type 'bar)

;;Theme Settings
;;(Note: Some nice themes (solarized dark) don't work in the terminal
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")

;;Add advice to load-theme to make it first disable current themes
;;Also add advice to set the powerline to be nice afterwards
(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(defun sh/fix-spaceline ()
  "Reload the spaceline"
  (interactive)
  (spaceline-emacs-theme))

(defadvice load-theme (after fix-spaceline-later activate)
  (sh/fix-spaceline))

;;Define some theme groups

(defun sh/set-tomorrow-themes ()
  (progn (defvar my-light-theme 'sanityinc-tomorrow-day)
	 (defvar my-dark-theme 'sanityinc-tomorrow-night)
	 (defvar term-theme 'sanityinc-tomorrow-night)))

(defun sh/set-gruvbox-themes ()
  (progn (defvar my-light-theme 'gruvbox-dark-medium)
	 (defvar my-dark-theme 'gruvbox-light-soft)
	 (defvar term-theme 'gruvbox-dark-medium)))

(defun sh/set-spacemacs-themes ()
  (progn (defvar my-light-theme 'spacemacs-dark)
	 (defvar my-dark-theme 'spacemacs-light)
	 (defvar term-theme 'spacemaces-dark)))

(defun sh/set-moe-themes ()
  (progn (defvar my-light-theme 'moe-light)
	 (defvar my-dark-theme 'moe-dark)
	 (defvar term-theme 'moe-dark)))

(defun sh/set-zenburn-themes ()
  (progn (defvar my-light-theme 'anti-zenburn)
	 (defvar my-dark-theme 'zenburn)
	 (defvar term-theme 'zenburn)))

(sh/set-tomorrow-themes)

;;Load themes

(if (display-graphic-p)
    (load-theme my-light-theme 1)
  (load-theme term-theme 1))

(defun sh/load-dark-theme ()
  "Load a dark theme for emacs"
  (interactive)
  (load-theme my-dark-theme 1)
  (spaceline-emacs-theme)
  )

(defun sh/load-light-theme ()
  "Load a light theme for emacs"
  (interactive)
  (load-theme my-light-theme 1)
  (spaceline-emacs-theme)
  )

;; Spaceline
(setq powerline-image-apple-rgb t)
(require 'spaceline-config)
(require 'spaceline-all-the-icons)
(spaceline-emacs-theme)

;;Rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;Font
(set-face-attribute 'default nil :font "Monaco" :height 140)

;;Window Size
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;;Window Switching using Windmove
(windmove-default-keybindings)

;;Ace-window setup
(require 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq aw-dispatch-always 1)
