;;{{{  goto-match-paren 像Vi一样用%在匹配的括号间跳转
;;;###autoload
(defun goto-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) )
	((looking-back "\\s\)")  (backward-list 1))
   ((looking-at "\\s\{") (forward-list 1) )
	((looking-back "\\s\}") (forward-char 1))
	(t (self-insert-command (or arg 1)))))

 ;;}}}
;;{{{  joseph-join-lines 合并当前行与下一行，同vim的 J命令
;;;###autoload
(defun joseph-join-lines(&optional arg)
  (interactive "*p")
  (end-of-line)
  (delete-char  1)
  (just-one-space)
  (when (looking-back "[ \t]*" (point-at-bol) t)
    (goto-char (match-beginning 0)))
  )
;;}}}
;;{{{  joseph-go-to-char此函数可以进行快速定位 ,vi 中有个f命令如fa 搜索a 并跳到相应位置, 如果这个函数用熟了完全可以去掉C-f 与C-b这两个键
;; 而这个命令与之相似，如将命令绑到C-f后，按下C-f后 连续按一个字母如s则会一直搜索s 并定位到相应的位置，按C-h可反向搜索
;;直到按下不同的字母(源码在王垠的wy-go-tochar上进行了修改，可以进行反向搜索)
;;郑重向大家推荐我写的 ,把它绑定到C-f ,它具有普通C-f 向前移到一个字符的功能,同时又能根据特定字符快速定位
;;;###autoload
(defun joseph-go-to-char (n)
  "Move forward to Nth occurence of CHAR.
Typing `joseph-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR. Typing `\C-h' will move back ."
  (interactive "p")
  (forward-char n)
  (unless (equal last-command 'joseph-go-to-char)
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
                )
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
  )

;;}}}
;;{{{  open-line-or-new-line-dep-pos
;;;###autoload
(defun open-line-or-new-line-dep-pos()
  "if point is in head of line then open-line
if point is at end of line , new-line-and-indent"
  (interactive)
  (if (or (= (point) (line-beginning-position))
          (string-match "^[ \t]*$"
                        (buffer-substring-no-properties
                         (line-beginning-position)(point) ) ))
      (progn
        (beginning-of-line)
        (open-line 1)
        (indent-relative-maybe)
        )
    (newline-and-indent)
    ))
;;}}}
;;{{{  smart-beginning-of-line

;;;###autoload
(defun smart-beginning-of-line ()
    "Move point to first non-whitespace character or beginning-of-line.
Move point to beginning-of-line ,if point was already at that position,
  move point to first non-whitespace character. "
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (and (= oldpos (point))
         (back-to-indentation) )))

;;;###autoload
(defun smart-end-of-line()
  "Move point to first non-whitespace character or end-of-line.
Move point to end-of-line ,if point was already at that position,
  move point to first non-whitespace character."
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (when (re-search-forward "[ \t]*$" (point-at-eol) t)
      (goto-char (match-beginning 0)))
    (when (= oldpos (point))
      (end-of-line))))
;;}}}
;;{{{  switch-to-scratch-buffer
;;;###autoload
(defun switch-to-scratch-buffer()
  "switch to *scratch* buffer."
  (interactive)
  (switch-to-buffer "*scratch*")
  (goto-char (point-max))
  )

;;}}}
;;{{{  move-backward-paren move-forward-paren 移向前(后)一个括号

;;;###autoload
(defun move-backward-paren()
  (interactive)
   (re-search-backward "\\s[\\|\\s(\\|\\s{" nil t)
  )

;;;###autoload
(defun move-forward-paren()
  (interactive)
   (re-search-forward "\\s]\\|\\s)\\|\\s}" nil t)
  )

;;}}}
;;{{{  stardict 词典 query-stardict sdcv-to-buffer

;;;###autoload
(defun query-stardict ()
  "Serch dict in stardict."
  (interactive)
  (let ((begin (point-min))
        (end (point-max)))
    (if mark-active
        (setq begin (region-beginning)
              end (region-end))
      (save-excursion
        (backward-word)
        (mark-word)
        (setq begin (region-beginning)
              end (region-end))))
    (message "searching  %s ... using stardicr" (buffer-substring begin end))
    (shell-command "notify-send \"`sdcv -n -u '朗道英汉字典5.0' %s`\"" (buffer-substring begin end) )
    (message "finished searching  朗道英汉字典5.0'")
    ))

;;;###autoload
(defun sdcv-to-buffer ()
  "Search dict in region or world."
(interactive)
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
      (current-word nil t)))
        (buf-name (buffer-name))
        )
    ;; (setq word (read-string (format "Search the dictionary for (default %s): " word)
    ;;                         nil nil word))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (insert (shell-command-to-string  (format "sdcv -n %s " word) ))
    (if (equal buf-name "*sdcv*")
        (switch-to-buffer "*sdcv*")
      (switch-to-buffer-other-window "*sdcv*")
        )
    (goto-char (point-min))
    ))
;; (shell-command "notify-send \"`sdcv -n  %s`\"" (buffer-substring begin end))
;; (tooltip-show
;;      (shell-command-to-string
;;       (concat "sdcv -n "
;;               (buffer-substring begin end))))

;;}}}
;;{{{  just-one-space-or-delete-horizontal-space 只留一个空格,或者删除光标处所有空格(多次连续调用此命令见效果)
;;;###autoload
(defun just-one-space-or-delete-horizontal-space()
   "just one space or delete all horizontal space."
   (interactive)
   (if (equal last-command 'just-one-space-or-delete-horizontal-space)
       (delete-horizontal-space)
     (just-one-space)
     )
   )

;;}}}
;;{{{  joseph-kill-region-or-line
;;我写的一个函数,如果有选中区域,则kill选区,否则删除当前行
;;注意当前行并不代表整行,它只删除光标到行尾的内容,也就是默认情况下
;;C-k 所具有的功能
;;;###autoload
(defun joseph-kill-region-or-line(&optional arg)
  "this function is a wrapper of (kill-line).
   When called interactively with no active region, this function
  will call (kill-line) ,else kill the region."
  (interactive "P")
  (if mark-active
      (if (= (region-beginning) (region-end) ) (kill-line arg)
          (kill-region (region-beginning) (region-end) )
        )
    (kill-line arg)
    )
  )
;;;;(global-unset-key "\C-w")  ;C-k 现在完全具有C-w的功能, 所以取消C-w的键定义
;;}}}
;;{{{  joseph-trailing-whitespace-hook自动清除每一行末多余的空格.
(defvar joseph-trailing-whitespace-modes '(c++-mode c-mode haskell-mode emacs-lisp-mode scheme-mode erlang-mode))
;;;###autoload
(defun joseph-trailing-whitespace-hook ()
  (when (member major-mode joseph-trailing-whitespace-modes)
    (delete-trailing-whitespace)))

;;}}}
;;{{{  joseph-untabify-hook在保存之前用空格替换掉所有的TAB
(defvar joseph-untabify-modes '(haskell-mode lisp-mode scheme-mode erlang-mode clojure-mode java-mode ))
;;;###autoload
(defun joseph-untabify-hook ()
  (when (member major-mode joseph-untabify-modes)
    (untabify (point-min) (point-max))))

;;}}}
;;{{{  kill-buffer-or-server-edit
(require 'server)
;;;###autoload
(defun kill-buffer-or-server-edit()
  (interactive)
  (if server-buffer-clients
      (server-edit)
    (kill-this-buffer)
    )
  )
;;}}}
;;{{{   try-joseph-dabbrev-substring hipperextend支持子串匹配
;;让hipperextend不仅可以匹配开头,也可以匹配字符串的内部
;;将这个函数加入到hippie-expand-try-functions-list中，
;;;###autoload
(defun try-joseph-dabbrev-substring (old)
  (let ((old-fun (symbol-function 'he-dabbrev-search)))
    (fset 'he-dabbrev-search (symbol-function 'joseph-dabbrev-substring-search))
    (unwind-protect
        (try-expand-dabbrev old)
      (fset 'he-dabbrev-search old-fun))))

(defun joseph-dabbrev-substring-search (pattern &optional reverse limit)
  (let ((result ())
        (regpat (cond ((not hippie-expand-dabbrev-as-symbol)
                       (concat (regexp-quote pattern) "\\sw+"))
                      ((eq (char-syntax (aref pattern 0)) ?_)
                       (concat (regexp-quote pattern) "\\(\\sw\\|\\s_\\)+"))
                      (t
                       (concat (regexp-quote pattern)
                               "\\(\\sw\\|\\s_\\)+")))))
    (while (and (not result)
                (if reverse
                    (re-search-backward regpat limit t)
                  (re-search-forward regpat limit t)))
      (setq result (buffer-substring-no-properties (save-excursion
                                                     (goto-char (match-beginning 0))
                                                     (skip-syntax-backward "w_")
                                                     (point))
                                                   (match-end 0)))
      (if (he-string-member result he-tried-table t)
          (setq result nil)))     ; ignore if bad prefix or already in table
    result))
;;}}}

(provide 'joseph-command)
