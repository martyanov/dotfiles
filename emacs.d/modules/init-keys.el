;;; init-keys.el --- Keybindings

;;; Commentary:

;; Custom keybindings

;;; Code:

;; Global keybindings for buffer-move
(global-set-key (kbd "<C-x-up>")     'buf-move-up)
(global-set-key (kbd "<C-x-down>")   'buf-move-down)
(global-set-key (kbd "<C-x-left>")   'buf-move-left)
(global-set-key (kbd "<C-x-right>")  'buf-move-right)

;; Smex keybindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-keys)
;;; init-keys.el ends here
