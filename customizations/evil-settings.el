;;Evil mode settings
;;Loaded if I use it

(require 'evil)
(evil-mode 1)

(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)
