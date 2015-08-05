;;custom setting

;;
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-z") 'undo)

;;color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/emacs-color-theme-solarized-master/")
(load-theme 'solarized-dark t)

;;
;;dired use 'a' open in current buffer
(put 'dired-find-alternate-file 'disabled nil)
;; rebind '^' to use the same buffer
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
 ))

;; Setting English Font
(set-face-attribute 'default nil :font "Consolas 12")
;; Chinese Font
;;(set-default-font "Monaco-10")
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei"
				 :size 12)))
;;指定窗口打开文件
(global-set-key (kbd "<f8>")
    (lambda () (interactive)
               (progn (message "Current windows is assigned.")
                      (setq assigned-window (selected-window))
               )
    )
)

(eval-after-load 'dired
    '(define-key dired-mode-map (kbd "\C-o")
        (lambda () (interactive)
                   (let ((target-window assigned-window))
                        (set-window-buffer target-window
                            (find-file-noselect (dired-get-file-for-visit))
                        )
                        (select-window target-window)
                   )
        )
     )
)
;;auto-mode-list
(add-to-list 'auto-mode-alist '("\\.qss\\'" . css-mode))
;;quick-jump mode
(require 'quick-jump)
(global-set-key (kbd "C-\\") 'quick-jump-push-marker)
(global-set-key (kbd "C-\'") 'quick-jump-go-forward)
(global-set-key (kbd "C-;") 'quick-jump-go-back)
(global-set-key (kbd "C-|") 'quick-jump-clear-all-marker)

;;auto split windows
(add-hook 'window-setup-hook (lambda () (split-window-horizontally)
                               (select-window-2)
                               (split-window-vertically) )
          )

;;
(require 'nyan-mode)





