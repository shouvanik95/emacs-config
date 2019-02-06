;;Load dired-x
(require 'dired-x)
(setq dired-dwim-target 1)
(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))

;;ibuffer settings
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;Helm for completion?
(load "helm-settings.el")

;; Use Ivy for completion
;; (load "ivy-settings.el")
