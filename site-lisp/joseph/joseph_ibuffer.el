;;; -*- coding:utf-8 -*-
;;ibuffer 的管理
;;n p 上下，m进行标记 D标记为删除（关闭buffer） x关闭标记的buffer
;; = 进行diff操作（已保存的与buffer中的）
;;O 过滤标记的buffer ，在搜索进行搜索，显示搜索结果
(require 'ibuf-ext)
(setq ibuffer-modified-char ?m);; 用m 字符表示modified的buffer
(setq ibuffer-read-only-char ?r);;用r 表示只读buffer
(setq ibuffer-show-empty-filter-groups nil);;不显示没有任何buffer的空分组
(setq ibuffer-default-sorting-mode (quote major-mode)) ;;排序
;;设置buffer中每一行的显示格式
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 30 30 :left :elide) " " ;buffer-name 宽度30 靠左
              (size 9 -1 :right) " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " " (name 24 -1) " " filename)))

;;隐藏所有以*anything开头的buffer
;;(add-to-list 'ibuffer-never-show-predicates "^\\*anything")
;;ibuffer分组
(setq ibuffer-saved-filter-groups
      '(("Default"
         ("Hidden"  (name . "^ "))
         ("Anything"  (name . "^\\*anything"))
         ("Woman"  (name . "^\\*WoMan.*\\*$"))
         ("Custom"  (mode . Custom-mode))
         ("Emacs"  (name . "^\\*.*$"))
         ("Dired"  (mode . dired-mode))
         )))
(add-hook 'ibuffer-mode-hook
          (lambda ()(ibuffer-switch-to-saved-filter-groups "Default")))
;;设置默认不显示maybe-show-predicates的buffer (即隐藏上面Hidden分组里的内容)
(setq ibuffer-default-display-maybe-show-predicates nil)
;;toggle 显示上面的 Hidden分组里的内容
(defun ibuffer-toggle-maybe-show()
  (interactive)
  (setq ibuffer-default-display-maybe-show-predicates
        (not ibuffer-default-display-maybe-show-predicates))
  (kill-buffer "*Ibuffer*")
  (ibuffer)
  )
(define-key ibuffer-mode-map "g" 'ibuffer-toggle-maybe-show)

;;默认的分组default分组放在最后一个,此advice 倒序之
(defadvice ibuffer-generate-filter-groups
  (after reverse-ibuffer-groups () activate)
  (setq ad-return-value (nreverse ad-return-value)))

;;M-n M-p 组间跳转

  ;; Switching to ibuffer puts the cursor on the most recent buffer
;;切换到ibuffer 时光标定位到最近一次访问的buffer 而不是上一次的buffer
;; (defadvice ibuffer (around ibuffer-point-to-most-recent activate) ()
;;   "Open ibuffer with cursor pointed to most recent buffer name"
;;   (let ((recent-buffer-name (buffer-name)))
;;     ad-do-it
;;     (ibuffer-jump-to-buffer recent-buffer-name)))
(provide 'joseph_ibuffer)

