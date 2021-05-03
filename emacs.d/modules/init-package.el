;;; init-package.el --- Package management and tools

;;; Commentary:

;; Setup package manager and default packages.

;;; Code:

(require 'package)

;; Packages installed by default
(defvar default-packages
  '(ag
    browse-kill-ring
    counsel
    counsel-projectile
    ctags-update
    diminish
    erlang
    expand-region
    flycheck
    git-gutter
    git-timemachine
    go-mode
    haskell-mode
    jinja2-mode
    lua-mode
    magit
    monokai-theme
    projectile
    python-docstring
    rust-mode
    smartparens
    smex
    undo-tree
    virtualenvwrapper
    which-key
    yaml-mode
    yasnippet))

;; Add melpa package repository and initialize package database
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
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
