;;; init.el --- Custom Emacs configuration

;;; Commentary:

;; Emacs uses this file as an entry point.

;;; Code:

;; Init packages
(package-initialize)

;; Add custom modules to load path
(add-to-list 'load-path "~/.emacs.d/modules/")

;; Core requirements
(require 'init-keys)
(require 'init-package)
(require 'init-ui)
(require 'init-go)
(require 'init-python)

;; Completely disable backups
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Editor settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(global-auto-revert-mode t)
(delete-selection-mode t)
(global-hl-line-mode t)
(setq require-final-newline t)

;; Disable all scms
(setq vc-handled-backends nil)

;; Undo tree mode
(global-undo-tree-mode t)
(diminish 'undo-tree-mode)

;; Whitespace mode configuration
(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-line-column 80)
(setq whitespace-style '(face trailing tabs empty tab-mark))
(diminish 'whitespace-mode)

;; Ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "")
(setq ivy-re-builders-alist
      '((t . ivy--regex-ignore-order)))
(setq ivy-initial-inputs-alist nil)
(diminish 'ivy-mode)

;; Increase selected region by semantic units
(require 'expand-region)

;; Flycheck mode
(global-flycheck-mode t)
(diminish 'flycheck-mode)

;; Enable magit
(require 'magit)

;; Projectile mode
(projectile-global-mode)
(setq projectile-completion-system 'ivy)

;; Configure Smex
(setq smex-save-file "~/.emacs.d/.smex-items")
(setq smex-history-length 10)

;; Configure GitGutter
(global-git-gutter-mode +1)
(diminish 'git-gutter-mode)

;; Configure which-key
(which-key-mode)

;; Python3 by default
(setq python-shell-interpreter "python3")

;;; init.el ends here
