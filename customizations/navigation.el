;;Load dired-x
(require 'dired-x)
(setq dired-dwim-target 1)

;;ibuffer settings
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Ido for completion?

;; ;;ido settings
;; (setq ido-enable-flex-matching 1)
;; (setq ido-create-new-buffer 'always)
;; (setq ido-everywhere 1)
;; (ido-mode 1)

;; ;;ido-vertical
;; (require 'ido-vertical-mode)
;; (ido-vertical-mode 1)
;; (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

;; ;;ido-ubiquitous
;; (require 'ido-completing-read+)
;; (ido-ubiquitous-mode 1)

;; ;;smex settings
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c M-x") 'smex-update)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;Helm for completion?

(use-package helm
  :diminish helm-mode
  :ensure t
  :init
  (progn
    (require 'helm-config)
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t
	  helm-M-x-fuzzy-match t)
    (helm-mode))
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
	 ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c SPC" . helm-all-mark-rings)))
(ido-mode -1)


