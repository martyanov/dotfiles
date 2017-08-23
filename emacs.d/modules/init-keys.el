;;; init-keys.el --- Keybindings

;;; Commentary:

;; Custom keybindings

;;; Code:

;; Counsel keybindings
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; Replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-keys)
;;; init-keys.el ends here
