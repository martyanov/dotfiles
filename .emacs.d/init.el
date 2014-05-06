;;; init.el --- Custom Emacs configuration

;;; Commentary:

;; Emacs uses this file as an entry point.

;;; Code:

(add-to-list 'load-path "~/.emacs.d/")

;; Core requirements
(require 'init-package)
(require 'init-ui)

;; General settings
(setq backup-directory-alist `((".*" . "/tmp/")))
(setq auto-save-default nil)

;; Editor settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(global-auto-revert-mode t)
(delete-selection-mode t)
(global-hl-line-mode t)

;; Undo tree mode
(global-undo-tree-mode t)
(diminish 'undo-tree-mode)

;; Whitespace mode configuration
(global-whitespace-mode t)
(setq whitespace-line-column 80)
(setq whitespace-style '(empty face tabs lines-tail trailing))

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

;;; init.el ends here
