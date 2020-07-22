;; Custom-themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Melpa-packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; icons
;;------------------------------------------------------------------------------

;;Powerline activation through path
(add-to-list 'load-path "~/.emacs.d/powerline/")
(require 'powerline)

;; current-theme-path(moe)
(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/moe-theme.el/")
(require 'moe-theme)

;;Show highlighted buffer-id as decoration. (Default: nil)
(setq moe-theme-highlight-buffer-id t)

;; Resize titles
;;(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
;;(require 'markdown-mode)
(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

;; Color for mode-line:(Default: Blue)
;;(moe-theme-set-color 'purple) --> Deactivated cause powerline is active

;; Chose light- (moe-light) or dark-theme (moe-dark)
(moe-dark)

;; Color for Powerline (Available colors: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b.)
(powerline-moe-theme)
;;(moe-theme-random-color)
(moe-theme-set-color 'purple)
;------------------------------------------------------------------------------
;;autocompletion 
(ac-config-default)

;;Programming
(setq-default tab-width 3)
(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(show-paren-mode t)
;; UI
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)

;; Org
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-bullets-mode t)))
(setq org-ellipsis "⤵")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
'(org-file-apps
  (quote
   ((auto-mode . emacs)
    ("\\.mm\\'" . default)
    ("\\.x?html?\\'" . "/usr/bin/firefox %s")
    ("\\.pdf\\'" . default))))
;;-----------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (org-bullets org-edit-latex all-the-icons auto-complete ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
