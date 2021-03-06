;;; prelude-gutter.el ---
;;
;; Author: Julien Wintz
;; Created: Sat Feb  1 19:29:23 2014 (+0100)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Download additional MELPA packages
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prelude-require-packages '(fringe-helper git-gutter git-gutter-fringe))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (display-graphic-p)
  (require 'git-gutter-fringe)
  (require 'git-gutter))

(global-git-gutter-mode t)

(global-set-key (kbd "C-x v g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-x v p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x v n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

(when (display-graphic-p)
  (setq git-gutter-fr:side 'right-fringe))
