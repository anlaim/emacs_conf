;;; -*- coding:utf-8 -*-
;;;; joseph-command.el
;;;###autoload
(defun goto-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) )
        ((looking-back "\\s\)")  (backward-list 1))
        ((looking-at "\\s\{") (forward-list 1) )
        ((looking-back "\\s\}") (forward-char 1))
        (t (self-insert-command (or arg 1)))))

;;;###autoload
(defun joseph-join-lines(&optional arg)
  (interactive "*p")
  (end-of-line)
  (delete-char  1)
  (just-one-space)
  (when (looking-back "[ \t]*" (point-at-bol) t)
    (goto-char (match-beginning 0)))
  )
;; 而这个命令与之相似，如将命令绑到C-f后，按下C-f后 连续按一个字母如s则会一直搜索s 并定位到相应的位置，按C-h可反向搜索
;;直到按下不同的字母(源码在王垠的wy-go-tochar上进行了修改，可以进行反向搜索)
;;郑重向大家推荐我写的 ,把它绑定到C-f ,它具有普通C-f 向前移到一个字符的功能,同时又能根据特定字符快速定位
;;replaced by fastnav.el
;;;###autoload
;; (defun joseph-go-to-char (n)
;;   "Move forward to Nth occurence of CHAR.
;; Typing `joseph-go-to-char-key' again will move forwad to the next Nth
;; occurence of CHAR. Typing `\C-h' will move back ."
;;   (interactive "p")
;;   (forward-char n)
;;   (unless (equal last-command 'joseph-go-to-char)
;;     (let((char (read-event "Go to Char:" )))
;;       (if (characterp char)
;;           (if (string-match "[[:cntrl:]]" (string char))
;;               (if (char-equal ?\C-f char)
;;                   (progn (forward-char n)
;;                          (let ((readed-char (read-event " ")))
;;                            (while (and  (characterp readed-char) (char-equal ?\C-f readed-char))
;;                              (forward-char)
;;                              (setq readed-char (read-event " "))))
;;                          (setq unread-command-events (list last-input-event)))
;;                 )
;;             (progn
;;               (when (search-forward (string char) nil nil n) (backward-char))
;;               (let ((readed-char (read-event
;;                                   (concat "(?\C-h for backward search ,\""
;;                                           (string char) "\" for forward search):"))))
;;                 (while (and (characterp readed-char)
;;                             (or (char-equal readed-char char)
;;                                 (char-equal ?\C-h readed-char)))
;;                   (if    (char-equal ?\C-h readed-char)
;;                       (search-backward (string char) nil nil n)
;;                     (forward-char)
;;                     (when (search-forward (string char) nil nil n) (backward-char))
;;                     )
;;                   (setq readed-char (read-event
;;                                      (concat "(?\C-h for backward search ,\""
;;                                              (string char)"\" for forward search):"))))
;;                 (setq unread-command-events (list last-input-event)))))
;;         (setq unread-command-events (list last-input-event))
;;         )
;;       )
;;     )
;;   )

;;;###autoload
(defun open-line-or-new-line-dep-pos()
  "if point is in head of line then open-line
if point is at end of line , new-line-and-indent"
  (interactive)
  (if (and (= (point) (point-at-bol))
           (not (looking-at "^[ \t]*$")))
      (progn
        (open-line 1)
        (indent-for-tab-command))
    (newline-and-indent)))

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
(defun org-mode-smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
Move point to beginning-of-line ,if point was already at that position,
  move point to first non-whitespace character. "
  (interactive)
  (let ((oldpos (point)))
    (org-beginning-of-line)
    (and (= oldpos (point))
         (back-to-indentation) )))

;;;###autoload
(defun smart-end-of-line(&optional arg)
  "like `org-end-of-line' move point to
   virtual end of line
or Move point to end of line (ignore white space)
or end-of-line.
Move point to end-of-line ,if point was already at end of line (ignore white space)
  move point to end of line .if `C-u', then move to end of line directly."
  (interactive "^P")
  (if arg
      (end-of-line)
    (let ((oldpos (point))
          (new-pos)
          )
      (beginning-of-line)
      (when (re-search-forward "[ \t]*$" (point-at-eol) t 1)
        (setq new-pos  (match-beginning 0))
        )
      (when (= oldpos new-pos)
        (setq new-pos (point-at-eol))
        )
      (when (> new-pos (+ (screen-width) oldpos))
        (setq new-pos (+ (screen-width) oldpos)))
      (goto-char new-pos)
      )
    )
  )

;;;###autoload
(defun org-mode-smart-end-of-line()
  "Move point to first non-whitespace character or end-of-line.
Move point to end-of-line ,if point was already at that position,
  move point to first non-whitespace character."
  (interactive)
  (let ((oldpos (point)))
    (org-end-of-line)
    (if  (equal (point-at-eol) (point))
      (progn
        (beginning-of-line)
        (when (re-search-forward "[ \t]*$" (point-at-eol) t)
          (goto-char (match-beginning 0)))
        )
      (when (equal oldpos (point))
        (end-of-line)
        )
      )
    ))

;;;###autoload
(defun joseph-jump-to-space-forward()
  (interactive)
  (let ((old-pos (point))
        m-end m-begin
        )
    (when (re-search-forward "[ \t]+"  nil t)
      (setq m-begin (match-beginning 0))
      (setq m-end (match-end 0))
      (goto-char m-begin)
      (if (equal old-pos m-end)
          (progn
            (re-search-forward "[ \t]+"  nil t)
            (goto-char (match-beginning 0)))
        (if (equal m-begin old-pos)
            (goto-char m-end)
            )))))


;;;###autoload
(defun switch-to-scratch-buffer ()
  "Toggle between *scratch* buffer and the current buffer.
     If the *scratch* buffer does not exist, create it."
  (interactive)
  (let ((scratch-buffer-name  "*scratch*"))
    (if (equal (buffer-name (current-buffer)) scratch-buffer-name)
        (switch-to-buffer (other-buffer))
      (with-current-buffer
          (switch-to-buffer  scratch-buffer-name)
        (emacs-lisp-mode)(goto-char (point-max))
        ))))


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

;;;###autoload
(defun just-one-space-or-delete-horizontal-space()
  "just one space or delete all horizontal space."
  (interactive)
  (if (equal last-command 'just-one-space-or-delete-horizontal-space)
      (delete-horizontal-space)
    (just-one-space)
    )
  )

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
(defun joseph-kill-region-or-org-kill-line(&optional arg)
  "this function is a wrapper of (kill-line).
   When called interactively with no active region, this function
  will call (kill-line) ,else kill the region."
  (interactive "P")
  (if mark-active
      (if (= (region-beginning) (region-end) ) (org-kill-line arg)
        (kill-region (region-beginning) (region-end) )
        )
    (org-kill-line arg)
    )
  )
;;;;(global-unset-key "\C-w")  ;C-k 现在完全具有C-w的功能, 所以取消C-w的键定义
(defvar joseph-trailing-whitespace-modes '(c++-mode c-mode haskell-mode emacs-lisp-mode scheme-mode erlang-mode))
;;;###autoload
(defun joseph-trailing-whitespace-hook ()
  (when (member major-mode joseph-trailing-whitespace-modes)
    (delete-trailing-whitespace)))

(defvar joseph-untabify-modes '(haskell-mode lisp-mode scheme-mode erlang-mode clojure-mode java-mode ))

;;;###autoload
(defun joseph-untabify-hook ()
  (when (member major-mode joseph-untabify-modes)
    (untabify (point-min) (point-max))))

(require 'server)

;;;###autoload
(defun kill-buffer-or-server-edit()
  (interactive)
  (if server-buffer-clients
      (progn
        (server-edit)
        (lower-frame)
        )
    (kill-this-buffer)
    )
  )
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

;;;###autoload
(defun joseph-append-semicolon-at-eol(&optional arg)
  "在当前行任何位置输入分号都在行尾添加分号，除非本行有for 这个关键字，
如果行尾已经有分号则删除行尾的分号，将其插入到当前位置,就是说输入两次分号则不在行尾插入而是像正常情况一样."
  (interactive "*p")
  (let* ( ( init_position (point))
          (b (line-beginning-position))
          (e (line-end-position))
          (line_str (buffer-substring b e))
          (semicolon_end_of_line (string-match ";[ \t]*$" line_str ))
          )
    (if semicolon_end_of_line ;;;;如果行尾已经有分号，则删除行尾的分号，并在当前位置输入分号;;;;;;
        (progn
          (save-excursion
            (goto-char (+ semicolon_end_of_line b))
            (delete-char 1) )
          (insert ";") )
      ;;在整行内容中搜索有没有关键字for的存在,或者当前位置已经是行尾,直接插入分号
      (if   (or (string-match "^[ \t]*$" (buffer-substring init_position e))
                (string-match "\\bfor\\b" line_str))
          (insert ";")
        (save-excursion ;;如果搜索不到 for 则在行尾插入分号;
          (end-of-line)
          (delete-trailing-whitespace)
          (insert ";")
          )))))

;;;###autoload
(defun joseph-hide-frame()
  "hide current frame"
  (interactive)
  (make-frame-invisible nil t))

;;;###autoload
(defun scroll-other-window-up-or-previous-buffer(&optional ARG)
  "if there is an `other-window' ,then scroll it up ,if
 not ,call (previous-buffer)"
  (interactive)
  (if (equal 1 (length (window-list nil nil))) ;;if don't exist other window
      (previous-buffer)
    (scroll-other-window ARG)
      ))

;;;###autoload
(defun scroll-other-window-down-or-next-buffer(&optional lines)
  "if there is an `other-window' ,then scroll it down ,if
 not ,call (next-buffer)"
  (interactive)
  (if (equal 1 (length (window-list nil nil))) ;;if don't exist other window
      (next-buffer)
    (scroll-other-window-down  lines)
    ))

;;;###autoload
(defun joseph-forward-4-line() (interactive) (forward-line 4) (scroll-up   4))
;;;###autoload
(defun joseph-backward-4-line() (interactive) (forward-line -4)(scroll-down 4))

;;代码注释工作，如果有选中区域，则注释或者反注释这个区域
;;如果，没选中区域，则注释或者注释当前行，如果光标在行末，则在行末添加或删除注释
;;;###autoload
(defun joseph-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
;;;###autoload
(defun joseph-goto-line-by-percent ()
  (interactive)
  (let ((readed-string (read-from-minibuffer "Goto line( by percent): "))(percent) )
    (if (string-match "^[ \t]*\\([0-9]+\\)[ \t]*$" readed-string )
        (let* ((total (count-lines (point-min) (point-max))) (num ))
          (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
          (setq num (round (* (/ total 100.0) percent)))
          (goto-char (point-min) )
          (forward-line (1- num)) )
      ))
  )

;; date命令插入当前时间
;;;###autoload
(defun date ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M")))

(provide 'joseph-command)
