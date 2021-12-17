(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; -------------------------------------------------------------------------------------
;; ----------------------------    THEME     -------------------------------------------
;; -------------------------------------------------------------------------------------

;; (load-theme 'wombat)
;; (load-theme 'spacemacs-light t)
;; (load-theme 'spacemacs-dark t)
;; (load-theme 'zenburn t)
;; (load-theme 'twilight-bright)
;; (load-theme 'autumn-light)
;; (load-theme 'paper)
;; (load-theme 'occidental)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (require 'cl-lib)
;; (load-file "~/.emacs.d/themes/spacemacs-common.el")
;; (load-file "~/.emacs.d/themes/spacemacs-light-theme.el")
;; (load-file "~/.emacs.d/themes/aalto-light-theme.el")

;; (setq base16-theme-256-color-source "base16-shell")

;; a great font: https://www.fontyukle.net/en/Monaco.ttf
(condition-case nil
    (set-default-font "Monaco")
  (error nil))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "APPL" :family "Monaco"))))
;;  '(fringe ((t (:background "#242424"))))
;;  '(linum ((t (:inherit (shadow default) :background "#191919" :foreground "#505050")))))

;; -------------------------------------------------------------------------------------
;; ---------------------    ENHANCEMENTS     -------------------------------------------
;; -------------------------------------------------------------------------------------

;; Make mouse work
(require 'mwheel)
(require 'mouse)
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(global-set-key [mouse-4] 'previous-line)
(global-set-key [mouse-5] 'next-line)


;; remove unecessary UI
(menu-bar-mode -1)
;; (scroll-bar-mode 0)
;; (tool-bar-mode 0)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; remove whitespace before saving
;; (add-hook 'before-save-hook 'whitespace-cleanup)

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

;; display time
;; (load "time" t t)
;; (display-time)

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
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq standard-indent 2)
(setq indent-line-function 'insert-tab)
(setq tab-width 2)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80))
(setq indent-tabs-mode nil)

;; disable backup files
(setq make-backup-files nil)

;; auto wraping
(set-default 'truncate-lines t)
(add-hook 'text-mode-hook (lambda () (setq truncate-lines nil)))

;; line wrap
(setq linum-format "%d ")
;;(global-linum-mode 1)

;; usefull shortcuts
(global-set-key [f3] 'comment-region)
(global-set-key [f4] 'uncomment-region)
(global-set-key [f5] 'eshell)
(global-set-key [f11] 'toggle-frame-fullscreen)
(global-set-key (kbd "C-h C-s") 'info-apropos)

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

;; Window split line
(set-face-attribute 'vertical-border nil :foreground "#303030")

;; Remove all trailing white spaces while saving
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; -------------------------------------------------------------------------------------
;; ---------------------      PLUGINS          -----------------------------------------
;; -------------------------------------------------------------------------------------

;; Our plugins configuration will leave under the conf folder, so let's load this up:
;; (mapc
;;  (lambda(path) (load-file path))
;;  (condition-case nil
;;      (directory-files "~/.emacs.d/conf/" t "\.el$")
;;    (erro
;;    r (make-directory "~/.emacs.d/conf/"))))

;; ---------------------  Mehmet added  -------------------- ;;

;; load emacs 24's package system. Add MELPA repository.
;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (add-to-list
;;    'package-archives
;;    ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
;;    '("melpa" . "http://melpa.milkbox.net/packages/")
;;    t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
    '("1a1266e25ed97448bbe80f246f53372d4b914d30802711abfda7afcbf2f7b3ec" "859ff6182156e4bea960c2c7678f8b3da23961046b855e805f0f5a5d09b92658" "aa6638f0cd2ba2c68be03220ea73495116dc6f0b625405ede34087c1babb71ae" "76b4632612953d1a8976d983c4fdf5c3af92d216e2f87ce2b0726a1f37606158" "a7760b614d51ba59af9bd4a87014e688cdcb7df36e971e21abc23cc7ad0cdfbc" default))
 '(git-commit-summary-max-length 100)
 '(package-selected-packages
    '(undo-fu silkworm-theme smooth-scroll ## find-file-in-project helm-ag dumb-jump helm)))

;; (load-theme 'silkworm)

;; (projectile-global-mode)
;; (setq projectile-enable-caching t)

;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; load the packaged named xyz.
(load "highlight-symbol") ;; best not to include the ending “.el” or “.elc”

;; (custom-set-variables
;;  '(highlight-symbol-colors
;;    (quote
;;     ("DeepPink" "cyan" "DarkRed" "DarkBlue" "tomato" "magenta1" )))
;;  )

(defun reload-dotemacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun ssh-o1 ()
  (interactive)
  (find-file "/ssh:mehmet@console.sb1.orbit-lab.org:/home/mehmet"))

(defun ssh-o2 ()
  (interactive)
  (find-file "/ssh:mehmet@console.sb2.orbit-lab.org:/home/mehmet"))

(defun ssh-o4 ()
  (interactive)
  (find-file "/ssh:mehmet@console.sb4.orbit-lab.org:/home/mehmet"))

(defun ssh-o1-1 ()
  (interactive)
  (find-file "/ssh:mehmet@console.sb1.orbit-lab.org|ssh:root@node1-1:/root/edge-load-balance"))

(defun ssh-o4-1 ()
  (interactive)
  (find-file "/ssh:mehmet@console.sb4.orbit-lab.org|ssh:root@node1-1:/root/edge-load-balance"))

(defun ssh-o4-5 ()
  (interactive)
  (find-file "/ssh:mehmet@console.sb4.orbit-lab.org|ssh:root@node1-5:/root/edge-load-balance"))

(require 'tramp)
(setq tramp-default-method "ssh")
;; (setq tramp-verbose 8)
;; (add-to-list 'tramp-default-proxies-alist
;;              '("ORBIT" nil "/ssh:mehmet@console.sb1.orbit-lab.org:"))

(defun ssh-amarel ()
  (interactive)
  (find-file "/ssh:mehmet@console.sb1.orbit-lab.org|ssh:mfa51@amarel.hpc.rutgers.edu:/home/mfa51"))

(add-hook 'python-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq tab-width 2)
    (setq python-indent-offset 2)))

;; (add-hook 'shell-mode-hook
;;   (lambda ()
;;     (setq indent-tabs-mode t)
;;     (setq tab-width 2)
;;     (setq python-indent-offset 2)))

(setq sh-basic-offset 2)

(straight-use-package 'dumb-jump)
(straight-use-package 'find-file-in-project)
(straight-use-package 'helm)
(straight-use-package 'helm-ag)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-q") 'quit-window)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-l") 'beginning-of-line)
(global-set-key (kbd "M-r") 'end-of-line)
(global-set-key (kbd "M-n") 'find-file-in-project)
(global-set-key (kbd "M-f") 'find-file)
(global-set-key (kbd "M-g") 'helm-ag)
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "M-h") 'highlight-symbol)
(global-set-key (kbd "M-S-h") 'highlight-symbol-remove-all)
(global-set-key (kbd "M-b") 'helm-buffers-list)
(global-set-key (kbd "M-m") 'helm-mini)
(global-set-key (kbd "M-d") 'delete-window)

(global-set-key (kbd "\C-b") 'undo-fu-only-undo)
(global-set-key (kbd "\C-n") 'undo-fu-only-redo)
(global-set-key (kbd "C-_") '
  comment-or-uncomment-region)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
