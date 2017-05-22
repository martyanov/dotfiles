;;; init.el --- Custom Emacs configuration

;;; Commentary:

;; Emacs uses this file as an entry point.

;;; Code:

(add-to-list 'load-path "~/.emacs.d/modules/")

;; Core requirements
(require 'init-keys)
(require 'init-package)
(require 'init-ui)
(require 'init-clojure)
(require 'init-go)

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

;; Undo tree mode
(global-undo-tree-mode t)
(diminish 'undo-tree-mode)

;; Whitespace mode configuration
(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-line-column 80)
(setq whitespace-style '(face trailing tabs empty tab-mark))

;; Ido
(ido-mode t)
(flx-ido-mode t)

;; Kill old buffers
(require 'midnight)

;; Increase selected region by semantic units
(require 'expand-region)

;; Flycheck mode
(global-flycheck-mode t)
(diminish 'flycheck-mode)

;; Enable magit
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

;; Projectile mode
(projectile-global-mode)

;; Configure Smex
(setq smex-save-file "~/.emacs.d/.smex-items")
(setq smex-history-length 10)

;; Configure GitGutter
(global-git-gutter-mode +1)

;; Python3 by default
(setq python-shell-interpreter "python3")

;;; init.el ends here
