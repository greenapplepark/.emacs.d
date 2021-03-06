(unless (version< emacs-version "24.3.1")
  (progn
    (require-package 'swiper)
    (require-package 'counsel)
    (require 'ivy)
    (ivy-mode 1)

    (setq ivy-use-virtual-buffers t)
    (setq ivy-height 10)
    (setq ivy-count-format "(%d/%d) ")

    (global-set-key (kbd "C-s") 'swiper)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    ;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    ;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    ;; (global-set-key (kbd "<f1> l") 'counsel-load-library)
    ;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    ;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)

    (global-set-key (kbd "C-c C-r") 'ivy-resume)))
(provide 'init-swiper)
