;;Magit settings
(global-set-key (kbd "C-x g") 'magit-status)

;;Yasnippet settings
;;Snippets used are yasnippet-snippets and from the default snippet directory
(require 'yasnippet)
(yas-global-mode 1)

(require 'yasnippet-snippets)

;; LaTeX settings / AucTex
(load "latex-config.el")

;;Matlab 
(require 'matlab)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "/Applications/MATLAB_R2017a.app/bin/matlab")
(setq matlab-shell-command-switches (list "-nodesktop"))
