;;Evil mode settings
;;Loaded if I use it

(require 'evil)
(evil-mode 1)

(setq evil-default-state 'emacs)
(setq evil-insert-state-modes nil)
(setq evil-motion-state-modes nil)

(setq evil-emacs-state-cursor 'bar)
(defalias 'evil-insert-state 'evil-emacs-state)

(define-key evil-normal-state-map (kbd "\\") 'evil-normal-state)

(require 'key-chord)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "b" 'switch-to-buffer
  "w" 'save-buffer)

