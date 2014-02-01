;;; prelude-cedet.el ---
;;
;; Author: Julien Wintz
;; Created: Mon Dec  9 13:02:20 2013 (+0100)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 210
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(unless (featurep 'cedet-devel-load)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar prelude-personal-cedet-dir (expand-file-name "cedet" prelude-personal-dir) "")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Update load paths
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path prelude-personal-cedet-dir)
(add-to-list 'load-path (concat prelude-personal-cedet-dir "/contrib"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file (concat prelude-personal-cedet-dir "/cedet-devel-load.el"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic requirements
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'eassist)

(require 'semantic)
(require 'semantic/ia)
(require 'semantic/bovine/c)
(require 'semantic/bovine/clang)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic helpers
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(semantic-mode 1)

;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)

(global-semantic-idle-completions-mode)
;; (global-semantic-idle-scheduler-mode)
;; (global-semantic-idle-summary-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic GNU setup
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-mode-local c-mode semanticdb-find-default-throttle '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle '(project unloaded system recursive))

(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic hooks setup
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun alexott/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "C-c <left>") 'semantic-tag-folding-fold-block)
  (local-set-key (kbd "C-c <right>") 'semantic-tag-folding-show-block))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)

(defun alexott/c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-cz" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref))

(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic Qt setup
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun jwintz/qt-mode-cedet-hook-layer (dir)
  "Add all header files in DIR to `semanticdb-implied-include-tags'."
  (let ((files (directory-files dir t "^.+\\.h[hp]*$" t)))
    (defvar-mode-local c++-mode semanticdb-implied-include-tags
      (mapcar (lambda (header)
                (semantic-tag-new-include
                 header
                 nil
                 :filename header))
              files))))

(defun jwintz/qt-mode-cedet-hook ()
  (setq qt-base-dir "~/Development/qt/5.2.0/clang_64/lib")

  (semantic-add-system-include (concat qt-base-dir "/QtCore.framework/Headers") 'c++-mode)
  (semantic-add-system-include (concat qt-base-dir "/QtDeclarative.framework/Headers") 'c++-mode)
  (semantic-add-system-include (concat qt-base-dir "/QtGui.framework/Headers") 'c++-mode)
  (semantic-add-system-include (concat qt-base-dir "/QtNetwork.framework/Headers") 'c++-mode)
  (semantic-add-system-include (concat qt-base-dir "/QtOpenGL.framework/Headers") 'c++-mode)
  (semantic-add-system-include (concat qt-base-dir "/QtQml.framework/Headers") 'c++-mode)
  (semantic-add-system-include (concat qt-base-dir "/QtQuick.framework/Headers") 'c++-mode)
  (semantic-add-system-include (concat qt-base-dir "/QtTest.framework/Headers") 'c++-mode)
  (semantic-add-system-include (concat qt-base-dir "/QtWidgets.framework/Headers") 'c++-mode)
  (semantic-add-system-include (concat qt-base-dir "/QtXml.framework/Headers") 'c++-mode)

  (add-to-list 'auto-mode-alist (cons qt-base-dir 'c++-mode))

  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtCore.framework/Headers"))
  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtDeclarative.framework/Headers"))
  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtGui.framework/Headers"))
  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtNetwork.framework/Headers"))
  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtOpenGL.framework/Headers"))
  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtQml.framework/Headers"))
  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtQuick.framework/Headers"))
  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtTest.framework/Headers"))
  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtWidgets.framework/Headers"))
  (jwintz/qt-mode-cedet-hook-layer (concat qt-base-dir "/QtXml.framework/Headers"))

  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/QtCore.framework/qconfig.h"))
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/QtCore.framework/qconfig-large.h"))
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/QtCore.framework/qglobal.h"))

  (setq c-protection-key (concat "\\<\\(public\\|public slot\\|protected"
                                 "\\|protected slot\\|private\\|private slot"
                                 "\\)\\>")
        c-C++-access-key (concat "\\<\\(signals\\|public\\|protected\\|private"
                                 "\\|public slots\\|protected slots\\|private slots"
                                 "\\)\\>[ \t]*:"))
  (font-lock-add-keywords 'c++-mode '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
  (make-face 'qt-keywords-face)
  (set-face-foreground 'qt-keywords-face "BlueViolet")
  (font-lock-add-keywords 'c++-mode '(("\\<Q_[A-Z]*\\>" . 'qt-keywords-face)))
  (font-lock-add-keywords 'c++-mode '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))
  (font-lock-add-keywords 'c++-mode '(("\\<Q[A-Z][A-Za-z]*\\>" . 'qt-keywords-face)))
  (font-lock-add-keywords 'c++-mode '(("\\<Q[A-Z_]+\\>" . 'qt-keywords-face)))
  (font-lock-add-keywords 'c++-mode
                          '(("\\<q\\(Debug\\|Wait\\|Printable\\|Max\\|Min\\|Bound\\)\\>" . 'font-lock-builtin-face)))

  (setq c-macro-names-with-semicolon '("Q_OBJECT" "Q_PROPERTY" "Q_DECLARE" "Q_ENUMS"))
  (c-make-macro-with-semi-re))

(add-hook 'c-mode-common-hook 'jwintz/qt-mode-cedet-hook)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fix
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(unless (boundp 'x-max-tooltip-size)
  (setq x-max-tooltip-size '(80 . 40)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

)
