;; Settings for helm

(use-package helm
  :diminish helm-mode
  :ensure t
  :init
  (progn
    (require 'helm-config)
    (require 'helm-swoop)
    (helm-autoresize-mode 1)
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files             t ; skip boring files in helm find file output
	  helm-M-x-fuzzy-match                  nil ; use fuzzy match for M-x
	  helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
	  helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
	  helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
	  helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
	  helm-ff-file-name-history-use-recentf t
	  helm-move-to-line-cycle-in-source     nil
	  helm-echo-input-in-header-line t
	  helm-autoresize-max-height 25
	  helm-autoresize-min-height 25
	  helm-swoop-pre-input-function (lambda () nil))
    (helm-mode))
  :bind (("C-s" . helm-swoop)
	 ("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
	 ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . isearch-forward-regexp)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c SPC" . helm-all-mark-rings)))
(ido-mode -1)

(require 'helm-spotify-plus)
(global-set-key (kbd "C-c s s") 'helm-spotify-plus)  ;; s for SEARCH
(global-set-key (kbd "C-c s f") 'helm-spotify-plus-next)
(global-set-key (kbd "C-c s b") 'helm-spotify-plus-previous)
(global-set-key (kbd "C-c s p") 'helm-spotify-plus-play) 
(global-set-key (kbd "C-c s g") 'helm-spotify-plus-pause) ;; g cause you know.. C-g stop things :)


;; Helm Projectile Settings
(use-package projectile
  :ensure t
  :init
  (progn
    (setq projectile-completion-system 'helm)
    (setq projectile-keymap-prefix (kbd "C-c p")))
  :config
  (progn
    (projectile-global-mode)
    (helm-projectile-on)))
