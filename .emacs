(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;;Powerline activation through path
(add-to-list 'load-path "~/.emacs.d/emacs-powerline/")
(require 'powerline)

;; Moe-Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/moe-theme.el/")
(require 'moe-theme)

;Show highlighted buffer-id as decoration. (Default: nil)
(setq moe-theme-highlight-buffer-id t)

;; Resize titles
;;(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
;;(require 'markdown-mode)
;;(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

(moe-dark)
(moe-theme-set-color 'purple)
;;(powerline-moe-theme)

;; transparency
(set-frame-parameter (selected-frame) 'alpha '(90 . 60))
(add-to-list 'default-frame-alist '(alpha . (90 . 60)))

(put 'downcase-region 'disabled nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(put 'scroll-left 'disabled nil)
(global-display-line-numbers-mode 1)
(setq create-lockfiles nil)

(require 'org-tree-slide)
; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "https://melpa.org/packages/")
   t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(treemacs emmet-mode a flycheck web-mode go-mode modern-cpp-font-lock yasnippet-snippets which-key try ## org-tree-slide moe-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Programming
(setq-default tab-width 3)
(setq skeleton-pair t)
;;(global-set-key "(" 'skeleton-pair-insert-maybe)
;;(global-set-key "[" 'skeleton-pair-insert-maybe)
;;(global-set-key "{" 'skeleton-pair-insert-maybe)
(show-paren-mode t)

;; Melpa-archive
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try :ensure t)
(use-package which-key :ensure t :config (which-key-mode))

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; auto complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;; C++
(use-package modern-cpp-font-lock
  :ensure t)

(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

;; Go-Language
(autoload 'go-mode "go-mode" nil t)

;; React
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 4))
  
(add-hook 'web-mode-hook  'web-mode-init-hook)
;; flycheck
(require 'flycheck)
(setq-default flycheck-disabled-checkers
           (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))
;; Enable eslint checker for web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'add-node-modules-path)
(defun web-mode-init-prettier-hook ()
  (add-node-modules-path)
  (prettier-js-mode))

(add-hook 'web-mode-hook  'web-mode-init-prettier-hook)
(add-hook 'web-mode-hook 'emmet-mode)
;; Save backup files in different folder
(setq auto-save-file-name-transforms
  `((".*" "~/.emacs-saves/" t)))
(setq backup-directory-alist '(("." . "~/.emacs-saves")))
