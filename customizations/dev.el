;;Magit settings
(global-set-key (kbd "C-x g") 'magit-status)

;;Yasnippet settings
;;Snippets used are yasnippet-snippets and from the default snippet directory
(require 'yasnippet)
(yas-global-mode 1)

(require 'yasnippet-snippets)

;; LaTeX settings / AucTex
(load "latex-config.el")
