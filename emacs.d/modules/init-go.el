;;; init-go.el --- Go programming

;;; Commentary:

;; Configure editor to work with Go.

;;; Code:

(require 'go-mode)

(add-hook 'go-mode-hook
          (lambda()
            ;; Use goimports instead of gofmt if available
            (when (executable-find "goimports")
              (setq gofmt-command "goimports"))

            ;; Run gofmt before saving the file
            (add-hook 'before-save-hook 'gofmt-before-save)))

(provide 'init-go)
;;; init-go.el ends here
