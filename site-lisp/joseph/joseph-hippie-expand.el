;;; -*- coding:utf-8 -*-

;;; hippie-expand 补全的设置 [(control return)] 代码补全
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

(provide 'joseph_complete)

