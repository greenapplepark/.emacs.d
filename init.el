(let ((minver "23.3"))
  (when (version<= emacs-version "23.1")
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-basic)
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)

(require 'init-appearance)
(require 'init-fonts)
(require 'init-sessions)
(require 'init-smartparens)
(require 'init-editing-utils)
(require 'init-ido)
(require 'init-swiper)
(require 'init-ibuffer)

;; Language support
(require 'init-php)
(require 'init-cpp)
(require 'init-sql)
(require 'init-docker)

;; (require 'init-org)

(require 'init-auto-complete)
(require 'init-magit)
(require 'init-projectile)
(require 'init-complete)
(require 'init-global-keys)


(provide 'init)
