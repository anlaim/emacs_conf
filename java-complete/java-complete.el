;;思路000
;;一个触发后,分析当前行 ，如果从光标到行首只有一个单词
  ;; 有两种情况 1 这个词是完整的类名，要做的就是导入此类所在的包
                  ;;做法在tag类区搜索以之开头的类，找到
  ;;          2 这个词不是完整的类名，需要补全这个类名
                 ;;做法搜索import区域匹配，匹配类名，有则补全类名
                 ;; 没有则
;;则认为是类的导入
;;  导入类有这个几种情况， 类名不完整，需要完成类名的补全
;; Copyright (C) 2004 Tapsell-Ferrier Limited
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.
;;; Commentary:

;; I have always wanted 3 sorts of completion in Java:
;;
;; 1. complete a class name;  for when you're declaring variables
;;
;; 2. complete a method call; given text:
;;     someVar.meth
;;
;;    - find the type of someVar
;;    - complete meth given the list of possible methods
;;
;; 3. complete package names in import statements
;;
;; When I'm completing I'd like to see nice status about what has been completed.

;;; Code:

;; (defvar java-complete-class-p 't
;;   "A switch that controls the completer.
;; If it's true then the completer does class completion, if false
;; it does member completion.")

;; (defvar java-complete-package-re ""
;;   "A regex that matches packages prefixs.
;; This is used to search across everything that a file imports.")

;; (defun java-complete ()
;;   (interactive)
;;   (save-excursion
;;     (if (looking-back "\\.[A-Za-z0-9]*" (line-beginning-position))
;;         (java-complete-member)
;;       (java-complete-class))))
(defun get-prefix (  &optional point &optional string )
  ;;this function return string between point and "." or between point and  "[ \t]",maybe its hard to understand 
  ;;for example  support there is a line like this ( "-|-" is the cursor  )
  ;;       System.out-|-  
  ;; then it will return "out" 
  ;;but when there is not "." the "[ \t]" is considated ,so 
  ;;     System-|- 
  ;;  will return "System"

)

;; (defun java-complete-class ()
;;   (let ((sym (progn
;;                (re-search-backward "[ \t]\\([A-Za-z0-9_]*\\)" (line-beginning-position) 't)
;;                (match-string 1))))
;;     (save-match-data
;;       (let* ((java-complete-package-re (java-complete-import-re)) ; java-complete-package-re is used dynamically
;;              (completed (try-completion sym 'java-completer)))
;;         (cond
;;          ((eq completed 't)
;;           (message "already complete"))
     
;;          ((eq completed nil)
;;           (message "no completion"))

;;          ((stringp completed) ; it's a completion
;;           (if (equal completed sym)
;;               (with-output-to-temp-buffer "*Completions*"
;;                 (display-completion-list
;;                  (all-completions completed 'java-completer)))
;;             ;; Else the completion did cause an expansion, so put it in.
;;             (progn
;;               (replace-match completed 't 't nil 1)
;;               (indent-region (line-beginning-position) (line-end-position))))))))))
;; (defun java-complete-member ()
;;   ;; This func is only called when point is preceeded by a "xxx." pattern
;;   ;; So we already know there's a variable to be found
;;   (let* (java-complete-class-name
;;          variable
;;          (pt (point))
;;          (sym (progn
;;                 (re-search-backward "\\.\\([A-Za-z0-9]*\\)" (line-beginning-position) 't)
;;                 (match-string 1))))
;;     ;; Find some other bits but protect the last re stats
;;     (save-excursion
;;       (save-match-data
;;         (re-search-backward " \\([a-zA-Z0-9]+\\)" (line-beginning-position) 't)
;;         (setq variable (match-string 1))
;;         ;; Finding the variable's decl is tricky.
;;         ;; We should really use C mode's syntactic marking to find the right decl
;;         ;; but you have to try to make a sensible decision about where the decl is.
;;         ;; It could be in the current scope, in which case we could search backwards
;;         ;; (but we might hit previous, deeper scopes)
;;         ;; If the decl is in clas scope it could be anywhere in relation to point.
;;         ;; So this will probably have to learn some scoping rules.
;;         (if (not (re-search-backward (concat "[ \t]\\([A-Za-z0-9.]+\\)[ ]*" variable "[ ]*=[ ]*") nil 't))
;;             (if (not (re-search-backward (concat "[ \t]\\([A-Za-z0-9.]+\\)[ ]*" variable "[ ]*;") nil 't))
;;                 (if (not (re-search-backward (concat "([ \t,]*\\([A-Za-z0-9.]+\\)[ ]*" variable "[ ]*[,)]") nil 't))
;;                     (error (concat "No decl found for " sym)))))
;;         (setq java-complete-class-name (match-string 1))))
;;     ;; Now call the completer
;;     (let* ((java-complete-package-re (java-complete-import-re))
;;            (java-complete-class-p nil)
;;            (completed (try-completion sym 'java-completer)))
;;       (cond
;;        ((stringp completed)
;;         (if (equal completed sym)
;;             (with-output-to-temp-buffer "*Completions*"
;;               (display-completion-list
;;                (all-completions completed 'java-completer)))
;;           ;; Else the completion did cause an expansion, so put it in.
;;           (progn
;;             (replace-match completed 't 't nil 1)
;;             (indent-region (line-beginning-position) (line-end-position)))))))))

(defun java-complete-import-re ()
  "make a regex to match the packages in the import statements"
  (let ((regex "java\\.lang\\."))
    (save-match-data
      (save-excursion
        (beginning-of-buffer)
        (let ((class-start (save-excursion
                             (re-search-forward "^.* \\(class \\|interface \\)" nil 't))))
          (if (not class-start)
              (error "this not a java class or interface"))
          (while (re-search-forward "^import \\([a-z0-9.]+\\).*;" class-start 't)
            (setq regex (concat regex "\\|" (regexp-quote (match-string-no-properties 1))))
            (end-of-line))))
      (concat "\\(" regex "\\)")
      )))

;; (defun java-complete-tags-finder (buffer &optional directory)
;;   "Find a java.tags file for the specified buffer.
;; The buffer might have the variable java-completer-tag-buffer set.
;; If so then the value of that is used. Otherwise the tag file is
;; seacrhed for from the current directory towards the root.  If a
;; tag file still isn't found then a user specific tags file is
;; tried: ~/.java.tags
;; If that isn't found either then an error is signalled."
;;  (defun mkfilename (dir name)
;;     (file-truename (expand-file-name (concat dir name))))
;;   ;; Main func.
;;   (let* ((dir1 (or directory (file-name-directory (buffer-file-name buffer))))
;;          (dirlst (directory-files dir1)))
;;     ;; Visit any file found
;;     (if (and (member ".java.tags" dirlst)
;;              (file-exists-p (mkfilename dir1 ".java.tags")))
;;         (let ((buf (find-file-noselect (mkfilename dir1 ".java.tags"))))
;;           (make-local-variable 'java-complete-tags)
;;           (setq java-complete-tags buf))
;;       (let ((parentdir (mkfilename dir1 "../")))
;;         (if (not (equal "/" parentdir))
;;             (java-complete-tags-finder buffer parentdir)
;;           (if (file-exists-p "~/.java.tags")
;;               (find-file-noselect "~/.java.tags")
;;             (error "could not find a java tags file, consider making a user specific one?")))))))


( defun jc-read-line ( line-number  )
"read a line in tag file and return the string"
  (let ((begin) (end) (line-string))
    ( goto-line line-number)
    ( beginning-of-line)
    (setq begin ( point) )
    ( end-of-line)
    (setq end ( point) )
    (buffer-substring-no-properties begin end)
  )
)
(defun split-pkg-item ( pkg-line-string )
 "the format pkg-line-string is str`num`num
  this function translate it to a list ,the num will be string2number
  give me  `java.lang`222`333 ,return '(\"java.lang\" 222 333 ) "
  (let (( pkg-item (split-string pkg-line-string "`")) ) 
    (setcar (nthcdr 1 pkg-item ) (string-to-number (nth 1 pkg-item ))  )
    (setcar (nthcdr 2 pkg-item ) (string-to-number (nth 2 pkg-item ))  )
    (setq pkg-item pkg-item )
    )
)

(defun split-class-item ( class-line-string )
 "the format of class-line-string is classname`packageLineNum`memberStartLineNum`memberEndLineNum
  this function translate it to a list ,the num will be convert to number "
  (let (( class-item (split-string class-line-string "`")) ) 
    (setcar (nthcdr 1 class-item ) (string-to-number (nth 1 class-item ))  )
    (setcar (nthcdr 2 class-item) (string-to-number (nth 2 class-item ))  )
    (setcar (nthcdr 3 class-item) (string-to-number (nth 3 class-item ))  )
    (setq class-item class-item )
    )
)

(defun split-pkg-item-by-pkg-ln ( pkg-line-number )
  "the format pkg-line-string is str`num`num   this function translate it to a list ,the num will be string2number
  return a list of pkg info of line-number "
  (split-pkg-item (jc-read-line pkg-line-number)  )
)

(defcustom jc-tag-files "~/.java_base.tag"
  "the tag file used for java complete "
  :type 'string
  :group 'joseph-java-complete)

(defvar jc-tag-buffer nil "this is the buffer of .java_base.tag" )
;; find tag file 
( defun jc-init ( ) "find java tag file and do some initial works, like  populate some variables "
  (setq jc-tag-files "~/.java_base.tag"  )
  (setq jc-tag-files (file-truename (expand-file-name jc-tag-files  )))
  (if (file-exists-p  jc-tag-files)
      (progn (shell-command (concat "chmod 444 " jc-tag-files ) )
            (setq jc-tag-buffer (find-file-noselect jc-tag-files ) ) 
            ( with-current-buffer jc-tag-buffer 
              (setq jc-package-first-ln  (string-to-number (jc-read-line 3)) )
              (setq jc-class-first-ln    (string-to-number  (jc-read-line 4) ))
              (setq jc-member-first-ln   (string-to-number (jc-read-line 5) ))
              (setq jc-member-end-ln     (string-to-number (jc-read-line 6) ))
            )
        (with-current-buffer jc-tag-buffer 
            (make-variable-buffer-local 'case-fold-search )
            (setq case-fold-search nil)
       )
       )
      (error  ( concat jc-tag-files "doesn't exists !!!" ))
   )
)



(defun jc-reload-tag-buffer-maybe( ) 
  "check if the jc-tag-buffer is still live ,if not reload it "
  (if (not jc-tag-buffer) (jc-init) )
  (if  (not (buffer-live-p jc-tag-buffer) )
      (setq jc-tag-buffer (find-file-noselect  jc-tag-files)) (setq jc-tag-buffer jc-tag-buffer)   ))


(defun jc-find-out-matched-pkg-item (pkg-prefix  &optional exactly_match  &optional buffer   )
  "this function is used to find out all matched packaged whose prefix is pkg-prefix 
  for example: support  pkg-prefix=javax.xm  then it will return
   '( '(\"javax.xml.bind\" 2741 2767 ) '(\"javax.xml.bind.attachment\" 2776 2778 ) ) 
if exactly_match is not nil then pkg-prefix will be seen as full package name , and
we will suppose you are searching package name = pkg-prefix , if exactly_match is set
in normal only 1 or 0 item will exists so we will try to
 convert '((packageName 12 33 )) to '(packageName 12 33 ) 
"
  (with-current-buffer (or buffer  (jc-reload-tag-buffer-maybe)  )
    (let (
          (line-num jc-package-first-ln) 
          (matched-package nil )
          (regexp-pkg-prefix (concat "^" (regexp-quote pkg-prefix )))
          (current-pkg-line    nil)   )
       (if exactly_match   (setq regexp-pkg-prefix (concat "^"  (regexp-quote  pkg-prefix )  "`" ) ))  ;;I use ` char as the separator in tag file
      (while (< line-num jc-class-first-ln  )  
        (setq current-pkg-line (jc-read-line line-num)  )
        (if (string-match regexp-pkg-prefix  current-pkg-line  )
              (setq matched-package (append (list (split-pkg-item current-pkg-line  )) matched-package  ))
          )
        (setq line-num  (+ line-num 1 )  )
        )
      (if (and   exactly_match matched-package ) (setq matched-package (car matched-package)) )
      (setq matched-package matched-package);; i don't know how to return it ,so i add this line
      )
    )
  ;;return 
  )   
(defun shrunk-matched-pkgs (pkg-prefix matched-pkg-items ) 
  "this function is used for list matched package . when you import a package in head of your java file ,
when you typed in (-|- means the cursor maybe I should call it  point) 
    jav-|- ,
 then it will list 'java javax' instead of
'java.lang java.lang.rel javax.xml javax.xml.ws' "
  (let ( (prefix-length (length pkg-prefix ) )
         (matched-pkg-count (length matched-pkg-items))
         (current-item nil) (current-cut-string nil)
         (index 0) (index-of-dot 0)
         (return-list ) (ele_exists nil)
         (i 0) )
    (while (< index matched-pkg-count)
      (setq current-item (nth index matched-pkg-items))
      (if (setq index-of-dot (string-match (regexp-quote ".") (car current-item)  prefix-length  )  )
          (setq current-cut-string  (substring (car current-item )  0   index-of-dot ))
        (setq current-cut-string (substring (car current-item )  0 )) )
      (setq ele_exists nil i 0 ) 
      (while (and  (not ele_exists ) (< i (length return-list) ))
        (when (string-equal current-cut-string (nth i return-list)) 
          (setq ele_exists t) )
        (setq i (+ i 1)) )
      (if (not ele_exists)  (setq return-list  (append return-list (list current-cut-string  ))  ))
      (setq index (+ 1 index)) )
      (setq return-list return-list)
    )
  )
(defun jc-find-out-matched-class-item (package-name class-prefix  &optional exactly_match  &optional buffer   )
  "this function is use to find out all Class whose package name is package-name 
   and ClassName is start with class-prefix 
if package-name is nil ,then try to find out all Class whose ClassName is start with class-prefix
if class-prefix is nil or empty string ,it will try to find out all Class in package package-name
if both  package-name and class-prefix  are nil then  it will return all Class in all package
the param exactly_match ,means only class name exactly equals to class-prefix will be return "
  (with-current-buffer (or buffer  (jc-reload-tag-buffer-maybe))
    (let ((matched-pkg-item )(return-list)
          (line-num nil) (end-line-num  nil)(current-line-string nil) )
      (if package-name
          (progn (setq matched-pkg-item (jc-find-out-matched-pkg-item package-name t))
                 (if matched-pkg-item
                     (setq line-num  (nth 1 matched-pkg-item) end-line-num (nth 2 matched-pkg-item) )
                   (setq line-num   1 end-line-num  1) ) )
        (setq line-num   jc-class-first-ln end-line-num  jc-member-first-ln) ) 
      (if (not class-prefix) (setq class-prefix "") )
      (if exactly_match (setq regexp-class-prefix (concat "^"  (regexp-quote  class-prefix ) "`" ) )
        (setq regexp-class-prefix  (concat "^"  (regexp-quote class-prefix  )   ) ) )
      (while (< line-num end-line-num)
        (setq current-line-string (jc-read-line line-num))
        (if (string-match regexp-class-prefix current-line-string )
            (setq return-list (append return-list (list (split-class-item current-line-string )))) )
        (setq line-num (+ line-num 1)) )
      (setq return-list return-list)
) ) ) 

(defvar matched-import-cache-list nil
 "when complete a import ,sometimes we can use the last completed items for next complete  ")
(defvar previous-matched-import-prefix nil "previous matched prefix for import Class at head of source " )
(defun jc-import-pkg-or-class-frontend(  )
  "this function is the frontend , so you can bind it will a key sequence 
it will return a list, for example '( java.lang ,java.ref)" 
  (interactive )
  (save-excursion 
    (let* ((begin ) (cursor )(line-string) (case-fold-search nil)
          (class-prefix ) (package-prefix ) (element)
          (matched-list nil) (matched-pkg-items)(matched-class-items)
          (index_of_last_dot))
      (setq cursor (point))(beginning-of-line) (setq begin (point))
      (setq line-string      (buffer-substring begin cursor))
      (if (string-match "^[ \t]*import[ \t]+\\([a-zA-Z_0-9\\.]+\\)" line-string)
          (progn  
            (setq line-string  (match-string-no-properties 1 line-string))
            (if (and matched-import-cache-list  ( > (length line-string)  (length previous-matched-import-prefix ) ) )
            ;;if there are some items in cache list then try to find out from it 
                (dolist (element matched-import-cache-list)
                  (if (string-match  (regexp-quote line-string)   element)
                  (setq matched-list (append matched-list (list element)  ))
                  ) ))
            (if (= (list-length matched-list ) 0 ) ;;if there are 0 matched in cache then find it out from tag files 
                (progn  
                  (setq matched-pkg-items (shrunk-matched-pkgs line-string  (jc-find-out-matched-pkg-item line-string) ) ) 
                  (setq index_of_last_dot    (string-match "\\.[a-zA-Z_0-9]*$" line-string))
                  (if index_of_last_dot
                      (progn 
                        (setq package-prefix (substring line-string 0 index_of_last_dot))
                        (setq class-prefix (substring line-string (+ 1 index_of_last_dot)  ))
                        (setq matched-class-items (jc-find-out-matched-class-item package-prefix class-prefix)) ) )
                  
                  (dolist ( element  matched-class-items )
                    (setq matched-list (append  (list (concat package-prefix "."  (car element ) ) )  matched-list  )) )
                  (setq matched-list   (append matched-list matched-pkg-items))
                  ) )) )
       (setq previous-matched-import-prefix line-string) ;;
       (setq  matched-import-cache-list matched-list)
      )
    )
  )

(defun bug_ (var)
  (if (stringp var ) (shell-command (concat "notify-send  " var  )) )
  (if (numberp var ) (shell-command (concat "notify-send   " (number-to-string var)  )) )
  (if (listp var ) (shell-command (concat "notify-send  " (concat var))) )
)

(defun jc-find-out-class-by-parse-source ()
  "find out class in current  java source file, then will import  them if they haven't been imported   "
  (save-excursion 
    (save-match-data
      (let* ( (case-fold-search nil) (matched-class-strings)(return-class-strings-list nil)(line ) (pt ) (ele) 
            (return-type-regexp  "\\(\\([a-zA-Z0-9_]\\| *\t*< *\t*\\| *\t*>\\| *\t*, *\t*\\| *\t*\\[ *\t*]\\)+\\)" )
            (split-char-regexp "\\(,\\|<\\|>\\|]\\|\\[\\| \\|\t\\|\n\\)") );;a list of split char like ", \t<>[]"
        (beginning-of-buffer)
        (while  (setq pt (search-forward-regexp   (concat  "\\bnew[ \t]+"  return-type-regexp) (point-max) 't))
          (setq matched-class-strings (append matched-class-strings  (split-string (match-string-no-properties 1 ) split-char-regexp )))
          )
        (beginning-of-buffer)
        (while   (search-forward-regexp     "\\b\\([A-Z][a-zA-Z0-9_]*\\)\\.[a-zA-Z0-9_]+[ \t]*(" (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (list(match-string-no-properties 1 )))))
        (beginning-of-buffer)
        (while   (search-forward-regexp     "\\([a-zA-Z0-9_]+\\)\\.getInstance[ \t]*(" (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (list(match-string-no-properties 1 )))))
        (beginning-of-buffer)
        ;;find out all statement of variable ,for example
        ;; String name;      Map<String,<String,Ojbect>>[] map=  
        (while (search-forward-regexp       "^[ \t]*\\(public\\|private\\|static\\|final\\|native\\|synchronized\\|transient\\|volatile\\|strictfp\\| \\|\t\\)*\\(\\([a-zA-Z0-9_]\\| *\t*< *\t*\\| *\t*>\\| *\t*, *\t*\\| *\t*\\[ *\t*]\\)+\\)[ \t]+[a-zA-Z0-9_]+[ \t]*[;=]"  (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (split-string (match-string-no-properties 2 ) split-char-regexp )))
          )
        (beginning-of-buffer);; find ClassName after "catch" keywords  for example :catch(IOException e )
        (while   (search-forward-regexp "catch[ \t]*(\\([a-zA-Z0-9_]+\\)[ \t]+"  (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (list (match-string-no-properties 1 ) )))
          )
        (beginning-of-buffer) ;;find method statement
        (while   (search-forward-regexp "^[ \t]*\\(public\\|private\\|static\\|final\\|native\\|synchronized\\|transient\\|volatile\\|strictfp\\| \\|\t\\)*[ \t]+\\(\\([a-zA-Z0-9_]\\|\\( *\t*< *\t*\\)\\|\\( *\t*> *\t*\\)\\|\\( *\t*, *\t*\\)\\|\\( *\t*\\[ *\t*\\)\\|\\(]\\)\\)+\\)[ \t]+[a-zA-Z0-9_]+[ \t]*(\\(.*\\))[ \t]*\\(throws[ \t]+\\([a-zA-Z0-9_, \t\n]*\\)\\)?[ \t\n]*{"  (point-max) 't)
          (let ((exception ) (returns) (params )  )
            (setq returns (match-string-no-properties 2))
            (setq  params  (match-string-no-properties 9))
            (setq exception (match-string-no-properties 11))
            ;;handle return type
            (setq matched-class-strings (append matched-class-strings  (split-string  returns "\\(,\\|<\\|>\\|]\\|\\[\\| \\|\t\\)"  )))
;;;;handle methods parameters  ;;find out 'Map String Ojbect User' from "Map<String,Object> map,User user"
            (while  (and  params  (>  (length params ) 0 )     )
              (if (string-match "\\([a-zA-Z0-9_]\\|\\( *\t*< *\t*\\)\\|\\( *\t*>\\)\\|\\( *\t*, *\t*\\)\\|\\( *\t*\\[ *\t*\\)\\|\\(]\\)\\)+" params    )
                  (progn 
                    (setq matched-class-strings (append matched-class-strings (split-string (match-string-no-properties 0 params ) split-char-regexp )))
                    (string-match "[ \t]*[a-zA-Z0-9_]+[ \t,]?" params  (match-end 0 )  )
                    (setq params (substring params  (match-end 0 ) )) )
                (setq params nil)
                ))
            ;;handle throws Exception1,Exception2, we will exatract Exception1 Exception2 from throws sentence
            (if exception 
                (setq matched-class-strings (append matched-class-strings (split-string  exception split-char-regexp)  ))))
          )
         ;;remove primitive type and remove duplicate item
        (dolist (ele matched-class-strings)
          (if (not (or (string-equal "" ele ) (string-match  "\\(int\\|float\\|double\\|long\\|short\\|char\\|byte\\|void\\|boolean\\|return\\|public\\|static\\|private\\|protected\\|abstract\\|final\\|native\\|package\\)" ele ) ) )
              (let( (index 0) (ele_exists nil))
                (while  (and (< index (length return-class-strings-list)) (not ele_exists) )
                  (if (string-equal ele  (nth index return-class-strings-list ) ) (setq   ele_exists t) ) 
                  (setq index (+ index 1)))
                (if (not ele_exists)(setq return-class-strings-list (append return-class-strings-list (list  ele))) ) )
            ))
        (setq matched-class-strings return-class-strings-list) ;;return 
        ))))
(defun jc-caculate-all-unimported-class-items()
  "this function will find out all unimported Class itmes , it just do a subtration 
   (jc-find-out-class-by-parse-source) -(jc-caculate-all-imported-class-items) 
what you need to do next, is just import the unimported class  "
  (let ((imported-class-items (jc-caculate-all-imported-class-items)   ) 
         (class-strings-in-source (jc-find-out-class-by-parse-source) )  
         (unimported-class-items )(ele ) )
           (dolist (ele class-strings-in-source)
                   (let ((is_class_hava_imported) (index 0)) 
                     (while  (and (< index (length imported-class-items)) (not is_class_hava_imported) ) 
                           (if (string-equal ele  (car (nth index imported-class-items))) 
                               (setq  is_class_hava_imported t))  (setq index (+ index 1))  )
                     (if (not is_class_hava_imported) 
                      (setq unimported-class-items
                           (append unimported-class-items (jc-find-out-matched-class-item nil ele t ))))))
           (setq unimported-class-items unimported-class-items));; return
)

(defun jc-import-all-unimported-class-frontend (&optional tag-buffer)
  (interactive)
  (let ((unimported-class-items (jc-caculate-all-unimported-class-items) )
        (ele)  (return-line-list))
    (dolist ( ele unimported-class-items)
      (if ele  (with-current-buffer (or tag-buffer  (jc-reload-tag-buffer-maybe)  )
            (setq return-line-list (append return-line-list (list 
              (concat    (car   (split-pkg-item-by-pkg-ln  (nth 1 ele) )  )  "." (car ele) )))) )))
    (insert-import-at-head-of-source-file  return-line-list)
     ; (setq return-line-list return-line-list)    
))
(defun jc-import-class-under-point-frontend ( &optional tag-buffer)
  (interactive)
  (let ((cur-word (current-word)) (class-item-s) (return-line-list)(ele) )
    (if (and cur-word  (> (length cur-word) 0)   )
        (progn 
        (setq class-item-s (jc-find-out-matched-class-item nil cur-word t))
      (dolist ( ele class-item-s)
        (if ele  (with-current-buffer (or tag-buffer  (jc-reload-tag-buffer-maybe)  )
                   (setq return-line-list (append return-line-list (list 
                     (concat    (car   (split-pkg-item-by-pkg-ln  (nth 1 ele) )  )  "." (car ele) )))) )))
  ))
    (insert-import-at-head-of-source-file  return-line-list)
) )

;;(insert-import-at-head-of-source-file (jc-import-all-unimported-class-frontend))
(defun insert-import-at-head-of-source-file (import-class-list)
  "insert 'import sentence' in head of java source file,
before that it will use y-or-n-p ask user to confirm 
params import-class-list  just looks like '(\"java.io.File\" \"java.io.Writer\") "
(let* ( (case-fold-search nil)   (import-class-buffer "*import-java-class*")(ele) (user-confirmed-class-list))
(if (and  import-class-list   ( > (length import-class-list) 0) )
(progn 
(switch-to-buffer-other-window  import-class-buffer t)
(with-current-buffer    import-class-buffer  ;;show maybe imported Class in a new buffer 
   (dolist (ele import-class-list)
   (insert (concat "[ ]  "  ele "\n")) )
   (beginning-of-buffer)(forward-char 1))
(other-window -1 )
(dolist (ele import-class-list ) ;;ask user whether to import the Class 
  (if (y-or-n-p (concat "import " ele  "? ") )
      (progn (switch-to-buffer-other-window  import-class-buffer t)
             (setq user-confirmed-class-list (append user-confirmed-class-list (list ele)))
             (with-current-buffer    import-class-buffer 
               (beginning-of-line )(forward-char 1)(delete-char 1)
               (insert "*")(backward-char 1)
               (next-line) (other-window -1 ) ))
    (progn (switch-to-buffer-other-window  import-class-buffer t)
           (with-current-buffer   import-class-buffer 
         (beginning-of-line ) (forward-char 1)(next-line)
             (other-window -1 ))) )
)
(delete-window )(kill-buffer import-class-buffer)  ;;delete *import-java-class* buffer and window
(save-match-data  ;;insert  at head of java source
  (save-excursion   (beginning-of-buffer)
    (let* ((case-fold-search nil)(ele)(class-start 
         (save-excursion (re-search-forward "\\(\\b\\(class\\|interface\\)[ \t]+[A-Z][a-zA-Z0-9_]*[ \t]*{\\)"  nil 't))))
      (if (not class-start)(error "this not a java class or interface ") )
      (if(re-search-forward "^[ \t]*import[ \t]+[a-zA-Z0-9_\\.\\*]+[ \t]*;" class-start 't) 
          ;;if find 'import' insert before it 
          (progn (beginning-of-line )(insert "\n")(previous-line)
                 (dolist (ele user-confirmed-class-list)(insert (concat "import " ele ";\n"))))
        ;; if hasn't found 'import; then insert after 'package ' statement 
        (progn (beginning-of-buffer)
               (if (re-search-forward "^[ \t]*package[ \t]+[a-z0-9_\\.]+[ \t]*;" class-start 't)
                   (progn (next-line) (beginning-of-line)(newline)
                          (dolist (ele user-confirmed-class-list)(insert (concat "import " ele ";\n"))))
                 (progn ;;if hasn't found 'import' and 'package' then insert at head of buffer
                   (beginning-of-buffer)
                   (dolist (ele user-confirmed-class-list)(insert (concat "import " ele ";\n"))) )))
))))))))
(defun jc-find-out-import-line ()
 "make a regex to match the packages in the import statements ,
return a list of each line string (exclude keyword 'import') "
  (let ((imported-line))
    (save-match-data
      (save-excursion
        (beginning-of-buffer)
        (let* ( (case-fold-search nil) (class-start (save-excursion
           (re-search-forward "\\(\\b\\(class\\|interface\\)[ \t]+[A-Z][a-zA-Z0-9_]*[ \t]*{\\)" nil 't))))
          (if (not class-start)
              (error "this not a java class or interface") )
          (while (re-search-forward "^[ \t]*import[ \t]+\\([a-zA-Z0-9_\\.\\*]+\\)[ \t]*;" class-start 't)
            (setq imported-line (append imported-line (list  (match-string-no-properties 1)   )) )
            (end-of-line))))
      )
    (setq imported-line imported-line)
    ))
(defun jc-caculate-all-imported-class-items (&optional exclude_java_lang)
  "find out all imported class  ,default include class in java.lang.*"
  (let ((imported-line (jc-find-out-import-line) )(element)(index)  (return-class-items) (case-fold-search nil) )
    (dolist ( element imported-line )
      (setq index   (string-match "\\.\\*$"  element))
      (if index   ;;import a package 
          (setq return-class-items (append return-class-items 
                                           (jc-find-out-matched-class-item (substring element 0 index) nil    ))) 
        (progn  ;;import a class 
          (string-match "^\\(.+\\)\\.\\([a-zA-Z0-9_]+\\)$" element )
          (setq return-class-items 
                (append return-class-items  
                        (jc-find-out-matched-class-item (match-string-no-properties 1 element ) (match-string-no-properties 2 element )  t ) ) ) ) ) ) 
    (if exclude_java_lang 
        (setq return-class-items return-class-items )
      (setq return-class-items  (append return-class-items  (jc-find-out-matched-class-item "java.lang" nil )))
      ) ) )
;(jc-caculate-all-imported-class-items)
;; (("Applet" 7 4367 4392) ("AppletContext" 7 4392 4402) ("AppletStub" 7 4402 4408)
;; ("AudioClip" 7 4408 4411) ("String" 25 11534 11616) ("Void" 25 11937 11938))

;; (defun java-completer (string predicate all-completions)
;;   "The completer.
;; This does most of the completion work scanning the buffer java.tags."
;;   (save-excursion
;;     (save-match-data
;;       (with-current-buffer (java-complete-tags-finder (current-buffer))
;;         (beginning-of-buffer)
;;         (let ((case-fold-search nil)
;;               (result (list '()))
;;               (re (if java-complete-class-p
;;                       (concat "^" java-complete-package-re "\\(" (regexp-quote string) "[A-Za-z0-9_]*\\)$")
;;                     ;; Else it's member completion
;;                     (concat "^[ \t]*\\(public \\|protected \\|abstract \\|static \\|final \\)"
;;                             java-complete-package-re 
;;                              java-complete-class-name "\\." ; the "." here ensures we catch only members (not constructors)
;;                             "\\(" (regexp-quote string) "[A-Za-z0-9]*\\)(.*)"))))
;;           (while (re-search-forward re nil 't)
;;             (nconc result (list (cons (match-string (if java-complete-class-p 2 3))
;;                                       (match-string 0))))
;;             (end-of-line))
;;           ;; What we do with the result depends on whether we were called as
;;           ;; try-completion or as all-completions
;;           (if all-completions
;;               ;; FIXME::: returning the list directly should work!!
;;               ;; seems to be a bug in display-completion-list that causes it to fail
;;               (mapcar (lambda (pair)
;;                         (car pair))  (cdr result))
;;             (try-completion string (cdr result) predicate)))))))


(provide 'java-complete)

;; End.



