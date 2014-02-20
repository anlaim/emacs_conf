;;; -*- coding:utf-8 -*-

;;; hippie-expand 补全的设置 [(control return)] 代码补全
(global-set-key [(meta return)] 'hippie-expand)
;; (global-set-key (kbd "C-\\") 'hippie-expand)
(setq-default hippie-expand-try-functions-list
              '(
                yas-hippie-try-expand
                try-expand-dabbrev
                try-joseph-dabbrev-substring
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

(eval-after-load 'senator '(add-to-list 'hippie-expand-try-functions-list 'senator-try-expand-semantic))
(provide 'joseph-hippie-expand)
