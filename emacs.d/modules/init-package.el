;;; init-package.el --- Package management and tools

;;; Commentary:

;; Setup package manager and default packages.

;;; Code:

(require 'package)

;; Packages installed by default
(defvar default-packages
  '(ace-jump-mode
    ace-jump-buffer
    ack-and-a-half
    browse-kill-ring
    ctags-update
    dash
    diminish
    direx
    epl
    erlang
    expand-region
    flx
    flx-ido
    flycheck
    go-mode
    haskell-mode
    ido-ubiquitous
    jinja2-mode
    lua-mode
    magit
    midnight
    monokai-theme
    projectile
    racket-mode
    rainbow-delimiters
    rainbow-mode
    smartparens
    smex
    undo-tree
    yaml-mode
    yasnippet))

;; Add melpa package repository and initialize package database
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Store package cache in ~/.emacs.d/elpa
(setq package-user-dir (expand-file-name "elpa" "~/.emacs.d"))

;; Refresh packages list if not already
(unless (file-exists-p package-user-dir)
  (package-refresh-contents))

(defun install-packages (packages)
  "Install packages, provided in PACKAGES list."
  (mapc #'install-package packages))

(defun install-package (package)
  "Install provided PACKAGE."
  (when (not (package-installed-p package))
    (package-install package)))

;; Install default packages
(install-packages default-packages)

(provide 'init-package)
;;; init-package.el ends here
