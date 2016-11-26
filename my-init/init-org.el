(with-eval-after-load 'org
  ;; set org-mode source code synax highlight
  (setq org-src-fontify-natively t)

  ;; set agenda search org-file in "~/org" path
  (setq org-agenda-files '("~/.emacs.d"))

  ;; set capture store file
  ;; 1. Todo templates store in  "~/.emacs.d/gtd.org"
  (setq org-capture-templates
	'(
	  ("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	   "* TODO [#B] %?\n %i\n"
	   :empty-lines 1)
	  ("j" "Journal Entry"
	   entry (file+datetree "~/org-notes/journal.org")
	   "* %?"
	   :empty-lines 1)
;	  ("c" "Chrome" entry (file+headline "~/org-notes/notes.org" "Quick notes")
;	   "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
;	   :empty-lines 1)
	  ))
  )

;; use <f3> key bindings org-capture
(global-set-key (kbd "<f3>") 'org-capture)
;; r aka remeber
(global-set-key (kbd "C-c r") 'org-capture)

;; use <C-c a> keybindings org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;; export <C-c C-e> <o>->html

(provide 'init-org)
