(global-set-key (kbd "C-j") 'open-and-move-to-next-line);相当于vi 中的o命令，在后面插入一新行，并移动光标到新行
(defun open-and-move-to-next-line(&optional arg)
  (interactive "p")
    (end-of-line)
    (open-line arg)
    (next-line)
    (indent-according-to-mode)
    )    
    

(global-set-key (kbd "C-o") 'open-and-move-to-pre-line);相当于vi 中的O命令，在前面插入一新行，并移动光标到新行
(defun open-and-move-to-pre-line(&optional arg)
  (interactive "p")
  (beginning-of-line)
  (insert "\n")
  (previous-line)
  (indent-relative-maybe)
  
  )

(setq-default kill-whole-line t) ;; 在行首 C-k 时，同时删除该行
;剪切当前行相对简单C-k 为剪切光标后的字符，C-a C-k 则为剪切当前行了

(global-set-key (kbd "C-c C-k") 'copy-lines);copy当前行包括后面的换行符
(defun copy-lines(&optional arg)
    (interactive "p")
  (save-excursion
        (beginning-of-line)
    (set-mark (point))
    (next-line  arg)
    (beginning-of-line)
    (kill-ring-save (mark) (point))
    )
  )
;w合并当前行与下一行，同vim的 J命令 ,并作了增强，可以合并多行，使用方法 C-u n C-c C-j ;n是次数:
(global-set-key (kbd "C-c C-j") 'join-lines)
(defun join-lines(&optional arg)
  (interactive "*p")
    (save-excursion
    (let ((index 1)   )        ;index 初始化为0
         (while (<= index  arg) ; when index <arg 
            (end-of-line)
            (delete-char  1)
            (delete-horizontal-space)
            (insert " ")
            (setq index (+ 1 index)) ; 计数器自增一 index=index+1
        )
     )
  )
)

(provide 'jixiuf_vim)

