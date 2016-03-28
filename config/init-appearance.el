(require 'linum)
(global-linum-mode)

(if (>= emacs-major-version 24)
  (progn
    (require-package 'color-theme-modern)
    (require-package 'alect-themes)
    (load-theme 'deep-blue t))
    ;; (load-theme 'alect-light-alt t))
  (progn
    (require 'color-theme)
    (color-theme-initialize)
    (color-theme-billw)))

;; Disable tool-bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Transparent
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 96 96))

;; Highlight current line.
(global-hl-line-mode t)
(or (facep 'keke-hl-line-face) (make-face 'keke-hl-line-face))
(setq hl-line-face 'keke-hl-line-face)
(face-spec-set 'keke-hl-line-face '((t (
                                      :background "DodgerBlue3"
                                                  ;;:bold
                                                  ;;:weight nil
                                                  :inverse-video nil
                                                  ))))
(defun keke-color-theme-adjust-hl-mode-face()
  "interactive"
  (let* ((color  (x-color-values (face-attribute 'default :background))))
    (if (null color)
      (error "not support.")
      (let ((keke-color (mapcar
        (lambda (x)
          (let ((y (/ #XFFFF 4))
            (delta #X18FF))
            (cond
              ((< x (* y 1))
               (+ x delta))
              ((< x (* y 2))
               (+ x delta))
              ((< x (* y 3))
               (- x delta))
              (t
               (- x delta)))))
        color)))
       (message "%S %S" color keke-color)
       (set-face-attribute
        'keke-hl-line-face nil
        :background
        (concat "#"
          (mapconcat
           (lambda (c) (format "%04X" c))
           keke-color
           "")))))))
(keke-color-theme-adjust-hl-mode-face)

(provide 'init-appearance)