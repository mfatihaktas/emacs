;; begin(smooth-scroll)
(add-to-list 'load-path "~/.emacs.d/plugins/smooth-scrolling")
(require 'smooth-scrolling)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1)
;; end(smooth-scroll)
EOF
