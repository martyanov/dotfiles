;;; init-python.el --- Python programming

;;; Commentary:

;; Configure editor to work with Python.

;;; Code:

;; Configure virtualenvwrapper package
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)

(provide 'init-python)
;;; init-python.el ends here
