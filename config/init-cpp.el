;; C++
;; Set header file mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cxx\\'" . c++-mode))

;; C++ and C mode...
;; keke c++ mode
(defun keke-c++-mode-hook ()
  (setq tab-width 4 indent-tabs-mode nil)
  (setq indent-tabs-mode nil)
  (c-set-style "stroustrup")
  (interactive)
  (define-key c-mode-map [return] 'newline-and-indent)
  (c-toggle-auto-newline)
  (c-toggle-hungry-state)
)

(add-hook 'c++-mode-hook 'keke-c++-mode-hook)
(add-hook 'c-mode-hook 'keke-c++-mode-hook)

(provide 'init-cpp)
