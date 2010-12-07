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

;; (defun java-complete-import-re ()
;;   "make a regex to match the packages in the import statements"
;;   (let ((regex "java\\.lang\\."))
;;     (save-match-data
;;       (save-excursion
;;         (beginning-of-buffer)
;;         (let ((class-start (save-excursion
;;                              (re-search-forward "^.* \\(class \\|interface \\)" nil 't))))
;;           (if (not class-start)
;;               (error "this not a java class or interface"))
;;           (while (re-search-forward "^import \\([a-z0-9.]+\\).*;" class-start 't)
;;             (setq regex (concat regex "\\|" (regexp-quote (match-string-no-properties 1))))
;;             (end-of-line))))
;;       (concat "\\(" regex "\\)")
;;       )))

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


( defun jc-read-line ( line-number  &optional buffer  )
  "read a line  and return the string"
  (if buffer 
      (with-current-buffer
          buffer ( goto-line line-number)
          (buffer-substring-no-properties (line-beginning-position) (line-end-position)) )
     (progn
       ( goto-line line-number)
       (buffer-substring-no-properties (line-beginning-position) (line-end-position)) ) )
  )

(defun jc-split-pkg-item ( pkg-line-string )
 "the format pkg-line-string is str`num`num
  this function translate it to a list ,the num will be string2number
  give me  `java.lang`222`333 ,return '(\"java.lang\" 222 333 ) "
  (let (( pkg-item (split-string pkg-line-string "`" t)) ) 
    (setcar (nthcdr 1 pkg-item ) (string-to-number (nth 1 pkg-item ))  )
    (setcar (nthcdr 2 pkg-item ) (string-to-number (nth 2 pkg-item ))  )
    (setq pkg-item pkg-item )
    )
)
(defun jc-split-pkg-item-by-pkg-ln ( pkg-line-number  &optional buffer )
  "the format pkg-line-string is str`num`num   this function translate it to a list ,the num will be string2number
   return a list of pkg info of line-number "
  (jc-split-pkg-item (jc-read-line pkg-line-number  (or buffer (jc-reload-tag-buffer-maybe))  )  )
)

(defun split-class-item ( class-line-string )
 "the format of class-line-string is classname`packageLineNum`memberStartLineNum`memberEndLineNum
  this function translate it to a list ,the num will be convert to number "
  (let (( class-item (split-string class-line-string "`" t)) ) 
    (setcar (nthcdr 1 class-item ) (string-to-number (nth 1 class-item ))  )
    (setcar (nthcdr 2 class-item) (string-to-number (nth 2 class-item ))  )
    (setcar (nthcdr 3 class-item) (string-to-number (nth 3 class-item ))  )
    (setq class-item class-item )
    )
)
(defun jc-split-class-item-by-class-ln ( class-line-number  &optional buffer )
  (split-class-item  (jc-read-line class-line-number  (or buffer (jc-reload-tag-buffer-maybe))  ))
)
(defun split-constructor-by-line-num ( constructor-line-num )
   (split-constructor  (jc-read-line constructor-line-num  (or buffer (jc-reload-tag-buffer-maybe))  ))
)

(defun split-constructor ( constructor-line-string )
  (let ((constructor-item) (split-list) )
    (setq constructor-line-string (substring-no-properties constructor-line-string 2))
    (setq split-list (split-string  constructor-line-string "`"))
    ;;handle constructor name
    (add-to-list  'constructor-item  (car split-list) t)
    ;;handle params if exists
    (if (not  (string-equal "" (nth 1 split-list)) )
        (let ((params)(param-split-list)) 
          (setq param-split-list (split-string (nth 1 split-list)  "," t))
          (dolist (param param-split-list)
            (if (string-match  "^~" param )
                (setq params  (append  params  (list (substring-no-properties param 1 ) )  ))
              (progn 
                (string-match ".*:\\(.*\\)"  param  )  
                (setq params (append params (list (jc-split-class-item-by-class-ln 
                                                   (string-to-number (match-string-no-properties 1 param))))))
                ) ) ) 
          (setq constructor-item (append constructor-item (list params)))
          ) 
      (setq constructor-item (append constructor-item  (list "")) )
      )
    (if (not  (string-equal "" (nth 2 split-list)) )
        (let ((exceptions)(exception-split-list)) 
          (setq exception-split-list (split-string (nth 2 split-list)  "," t))
          (dolist (exception exception-split-list)
            (if (string-match  "^~" exception )
                (setq exceptions  (append  exceptions  (list (substring-no-properties exception 1 ) )  ))
              (progn 
                (string-match ".*:\\(.*\\)"  exception  )  
                (setq exceptions (append exceptions (list (jc-split-class-item-by-class-ln 
                                                        (string-to-number (match-string-no-properties 1 exception))))))
                ) ) ) 
          (setq constructor-item (append constructor-item (list exceptions)))
          ) 
      (setq constructor-item (append constructor-item  (list "")) )
      )    (setq constructor-item constructor-item)
           )
  )
(defvar jc-use-short-class-name t )
(defun constructor-to-string (constructor-item)
  (let((constructor-string  (car constructor-item) )
       (params (nth 1 constructor-item)   )
       (exceptions (nth 2 constructor-item)) )
    (if (stringp params ) (setq constructor-string (concat constructor-string "()")) 
      (progn 
        (setq constructor-string (concat constructor-string "("))                
        (dolist (param  params )
          (when (stringp param ) (setq constructor-string (concat constructor-string param " , " ) ) )
          (when (listp param) 
            (if jc-use-short-class-name 
                (setq constructor-string (concat constructor-string  (car param)  " , " ) ) 
              (setq constructor-string (concat constructor-string
                                               (car (jc-split-pkg-item-by-pkg-ln (nth 1 param) ))  "."  
                                               (car param)  " , " ) ) ) ) )
        (setq constructor-string  (replace-regexp-in-string  " , $" ")" constructor-string ) ) ) )
    (when (listp exceptions )  
      (setq constructor-string (concat constructor-string " throws "))                
      (dolist (exception  exceptions )
        (when (stringp exception ) (setq constructor-string (concat constructor-string exception " , " ) ) )
        (when (listp exception) 
          (if jc-use-short-class-name 
              (setq constructor-string (concat constructor-string  (car exception)  " , " ) ) 
            (setq constructor-string (concat constructor-string
                                             (car (jc-split-pkg-item-by-pkg-ln (nth 1 exception) ))  "."  
                                             (car exception)  " , " ) ) ) ) )
      (setq constructor-string  (replace-regexp-in-string  ", $" "" constructor-string ) ) ) 
    
    (setq constructor-string constructor-string)
   )
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
              (setq jc-member-end-ln     (string-to-number (jc-read-line 6) )) )
        (with-current-buffer jc-tag-buffer 
            (make-variable-buffer-local 'case-fold-search )
            (setq case-fold-search nil) )
        (jc-load-all-sorted-class-items-to-memory)
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
in normal only 1 or 0 item will returned so we will try to
 convert '((packageName 12 33 )) to '(packageName 12 33 ) "
  (with-current-buffer (or buffer  (jc-reload-tag-buffer-maybe)  )
    (let ( (line-num jc-package-first-ln) (matched-package nil )
          (regexp-pkg-prefix (concat "^" (regexp-quote pkg-prefix )))
          (current-pkg-line    nil)   )
       (if exactly_match   (setq regexp-pkg-prefix (concat "^"  (regexp-quote  pkg-prefix )  "`" ) ))  ;;I use ` char as the separator in tag file
      (while (< line-num jc-class-first-ln  )  
        (setq current-pkg-line (jc-read-line line-num)  )
        (if (string-match regexp-pkg-prefix  current-pkg-line  )
            (add-to-list 'matched-package (jc-split-pkg-item current-pkg-line)) )
        (setq line-num  (+ line-num 1 )  ) )
      (if (and   exactly_match matched-package ) (setq matched-package (car matched-package)) )
      (setq matched-package matched-package);; i don't know how to return it ,so i add this line
      ) )
  ;;return 
  )   
(defun jc-shrunk-matched-pkgs (pkg-prefix matched-pkg-items ) 
  "this function is used for list matched package . when you import a package in head of your java file ,
when you typed in (-|- means the cursor maybe I should call it  point) jav-|- ,
 then it will list 'java javax' instead of 'java.lang java.lang.rel javax.xml javax.xml.ws' "
  (let ( (matched-pkg-count (length matched-pkg-items))
         (current-item nil) (current-cut-string nil)
         (index 0) (index-of-dot 0) (return-list ))
    (while (< index matched-pkg-count)
      (setq current-item (nth index matched-pkg-items))
      (if (setq index-of-dot (string-match (regexp-quote ".") (car current-item)  (length pkg-prefix)  )  )
          (setq current-cut-string  (substring-no-properties (car current-item )  0   index-of-dot ))
        (setq current-cut-string (substring-no-properties (car current-item )  0 )) )
      (add-to-list 'return-list current-cut-string)
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
          (line-num nil) (end-line-num  nil)(current-line-string ) )
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
            (add-to-list 'return-list (split-class-item current-line-string)) )
        (setq line-num (+ line-num 1)) )
      (setq return-list return-list)
) ) ) 
(defun jc-find-out-matched-class-item-without-package-prefix (class-prefix &optional exactly_match )
  "actully you can use jc-find-out-matched-class-item to do the same thing ,just let package-prefix nil
 but it is very slowly ,it need to search all the line in tag file just to find out one class item .
so this function use jc-load-all-sorted-clas-items-to-memory to sort the class section and load it in memory
and build a index for it  ,limit : length of class-prefix must larger than 2 "
  (let ((case-fold-search nil) (two-char-list-length (length two-char-list) )(two-char-item)
           (not_found t) (index 0) (matched-class-items))
    (if (string-match "^[A-Z][a-zA-Z]" class-prefix);; actually we only index this 
          (while  (and not_found (< index two-char-list-length ) )
               (setq two-char-item (nth index two-char-list))
               (when (string-equal (substring-no-properties class-prefix 0 2) (car two-char-item) )
                   (let* ( (start (nth 1 two-char-item)) (end (nth 2 two-char-item)) 
                           (i start) (current-class-item) (regexp-class-prefix))
                     (if exactly_match (setq regexp-class-prefix (concat "^" class-prefix "$"))
                       (setq regexp-class-prefix (concat "^" class-prefix )) )
                     (while (< i end) (setq current-class-item (nth i jc-all-sorted-class-items))
                           (if (string-match  regexp-class-prefix (car  current-class-item )  )
                               (add-to-list 'matched-class-items current-class-item t))
                     (setq i (+ i 1)) ) )
                   (setq  not_found nil);; exit while
               )
               (setq index (+ index 1)) )
      ;;actually  I only index  those class whose class name match [A-Z][a-zA-Z].
      ;; other class like   _RMIConnection_Stub should be search line by line at the class section  in tag file 
      (let ((line-num jc-class-first-ln) (current-line-string) (regexp-class-prefix))
        (if exactly_match (setq regexp-class-prefix  (concat "^" class-prefix "`" ))              
                          (setq regexp-class-prefix  (concat "^" class-prefix  )) )
        (with-current-buffer (jc-reload-tag-buffer-maybe)
        (while (< line-num jc-member-first-ln)
          (setq current-line-string (jc-read-line line-num))
          (if (string-match regexp-class-prefix current-line-string )
              (add-to-list 'matched-class-items (split-class-item current-line-string)) )
          (setq line-num (+ line-num 1)) ) )) )
      (setq matched-class-items matched-class-items)
 ) ) 


(defvar jc-all-sorted-class-items nil)
(defun jc-load-all-sorted-class-items-to-memory()
  (jc-sort-class);;first sort the class ,and populate two-char-list variable
  (with-current-buffer "**jc-tmp-sorted-class**"
    (beginning-of-buffer)
    (let ((max-line-num (line-number-at-pos (point-max)) )  (line-num 1))
      (while  (< line-num max-line-num)
        (add-to-list 'jc-all-sorted-class-items  (split-class-item (jc-read-line line-num)) t)
        (setq line-num (+ line-num 1))
) ) )
  (kill-buffer (get-buffer "**jc-tmp-sorted-class**"))
 )

(defvar two-char-list nil )
(defun jc-sort-class ()
  "sort class for search ,we build a table for example ((Ab 1 3) (Ac 4 6) )
then we search AbstractC ,we just need to search line number from 1 3 "
     (let ((case-fold-search nil)(begin ) (end) (jc-tmp-sorted-class-buffer "**jc-tmp-sorted-class**"))
  (with-current-buffer (jc-reload-tag-buffer-maybe)
    (goto-line jc-class-first-ln)(beginning-of-line) (setq begin (point))
    (goto-line jc-member-first-ln) (beginning-of-line) (setq end (point))
    (if (get-buffer jc-tmp-sorted-class-buffer) (kill-buffer (get-buffer jc-tmp-sorted-class-buffer )) )
    (append-to-buffer jc-tmp-sorted-class-buffer begin end ) )
    (with-current-buffer jc-tmp-sorted-class-buffer 
      (setq case-fold-search nil)
     (sort-lines nil 1 (point-max)  )
     (let ( (end ?Z) (index ?A) (index2 ?A)  (two-char)  (return-two-list)(two-char-item)(next-start-search-line-num) )
       (while  (<= index end) (setq index2 ?A)
         (while ( <= index2 ?z)
          (setq two-char (concat (char-to-string index) (char-to-string index2)  ))
          (if next-start-search-line-num
              (setq two-char-item
                   (jc-build-map-4-search-class two-char jc-tmp-sorted-class-buffer next-start-search-line-num))
              (setq two-char-item
                   (jc-build-map-4-search-class two-char jc-tmp-sorted-class-buffer 1))
          )
          (if two-char-item 
          (add-to-list 'return-two-list  two-char-item  t) 
          (setq next-start-search-line-num (nth 2 two-char-item))
          )
           (if (= index2 ?Z) (setq index2 ?a) (setq index2 (+ index2 1)) )
           )
         (setq index (+ index 1))
         )
        (setq two-char-list return-two-list)
 ) ) ))

(defun jc-build-map-4-search-class (two-char-prefix jc-tmp-sorted-class-buffer  start-search-line-num)
  "suppose two-char-prefix is 'Ab' and jc-tmp-sorted-class-buffer is the buffer
 ,all lines in it is the classname has been sorted by classname 
(it is cut from tag file between jc-class-first-ln and jc-member-first-ln ,and sorted by (sort-lines))
then this function is try to find out className begin with two-char-prefix ,and got the start line-number 
and end-line-number ,remember in a list ,when search class name begin with two-char-prefix ,we just need to
find it from the start line number to the end line number ,it is faster than directly searching the unsorted 
tag buffer file "
  (with-current-buffer  jc-tmp-sorted-class-buffer
    (goto-line start-search-line-num)
    (let ((char1 ) (char2)(end-prefix-regexp )(end-line-num)
          (case-fold-search nil)(start nil) (end nil)
          (has-found-first nil) (return-item) )
      (setq char1 (string-to-char (substring-no-properties two-char-prefix 0 1)))
      (setq char2 (string-to-char (substring-no-properties two-char-prefix 1 2)))
      (if (or  (= char1 ?Z)  (= char2 ?z) (= char2 ?Z) )
          (setq end-line-num (line-number-at-pos (point-max)))
        (progn 
        (if (< char2 ?a) 
            (setq end-prefix-regexp (concat  "^" (char-to-string char1)
                         "[a-z" (char-to-string (+ 1 char2)) "-Z]\\|^" (char-to-string (+ char1 1)) "[a-zA-Z]"  ))
          (setq end-prefix-regexp (concat "^" (char-to-string char1)
                     "[" (char-to-string (+ 1 char2)) "-z]\\|^" (char-to-string (+ char1 1)) "[a-zA-Z]"  )) ) 
        (message (concat  two-char-prefix ":"   end-prefix-regexp) )
        (goto-line start-search-line-num)
        (if ( re-search-forward end-prefix-regexp  (point-max) t) 
            (setq end-line-num (point))
            (setq end-line-num (point-max))
          )
        ))
        (goto-line start-search-line-num)
      (add-to-list 'return-item two-char-prefix)
         (while (re-search-forward (concat "^" two-char-prefix ) (point-max) t )
                  (when (not has-found-first)    
                    (setq has-found-first t)
                    (setq start (line-number-at-pos (point)))
                      )
                  (setq end (line-number-at-pos (point)))
           )
         (if (numberp start )
           (progn (setq return-item (append return-item (list start) ))
             (setq return-item (append return-item (list end )) ))
           (setq return-item nil)
            )
         (setq return-item return-item)
      )
 ) )

(defvar matched-import-cache-list nil
  "when complete a import ,sometimes we can use the last completed items for next complete  ")
(defvar previous-matched-import-prefix nil "previous matched prefix for import Class at head of source " )
(defun jc-import-pkg-or-class-frontend(  )
  "this function is the frontend , so you can bind it with a key sequence 
  it will return a list, for example '( java.lang ,java.ref)" 
  (interactive )
  (save-excursion 
    (let* ( (case-fold-search nil) (package-prefix ) (class-prefix )
            (line-string   (buffer-substring-no-properties (line-beginning-position) (point)))
            (matched-list nil) (matched-pkg-items)(matched-class-items)
            (index_of_last_dot))
      (when (string-match "^[ \t]*import[ \t]+\\([a-zA-Z_0-9_\\.]+\\)" line-string)
        (setq line-string  (match-string-no-properties 1 line-string))
        (when (and matched-import-cache-list  
                   (string-match (concat "^"  previous-matched-import-prefix   ) line-string ) )
          ;;if there are some items in cache list then try to find out from it 
          (dolist (element matched-import-cache-list)
            (if (string-match  (regexp-quote line-string)   element) (add-to-list 'matched-list element) ) ))
        (when (= (list-length matched-list ) 0 ) ;;if there are 0 matched in cache then find it out from tag files 
          (setq matched-pkg-items (jc-shrunk-matched-pkgs line-string  (jc-find-out-matched-pkg-item line-string) ) ) 
          (setq index_of_last_dot    (string-match "\\.[a-zA-Z_0-9]*$" line-string))
          (when index_of_last_dot
            (setq package-prefix (substring-no-properties line-string 0 index_of_last_dot))
            (setq class-prefix (substring-no-properties line-string (+ 1 index_of_last_dot)  ))
            (setq matched-class-items (jc-find-out-matched-class-item package-prefix class-prefix)) ) 
          (setq matched-list   (append matched-list matched-pkg-items))
          (dolist ( element matched-class-items )(add-to-list 'matched-list (concat package-prefix "." (car element))))
          )
        (setq previous-matched-import-prefix line-string) ;;
        (setq  matched-import-cache-list matched-list)
        ) ) ) )
(defun jc-find-out-class-by-parse-source ()
  "find out class in current  java source file, then will import  them if they haven't been imported   "
  (save-excursion 
    (save-match-data
      (let* ( (case-fold-search nil) (matched-class-strings)
            (return-type-regexp  "\\(\\([a-zA-Z0-9_]\\| *\t*< *\t*\\| *\t*>\\| *\t*, *\t*\\| *\t*\\[ *\t*]\\)+\\)" )
            (split-char-regexp "\\(,\\|<\\|>\\|]\\|\\[\\| \\|\t\\|\n\\)") );;a list of split char like ", \t<>[]"
        (beginning-of-buffer)
        (while   (search-forward-regexp   (concat  "\\bnew[ \t]+"  return-type-regexp) (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (split-string (match-string-no-properties 1 ) split-char-regexp t))) )
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
          (setq matched-class-strings (append matched-class-strings  (split-string (match-string-no-properties 2 ) split-char-regexp  t))) )
        (beginning-of-buffer);; find ClassName after "catch" keywords  for example :catch(IOException e )
        (while   (search-forward-regexp "catch[ \t]*(\\([a-zA-Z0-9_]+\\)[ \t]+"  (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (list (match-string-no-properties 1 ) ))) )
        (beginning-of-buffer) ;;find method statement
        (while   (search-forward-regexp "^[ \t]*\\(public\\|private\\|static\\|final\\|native\\|synchronized\\|transient\\|volatile\\|strictfp\\| \\|\t\\)*[ \t]+\\(\\([a-zA-Z0-9_]\\|\\( *\t*< *\t*\\)\\|\\( *\t*> *\t*\\)\\|\\( *\t*, *\t*\\)\\|\\( *\t*\\[ *\t*\\)\\|\\(]\\)\\)+\\)[ \t]+[a-zA-Z0-9_]+[ \t]*(\\(.*\\))[ \t]*\\(throws[ \t]+\\([a-zA-Z0-9_, \t\n]*\\)\\)?[ \t\n]*{"  (point-max) 't)
          (let ((exception ) (returns) (params )  )
            (setq returns (match-string-no-properties 2))
            (setq  params  (match-string-no-properties 9))
            (setq exception (match-string-no-properties 11))
            ;;handle return type
            (setq matched-class-strings (append matched-class-strings  (split-string  returns "\\(,\\|<\\|>\\|]\\|\\[\\| \\|\t\\)"  t)))
;;;;handle methods parameters  ;;find out 'Map String Ojbect User' from "Map<String,Object> map,User user"
            (while  (and  params  (>  (length params ) 0 )     )
              (if (string-match "\\([a-zA-Z0-9_]\\|\\( *\t*< *\t*\\)\\|\\( *\t*>\\)\\|\\( *\t*, *\t*\\)\\|\\( *\t*\\[ *\t*\\)\\|\\(]\\)\\)+" params    )
                  (progn 
                    (setq matched-class-strings (append matched-class-strings (split-string (match-string-no-properties 0 params ) split-char-regexp t)))
                    (string-match "[ \t]*[a-zA-Z0-9_]+[ \t,]?" params  (match-end 0 )  )
                    (setq params (substring-no-properties params  (match-end 0 ) )) )
                (setq params nil)
                ))
            ;;handle throws Exception1,Exception2, we will exatract Exception1 Exception2 from throws sentence
       (if exception 
            (setq matched-class-strings (append matched-class-strings (split-string  exception split-char-regexp t))))))
         ;;remove primitive type and remove duplicate item
        (delete-dups matched-class-strings) (delete "" matched-class-strings)
        (dolist (ele matched-class-strings)
          (if (string-match  "\\(int\\|float\\|double\\|long\\|short\\|char\\|byte\\|void\\|boolean\\|return\\|public\\|static\\|private\\|protected\\|abstract\\|final\\|native\\|package\\)" ele )
              (delete ele matched-class-strings) ))
       (setq matched-class-strings matched-class-strings) ;;return 
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
;                           (append unimported-class-items (jc-find-out-matched-class-item nil ele t ))))))
                    (append unimported-class-items   (jc-find-out-matched-class-item-without-package-prefix ele t)  )))))
                            
           (setq unimported-class-items unimported-class-items));; return
)
(defun jc-import-all-unimported-class-frontend ()
     (interactive)
    (jc-insert-import-at-head-of-source-file (jc-caculate-all-unimported-class-items) )
)
(defun jc-import-class-under-point-frontend ( )
  (interactive)
  (let ((cur-word (current-word))  )
    (when (and cur-word  (> (length cur-word) 0)   )
      (if (string-match "[^a-zA-Z0-9_]\\([a-zA-Z0-9_]+\\)$" cur-word)
          (setq cur-word (match-string-no-properties 1  cur-word )) )
      (if (string-match "^\\([a-zA-Z0-9_]+\\)[^a-zA-Z0-9_]" cur-word)
          (setq cur-word (match-string-no-properties 1  cur-word )) )
;      (jc-insert-import-at-head-of-source-file (jc-find-out-matched-class-item nil cur-word t)  )
      (jc-insert-import-at-head-of-source-file (jc-find-out-matched-class-item-without-package-prefix cur-word t)  )
 ) ) )
;;(jc-insert-import-at-head-of-source-file (jc-import-all-unimported-class-frontend))
(defun jc-insert-import-at-head-of-source-file (import-class-items-list)
  "insert 'import sentence' in head of java source file,
before that it will use y-or-n-p ask user to confirm 
params import-class-items-list  just looks like '(\"java.io.File\" \"java.io.Writer\") "
(let* ( (case-fold-search nil)   (import-class-buffer "*import-java-class*")(ele) (user-confirmed-class-items-list))
(if (and  import-class-items-list   ( > (length import-class-items-list) 0) )
(progn 
(if ( buffer-live-p (get-buffer"*import-java-class*") ) error "already opened buffer"  )
(switch-to-buffer-other-window  import-class-buffer t)
(with-current-buffer    import-class-buffer  ;;show maybe imported Class in a new buffer 
   (dolist (ele import-class-items-list)
   (insert (concat "[ ]  "  (car (jc-split-pkg-item-by-pkg-ln  (nth 1 ele ))) "." (car ele)  "\n")) )
   (beginning-of-buffer)(forward-char 1))
(other-window -1 )
(dolist (ele import-class-items-list ) ;;ask user whether to import the Class 
  (if (y-or-n-p (concat "import " (car ele)  "? ") )
      (progn (switch-to-buffer-other-window  import-class-buffer t)
             (add-to-list 'user-confirmed-class-items-list ele)
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
(jc-insert-import-at-head-of-source-file-without-confirm user-confirmed-class-items-list)
(setq user-confirmed-class-items-list user-confirmed-class-items-list)
))))
(defun jc-insert-import-at-head-of-source-file-without-confirm (class-items)
(save-match-data  ;;insert  at head of java source
  (save-excursion   (beginning-of-buffer)
    (let* ((case-fold-search nil)(class-start 
         (save-excursion (re-search-forward "\\(\\b\\(class\\|interface\\)[ \t]+[A-Z][a-zA-Z0-9_]*[ \t]*{\\)"  nil 't))))
      (if (not class-start)(error "this not a java class or interface ") )
      (if(re-search-forward "^[ \t]*import[ \t]+[a-zA-Z0-9_\\.\\*]+[ \t]*;" class-start 't) 
          ;;if find 'import' insert before it 
          (progn (beginning-of-line )(insert "\n")(previous-line)
             (dolist (ele class-items)(insert 
                                      (concat "import " 
                                             (car (jc-split-pkg-item-by-pkg-ln  (nth 1 ele )))
                                             "." (car  ele) ";\n"))))
        ;; if hasn't found 'import; then insert after 'package ' statement 
        (progn (beginning-of-buffer)
               (if (re-search-forward "^[ \t]*package[ \t]+[a-z0-9_\\.]+[ \t]*;" class-start 't)
                   (progn (next-line) (beginning-of-line)(newline)
                    (dolist (ele class-items)
                            (insert (concat "import "
                                             (car (jc-split-pkg-item-by-pkg-ln  (nth 1 ele )))
                                             "." (car  ele) ";\n"))) )
                 (progn ;;if hasn't found 'import' and 'package' then insert at head of buffer
                   (beginning-of-buffer)
                (dolist (ele class-items)
                         (insert (concat "import "
                                           (car (jc-split-pkg-item-by-pkg-ln  (nth 1 ele )))
                                            "." (car  ele) ";\n")))
                    ))) )))) )
(defun jc-find-out-import-line ()
 "make a regex to match the packages in the import statements ,
return a list of each line string (exclude keyword 'import') "
  (let ((imported-lines))
    (save-match-data
      (save-excursion
        (beginning-of-buffer)
        (let* ( (case-fold-search nil) (class-start (save-excursion
           (re-search-forward "\\(\\b\\(class\\|interface\\)[ \t]+[A-Z][a-zA-Z0-9_]*[ \t]*{\\)" nil 't))))
          (if (not class-start)
              (error "this not a java class or interface") )
          (while (re-search-forward "^[ \t]*import[ \t]+\\([a-zA-Z0-9_\\.\\*]+\\)[ \t]*;" class-start 't)
            (add-to-list 'imported-lines  (match-string-no-properties 1))
            (end-of-line))))
      )
    (setq imported-lines imported-lines)
    ))
(defun jc-caculate-all-imported-class-items (&optional exclude_java_lang)
  "find out all imported class  ,default include class in java.lang.*"
  (let ((imported-line (jc-find-out-import-line) )(element)(index)  (return-class-items) (case-fold-search nil) )
    (dolist ( element imported-line )
      (setq index   (string-match "\\.\\*$"  element))
      (if index   ;;import a package 
         (setq return-class-items (append return-class-items 
                     (jc-find-out-matched-class-item (substring-no-properties element 0 index) nil    ))) 
        (progn  ;;import a class 
          (string-match "^\\(.+\\)\\.\\([a-zA-Z0-9_]+\\)$" element )
          (setq return-class-items (append return-class-items  
                (jc-find-out-matched-class-item
                      (match-string-no-properties 1 element ) (match-string-no-properties 2 element )  t ) ) ) ) ) ) 
    (if exclude_java_lang 
        (setq return-class-items return-class-items )
      (setq return-class-items  (append return-class-items  (jc-find-out-matched-class-item "java.lang" nil )))
      ) ) )
(defun jc-complete-constructor-frontend ()
  (interactive)
  (let ((return-matched-list))
    (if (looking-back "\\bnew[ \t]+\\([A-Z][a-zA-Z0-9_]*\\)[ \t]*([ \t]*"  (line-beginning-position) )
        (setq return-matched-list (jc-complete-constructor (match-string-no-properties 1)))
      (if (looking-back "\\b\\([A-Z][a-zA-Z0-9_]*\\)"  )
          (setq return-list (jc-build-list-with-nth-on-each-element 
                             (jc-complete-class-with-cache (match-string-no-properties 1)) 0))
        )
      )
      (setq return-matched-list return-matched-list)
    )
  )
(defun jc-complete-constructor (class-prefix)
  (interactive)
  (let ((matched-class-item (jc-find-out-matched-class-item-without-package-prefix class-prefix t))
          (matched-constructor-items) (return-complete-list) ) 
    ;;when items <3 ,check if all of them have the same Short Class Name
    ;; if so ,then ask user to import one of them ,
    ;;then we can got the imported class item ,so that we complete its constructor
      (when (> (length matched-class-item ) 1 )  
        (setq matched-class-item  (jc-insert-import-at-head-of-source-file matched-class-item) )) 
    (if (= (length matched-class-item ) 1);; when only 1 class-item ,then complete its constructor
        (let ((line-num     (nth 2 (car matched-class-item) ) )  (matching-constructor t)  
              (end-line-num (nth 3 (car matched-class-item))) (current-line) )
          (while (and matching-constructor  (< line-num end-line-num ) )
            (setq current-line (jc-read-line line-num (jc-reload-tag-buffer-maybe)))
            (if (string-match "^  "  current-line)   
                (add-to-list 'matched-constructor-items (split-constructor current-line)  )
                (setq matching-constructor nil) )
            (setq line-num (+ line-num 1)) )
    (dolist (constructor matched-constructor-items)
      (add-to-list 'return-complete-list (constructor-to-string constructor) t)
    )
 ) ) 
(setq return-complete-list return-complete-list)
) )

(defun jc-complete-class-frontend () 
  "complete class name with (current-word) as class-prefix"
  (interactive)
  (let  ( (case-fold-search nil)   (return-list) (class-prefix))
    (setq class-prefix (current-word))
    (when class-prefix  (> (length class-prefix ) 0)
          (if (string-match "[^a-zA-Z0-9_]\\([a-zA-Z0-9_]+\\)$" class-prefix)
              (setq class-prefix (match-string-no-properties 1  class-prefix )) )
      (setq return-list (jc-build-list-with-nth-on-each-element (jc-complete-class-with-cache class-prefix) 0))
          ) ) )
(defvar matched-class-items-cache nil  "when search class-prefix without package-name ,it will search thoudsands of lines in tags files ,so this will cache for next match maybe  ")
(defvar previous-class-prefix nil "cache last class-prefix ")

(defun jc-complete-class-with-cache ( class-prefix )
  "complete class name"
  (let  ( (case-fold-search nil)   (return-list) )
    (when  (and class-prefix   (string-match "[A-Z][a-zA-Z0-9_]*" class-prefix))
      (if (and previous-class-prefix   (string-match (concat "^" previous-class-prefix ) class-prefix ))
          (dolist (class-item matched-class-items-cache ) 
            (if (string-match (concat "^" class-prefix) (car class-item)  ) (add-to-list 'return-list class-item t) ) ) 
        (setq return-list  (jc-find-out-matched-class-item-without-package-prefix class-prefix) ))
      (when (> (length return-list) 0);; if find matched ,update cache ,or not
        (setq previous-class-prefix class-prefix)
        (setq matched-class-items-cache return-list ) )
      )
    (setq return-list return-list);; return 
    )  
  )
(defun jc-build-list-with-nth-on-each-element (list index  )
  "if params : list= '( (1 11 111) (2 22 222)) index=1 then return '(11 22 ) "
  (let ((return-list))
    (dolist (ele list) 
      (add-to-list 'return-list (nth index ele) t)  ) 
     (setq return-list return-list);;return
 ))
(defun jc-complete ()
  (let( (stack-list  (jc-parse-splited-line-4-complete-class-method)) 
        (top) (return-list) )
      ( if (and stack-list (> (length stack-list) 0))
         (setq  top (pop stack-list))
       (while top 
         (if (string-equal top "new")
             (if  (= (length stack-list) 1) 
                (setq return-list (jc-find-out-matched-class-item-without-package-prefix (pop stack-list)  ))
              )
) ) ) ))
(defun jc-parse-splited-line-4-complete-class-method () 
  (interactive)
  (let* ( (line-string (buffer-substring-no-properties (line-beginning-position) (point))) (stack-list)(ele)
          (reverse-current-line-split-list  (reverse (jc-split-line-4-complete-class-method line-string)))
           (parse-finished) )
    (setq ele (pop reverse-current-line-split-list))
    (while  (and ele (not parse-finished) )
      (if  (or (string-equal ";" ele) (string-equal "(" ele ) ) (setq parse-finished t);; parse finished ,exit the  loop
          (if (string-equal ")" ele) 
              (let ((e)(right-stack)) 
                (push ele  right-stack)
                (setq e (pop reverse-current-line-split-list))
                (while (and e (  > (length right-stack) 0))
                  (if (string-equal "(" e ) (pop right-stack)  )
                  (if (string-equal ")" e ) (push e right-stack)  )
                  (setq e (pop reverse-current-line-split-list)) ) 
                (if e    (push e reverse-current-line-split-list) )
                )
              (push ele stack-list) 
            )
           )
      (setq ele (pop reverse-current-line-split-list))
      )
    (setq stack-list stack-list)
    )
  )
(defun jc-split-line-4-complete-class-method(line-string  )
  "this function is the frontend , so you can bind it will a key sequence 
it will return a list, for example '( java.lang ,java.ref),  when you type in 'Syst'
it will complete 'System' ,when you type 'System.' it will list all methods and fields
and 'System.out.' it will list fileds and methods of 'out' " 
  (save-excursion 
    (let* ( (case-fold-search nil) (stack-list nil) ) 
        (setq line-string  (replace-regexp-in-string   "\\\\\"" "'"  line-string)) 
        (setq line-string  (replace-regexp-in-string   "\".*?\"" "String"  line-string)) 
       ;;split line-string with "." ,but add "." as an element at its position in list
;      (jc-split-string-with-separator line-string "\\." "." t)
        (while (string-match "=\\(.*\\)" line-string)
          (setq line-string (match-string-no-properties 1 line-string))
        )
      (setq stack-list (jc-split-string-with-separator  line-string "[ \t]*\\.[ \t]*"  "." t))
       ;;split each element  with "(" ,but add "(" as an element at its position in list 
      ;;and merge all the list in a list 
      (let ((ele)(tmp-list))
           (dolist (ele stack-list)
            (setq tmp-list (append tmp-list (jc-split-string-with-separator ele "("  "("  t))) )
           (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (jc-split-string-with-separator ele ")"  ")"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (jc-split-string-with-separator ele "\\["  "("  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (jc-split-string-with-separator ele "]"  ")"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (jc-split-string-with-separator ele "{"  "("  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (jc-split-string-with-separator ele "}"  ")"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (jc-split-string-with-separator ele "<"  "("  t))) )
        (setq stack-list tmp-list) )
      (let( (ele)(tmp-list) )
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (jc-split-string-with-separator ele ">"  ")"  t))) )
        (setq stack-list tmp-list) )
            (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (jc-split-string-with-separator ele ","  ";"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (jc-split-string-with-separator ele ";"  ";"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (split-string ele "[ \t]+"  t))) )
        (setq stack-list tmp-list) )
      
      (setq stack-list stack-list )
      ) ) )
(defun jc-split-string-with-separator(str regexp &optional replacement OMIT-NULLS)
  "this function is a tool like split-string, but it treat separator as an element of returned list"
  (if (and str  ( > (length str ) 0))
      (let ( (split-list)  (substr) (match-end ))
        (if  (string-match regexp str)
            (progn (while (string-match regexp  str  )
                     (setq match-end (match-end 0) )
                     (setq  substr (substring-no-properties str 0 (- match-end 1)))
                     (if OMIT-NULLS 
                         (if (> (length substr ) 0) (setq split-list (append split-list (list  substr)  )) )
                       (setq split-list (append split-list (list  substr)  )) )
                     (if replacement 
                         (setq split-list (append split-list (list replacement)))
                       (setq split-list (append split-list (list regexp))) )
                     (setq str (substring-no-properties str  match-end))
                     )
                     (if OMIT-NULLS 
                         (if (> (length str ) 0) (setq split-list (append split-list (list str)  )) )
                       (setq split-list (append split-list (list  str)  )) )
                   (setq split-list split-list)
                   )
          (setq split-list (list str))
          )
        )
    )
  )
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
