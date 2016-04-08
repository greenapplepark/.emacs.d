(unless (version<= emacs-version "24")
  (progn
    (require-package 'smartparens)
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-smartparens-global-mode +1)))

(provide 'init-smartparens)
