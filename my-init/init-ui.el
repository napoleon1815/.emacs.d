;; set font
(when (eq system-type 'gnu/linux)
 (set-default-font "Courier 10 Pitch-20"))
(when (not (eq system-type 'gnu/linux))
	    (set-default-font "Courier New-20"))

;; show line num
(global-linum-mode t)

;; close splash screen
(setq inhibit-splash-screen t)

;; disable annoy sound
(setq ring-bell-function 'ignore)

;; emacs buffer variable has two kind
;; buffer-local variable independence in every buffer(such as cursor-type)
;; use setq change buffer, use setq-default change global
;; if not buffer-local variable setq be equal with setq-default
(setq-default cursor-type 'bar)

;; close emacs toolbar
(tool-bar-mode -1)

;; close emacss scroollbar
(scroll-bar-mode -1)

;; high light current line
(global-hl-line-mode t)

;; launch will full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-ui)
