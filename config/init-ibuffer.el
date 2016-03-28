(require-package 'fullframe)
(after-load 'ibuffer
 (fullframe ibuffer ibuffer-quit))

;; (require-package 'ibuffer-vc)

; (defun ibuffer-set-up-preferred-filters ()
;   (ibuffer-vc-set-filter-groups-by-vc-root)
;   (unless (eq ibuffer-sorting-mode 'filename/process)
;     (ibuffer-do-sort-by-filename/process)))

; (add-hook 'ibuffer-hook 'ibuffer-set-up-preferred-filters)

(after-load 'ibuffer
  ;; Use human readable Size column instead of original one
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (cond
     ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
     ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
     (t (format "%8d" (buffer-size))))))


;; Explicitly require ibuffer-vc to get its column definitions, which
;; can't be autoloaded
; (after-load 'ibuffer
;   (require 'ibuffer-vc))


(require 'ibuf-ext)
(setq ibuffer-mode-hook
  (lambda ()
    (setq ibuffer-filter-groups
      '(
        ("*Buffer*" (name . "\\*.*\\*"))
        ("Dired" (mode . dired-mode))
        ("Elisp" (or (mode . emacs-lisp-mode)
                     (mode . lisp-interaction-mode)))
        ("Org" (mode . org-mode))
))))
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-default-sorting-mode 'alphabetic)

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 70 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 20 16 :left :elide)
              " "
              filename-and-process)))

(setq ibuffer-filter-group-name-face 'font-lock-doc-face)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-ibuffer)