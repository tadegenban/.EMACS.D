;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.t" . perl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . perl-mode))
(add-to-list 'interpreter-mode-alist '("t" . perl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . perl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . perl-mode))

(add-hook 'perl-mode-hook
  (lambda ()
    (require 'flymake)
    (flymake-mode 1) ;; use flymake
    (local-set-key (kbd "C-h f") 'cperl-perldoc)
    (local-set-key (kbd "M-.") 'etags-select-find-tag)
    (local-set-key (kbd "M-,") 'pop-tag-mark))) ;; use perldoc instead of info on C-h f

(provide 'init-cperl-mode)
