;;{{{     相当于vi 中的o命令，在后面插入一新行，并移动光标到新行
(global-set-key (kbd "C-j") 'open-and-move-to-next-line);
(defun open-and-move-to-next-line(&optional arg)
  (interactive "p")
    (end-of-line)
    (open-line arg)
    (next-line)
    (indent-according-to-mode)
    )    
    
;;}}}

;;{{{ ;相当于vi 中的O命令，在前面插入一新行，并移动光标到新行
(global-set-key (kbd "C-o") 'open-and-move-to-pre-line)
(defun open-and-move-to-pre-line(&optional arg)
  (interactive "p")
  (beginning-of-line)
  (insert "\n")
  (previous-line)
  (indent-relative-maybe)
  
  )
;;}}}

(setq-default kill-whole-line t) ;; 在行首 C-k 时，同时删除该行
;;;;剪切当前行相对简单C-k 为剪切光标后的字符，C-a C-k 则为剪切当前行了

;;{{{ 不在需要的copy当前行 ()
;; (global-set-key (kbd "C-c C-k") 'copy-lines);
;; (defun copy-lines(&optional arg)
;;     (interactive "p")
;;   (save-excursion
;;         (beginning-of-line)
;;     (set-mark (point))
;;     (next-line  arg)
;;     (beginning-of-line)
;;     (kill-ring-save (mark) (point))
;;     )
;;   )
;;}}}

;;{{{ ;合并当前行与下一行，同vim的 J命令 ,并作了增强，可以合并多行，使用方法 C-u n C-c C-j ;n是次数:
(global-set-key (kbd "C-c C-j") 'join-lines)
(global-set-key (kbd "C-x C-j") 'join-lines)
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
;;}}}
;;{{{;;像vi一样用%在匹配的括号间跳转
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
   ((looking-at "\\s\{") (forward-list 1) (backward-char 1))
	((looking-at "\\s\}") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
;;}}}
;;{{{ ;此函数可以进行快速定位 ,vi 中有个f命令如fa 搜索a 并跳到相应位置, 如果这个函数用熟了完全可以去掉C-f 与C-b这两个键
;; 而这个命令与之相似，如将命令绑到C-f后，按下C-f后 连续按一个字母如s则会一直搜索s 并定位到相应的位置，按C-h可反向搜索
;;直到按下不同的字母(源码在王垠的wy-go-tochar上进行了修改，可以进行反向搜索)
;;郑重向大家推荐我写的 ,把它绑定到C-f ,它具有普通C-f 向前移到一个字符的功能,同时又能根据特定字符快速定位
(defun joseph-go-to-char (n )
  "Move forward to Nth occurence of CHAR.
Typing `joseph-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR. Typing Backspace will move back . "
  (interactive "p")
  (forward-char 1)
  (let( (char (read-char "Go to char:" ) ))
  (message (string char) )
  (if (string-equal "" (string char) )
      (forward-char 1)
    (unless   ( char-equal ?  char)
         (search-forward (string char) nil nil n)
               (let ((readed-char (read-char "go to next position" ))  )       
                 (while (or (char-equal readed-char char)  ;;it equals to the original inputed char ,then search it again
                            (char-equal ? readed-char )  ;; Ctrl+h     means   search back for the char
                            )
                   (if    (char-equal ? readed-char);;C-h backward search
                           (search-backward (string char) nil nil n   )                         
                           (search-forward (string char) nil nil n) )
                 (setq readed-char (read-char "C-h for backward search ,same char for forward search")) )
                 (setq unread-command-events (list last-input-event)) ) 
      ) ) ) )
(define-key global-map (kbd "C-f") 'joseph-go-to-char)
;;}}}
(provide 'joseph_vim)

