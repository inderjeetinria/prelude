;;; prelude-cmake.el ---
;;
;; Author: Julien Wintz
;; Created: Fri Dec 13 11:16:40 2013 (+0100)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 3
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

(require 'cmake-mode)
(require 'cmake-project)

(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode)
                ("\\.cmake.in\\'" . cmake-mode))
              auto-mode-alist))

(defun alamaison/maybe-cmake-project-hook ()
  (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))

(add-hook 'c-mode-hook 'alamaison/maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'alamaison/maybe-cmake-project-hook)
