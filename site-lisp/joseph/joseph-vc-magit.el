;;; joseph-vc-magit.el --- Description

;; Description: Description
;; Created: 2012-12-02 17:00
;; Last Updated: 纪秀峰 2014-08-29 18:34:24
;; Author: 纪秀峰  jixiuf@gmail.com
;; Keywords:
;; URL: http://www.emacswiki.org/emacs/download/joseph-vc-magit.el

;; Copyright (C) 2012, 纪秀峰, all rights reserved.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/"))
  (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/helm"))
  (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/magit"))
  (require 'magit)
  (require 'magit-svn)
  (require 'helm))
;;  `w' `magit-wazzup' 查看有哪些commit 还没有merge进当前branch来,
;;  `e'  magit-ediff 解决冲突
;;  `zz'  stash 当前未commit的内容(暂存),可以用 `A'取回
;;   `v' 丢弃已做的修改
;;   `c' commit
;;    `x' 一般在log mode内使用,恢复log到某次commit ,(内容并不会丢失,只是被staged起来,直接commit之即可)
;;  `l' log
;; `i' ignore
;;   `s' stage
;;   `u' unstage
;;   `R' rebase
;;   `b' branch manager
;;   `N' git svn
;;  `M' remote manager like `b'
;;  `m' merge
;; 1 2 3 显示不同级别的信息 ,3 一般会显示文件内具体的diff ,可以在这些diff上使用s命令
;; `.' mark-item 在log mode 中 mark 一个item ,移动到另一个commit上按 `=' 可对这两个commit进行比较
;; 在log mode里, 可以`v' revert 某次的提交 ,注意 这并不会改变已提交的东西,只是revert了那一次提交所做的工作
;;  如果想保存这次revert的结果 ,你需要再commit一次才行
;; `lh' 可以看到只在本地的提交 ,比如假如你在一个deteached 分支上做的提交 没有合并到任何分支中,并且没有运行过git gc
;; 的话,lh 可以看到这样的提交 ,然后checkout 后可以进行合并等操作,找回丢失的提交

;; There is also set of commands, that allows user to rewrite history of
;; changes. This set of commands is more handy than combination of x (reset
;; head) and a (cherry pick). All commands in this set have r as common
;; prefix. To start work, you need to press r s, and you will asked for name
;; of revision, starting from which you can start rewriting. And all following
;; changesets will put into special list of pending changes. Than you can use
;; a, A & v keys to apply and revert changes in order, that you need. And
;; applied changesets will change their status from * to . (dot). You can also
;; explicitly change status of changeset with r . and r * keys.

;; If something goes wrong, you can return to start of work by pressing r a,
;; and work will started from the revision, those name you enter with r s. And
;; you can finish work by pressing r f, that will apply rest of changeset in
;; the same order, as they were in the history of changes.
;; `r'有这几个选项
;; Actions
;; b: Begin         s: Stop          a: Abort         f: Finish        *: Set unused    .: Set used
;; 一般操作方式是在log mode中,某个commit上`rb' begin
;; `ra' 是恢复成rb之前的状态,也就是说如果中间操作有误,你还可以用`ra'恢复到初始状态,前提是你没用用过`rs' `rf'
;;`rs' 则是当前是什么状态保持现在的状态,
;; 正常结束应该是`rf',也就是说你执行完所有的操作后,按`rf'来完成
;; 假如有 1-->2---->3--->4 几个commit
;; 现在我想交换2 3 的提交顺序 变成 1--->3--->2-->4
;;  当然最好2 3 的两次提交不会导致冲突,否则中间你需要解决冲突会使问题复杂
;; 我们就假如2 3 分别添加了一个文件,这样较简单
;; 在log mode里移动到2上按下`rb' ,此时只有1是提交状态,按`q' 退出log mode回到magit status mode
;; magit status mode如下
;; Pending changes
;; 	New        b
;; 	New        c
;; 	New        d

;; Pending commits:
;; * 4
;; * 3
;; * 2
;;现在1已经是提交状态,下次想提交3 ,所以move在 pending commits 的3上按下a ,然后c 写日志提交()
;; 依次到2 ,4 上如上操作后,变成了 (注意 *都变成 .号了,Pending changes应该消失了)
;; Pending commits:
;; . 4
;; . 3
;; . 2
;; 然后要做的就是 `rf'正常退出了,中间如果出错最好是`ra' 回退到最初状态从头开始

(require 'magit-svn)
;; (require 'magit-topgit)

(defun magit-mode-hook-fun()
  (turn-on-magit-svn)
  (define-key magit-mode-map (kbd "C-w") nil)
  (define-key magit-mode-map "," 'helm-magit)
  (define-key magit-mode-map "r" 'magit-refresh)
  (add-to-list 'magit-repo-dirs (expand-file-name ".." (magit-git-dir)))
  )

(eval-after-load 'git-commit-mode '(setq git-commit-setup-hook (delete 'git-commit-turn-on-flyspell git-commit-setup-hook)))
(add-hook 'magit-mode-hook 'magit-mode-hook-fun)

(unless magit-repo-dirs
  (setq magit-repo-dirs (list (expand-file-name "~/.emacs.d")
                              (expand-file-name "~/.emacs.d/priv")
                              (expand-file-name "~/dotfiles")
                              (expand-file-name "~/documents/org/src"))))

(defvar helm-c-source-magit-history
  '((name . "Magit History:")
    (candidates . magit-repo-dirs)
    (action . (("Go" . (lambda(candidate) (magit-status candidate)))))))

;;;###autoload
(defun helm-magit()
  "helm magit status interface"
  (interactive)
  (helm '(helm-c-source-magit-history) ""  nil nil))

;; (defun magit-get-section-files(section-title)
;;   "get file path in section `section-title' ,`section-title' maybe
;; `staged' ,`unstaged' ,`untracked',`unpushed'"
;;   (save-excursion
;;     (let (section files-struct files)
;;       (magit-goto-section-at-path (list section-title))
;;       (setq section (magit-current-section))
;;       (when section
;;         (setq files-struct (magit-section-children section))
;;         (dolist (magit-section-struct files-struct)
;;           (add-to-list 'files (magit-section-title magit-section-struct))))
;;       files)))

;; (defun magit-log-edit-auto-insert-files()
;;   "提交代码时日志中自动插入staged的文件."
;;   (let ((files (with-current-buffer magit-buffer-internal (magit-get-section-files 'staged))))
;;     (when files
;;       (save-excursion
;;         (goto-char (point-min))
;;         (when (search-forward "\n受影响的文件:" (point-max) t)
;;           (delete-region (match-beginning 0) (point-max)))
;;         (goto-char (point-max))
;;         (insert "\n受影响的文件:\n    "
;;                 (mapconcat 'identity files "\n    "))))))

;; (defun magit-log-edit-auto-insert-author()
;;   (save-excursion
;;     (goto-char (point-min))
;;     (if (search-forward magit-log-header-end (point-max) t) ;skip magit log header -end
;;         (goto-char (match-end 0))
;;       (goto-char (point-min)))
;;     (delete-horizontal-space)
;;     ;; (goto-char (point-at-eol))
;;     (let ((sign (format  "[%s]:" user-full-name)))
;;       (unless (looking-at (regexp-quote sign))
;;         (insert sign)))))

;; (defadvice magit-log-edit-commit (around auto-insert-author preactivate activate compile)
;;   (magit-log-edit-auto-insert-author)
;;   (magit-log-edit-auto-insert-files)
;;   ad-do-it)

;; 在magit buffer里，C-xvL 依然可以使用,
(defadvice vc-deduce-backend (around magit-support  preactivate activate compile)
  (let (backend)
    ad-do-it
    (setq backend ad-return-value)
    (unless backend
      (cond
       ((derived-mode-p 'magit-mode)
        (setq backend 'Git)
        )
       (t nil)))
    (setq ad-return-value backend)
    ))

(provide 'joseph-vc-magit)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-vc-magit.el ends here
