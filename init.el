(if (not (boundp 'format-message))
    (defun format-message (s &rest args)
      (message (apply 'format s args))))

(setq-default indent-tabs-mode nil)

(set-language-environment "Japanese")

;; ==== ==== ==== ==== FILETYPE ASSOCIATION ==== ==== ==== ====
;; ---- ---- LaTeX ---- ----
(add-to-list 'auto-mode-alist '("\\.tex$" . gfn-latex-mode))
(add-to-list 'auto-mode-alist '("\\.ltx$" . gfn-latex-mode))
(add-to-list 'auto-mode-alist '("\\.cls$" . gfn-latex-mode))
(add-to-list 'auto-mode-alist '("\\.sty$" . gfn-latex-mode))
(add-to-list 'auto-mode-alist '("\\.clo$" . gfn-latex-mode))
(add-to-list 'auto-mode-alist '("\\.bbl$" . gfn-latex-mode))

;; ---- ---- OCaml ---- ----
(add-to-list 'auto-mode-alist '("\\.ml$" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.mli$" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.mll$" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.mly$" . tuareg-mode))

;; ---- ---- Macrodown ---- ----
(add-to-list 'auto-mode-alist '("\\.mcrd$" . mcrd-mode))
(add-to-list 'auto-mode-alist '("\\.mcrdh$" . mcrd-mode))
(add-to-list 'auto-mode-alist '("\\.mcrds$" . mcrd-mode))

;; ==== ==== ==== ==== USER INTERFACE ==== ==== ==== ====
;; ---- ---- hide tool bar and menu bar ---- ----
(tool-bar-mode -1)
(menu-bar-mode -1)

;; ---- ---- font settings ---- ----
;(require 'gfn-font-environment)

;(defvar gfn-latin-font-name "Consolas")
;(defvar gfn-japanese-font-name "Meiryo UI")
;(set-face-attribute 'default nil :family gfn-latin-font-name :height 130)
;(set-fontset-font nil 'japanese-jisx0208 (font-spec :family gfn-japanese-font-name))
;(setq face-font-rescale-alist '((gfn-japanese-font-name . 1.08)))

;;(set-face-background 'hl-line "darkolivegreen")

;; ---- ---- highlighting current line ---- ----
(global-hl-line-mode 1)

;; ---- ---- show balanced paren ---- ----
(show-paren-mode 1)

;;eldocを使う
;;(add-hook emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; ---- ---- display line and column number ---- ----
(line-number-mode 1)
(column-number-mode 1)

;; ==== ==== ==== ==== KEY BIND ==== ==== ==== ====
;(global-set-key [M-kanji] 'ignore)
;(global-set-key [kanji] 'ignore)
;; ---- ---- common ---- ----
(define-key global-map (kbd "C-c s") 'query-replace)
(define-key global-map (kbd "C-c a") 'beginning-of-buffer)
(define-key global-map (kbd "C-c e") 'end-of-buffer)
(define-key global-map (kbd "C-c t") 'shell)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "M-n") 'scroll-up-command)
(define-key global-map (kbd "M-p") 'scroll-down-command)
;; ---- ---- original ---- ----
(define-key global-map (kbd "C-c m") 'gfn-macro)
(define-key global-map (kbd "C-c l") 'gfn-insert-line)
;; ---- ---- helm ---- ----
(define-key global-map (kbd "C-x C-b") 'helm-buffers-list)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
;; ---- ---- recentf ---- ----
(define-key global-map (kbd "C-c f") 'recentf-open-files)
;; ---- ---- tabbar ---- ----
(define-key global-map (kbd "M-<right>") 'tabbar-forward-tab)
(define-key global-map (kbd "M-<left>") 'tabbar-backward-tab)

;; ==== ==== ==== ==== OTHER SETTINGS ==== ==== ==== ====
;; ---- ---- garbage collection ---- ----
(setq gc-cons-threshold (* 20 gc-cons-threshold))

;; ==== ==== ==== ==== MY PACKAGES ==== ==== ==== ====
(require 'gfn-latex)
(require 'gfn-first)
(require 'open-group)
(require 'mcrd)

;(require 'gfn-local-environment)

;; ==== ==== ==== ==== DISTRIBUTED PACKAGES ==== ==== ==== ====
;; ---- ---- f ---- ----
;(require 'f)

;; ---- ---- magit ---- ----
;(require 'magit)

;; ---- ---- unicode-escape ---- ----
;(require 'unicode-escape)

;; ---- ---- save-place ---- ----
;(setq-default save-place t)
;(require 'save-place)

;; ---- ---- package ---- ----
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; ---- ---- markdown-mode ---- ----
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "gfm-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; ---- ---- javascript ---- ----
(setq js-indent-level 2)

;; ---- ---- helm ---- ----
(require 'helm-config)
(helm-mode 1)

;; ---- ---- tabbar ---- ----
(require 'tabbar)
(tabbar-mode 1)

;; ---- ---- tuareg ---- ----
(require 'tuareg)
(setq tuareg-use-smie nil)

(require 'install-elisp)
(require 'restart-emacs)

;; ---- ---- auto-async-byte-compile ---- ----
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ---- ---- undo-tree ---- ----
(require 'undo-tree)
(global-undo-tree-mode t)
(define-key global-map (kbd "M-/") 'undo-tree-redo)

;; ---- ---- paredit ---- ----
(require 'paredit) ;paredit
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)

;; ---- ---- auto-complete ---- ----
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; ---- ---- recentf ---- ----
(setq recentf-max-saved-items 2000)
(require 'recentf-ext)
(require 'recentf)
(recentf-mode 1)

;; ---- ---- autoinsert ---- ----
(auto-insert-mode)
(setq-default auto-insert-directory "~/.emacs.d/auto-insert/")
(define-auto-insert "\\.tex$" "latex-template.tex")

;; ---- ---- yatex ---- ----
(setq-default YaTeX-inhibit-prefix-letter t)
(require 'yatex)
;;
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq-default YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq-default YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq-default YaTeX-dvi2-command-ext-alist
      '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
(setq tex-command "latexmk")
(setq bibtex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
(setq makeindex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
(setq dvi2-command "rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance")
;(setq dvi2-command "texworks")
;(setq dvi2-command "texstudio --pdf-viewer-only")
(setq tex-pdfview-command "rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance")
;(setq tex-pdfview-command "texworks")
;(setq tex-pdfview-command "texstudio --pdf-viewer-only")
(setq dviprint-command-format "powershell -Command \"& {$r = Write-Output %s;$p = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFileNameWithoutExtension($r),'.pdf','\"\"\"');Start-Process pdfopen -ArgumentList ('--r15','--file',$p)}\"")
(defun sumatrapdf-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process
      "fwdsumatrapdf"
      nil
      "fwdsumatrapdf"
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      (buffer-name)
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))))))
(add-hook 'yatex-mode-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c s") 'sumatrapdf-forward-search)))
(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))
;;
;; RefTeX with YaTeX
;;
;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
