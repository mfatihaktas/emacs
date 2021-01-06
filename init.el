;; ---------------------      INITIALIZE       -----------------------------------------

;; SETUP YOUR PROXY IF NEEDED
;; (setq url-proxy-services
;;       '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;         ("http" . "company.com:8080")
;;         ("https" . "company.com:8080")))

;; ----------------------------    THEME     -------------------------------------------
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)
  (package-initialize) )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a7760b614d51ba59af9bd4a87014e688cdcb7df36e971e21abc23cc7ad0cdfbc" default)))
 '(gdb-non-stop-setting nil t)
 '(git-commit-summary-max-length 100)
 '(message-fill-column 100)
 '(package-selected-packages
   (quote
    (tabbar silkworm-theme ## find-file-in-project projectile helm-ag dumb-jump helm))))

;; (load-theme 'wombat)
;; (load-theme 'misterioso)
(load-theme 'silkworm)
;; a great font: https://www.fontyukle.net/en/Monaco.ttf
;; (condition-case nil
;;     (set-default-font "Monaco")
;;   (error nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 100 :family "Hack")))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "APPL" :family "Monaco"))))
;;  '(fringe ((t (:background "#242424"))))
;;  '(linum ((t (:inherit (shadow default) :background "#191919" :foreground "#505050")))))

;; ---------------------    ENHANCEMENTS     -------------------------------------------

;; remove unecessary UI
(menu-bar-mode -1)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; remove whitespace before saving
(add-hook 'before-save-hook 'whitespace-cleanup)

;; faster to quit
(fset 'yes-or-no-p 'y-or-n-p)

;; highlight selected text
(transient-mark-mode t)

;; set path
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/usr/local/bin")

;; display matching parenthesis
(show-paren-mode 1)

;; usefull stuff before saving
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook 'before-save-hook '(lamdba () (require 'saveplace)(setq-default save-place t)))

;; refresh buffers when any file change
(global-auto-revert-mode t)

;; track recently opened file
(recentf-mode t)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(setq recentf-max-saved-items 1000)
(setq recentf-max-menu-items 50)

;; display pictures and other compressed files
(setq auto-image-file-mode t)
(setq auto-compression-mode t)

;; line and column numbering
(column-number-mode 1)
(line-number-mode 1)

;; code folding
(global-set-key (kbd "C-c C-d") 'hs-hide-all)
(global-set-key (kbd "C-c C-f") 'hs-show-all)
(global-set-key (kbd "C-c C-c") 'hs-toggle-hiding)
(add-hook 'prog-mode-hook #'(lambda () (hs-minor-mode t) ))

;; Search using regexp
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)

;; Usable on OSX and windows
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'alt)
(setq mac-right-option-modifier 'super)
(setq w32-get-true-file-attributes nil)
(setq vc-handled-backends nil)
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; scroll
(setq scroll-step 1)
(setq scroll-conservatively 10)
(setq scroll-margin 7)
(setq scroll-conservatively 5)

;; indentation
;; setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (setq standard-indent 4)
;; (setq indent-line-function 'insert-tab)
;; (setq tab-width 4)
;; (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
;; (setq indent-tabs-mode nil)

;; disable backup files
(setq make-backup-files nil)

;; auto wraping
(set-default 'truncate-lines t)
(add-hook 'text-mode-hook (lambda () (setq truncate-lines nil)))

;; line wrap
(setq linum-format "%d ")
;;(global-linum-mode 1)

;; ARTIST MODE
(eval-after-load "artist" '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation))

;; EWW - emacs web browser
(setq eww-search-prefix "https://www.google.com.au/search?q=")
(setq shr-color-visible-luminance-min 78) ;; improve readability (especially for google search)
(setq url-user-agent "User-Agent: Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7\n")
(global-set-key (kbd "C-c b") 'eww)

;; Setup the package manager
(defun load-package-manager ()
  (package-initialize)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")))
(add-hook 'after-init-hook 'load-package-manager)



;; Hide left line indicator
(setf (cdr (assq 'continuation fringe-indicator-alist))
      '(nil nil) ;; no continuation indicators
      ;; '(nil right-curly-arrow) ;; right indicator only
      ;; '(left-curly-arrow nil) ;; left indicator only
      ;; '(left-curly-arrow right-curly-arrow) ;; default
      )


;; Window split line
(set-face-attribute 'vertical-border nil :foreground "#303030")

;; ---------------------      PLUGINS          -----------------------------------------

;; Our plugins configuration will leave under the conf folder, so let's load this up:
;; (mapc
;;  (lambda(path) (load-file path))
;;  (condition-case nil
;;      (directory-files "~/.emacs.d/conf/" t "\.el$")
;;    (erro
;;    r (make-directory "~/.emacs.d/conf/"))))

;; ---------------------  Mehmet added  -------------------- ;;

;; See: http://www-internal/hub/share/sbtools/develfaq/faq_emacs.html
(load-file "//mathworks/hub/share/sbtools/emacs_setup.el")

;;(mapc
;; (lambda(path) (load-file path))
;; (directory-files "~/.emacs.d/conf/" t "\.el$"))

(global-set-key (kbd "M-x") 'helm-M-x)
;; (helm-projectile-on)

;; (projectile-global-mode)
(setq projectile-enable-caching t)

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; load the packaged named xyz.
(load "highlight-symbol") ;; best not to include the ending “.el” or “.elc”

(defun reload-dotemacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; (add-to-list 'ibuffer-never-show-regexps "^\\*")
;; (use-package ibuffer-sidebar
;;   :bind (("C-x C-b" . ibuffer-sidebar-toggle-sidebar))
;;   :ensure nil
;;   :commands (ibuffer-sidebar-toggle-sidebar))

;; (Global-Unset-key (kbd "C-z"))
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-q") 'quit-window)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "<M-left>") 'beginning-of-line)
(global-set-key (kbd "<M-right>") 'end-of-line)
(global-set-key (kbd "M-n") 'find-file-in-project)
(global-set-key (kbd "M-f") 'find-file)
(global-set-key (kbd "M-h") 'helm-ag)
;; (global-set-key (kbd "M-h") 'helm-occur)
(global-set-key (kbd "M-b") 'helm-buffers-list)
(global-set-key (kbd "M-m") 'helm-mini)
(global-set-key (kbd "M-d") 'delete-window)

(global-set-key (kbd "\C-b") 'undo-fu-only-undo)
(global-set-key (kbd "\C-n") 'undo-fu-only-redo)

;; (setq indent-tabs-mode nil)
(add-hook 'python-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq tab-width 2)
    (setq python-indent-offset 2)))
