;;Use pdftools as document viewer

(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-tools-install)
  :bind ("C-c C-g" . pdf-sync-forward-search)
  :defer t
  :config
  (setq mouse-wheel-follow-mouse t)
  (setq pdf-view-resize-factor 1.10))

;; No line numbers for pdfs
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))
(add-hook 'pdf-view-mode-hook (lambda() (linum-relative-mode -1)))
(add-hook 'doc-view-mode-hook (lambda() (linum-mode -1)))
(add-hook 'doc-view-mode-hook (lambda() (linum-relative-mode -1)))

;; Follow links
(add-hook 'pdf-view-mode-hook #'pdf-links-minor-mode)

;; Continuous scrolling for pdfs settings
(setq pdf-view-continuous t)

;; Nice colors for pdfs in midnight mode

(defun bms/pdf-no-filter ()
  "View pdf without colour filter."
  (interactive)
  (pdf-view-midnight-minor-mode -1)
  )

;; change midnite mode colours functions
(defun bms/pdf-midnite-original ()
  "Set pdf-view-midnight-colors to original colours."
  (interactive)
  (setq pdf-view-midnight-colors '("#839496" . "#002b36" )) ; original values
  (pdf-view-midnight-minor-mode)
  )

(defun bms/pdf-midnite-amber ()
  "Set pdf-view-midnight-colors to amber on dark slate blue."
  (interactive)
  (setq pdf-view-midnight-colors '("#ff9900" . "#0a0a12" )) ; amber
  (pdf-view-midnight-minor-mode)
  )

(defun bms/pdf-midnite-green ()
  "Set pdf-view-midnight-colors to green on black."
  (interactive)
  (setq pdf-view-midnight-colors '("#00B800" . "#000000" )) ; green 
  (pdf-view-midnight-minor-mode)
  )

(defun bms/pdf-midnite-colour-schemes ()
  "Midnight mode colour schemes bound to keys"
        (local-set-key (kbd "!") (quote bms/pdf-no-filter))
        (local-set-key (kbd "@") (quote bms/pdf-midnite-amber)) 
        (local-set-key (kbd "#") (quote bms/pdf-midnite-green))
            (local-set-key (kbd "$") (quote bms/pdf-midnite-original))
 )  

(add-hook 'pdf-view-mode-hook 'bms/pdf-midnite-colour-schemes)
