(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
;;(moe-theme-set-color 'purple)

;; Color for Powerline
;; (Available colors: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b.)
(powerline-moe-theme)
;;(moe-theme-random-color)
(moe-theme-set-color 'purple)
;;-----------------------------------------------------------------
