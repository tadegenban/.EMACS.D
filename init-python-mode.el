;; (autoload 'doctest-mode "doctest-mode" "Python doctest editing mode." t)

;; (setq auto-mode-alist
;;       (append '(("SConstruct\\'" . python-mode)
;; 		("SConscript\\'" . python-mode))
;;               auto-mode-alist))

;; (setq interpreter-mode-alist
;;       (cons '("python" . python-mode) interpreter-mode-alist))


;; ;;----------------------------------------------------------------------------
;; ;; On-the-fly syntax checking via flymake
;; ;;----------------------------------------------------------------------------
;; (eval-after-load 'python
;;   '(require 'flymake-python-pyflakes))

;; (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(elpy-enable)
(setq elpy-rpc-backend "rope")
(define-key elpy-mode-map (kbd "M-,") 'pop-tag-mark)

(provide 'init-python-mode)
