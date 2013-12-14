;;; prelude-evil.el ---
;;
;; Author: Julien Wintz
;; Created: Fri Dec 13 11:07:59 2013 (+0100)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Download additional MELPA packages
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prelude-require-package 'evil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'evil)

(setq evil-normal-state-cursor      '("red" box))
(setq evil-emacs-state-cursor    '("gray80" box))
(setq evil-insert-state-cursor    '("green" box))
(setq evil-motion-state-cursor     '("blue" box))
(setq evil-visual-state-cursor   '("purple" box))
(setq evil-operator-state-cursor '("orange" box))

(setq evil-normal-state-tag   (propertize "N" 'face '((:foreground    "red"))))
(setq evil-emacs-state-tag    (propertize "E" 'face '((:foreground "gray80"))))
(setq evil-insert-state-tag   (propertize "I" 'face '((:foreground  "green"))))
(setq evil-motion-state-tag   (propertize "M" 'face '((:foreground   "blue"))))
(setq evil-visual-state-tag   (propertize "V" 'face '((:foreground "purple"))))
(setq evil-operator-state-tag (propertize "O" 'face '((:foreground "orange"))))
