;; -------------- my elisp bindings -----------------
;; check <<learn X in Y minutes>>

(global-set-key (kbd "<f2>") 'open-my-init-file)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; type "oo" + space
					    ("oo" "oliver.zeng")
					    ))

;; disable generate backup & auto-save file *~
(setq make-backup-files nil)
(setq auto-save-default nil)

;; make emacs behaviour looks more like normal editer
(delete-selection-mode t)

;; show match parents & mouse
;; add-hook need reboot to effective, hook on 'emacs-lisp-mode-hook major mode
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; if init.el changed auto reload for git roll back
(global-auto-revert-mode t)

;; set txt format is UTF-8 for support Chinese better
(set-language-environment "UTF-8")

;; make interactive cmd esay
(fset 'yes-or-no-p 'y-or-n-p)

;; dired-mode operate directory always recursive
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; set dired-mode buffer is always one
(put 'dired-find-alternate-file 'disabled nil)

;; avoid use to many require at initial time
;; but after enable dired mode to load
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; enable use <C-x C-j> to open current file with dired-mode
(require 'dired-x)

;; dwin = do what I mean(defun occur-dwim ()
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (deactivate-mark)
  (call-interactively 'occur))

(provide 'init-better-defaults)
