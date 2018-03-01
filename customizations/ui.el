;;THis file defines my UI settings for Emacs. To load it add (load "customizations.el") to init.el

;;Hide and configure toolbars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;Fullscreen shortcut
(global-set-key (kbd "M-i") 'toggle-frame-fullscreen)

;;Show line numbers
(global-linum-mode 1)

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

;;Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; Written this way because Solarized doesnt work in the terminal
(if (display-graphic-p)
    (load-theme 'doom-vibrant 1)
  (load-theme 'doom-vibrant 1))

;;Font
(set-face-attribute 'default nil :font "Monaco" :height 140)

;;Window Size
(setq initial-frame-alist '((top . 0) (left . 200) (width . 120) (height . 80))) 
