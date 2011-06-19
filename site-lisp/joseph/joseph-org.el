;;; joseph-org.el --- config about org mode

;; Copyright (C) 2011  �·����

;; Author: �·���� <jixiuf@gmail.com>
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

;; `<TAB>'      �������۵�
;; ,-> FOLDED -> CHILDREN -> SUBTREE --.
;; '-----------------------------------'
;; `S-<TAB>' ����buffer���۵�
;; `C-u <TAB>'
;; ,-> OVERVIEW -> CONTENTS -> SHOW ALL --.
;; '--------------------------------------'
;; `C-u C-u C-u <TAB>' ��ʾ����

;;org buffer ��ʱ�ĳ�ʼ״̬��Overview ,��`org-startup-folded'��������
;; Ҳ����ÿ���ļ�ͷ������������������
;; #+STARTUP: overview
;; #+STARTUP: content
;; #+STARTUP: showall
;; #+STARTUP: showeverything
;; `C-u C-u <TAB>' �л���buffer ������״̬

;;���� ͨ��VISIBILITY ��������ĳһ���ڵ�Ŀ��ӻ�״̬���磺
;;                         ** adef
;;                         ** abc
;;                         :PROPERTIES:
;;                         :VISIBILITY: children
;;                         :END:
;;

;;������������صļ���

;;`C-cC-xp'����һ������

;; `S-<left>/<right>'
;; ��ĳ�����Կ�ȡ��ֵ֮��ѭ��

;;��һ���������ϰ�`C-cC-c' ִ����������صĲ���������������ֵ��ɾ��������Ե�,��
;; `C-c C-c d' ɾ��һ��property
;; `C-c C-c D' ȫ��ɾ��һ��property
;; `C-c C-c c'
;; Compute the property at point, using the operator and scope from
;; the nearest column format definition.

;;`M-x org-insert-property-drawer'
;;���� �������ԵĿ�ʼ�������ǣ���
;;                         :PROPERTIES:
;;                          ���м���������
;;                         :END:
;;һ�����Կ�������������ȡ��Щֵ������
;; prop1 ������1 2 3 ,��������
;; prop1_ALL 1 2 3
;;���������������������ļ�ͷ�������ļ�����Ч
;; #+PROPERTY: NDisks_ALL 1 2 3 4
;; `org-global-properties' �����ļ�����Ч
;; ��һ���ڵ����ã�����ӵ����������ӽڵ���Ч
;;���磺
;;                         * CD collection
;;                         :PROPERTIES:
;;                         :NDisks_ALL:  1 2 3 4
;;                         :Publisher_ALL: "Deutsche Grammophon" Philips EMI
;;                         :END:
;;                         ** a cd
;;                         :PROPERTIES:
;;                         :NDisks: 1             --- ����ֻ��ȡֵ1 2 3 4
;;                         :Publisher: EMI         ----ͬ��
;;                         :END:





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;`C-cC-xf'  ��ע��صĲ��� ,�����ע���ڽ�ע����ת
;;`C-uC-cC-xf'  ��ע��صĲ���

;;Todo���
;; `C-c C-t'
;; ,-> (unmarked) -> TODO -> DONE --.
;; '--------------------------------'
;;����֮���ʾ�������״̬
;; (setq org-todo-keywords
;;       '((sequence "����" "�������" "���ռ��" "|" "���" "DELEGATED")))

;;(setq org-todo-keywords '((type "homewordToDo" "JobToDo"  "|" "DONE")))

;;������� (���м��л�)
;; `C-u C-u C-c C-t'
;; `C-S-<right>'
;; `C-S-<left>'
;;q����keyword ���л�
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

;;ÿ��keyword ������ĸ��������`C-cC-t'��������ĸѸ���л�������״̬
;;ֻ��ĳһ�ļ���Ч��todo ����
;; #+TODO: TODO | DONE
;; #+TODO: REPORT BUG KNOWNCAUSE | FIXED
;; #+TODO: | CANCELED


(setq org-enforce-todo-dependencies t) ;; �ӽڵ�����δ�������򸸽ڵ㲻�ܱ��ΪDone
;;��¼Done ��ʱ��
;;(setq org-log-done 'time)

(setq org-log-done 'note)
;; (setq org-log-done 'note) ;; ��(setq org-log-done 'time)��ͬ��������ʾ������һ��note
;;Ĭ������£�ֻ��Done ��ʱ��ż�¼ʱ�̻�note ,Ҳ���������ڴ���ĳ���ؼ���״̬ʱҲ���д˲���
;;d��ÿ���ؼ��ֺ�������м������������`!' (for a timestamp) and `@' (for a note)

;;�Ѿ����Ϊ��@�� �ˣ�����ȴ����һ��'/!' ,��ʾ �ڴ����״̬�л�������״̬ʱ����������
;;Ŀ��״̬û������@Ҳû! ʱ�������¼��ʱ��ʱ�̣���ʾ�����״̬�л�Ϊ����״̬��ʱ�̡�
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
;;����������ӣ���wait �л�Ϊtodo ״̬ʱ�������¼ʱ�̣���Ϊtodo״̬��û��! ��@ ���
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(setq org-todo-keywords
      '((sequence "TODO(t!)" "|" "DONE(d@/!)")
        (sequence "REPORT(r!)" "BUG(b!)" "KNOWNCAUSE(k!)" "|" "FIXED(f@)")
        (sequence "|" "CANCELED(c@)")))
;;localͬ�����﷨
;; #+TODO: TODO(t) WAIT(w@/!) | DONE(d!) CANCELED(c@)

;;�������Ը�һ�ض����ӽڵ���ж��ƣ�ʹ��LOGGING����
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
;�������ȼ�
;; `C-c ,'
;; `S-<up>'
;; `S-<down>'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;-- Tag --
;������
;; #+FILETAGS: :Peter:Boss:Secret:
;;�൱�ڱ��ĵ������б����ж����⼸��tag
;;����Tag �Ĳ���
;; `C-c C-q' ����xc
;; `C-c C-c'

;; `org-tag-alist'
;; #+TAGS: @work @home @tennisclub
;; #+TAGS: laptop car pc sailboat
;;(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))
(setq org-tag-alist '(("Emacs" . ?e) ("AutoHotKey" . ?a) ("Daily" . ?d)("Java" . ?j)("Windows" . ?w) ("Linux" . ?l)))

;;���ߣ�
;;#+TAGS: @work(w)  @home(h)  @tennisclub(t)  laptop(l)  pc(p)

;���飺ͬ��ֻ����һ
;;#+TAGS: { @work(w)  @home(h)  @tennisclub(t) }  laptop(l)  pc(p)
;;ȫ�� ���Ҫ���÷��� Ҫ��`:startgroup' `:endgroup'������
;; (setq org-tag-alist '((:startgroup . nil)
;;                       ("@work" . ?w) ("@home" . ?h)
;;                       ("@tennisclub" . ?t)
;;                       (:endgroup . nil)
;;                       ("laptop" . ?l) ("pc" . ?p)))




;;deadline and schedules ��������� ������
;;(setq org-deadline-warning-days 5);;������޵���ǰ5�켴��������
;; *** TODO write article about the Earth for the Guide
;; The editor in charge is [[bbdb:Ford Prefect]]
;; DEADLINE: <2004-02-29 Sun>
;; `DEADLINE: <2004-02-29 Sun -5d>'.���ָ�ʽ����ָ��5��ǰ����
;;; schedules ������ָ����δ����һ�쿪ʼִ��ĳ����
;; *** TODO Call Trillian for a date on New Years Eve.
;; SCHEDULED: <2004-12-25 Sat>
;; `C-cC-d' �����������deadline
;; `C-cC-s'  ����schedule
;; `C-cC-xC-k' Mark the current entry for agenda action.
;;press `k s' or `k d' to schedule the marked item.

;;(define-key mode-specific-map [?a] 'org-agenda)
(eval-after-load 'org-agenda
  '(progn
     (define-key org-agenda-mode-map "\C-n" 'next-line)
     (define-key org-agenda-keymap "\C-n" 'next-line)
     (define-key org-agenda-mode-map "\C-p" 'previous-line)
     (define-key org-agenda-keymap "\C-p" 'previous-line)
     (setq org-agenda-files (quote ("~/todo.org")))
     (setq org-default-notes-file "~/notes.org")
     (setq org-deadline-warning-days 5);;������޵���ǰ5�켴��������
     (setq org-agenda-show-all-dates t)
     (setq org-agenda-skip-deadline-if-done t)
     (setq org-agenda-skip-scheduled-if-done t)
     (setq org-agenda-span 7)
     ;;��     (setq org-agenda-start-on-weekday  nil)��������ʾ��ʾδ��7��
     ;;��agenda,�����Ǳ���
     (setq org-agenda-start-on-weekday  nil)
     ;; (setq org-agenda-start-on-weekday nil)
      (setq org-reverse-note-order t) ;;org.el
     ))

;;     (define-key global-map [(control meta ?r)] 'remember)
;;(require 'remember)
(eval-after-load 'remember
  '(progn
     (add-hook 'remember-mode-hook 'org-remember-apply-template)
     (setq org-remember-store-without-prompt t)
     (setq org-remember-templates
           (quote ((116 "* TODO %?\n  %u" "~/todo.org" "Tasks")
                   (110 "* %u %?" "~/notes.org" "Notes"))))
     (setq remember-annotation-functions (quote (org-remember-annotation)))
     (setq remember-handler-functions (quote (org-remember-handler)))
     )
  )


(setq org-agenda-custom-commands
      '(("b" . "show item of tags prefix") ; describe prefix "h"
        ("be" tags "+Emacs")
        ("bj" tags "+Java")
        ("ba" tags "+AutoHotKey")
        ("bl" tags "+Linux")
        ("bd" tags "+Daily")
        ("bw" tags "+Windows")
        ("d" todo "DELEGATED" nil)
      ("c" todo "DONE|DEFERRED|CANCELLED" nil)
      ("w" todo "WAITING" nil)
      ("W" agenda "" ((org-agenda-ndays 21)))
      ("A" agenda ""
       ((org-agenda-skip-function
         (lambda nil
           (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
        (org-agenda-ndays 1)
        (org-agenda-overriding-header "Today's Priority #A tasks: ")))
      ("u" alltodo ""
       ((org-agenda-skip-function
         (lambda nil
           (org-agenda-skip-entry-if (quote scheduled) (quote deadline)
                                     (quote regexp) "\n]+>")))
        (org-agenda-overriding-header "Unscheduled TODO entries: ")))
      ))

(provide 'joseph-org)
;;; joseph-org.el ends here
