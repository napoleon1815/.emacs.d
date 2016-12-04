;; ------------- ehance packages system -------------
;; M-x describe-variable package-activated-list will list currently installed package
;; make packages system more powerful with Melpa
(when (>= emacs-major-version 24)
;;  (require 'package)
;;  (package-initialize)
;;  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)) ;; stable
(setq package-archives '(("popkit" . "http://elpa.popkit.org/packages/"))))
;;  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)) ;; leatst

;; load cl library to support useage "loop for"
(require 'cl)

;; make packages-list, add whatever needed packages here
;; M-x package-list-packages
;; i(nstall) u(ndo) D(elete) x(do) U(pdate) 
(defvar my-packages '(
		      company ;; auto complete
		      monokai-theme
		      hungry-delete ;; for fast delete munch space char
		      swiper ;; enhance basic operate package-1
		      counsel ;; enhance basic operate package-2
		      smartparens ;; parenthesis match
		      maxframe
		      ;; java IDE
		      js2-mode
		      nodejs-repl
		      js2-refactor
		      ;; let emacs could find the execuable
		      exec-path-from-shell
		      ;; let curser always follow pop new buffer
		      popwin
		      ;; gtd
		      org-pomodoro
		      ;; macos only
		      reveal-in-osx-finder
		      ;; for fast choose object-text
		      expand-region
		      ;; iedit
		      iedit
		      ;; need shell has ag firstly
		      helm-ag
		      ;; ehance yasnippet
		      auto-yasnippet
		      ;; evil for vim(undo-tree & goto-chg for evail, need add package one by one)
		      ;; evil state(vim mode)
		      ;; evil normal state <N> -> <E> (by <C-z>
		      ;; evil insert state <I> (<C-z> not work)
		      ;; evil visual state
		      ;; evil motion state
		      ;; evil emacs state <E> -> <N> (by <C-z>)
		      ;; evil operator state(diw)
		      goto-chg
		      undo-tree
		      evil
		      evil-leader
		      ;; vim patch surrod
		      evil-surround
		      ;; vim patch nerd-commenter
		      evil-nerd-commenter
		      ;; for faster switch window
		      window-numbering
		      ;; add powerline for vim/evil buffer
		      ;;powerline;;not good for useage
		      ;; which key
		      which-key
		      ;; fast move
		      avy
		      ;; c/c++ ide
		      xcscope
		      ) "A list of packages to ensure are installed at launch.")

;; check whether packages-list all installed
(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; if check fail, only refresh not installed packages-list
(unless (my-packages-installed-p)
  ;; check for new packages (package versions)                                  
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; <M-x package-list-packages> -> <d> -> <x>
 '(package-selected-packages
   (quote
    (company monokai-theme hungry-delete swiper counsel smartparens)))

;; for java IDE
;; config js2-mode for java files
;; <M-x> customize group -> js2-mode -> External Variable -> dark gray
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; bug!!
;; for exec-path-from-shell
;(when (memq window-system '(mac ns))
;  exec-path-from-shell-initialize)

;; for popwin
(require 'popwin)
(popwin-mode t)

;; for hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; for smartparens
;; (require 'smartparens-config)
(smartparens-global-mode t)

;; for swiper & counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; M-x global-company-mode
(global-company-mode t)
;; M-x customize-group -> company
;; Company Idle Delay 0.08 State -> save for future sessions
;; Company Minimum Prefix 1 -> save for future sessions

;; M-x load-theme -> monokai -> y
(load-theme 'monokai t)

;; 
(require 'org-pomodoro)

;; make smartparens ignore ' in emacs-lisp-mode 
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; config for js2-refactor(operate refer day5 31:32)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; <C-x d> enter dired mode
;; in dired mode use <+> to create directory
;; in dired mode use <C-h C-f> to create file
;; in dired mode use <g> to refresh dired buffer
;; in dired mode use <C> to copy file, if open two dired-mode default copy to other path
;; <d> to delete file
;; in dired mode use <D> to delete file after confirm
;; <R> to rename file
;; <C-x C-q> to edit dired mode

;; search tool ag > pt > ack > grep
;; macos:
;; 1)ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
;; 2)brew install the_silver_search
;; (brew update/brew install <repo>/brew uninstall <repo>/brew list)
;; ubuntu: apt-get install silversearcher-ag

;; <M-x customize-group popwin> set right & weight
;; <M-s o> reserve search buffer
;; <C-x o> move to another buffer

;; based on yasnippet(already exist package depand on it)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; based on autoyasnippet, usage:
;; 1)in a string add <~> before need replace keywords
;; 2)aya-create
;; 3)aya-expand
;; 4)input new keywords

;; based on evil
;; <M-x customize-group evil> -> Evil Want C U Scroll: Toggle on
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; based on window-numbering
(window-numbering-mode 1)

;; based on powerline
(require 'powerline)
(powerline-default-theme)

;; set evil-leader shortkey
;; <M-x Customize-group evil-leader> -> Evil Leader: SPC
(global-evil-leader-mode)
(evil-leader/set-key
 "jp" 'avy-goto-char-2-above
 "j;" 'avy-goto-char-2-below
 "ff" 'find-file
 "fr" 'recentf-open-files
 "bb" 'switch-to-buffer
 "bk" 'kill-buffer
 "pf" 'counsel-git
 "ps" 'helm-do-ag-project-root
 "0" 'select-window-0
 "1" 'select-window-1
 "2" 'select-window-2
 "3" 'select-window-3
 "w/" 'split-window-right
 "w-" 'split-window-below
 ":" 'counsel-M-x
 "wm" 'delete-other-windows
 "qq" 'save-buffers-kill-terminal)

;; avoid XX-mode default use evil normal state
(dolist (mode '(ag-mode
		git-rebase-mode)))
;; set XX-mode default use evil normal state(binding h/j/k/l key)
(add-hook 'occur-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/") 'evil-search-forward
	      (kbd "n") 'evil-search-next
	      (kbd "N") 'evil-search-previous
	      (kbd "C-d") 'evil-search-down
	      (kbd "C-u") 'evil-search-up
	      )
	    ))
(add-hook 'recentf-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings recentf-mode-map 'emacs
	      (kbd "/") 'evil-search-forward
	      (kbd "n") 'evil-search-next
	      (kbd "N") 'evil-search-previous
	      (kbd "C-d") 'evil-search-down
	      (kbd "C-u") 'evil-search-up
	      )
	    ))

;; add: <visual choose> + <shift+s> + <tag>
;; change: <c+s+old_tag+new_tag>
;; delete: <d+s+old_tag>
(require 'evil-surround)
(global-evil-surround-mode 1)

;; toggle on nerd-comment hotkeys
;; binding <, /> to comment & uncomment
(evilnc-default-hotkeys)

;; type 2 key, if not done, show the further key bindings 
(which-key-mode) 
;need adjust weight;(setq which-key-side-window-location 'right)

(provide 'init-packages)
