(setq
  desktop-path (list user-emacs-directory)
  desktop-auto-save-timeout 600)
(desktop-load-default)
(desktop-save-mode 1)

(require-package 'session)

(setq session-save-file (expand-file-name ".session" user-emacs-directory))
(setq session-name-disable-regexp "\\(?:\\`'/tmp\\|\\.git/[A-Z_]+\\'\\)")
(add-hook 'after-init-hook 'session-initialize)

(provide 'init-sessions)
