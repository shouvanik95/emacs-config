1;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq-default TeX-master t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'TeX-fold-mode)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-isearch-minor-mode t)
(setq TeX-PDF-mode t)

;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; ;; pdfview and auctex
;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
;; TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
;; TeX-source-correlate-start-server t)

;; ;; refresh buffer
;; (add-hook 'TeX-after-compilation-finished-functions
;; #'TeX-revert-document-buffer)
