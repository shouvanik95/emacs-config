;;Evil mode settings
;;Loaded if I use it

(require 'evil)
(evil-mode 1)

(require 'key-chord)
(key-chord-define evil-insert-state-map "jk" 'emacs-normal-state)
