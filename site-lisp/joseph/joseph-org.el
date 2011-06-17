;;; joseph-org.el --- config about org mode

;; Copyright (C) 2011  孤峰独秀

;; Author: 孤峰独秀 <jixiuf@gmail.com>
;; Keywords:

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

;; `<TAB>'      子树的折叠
;; ,-> FOLDED -> CHILDREN -> SUBTREE --.
;; '-----------------------------------'
;; `S-<TAB>' 整个buffer的折叠
;; `C-u <TAB>'
;; ,-> OVERVIEW -> CONTENTS -> SHOW ALL --.
;; '--------------------------------------'
;; `C-u C-u C-u <TAB>' 显示所有

;;org buffer 打开时的初始状态是Overview ,可`org-startup-folded'进行配置
;; 也可在每个文件头部加入下面内容设置
;; #+STARTUP: overview
;; #+STARTUP: content
;; #+STARTUP: showall
;; #+STARTUP: showeverything
;; `C-u C-u <TAB>' 切换到buffer 初化的状态

;;可以 通过VISIBILITY 属性设置某一个节点的可视化状态，如：
;;                         ** adef
;;                         ** abc
;;                         :PROPERTIES:
;;                         :VISIBILITY: children
;;                         :END:
;;

;;与属性设置相关的键绑定

;;`C-cC-xp'插入一个属性

;; `S-<left>/<right>'
;; 在某个属性可取的值之间循环

;;在一个属性行上按`C-cC-c' 执行与属性相关的操作，如重新设置值，删除这个属性等,如
;; `C-c C-c d' 删除一个property
;; `C-c C-c D' 全局删除一个property
;; `C-c C-c c'
;; Compute the property at point, using the operator and scope from
;; the nearest column format definition.

;;`M-x org-insert-property-drawer'
;;插入 设置属性的开始与结束标记，即
;;                         :PROPERTIES:
;;                          这中间设置属性
;;                         :END:
;;一个属性可以设置它可以取哪些值，比如
;; prop1 可以属1 2 3 ,这样设置
;; prop1_ALL 1 2 3
;;这个属性如果像这样放在文件头部，此文件中有效
;; #+PROPERTY: NDisks_ALL 1 2 3 4
;; `org-global-properties' 所有文件中有效
;; 在一个节点设置，则此子点下性所有子节点有效
;;比如：
;;                         * CD collection
;;                         :PROPERTIES:
;;                         :NDisks_ALL:  1 2 3 4
;;                         :Publisher_ALL: "Deutsche Grammophon" Philips EMI
;;                         :END:
;;                         ** a cd
;;                         :PROPERTIES:
;;                         :NDisks: 1             --- 这里只能取值1 2 3 4
;;                         :Publisher: EMI         ----同理
;;                         :END:





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;`C-cC-xf'  脚注相关的操作 ,插入脚注，在脚注间跳转
;;`C-uC-cC-xf'  脚注相关的操作

;;Todo相关
;; `C-c C-t'
;; ,-> (unmarked) -> TODO -> DONE --.
;; '--------------------------------'
;;竖线之后表示处于完成状态
;; (setq org-todo-keywords
;;       '((sequence "待办" "结果反馈" "最终检查" "|" "完成" "DELEGATED")))

;;(setq org-todo-keywords '((type "homewordToDo" "JobToDo"  "|" "DONE")))

;;多个序列 (序列间切换)
;; `C-u C-u C-c C-t'
;; `C-S-<right>'
;; `C-S-<left>'
;;q所有keyword 间切换
;; `S-<right>'
;; `S-<left>'
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "|" "DONE(d)")
;;         (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
;;         (sequence "|" "CANCELED(c)")))

(setq org-todo-keyword-faces
      '(("TODO"      . org-warning)
        ("DEFERRED"  . shadow)
        ("CANCELED"  . (:foreground "blue" :weight bold))))

;;每个keyword 后有字母，可以用`C-cC-t'后跟这个字母迅速切换到这种状态
;;只在某一文件有效的todo 设置
;; #+TODO: TODO | DONE
;; #+TODO: REPORT BUG KNOWNCAUSE | FIXED
;; #+TODO: | CANCELED


(setq org-enforce-todo-dependencies t) ;; 子节点若有未完成事项，则你节点不能标记为Done
;;记录Done 的时刻
;;(setq org-log-done 'time)

(setq org-log-done 'note)
;; (setq org-log-done 'note) ;; 与(setq org-log-done 'time)相同，并且提示你输入一条note
;;默认情况下，只有Done 的时候才记录时刻或note ,也可以设置在处于某个关键字状态时也进行此操作
;;d在每个关键字后的括号中加入这两个标记`!' (for a timestamp) and `@' (for a note)

;;已经标记为“@” 了，后面却跟着一个'/!' ,表示 在从这个状态切换到其他状态时，当仅仅当
;;目标状态没有设置@也没! 时，它会记录此时的时刻，表示从这个状态切换为其他状态的时刻。
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
;;比如这个例子，从wait 切换为todo 状态时，它会记录时刻，因为todo状态，没有! 或@ 标记
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(setq org-todo-keywords
      '((sequence "TODO(t!)" "|" "DONE(d@/!)")
        (sequence "REPORT(r!)" "BUG(b!)" "KNOWNCAUSE(k!)" "|" "FIXED(f@)")
        (sequence "|" "CANCELED(c@)")))
;;local同样的语法
;; #+TODO: TODO(t) WAIT(w@/!) | DONE(d!) CANCELED(c@)

;;如果仅想对革一特定的子节点进行定制，使用LOGGING属性
;;                        * TODO Log each state with only a time
;;                         :PROPERTIES:
;;                         :LOGGING: TODO(!) WAIT(!) DONE(!) CANCELED(!)
;;                         :END:
;;                         * TODO Only log when switching to WAIT, and when repeating
;;                         :PROPERTIES:
;;                         :LOGGING: WAIT(@) logrepeat
;;                         :END:
;;                         * TODO No logging at all
;;                         :PROPERTIES:
;;                         :LOGGING: nil
;;                         :END:
;设置优先级
;; `C-c ,'
;; `S-<up>'
;; `S-<down>'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-- Tag --
;设置了
;; #+FILETAGS: :Peter:Boss:Secret:
;;相当于本文档中所有标题中都含这几个tag
;;操作Tag 的操作
;; `C-c C-q' 插入xc
;; `C-c C-c'

;; `org-tag-alist'
;; #+TAGS: @work @home @tennisclub
;; #+TAGS: laptop car pc sailboat
;;(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))
(setq org-tag-alist '(("Emacs" . ?e) ("AutoHotKey" . ?a) ("Daily" . ?d)("Java" . ?j)("Windows" . ?w) ("Linux" . ?l)))

;;或者：
;;#+TAGS: @work(w)  @home(h)  @tennisclub(t)  laptop(l)  pc(p)

;分组：同组只择其一
;;#+TAGS: { @work(w)  @home(h)  @tennisclub(t) }  laptop(l)  pc(p)
;;全局 如果要设置分组 要用`:startgroup' `:endgroup'来分组
;; (setq org-tag-alist '((:startgroup . nil)
;;                       ("@work" . ?w) ("@home" . ?h)
;;                       ("@tennisclub" . ?t)
;;                       (:endgroup . nil)
;;                       ("laptop" . ?l) ("pc" . ?p)))





(provide 'joseph-org)
;;; joseph-org.el ends here
