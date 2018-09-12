;;Magit settings
(global-set-key (kbd "C-x g") 'magit-status)

;;Flycheck settings
(require 'flycheck)

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

;;Python
(require 'elpy)
(elpy-enable)
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(require 'ein)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;Common Lisp
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;;Clojure
(require 'clojure-mode)
(require 'cider)

;;Haskell
(require 'haskell-mode)
(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))
(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))
