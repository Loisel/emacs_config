(require 'package)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
;; some tools
(require 'helpers)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("melpa-milkbox" . "http://melpa.milkbox.net/packages/"))

;; start without toolbar and maximized
(tool-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-replace t)
 '(csv-separators (quote ("," ";")))
 '(custom-safe-themes
   (quote
    ("d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" default)))
 '(ess-eval-visibly (quote nowait))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files
   (quote
    ("~/pik-cloud/org/notes.org" "~/pik-cloud/org/lca.org" "~/pik-cloud/org/vw.org" "~/pik-cloud/org/ssp5.org" "~/pik-cloud/org/shape.org" "~/pik-cloud/org/other.org" "~/pik-cloud/org/transport-edge.org" "~/pik-cloud/org/sdp.org")))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (magit csv-mode gist websocket dash simple-httpd js2-mode skewer-mode s deferred request request-deferred pyvenv epl pkg-info projectile popup poly-noweb poly-markdown julia-mode ivy highlight-indentation helm-make async helm gams-ac find-file-in-project ctable ess-R-data-view company ac-helm helm-core poly-R yasnippet solarized-theme alect-themes polymode markdown-mode ein flycheck po-mode auto-complete django-mode elpy smartparens ess org htmlize gams-mode)))
 '(reb-re-syntax (quote string)))

;; globally enable flycheck
;;(global-flycheck-mode)

(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'

;; IDO
(require 'ido)
(ido-mode t)

;; load paths
(add-to-list 'load-path "~/emacs.d/lisp")

;; gams
(require 'gams-mode)
(setq gams-process-command-name "/home/alois/gams/gams25.0_linux_x64_64_sfx/gams")
(setq gams-system-directory "/home/alois/gams/gams25.0_linux_x64_64_sfx/gams")


;; auto-complete
(ac-config-default)

;; R
;; (setq-default inferior-R-program-name "R")
(require 'ess-site)

(add-hook 'ess-mode-hook
          (lambda()
	     (interactive)
             (local-set-key [(shift return)] 'ess-execute-to-point)
             (local-set-key (kbd "C-<") 'ess-insert-assign)
             (local-set-key (kbd "C-.") 'ess-set-working-directory)
             (local-set-key (kbd "C-c d") 'ess-describe-object-at-point)
	     (comint-move-point-for-output t)
	     ))

(define-key ac-completing-map [return] nil)
(define-key ac-completing-map "\r" nil)

(setq ess-default-style 'DEFAULT)
;;(ess-toggle-underscore nil)

(defun rmd-mode ()
  "ESS Markdown mode for rmd files."
  (interactive)
  (require 'poly-R)
  (require 'poly-markdown)
  (poly-markdown+r-mode))

;; (add-hook 'poly-markdown+r-mode 'yas-minor-mode)

;; smartparens
;;(require 'smartparens-config)
;; Always start smartparens mode in python mode.
;;(add-hook 'python-mode-hook 'smartparens-mode)

;; elpy mode
(elpy-enable)

;; white space cleanup
;;(add-hook 'before-save-hook 'whitespace-cleanup)

;; global key setup
;; this is a redefinition of (useless) toggle read-only mode
(global-set-key (kbd "C-x C-q") 'find-file-at-point)

;; electric pair mode
(electric-pair-mode 1)

;; ibuffer instead of normal buffer view
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; add-quotes
(global-set-key (kbd "M-\"") 'add-quotes)

;; comment-or-uncomment
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-r") 'revert-buffer)

;; magit status
(global-set-key (kbd "C-x g") 'magit-status)

;; org mode auto fill mode hook
(add-hook 'org-mode-hook 'auto-fill-mode)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-directory "~/pik-cloud/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-support-mode
       '((gams-mode . nil)
     (t . jit-lock-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; hl line
(global-hl-line-mode)

;;(inhibit-startup-screen t)
(load-theme 'solarized-light t)

