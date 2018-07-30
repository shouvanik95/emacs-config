;; Highlights matching parenthesis
(show-paren-mode 1)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
;; Also use regexp query replace as the default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "M-%") 'query-replace-regexp)

;; Avys settings
(require 'avy)
(global-set-key (kbd "M-s") 'avy-goto-char)

;;Evil-mode
(load "evil-settings.el")

;;Org mode
(setq org-src-fontify-natively t)

;;Set up key-chords
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-mode 1)

;;Set up expand region
(use-package expand-region
  :ensure
  :bind ("C-=" . er/expand-region)
  )

;;Set up company mode
(require 'company)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)

;;Octave settings
;;(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
 x-select-enable-clipboard t
 ;; I'm actually not sure what this does but it's recommended?
 x-select-enable-primary t
 ;; Save clipboard strings into kill ring before replacing them.
 ;; When one selects something in another program to paste it into Emacs,
 ;; but kills something in Emacs before actually pasting it,
 ;; this selection is gone unless this variable is non-nil
 save-interprogram-paste-before-kill t
 ;; Shows all options when running apropos. For more info,
 ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
 apropos-do-all t
 ;; Mouse yank commands yank at point instead of at click.
 mouse-yank-at-point t)


