;;-*- coding: utf-8 -*-
;; 文件编码
;; 如有可能就使用utf-8
(set-language-environment 'utf-8)
;; 设置新开buffer和及保存时的默认编码
;;(set-buffer-file-coding-system 'utf-8)
;; Windows下正确显示和保存中文文件名
(set-file-name-coding-system 'chinese-gbk)
;; 可以设置多个，注意后设置的使用时优先
;;(prefer-coding-system 'utf-8)
(prefer-coding-system 'chinese-gbk)


(defvar keke-latin-font "Courier New")
(defvar keke-chinese-font "新宋体")
(defvar keke-fontset "fontset-courier")

(defvar keke-latin-size 13)
(defvar keke-chinese-size 13)

(create-fontset-from-fontset-spec
 "-outline-Courier New-normal-r-*-*-13-97-96-96-c-*-fontset-courier")

(create-fontset-from-fontset-spec
 "-outline-Monaco-normal-r-*-*-15-*-96-96-c-*-fontset-monaco")

(create-fontset-from-fontset-spec
 "-outline-Lucida Sans Typewriter-normal-r-*-*-15-*-96-96-c-*-fontset-lucida")

(create-fontset-from-fontset-spec
 "-outline-DejaVu Sans Mono-normal-r-*-*-15-*-96-96-c-*-fontset-dejavu")

(create-fontset-from-fontset-spec
 "-outline-Consolas-normal-r-*-*-15-*-96-96-c-*-fontset-consolas")

(create-fontset-from-fontset-spec
 "-outline-Profont-normal-r-*-*-15-*-96-96-c-*-fontset-profont")

(create-fontset-from-fontset-spec
 "-outline-Inconsolata-normal-r-*-*-15-*-96-96-c-*-fontset-inconsolata")


(defun keke-set-font (latin-size  chinese-size)
  (interactive "nLatin Font Size: ")
  (cond
   ((string= keke-latin-font "Monaco")    
    (setq keke-fontset "fontset-monaco"))
   ((string= keke-latin-font "Lucida Sans Typewriter")
    (setq keke-fontset "fontset-lucida"))
   ((string= keke-latin-font "Consolas")
    (setq keke-fontset "fontset-consolas"))
   ((string= keke-latin-font "DejaVu Sans Mono")
    (setq keke-fontset "fontset-dejavu"))
   ((string= keke-latin-font "Courier New")
    (setq keke-fontset "fontset-courier"))
   ((string= keke-latin-font "profont")
    (setq keke-fontset "fontset-profont"))
   ((string= keke-latin-font "inconsolata")
    (setq keke-fontset "fontset-inconsolata"))
   (t
    (setq keke-fontset "fontset-courier")))
  (setq keke-latin-size latin-size)
  ;; chinese-size is normally not same as latin-size
  ;; (unless chinese-size      
  ;;   (setq chinese-size
  ;;         (if (string= keke-latin-font "Consolas")
  ;;             (cond
  ;;              ((<= latin-size 20) (+ 1 latin-size))
  ;;              ((<= latin-size 33) (+ 3 latin-size))
  ;;              (t (+ 4 latin-size)))
  ;;         (cond
  ;;          ((<= latin-size 24) (+ 3 latin-size))
  ;;          ((<= latin-size 29)  (+ 5 latin-size))
  ;;          (t (+ 6 latin-size)))
  ;;         )))
  ;; (setq keke-chinese-size chinese-size)
  ;; the font-name format of 微软雅黑 might be different from 新宋体
  (let ((latin-font
         (format
          (concat "-outline-" keke-latin-font "-*-*-*-*-%d-97-96-96-c-*-iso8859-1")
          latin-size))
        (chinese-font
         (format
          (if (string= keke-chinese-font "微软雅黑")
;;           (decode-coding-string              
              (concat "-outline-" keke-chinese-font "-*-r-*-*-%d-*-96-96-p-*-iso10646-1")
;;            'utf-8)
;;           (decode-coding-string              
            (concat "-outline-" keke-chinese-font "-*-r-*-*-%d-*-96-96-c-*-iso10646-1")
;;            'utf-8)
            )
          chinese-size)))
    ;; set font for all charsets
    (set-fontset-font			
     keke-fontset nil chinese-font nil 'prepend)
    (set-fontset-font
     keke-fontset 'ascii latin-font nil 'prepend)
    (set-fontset-font
     keke-fontset 'latin latin-font nil 'prepend)
    (set-fontset-font
     keke-fontset 'kana chinese-font nil 'prepend)
    (set-fontset-font
     keke-fontset 'han chinese-font nil 'prepend)
    (set-fontset-font
     keke-fontset 'cjk-misc chinese-font nil 'prepend)
    (set-fontset-font
     keke-fontset 'symbol chinese-font nil 'prepend)
    ;; use the font
    (set-default-font keke-fontset)
    ;; set for new frame too
    (push (cons 'font keke-fontset) default-frame-alist)
    )
  (message "Current Latin Font: %s, Font Size: %d"
           keke-latin-font keke-latin-size))


(defun keke-fontset-monaco (latin-size chinese-size)
  (interactive "P")
  (setq keke-latin-font "Monaco")
  (setq keke-chinese-font "微软雅黑")
  (setq keke-latin-size latin-size)
  (setq keke-chinese-size chinese-size)
  (keke-set-font keke-latin-size keke-chinese-size))

(defun keke-fontset-courier (latin-size chinese-size)
  (interactive "P")
  (setq keke-latin-font "Courier New")
  (setq keke-chinese-font "微软雅黑")
  (setq keke-latin-size latin-size)
  (setq keke-chinese-size chinese-size)
  (keke-set-font keke-latin-size keke-chinese-size))

(defun keke-fontset-dejavu (latin-size chinese-size)
  (interactive "P")
  (setq keke-latin-font "DejaVu Sans Mono")
  (setq keke-chinese-font "微软雅黑")
  (setq keke-latin-size latin-size)
  (setq keke-chinese-size chinese-size)
  (keke-set-font keke-latin-size keke-chinese-size))

(defun keke-fontset-consolas (latin-size chinese-size)
  (interactive "P")
  (setq keke-latin-font "Consolas")
  (setq keke-chinese-font "微软雅黑")
  (setq keke-latin-size latin-size)
  (setq keke-chinese-size chinese-size)
  (keke-set-font keke-latin-size keke-chinese-size))

(defun keke-fontset-profont (latin-size chinese-size)
  (interactive "P")
  (setq keke-latin-font "profont")
  (setq keke-chinese-font "微软雅黑")
  (setq keke-latin-size latin-size)
  (setq keke-chinese-size chinese-size)
  (keke-set-font keke-latin-size keke-chinese-size))

(defun keke-fontset-inconsolata (latin-size chinese-size)
  (interactive "P")
  (setq keke-latin-font "inconsolata")
  (setq keke-chinese-font "微软雅黑")
  (setq keke-latin-size latin-size)
  (setq keke-chinese-size chinese-size)
  (keke-set-font keke-latin-size keke-chinese-size))

;; (keke-fontset-dejavu 14 13)
;; (keke-fontset-consolas 13 12)
;; (keke-fontset-monaco 11 12)
;; (keke-fontset-courier 13 13)

(provide 'init-fonts-locale)