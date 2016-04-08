;; Title
(setq frame-title-format '(buffer-file-name "%b - [%f]" "%b"))


;; better scrolling
(setq 
  scroll-margin 3
  scroll-conservatively 10000)


;; Time display
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)


;; No backup files
;; (setq backup-directory-alist '(("" . "~/.emacs.d/backup/")))
(setq-default make-backup-files nil)


;; Parentheses
(show-paren-mode t)
(setq show-paren-style 'parentheses)


;;set default mode to text-mode
(setq default-major-mode 'text-mode)


;; Move mouse away
(mouse-avoidance-mode 'animate)


;; Use 'y/n' instead of 'yes/no'
(fset 'yes-or-no-p 'y-or-n-p)


;; Deal with same name buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


;; Copy buffer path to clipboard
(defun copy-current-buffer-path ()
  (interactive)
    (kill-new (convert-standard-filename (buffer-file-name (current-buffer)))))
;; Copy buffer name to clipboard
(defun copy-current-buffer-name ()
  (interactive)
    (kill-new (file-name-nondirectory (buffer-file-name (current-buffer)))))


;; Auto refresh file when changed outside
(global-auto-revert-mode t)


(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(global-set-key (read-kbd-macro "<M-DEL>") 'backward-delete-word)

;; New temp buffer
(defun generate-buffer ()
  (interactive)
  (switch-to-buffer (make-temp-name "scratch")))


;; Copy region/line
(defun keke-kill-ring-save (&optional n)
  "If region is active, copy region. Otherwise, copy line."
  (interactive "p")
  (if mark-active
      (kill-ring-save (region-beginning) (region-end))
    (if (> n 0)
        (kill-ring-save (line-beginning-position) (line-end-position n))
      (kill-ring-save (line-beginning-position n) (line-end-position)))))
(global-set-key (kbd "M-w") 'keke-kill-ring-save)


(defun keke-save-word-at-point()
  (interactive)
  (save-excursion
    (let ((end (progn (unless (looking-back "\\>" 1) (forward-word 1)) (point)))
          (beg (progn (forward-word -1) (point))))
      (copy-region-as-kill beg end)
      (message (substring-no-properties (current-kill 0))))))
(global-set-key (kbd "C-c w") 'keke-save-word-at-point)


(require-package 'highlight-symbol)
(global-set-key [(control f2)] 'highlight-symbol-at-point)
(global-set-key [f2] 'highlight-symbol-next)
(global-set-key [(shift f2)] 'highlight-symbol-prev)


;; Ace jump
(require-package 'ace-jump-mode) 
(define-key global-map (kbd "C-c k") 'ace-jump-mode)


;; Reload file
(defun reload-file ()
  (interactive)
  (let ((curr-scroll (window-vscroll)))
    (find-file (buffer-name))
    (set-window-vscroll nil curr-scroll)
    (message "Reloaded file")))
(global-set-key "\C-c\C-r" 'reload-file)


;; Redo
(require 'redo+)
(global-set-key (kbd "C-/") 'undo)
(global-set-key (kbd "C-.") 'redo)


;; For rgrep in windows
(if (eq system-type 'windows-nt)
  (progn
    (setq find-program "E:\\Software\\cygwin\\bin\\find.exe")
    ;; Prevent issues with the Windows null device (NUL)
    ;; when using cygwin find with rgrep.
    (defadvice grep-compute-defaults (around grep-compute-defaults-advice-null-device)
      "Use cygwin's /dev/null as the null-device."
      (let ((null-device "/dev/null")) ad-do-it))
    (ad-activate 'grep-compute-defaults)))


;; Hungry delete
(require 'hungry-delete)


;; PopWin
(require-package 'popwin)
(require 'popwin)
(popwin-mode 1)

(provide 'init-editing-utils)
