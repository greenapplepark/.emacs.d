(require-package 'paredit)
(autoload 'enable-paredit-mode "paredit")
(paredit-mode 1)

(defun maybe-map-paredit-newline ()
  (unless (or (memq major-mode '(inferior-emacs-lisp-mode cider-repl-mode))
              (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))

(add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)

;; (after-load 'paredit
;;   (diminish 'paredit-mode " Par")
;;   (dolist (binding (list (kbd "C-<left>") (kbd "C-<right>")
;;                          (kbd "C-M-<left>") (kbd "C-M-<right>") (kbd "M-DEL")))
;;     (define-key paredit-mode-map binding nil))

;;   ;; Allow my global binding of M-? to work when paredit is active
;;   (define-key paredit-mode-map (kbd "M-?") nil))


(diminish 'paredit-mode " Par")
(dolist (binding (list (kbd "C-<left>") (kbd "C-<right>")
		       (kbd "C-M-<left>") (kbd "C-M-<right>") (kbd "M-DEL")))
  (define-key paredit-mode-map binding nil))



;; Compatibility with other modes

;; (suspend-mode-during-cua-rect-selection 'paredit-mode)


;; Use paredit in the minibuffer
;; TODO: break out into separate package
;; http://emacsredux.com/blog/2013/04/18/evaluate-emacs-lisp-in-the-minibuffer/
(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)

(defvar paredit-minibuffer-commands '(eval-expression
                                      pp-eval-expression
                                      eval-expression-with-eldoc
                                      ibuffer-do-eval
                                      ibuffer-do-view-and-eval)
  "Interactive commands for which paredit should be enabled in the minibuffer.")

(defun conditionally-enable-paredit-mode ()
  "Enable paredit during lisp-related minibuffer commands."
  (if (memq this-command paredit-minibuffer-commands)
      (enable-paredit-mode)))

;; ----------------------------------------------------------------------------
;; Enable some handy paredit functions in all prog modes
;; ----------------------------------------------------------------------------

(require-package 'paredit-everywhere)
(add-hook 'prog-mode-hook 'paredit-everywhere-mode)
(add-hook 'css-mode-hook 'paredit-everywhere-mode)

(provide 'init-paredit)
