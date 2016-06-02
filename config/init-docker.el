(unless (version<= emacs-version "24.4")
  (require-package 'dockerfile-mode))
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(provide 'init-docker)
