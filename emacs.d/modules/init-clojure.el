;;; init-clojure.el --- Clojure programming

;;; Commentary:

;; Configure editor to work with Clojure.

;;; Code:

;; Enhanced Clojure syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; Clojure mode configuration
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'show-paren-mode)

;; Cider configuration
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'show-paren-mode)
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 10000)
(setq cider-repl-history-file "~/.emacs.d/.cider-repl-history")

;; Use clojure-mode for ClojureScript files
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

(provide 'init-clojure)
;;; init-clojure.el ends here
