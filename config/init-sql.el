(defun keke-sql-mode-hook ()
  (setq tab-width 2 indent-tabs-mode nil)
  (setq sql-product (quote mysql))
)
(add-hook 'sql-mode-hook 'keke-sql-mode-hook)

(provide 'init-sql)
