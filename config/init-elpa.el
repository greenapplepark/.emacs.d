;; Package
(let ((package-el-site-lisp-dir
       (expand-file-name "site-lisp/package" user-emacs-directory)))
  (when (and (file-directory-p package-el-site-lisp-dir)
             (> emacs-major-version 23))
    (message "Removing local package.el from load-path to avoid shadowing bundled version")
    (setq load-path (remove package-el-site-lisp-dir load-path))))

(require 'package)

(package-initialize)


(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Add the original Emacs Lisp Package Archive
;; (add-to-list 'package-archives
;;   '("elpa" . "http://tromey.com/elpa/"))
;; Add melpa to package list
(add-to-list 'package-archives
  '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Add popkit for China
;; (add-to-list 'package-archives
;;   '("popkit" . "http://elpa.popkit.org/packages/"))


;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install package `%s': %S" package err)
     nil)))

;;; Fire up package.el

(setq package-enable-at-startup nil)
(package-initialize)


; (require-package 'fullframe)
; (fullframe list-packages quit-window)

(require-package 'cl-lib)
(require 'cl-lib)

(require-package 'diminish)

; (defvar keke-packages
;   '(
;     popwin
;   "A list of packages to ensure are installed at launch.")


(provide 'init-elpa)
