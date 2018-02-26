;;ido settings
(setq ido-enable-flex-matching 1)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere 1)
(ido-mode 1)

;;ido-vertical
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

;;ido-ubiquitous
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

;;smex settings
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'smex-update)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;ibuffer settings
(global-set-key (kbd "C-x C-b") 'ibuffer)
