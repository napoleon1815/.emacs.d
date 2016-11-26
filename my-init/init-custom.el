


;; ---------------------------  not mine auto generate, change one sentence ---------------------------------
;; ------------------- only change package-selected-packages my-packages for easy remove  -------------------
;; ---------- delete package from my-packages, and M-x package-autoremove -----------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" default)))
 '(evil-leader/leader "SPC")
 '(evil-want-C-u-scroll t)
 '(org-pomodoro-long-break-length 40)
 '(package-selected-packages
   (quote
    (org-pomodoro smartparens popwin nodejs-repl monokai-theme maxframe js2-mode hungry-delete exec-path-from-shell counsel company)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 50))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(iedit-occurrence ((t (:inherit highlight)))))


(provide 'custom-file)
