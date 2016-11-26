;; -------------- emacs basic bindings -------------
;; aka
;; C(trl) M(elta, alt/option key)
;; S(hift) s(uper, macos command key)

;; <C-x C-f> open
;; <C-x C-s> save
;; <C-x C-c> exit in edit buffer
;; <q> exit in read-only buffer
;; <C-g> cancel shortcut cmd
;; <C-x b> switch buffer
;; <C-x C-b> show all buffers
;; <C-x left/right> change buffer
;; <C-x k> kill buffer
;; <C-x 3> new window on right
;; <C-c C-k> cancel ? not work

;; will replace with vim
;; <C-s> search, equal with <s-f>, default i-search, replace swiper
;; <C-w> cut, equal with <s-x>
;; <M-w> copy, equal with <s-c>
;; <C-y> paste, equal with <s-v>
;; <M-%> replace
;; <M-;> comment

;; <C-h t> show tutorial
;; <C-h k $SHORTCUT> show key bindings function introduce
;; <C-h f $FUNCTION> show function introduce
;; <C-h v $VARIABLE> show variables introduce
;; <M-x find-variable $VARIABLE>
;; <C-h m> show map & minor mode

;; <M-x info> -> "Emacs Lisp Intro" to study elisp
;; <C-x C-e> run a lisp program sentence
;; <M-x $FUNCTION> run a lisp function
;; <M-x eval-buffer> run current elisp buffer

;; Macos
;; <s-a> choose all
;; <s-c> copy
;; <s-v> paste
;; <s-s> save

;; my bindings as below
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; ------------------ packages ----------------------
;; Options -> Manage Emacs Packages -> Company/monikai-theme/hungry-delete
;; M-x list-packages


(global-set-key (kbd "\C-s") 'swiper) ;; enhance search
(global-set-key (kbd "s-f") 'swiper) ;; enhance search
(global-set-key (kbd "<f6>") 'ivy-resume) ;; find cursor content
(global-set-key (kbd "M-x") 'counsel-M-x) ;; enhance M-x
(global-set-key (kbd "C-x C-f") 'counsel-find-file) ;; enhance open file (find file no need exit use shell any more!!!)
(global-set-key (kbd "C-h f") 'counsel-describe-function) ;; enhance find function
(global-set-key (kbd "C-h v") 'counsel-describe-variable) ;; enhance find variable

;; use <C-x C-r> & <s-r> open recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; use shortcut to fast open current git repo files
(global-set-key (kbd "C-x p f") 'counsel-git)

;; use C-n/p replace M-n/p for company package
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  )

;; use cmd open file directory by package reveal-in-osx-finder
(global-set-key (kbd "C-x j") 'reveal-in-osx-finder)

;; use enhance indent cmd replace old one
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; use hippie to complet without company
(global-set-key (kbd "s-/") 'hippie-expand)

;; enhance occur mode, in occur use <e> to edit directly
(global-set-key (kbd "M-s o") 'occur-dwim)

;; enhance imenu to search all function
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; base on expand-region to choose fastly a region
(global-set-key (kbd "C-=") 'er/expand-region)

;; M-s i(counsel-imenu) M-s o(occur) M-s e(iedit)
;; base on iedit to easy replace
;; <M-x customize-group iedit> Iedit Occurrence face #ff0000
(global-set-key (kbd "M-s e") 'iedit-mode)

;; dired mode
;; <C-x C-j> to open current file with dired-mode
;; <S-6> to cd ..

;; base on helm-ag to search in project(need git repo first)
;; use <space> add more key words, use <!> to filter key words
;; use <C-c C-e> to edit search result in one buffer directly
(global-set-key (kbd "C-x p s") 'helm-do-ag-project-root)

;; same as shell
;; <C-a> to line start, <C-e> to line end
;; <C-w> to delete a word, <C-d> to delete a char
;; <C-k> to delete a line
;; imply <C-w> need <M-x customize-group evil> -> U Scroll on 

;; based on evil-nerd-comment 
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

(provide 'init-keybindings)
