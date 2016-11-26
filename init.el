;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; <M-x update-directory-autoloads> search .el, if ";;;###autoload" exit
;; generate <autoload 'this_func "feature_name">
;; (package-initialize) equal with (update-directory-autoloads "~/.emacs.d/elpa")
;; run <M-x update-directory-autoloads> all .el file within "~/.emacs.d/elpa"
(package-initialize)
;; add load-path for <load func>, require -> load -> load-file -> autoload
;; <require func> if feature exit by <provide func> run directly, else run <load func>
;; <load func> first run .elc, if fail run .el
;; <load-file func> do not need load-path, need file absolute path with file postfix
;; <autoload> run a func by <require>, need use ";;;###autoload" above defun
;; use <M-x byte-recompile-directory> to convert .el to .elc
;; be attention emacs can not aouto generate .elc
;; so if .el changed, need convert .el to .elc again!!!
(add-to-list 'load-path "~/.emacs.d/my-init/")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-func)
(require 'init-keybindings)
(require 'init-org)
;; (load-file "~/.emacs.d/my-init/init-org.el")
;; (autoload 'open-my-init-file "init-func")

;; M-x customize-group -> <package name>
;; set customize change auto generate in custom-file, not default init.el 
(setq custom-file (expand-file-name "my-init/init-custom.el" user-emacs-directory))
(load-file custom-file)
