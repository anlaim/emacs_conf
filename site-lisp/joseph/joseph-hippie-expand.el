;;; -*- coding:utf-8 -*-
;;{{{ byte compile
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
;;}}}

(setq-default save-completions-file-name "~/.emacs.d/cache/completions")



;;{{{ hippie-expand 补全的设置 [(control return)] 代码补全
(global-set-key [(control return)] 'hippie-expand)
;(autoload 'senator-try-expand-semantic "senator")
(autoload 'try-joseph-dabbrev-substring "joseph-command" "让hippie-expand支持子串匹配" nil)
(setq-default hippie-expand-try-functions-list
     '(
;        senator-try-expand-semantic
        try-joseph-dabbrev-substring
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)

;;}}}

;;{{{ 粘贴的时候自动缩进

;; automatically indenting yanked text if in programming-modes
(defvar yank-indent-modes '(emacs-lisp-mode lisp-mode
                            c-mode c++-mode js2-mode
                            tcl-mode sql-mode
                            perl-mode cperl-mode
                            java-mode jde-mode
                            lisp-interaction-mode
                            LaTeX-mode TeX-mode
                            scheme-mode clojure-mode)
  "Modes in which to indent regions that are yanked (or yank-popped)")

(defadvice yank (after indent-region activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (member major-mode yank-indent-modes)
      (let ((mark-even-if-inactive t))
        (indent-region (region-beginning) (region-end) nil))))

(defadvice yank-pop (after indent-region activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (member major-mode yank-indent-modes)
      (let ((mark-even-if-inactive t))
        (indent-region (region-beginning) (region-end) nil))))

;;}}}
(provide 'joseph_complete)

