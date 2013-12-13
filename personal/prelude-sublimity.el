;;; prelude-sublimity.el ---
;;
;; Author: Julien Wintz
;; Created: Fri Dec 13 11:07:12 2013 (+0100)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Download additional MELPA packages
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prelude-require-package 'sublimity)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (display-graphic-p)
  (require 'sublimity)
  (require 'sublimity-scroll)
  (require 'sublimity-map))

(defun jwintz/sublimity-hook ()
  (when (display-graphic-p)
    (sublimity-mode)))


(add-hook 'text-mode-hook 'jwintz/sublimity-hook)
(add-hook 'c-mode-common-hook 'jwintz/sublimity-hook)
