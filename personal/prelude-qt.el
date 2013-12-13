;;; prelude-additions.el ---
;;
;; Author: Julien Wintz
;; Created: Sun Dec  8 23:03:50 2013 (+0100)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 65
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar prelude-personal-packages-dir (expand-file-name "packages" prelude-personal-dir) "")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Update load paths
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path prelude-personal-packages-dir)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'qt-pro)
(require 'qt-qml)

(add-to-list 'auto-mode-alist '("\\.pr[io]$" . qt-pro-mode))
(add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))
