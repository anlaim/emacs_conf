 ;; -*-no-byte-compile: t; -*-
;;; joseph_vim.el --- config about some vim feathers
;;;;Time-stamp: <jixiuf 2011-03-02 14:19:44>
;;{{{ 在大小括号间前进后退  
(defun move-backward-paren()
  (interactive)
   (re-search-backward "\\s[\\|\\s(\\|\\s{" nil t)
  )
(defun move-forward-paren()
  (interactive)
   (re-search-forward "\\s]\\|\\s)\\|\\s}" nil t)
  )
(global-set-key (kbd "M-[") 'move-backward-paren)
(global-set-key (kbd "M-]") 'move-forward-paren)


;;}}}
;;{{{ 像vi一样用%在匹配的括号间跳转

;; (defun match-paren (arg)
;;   "Go to the matching paren if on a paren; otherwise insert %."
;;   (interactive "p")
;;   (cond ((looking-at "\\s\(") (forward-list 1) )
;; 	((looking-back "\\s\)")  (backward-list 1))
;;    ((looking-at "\\s\{") (forward-list 1) )
;; 	((looking-back "\\s\}") (forward-char 1))
;; 	(t (self-insert-command (or arg 1)))))
;; (global-set-key "%" 'match-paren)

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis AND last command is a movement command, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (message "%s" last-command)
  (if (not (memq last-command '(
                                set-mark
                                cua-set-mark
                                goto-match-paren
                                down-list
                                up-list
                                end-of-defun
                                beginning-of-defun
                                backward-sexp
                                forward-sexp
                                backward-up-list
                                forward-paragraph
                                backward-paragraph
                                end-of-buffer
                                beginning-of-buffer
                                backward-word
                                forward-word
                                mwheel-scroll
                                backward-word
                                forward-word
                                mouse-start-secondary
                                mouse-yank-secondary
                                mouse-secondary-save-then-kill
                                move-end-of-line
                                move-beginning-of-line
                                backward-char
                                forward-char
                                scroll-up
                                scroll-down
                                scroll-left
                                scroll-right
                                mouse-set-point
                                next-buffer
                                previous-buffer
                                )
                 ))
      (self-insert-command (or arg 1))
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
          ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
          (t (self-insert-command (or arg 1))))))
(global-set-key "%" 'goto-match-paren)

;;}}}
;;{{{ 合并当前行与下一行，同vim的 J命令 ,并作了增强，可以合并多行，使用方法 C-u n C-c C-j ;n是次数:
;(global-set-key (kbd "C-x C-j") 'joseph-join-lines)
(defun joseph-join-lines(&optional arg)
  (interactive "*p")
    (save-excursion
    (let ((index 1)   )        ;index 初始化为0
         (while (<= index  arg) ; when index <arg 
            (end-of-line)
            (delete-char  1)
            (delete-horizontal-space)
            (insert " ")
            (setq index (1+ index)) ; 计数器自增一 index=index+1
        )
     )
  )
)
(global-set-key (kbd "C-c C-j") 'joseph-join-lines)

;;}}}
;;{{{ ;此函数可以进行快速定位 ,vi 中有个f命令如fa 搜索a 并跳到相应位置, 如果这个函数用熟了完全可以去掉C-f 与C-b这两个键

;; 而这个命令与之相似，如将命令绑到C-f后，按下C-f后 连续按一个字母如s则会一直搜索s 并定位到相应的位置，按C-h可反向搜索
;;直到按下不同的字母(源码在王垠的wy-go-tochar上进行了修改，可以进行反向搜索)
; ;郑重向大家推荐我写的 ,把它绑定到C-f ,它具有普通C-f 向前移到一个字符的功能,同时又能根据特定字符快速定位
(defun joseph-go-to-char (n)
  "Move forward to Nth occurence of CHAR.
Typing `joseph-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR. Typing \C-h will move back ."
  (interactive "p")
  (forward-char n)
  (let((char (read-event "Go to Char:" )))
    (if (characterp char) 
        (if (string-match "[[:cntrl:]]" (string char))
            (if (char-equal ?\C-f char)
                (progn (forward-char n)
                       (let ((readed-char (read-event " ")))
                         (while (and  (characterp readed-char) (char-equal ?\C-f readed-char)) 
                           (forward-char)
                           (setq readed-char (read-event " "))))
                       (setq unread-command-events (list last-input-event)))
              (setq unread-command-events (list last-input-event)))
          (progn 
            (when (search-forward (string char) nil nil n) (backward-char))                 
                 (let ((readed-char (read-event
                                     (concat "(?\C-h for backward search ,\""
                                             (string char) "\" for forward search):"))))
                   (while (and (characterp readed-char)
                               (or (char-equal readed-char char)  
                                   (char-equal ?\C-h readed-char)))
                     (if    (char-equal ?\C-h readed-char)
                         (search-backward (string char) nil nil n)
                       (forward-char)
                       (when (search-forward (string char) nil nil n) (backward-char))
                       )
                     (setq readed-char (read-event
                                        (concat "(?\C-h for backward search ,\""
                                                (string char)"\" for forward search):"))))
                   (setq unread-command-events (list last-input-event)))))
      (setq unread-command-events (list last-input-event))
      )
    )
  )

(define-key global-map (kbd "C-f") 'joseph-go-to-char)
;;}}}
(provide 'joseph_vim)

;;; joseph_vim.el ends here
