;;; prelude-header.el ---
;;
;; Author: Julien Wintz
;; Created: Fri Dec 13 11:05:56 2013 (+0100)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Download additional MELPA packages
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prelude-require-package 'header2)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq header-author 'user-full-name)
(setq header-file-name 'buffer-file-name)
(setq header-creation-date 'current-time-string)
(setq header-modification-author 'user-full-name)
(setq make-header-hook '(header-title
                         header-blank
                         header-author
                         header-creation-date
                         header-version
                         header-modification-date
                         header-modification-author
                         header-update-count
                         header-end-line
                         header-history
                         header-blank
                         header-end-line))

(define-key global-map "\C-x\C-hm" 'make-header)
(define-key global-map "\C-x\C-hc" 'make-box-comment)
(define-key global-map "\C-x\C-hd" 'make-divider)
(define-key global-map "\C-x\C-hr" 'make-revision)
(define-key global-map "\C-x\C-hg" 'update-file-header)

(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)

(autoload 'auto-make-header "header2")
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
(add-hook 'c-mode-common-hook   'auto-make-header)
