;;; init-ui.el --- UI tweaks

;;; Commentary:

;; Tweak default Emacs UI settings: controls, theme, font etc.

;;; Code:

;; Disable annoying UI controls
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable control tooltips
(tooltip-mode -1)

;; Disable blinking cursor
(blink-cursor-mode -1)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Toggle short answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Tune scroll behavior
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position 1)

;; Use system font as default
(setq font-use-system-font t)

;; Use Monokai as a default theme
(load-theme 'monokai t)

;; Tune uniquify buffer name strategy
(setq uniquify-buffer-name-style 'post-forward)

;; Display line lenghts
(setq column-number-mode t)

(provide 'init-ui)
;;; init-ui.el ends here
