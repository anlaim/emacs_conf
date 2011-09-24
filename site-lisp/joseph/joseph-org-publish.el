;;; -*- coding:utf-8 -*-
;;这个文件主要用到了Emacs 自带的org-publish.el文件的功能，
;;主要是将我写的org 文件，自动发布(根据org文件自动生成生成)成相应的html 文件（当然也可以发布成其他格式，如pdf），
;;而发布后的所有html文件 ,我会把它上传到网上我的一个免费php空间里，
;;也就是说，我要用Emacs 的org-publish.el 功能，管理我的个人空间
;;我的笔记的所有文件都在`note-root-dir'这个变量指定的目录里，
;;因为我会在linux ,与Windows 两个系统里同时使用，所以针对系统的不同设置不同的值，
;;假如 `note-root-dir' 的值为`d:/documents/org'
;;那么，它的目录结构会是
;; `d:/documents/org/'
;; `d:/documents/org/src'
;; `d:/documents/org/public_html'
;; `d:/documents/org/public_html/src'
;; `d:/documents/org/public_html/htmlized-src'
;;
;; `d:/documents/org/src'目录下是最原始的org文件，当然也可能包含jpg js,gif mp3 css 等其他格式的文件，
;; Emacs 的org-publish.el的功能就是根据这个目录里的文件自动生成相应的html文件（以发布为html 格式为例），
;; 而自动生成的文件会放到`d:/documents/org/public_html'目录下
;;注意这个目录结构是我自定议的，你完全可以把org 文件放在`c:/' ,而生成的`html'文件，放在任何你想放的目录
;;

(defvar note-root-dir nil)
(defvar note-org-src-dir nil)
(defvar note-org-public-html-dir nil "发布生成的html 放在这个文件夹下")
(defvar note-org-public-org-src-dir nil "我会把我的org 源文件也放到网上。所以会有这个目录")
(defvar note-org-public-org-htmlized-src-dir nil
  "我会把我的org 源文件也放到网上。而这个是便于网页浏览的。因为有语法着色。")

;;注意如果你修改了这里的路径，需要保证目录名称后面一定要有"/"
(when (equal system-type 'gnu/linux)
  (setq note-root-dir (expand-file-name "~/documents/org/")))
(when (equal system-type 'windows-nt)
  (setq note-root-dir "d:/Document/org/"))

(setq note-org-src-dir (concat note-root-dir "src/"))
(setq note-org-public-html-dir (concat note-root-dir "public_html/"))
(setq note-org-public-org-src-dir (concat note-root-dir "public_html/src/"))
(setq note-org-public-org-htmlized-src-dir (concat note-root-dir "public_html/htmlized-src/"))


;; ;;(message (read-file-as-var "D:/Document/org/src/style/emacs.css"))
;; ;;;###autoload
;; (defun read-file-as-var (file-name)
;;   "read file content and return it as string"
;;   (let (buf-content)
;;           (with-current-buffer (find-file-noselect file-name t )
;; 	    (setq buf-content (buffer-substring  (point-min) (point-max)))
;; 	    (kill-buffer))
;; 	  buf-content))

;; ;;;###autoload
;; (defun surround-css-with-style-type(css-file-name)
;;   "read css file content ,and surround it with <style></style>"
;;   (format
;;   "<style type='text/css'>
;;        %s
;;     </style>"
;;   (read-file-as-var css-file-name)))
;; ;;( format
;; ;;   "<style type='text/css'>
;; ;;     <![CDATA[
;; ;;       %s
;; ;;     ]]>
;; ;;    </style>"
;; ;;   (read-file-as-var css-file-name)
;; ;; )



;;注意，这个alist 分成了三部分，`note-org' ,`note-static' `note'
;;其中`note-org' 完成的功能是把`note-org-src-dir'目录下的所有org 文件，
;; 转换生成html 文件，并放到`org-publish-org-to-html'目录中
(setq org-publish-project-alist
      `(
        ("note-html"
         :components ("base-note-org-html" "base-note-static" )
         :author "jixiuf@gmail.com")
        ("note-src"  ;;这个发布org的源代码，直接把org源代码copy 到相应目录及copy htmlized后的org.html到相应目录
         :components ( "base-note-org-org" "base-note-org-htmlize")
         :author "jixiuf@gmail.com")
       ("base-note-org-html"
         :base-directory ,note-org-src-dir              ;;原始的org 文件所在目录
         :publishing-directory ,note-org-public-html-dir   ;;发布生后成的文件存放的目录
         :base-extension "org"  ;; 对于以`org' 结尾的文件进行处理
         :recursive t       ;;递归的处理`note-org-src-dir'目录里的`org'文件
         :publishing-function org-publish-org-to-html ;;发布方式,以html 方式
         ;; :auto-index nil        ;;不自动生成首页,而是让下面`index-filename'指定的文件，所生成的html作为首页
         ;; :auto-index t        ;;自动生成首页
         ;; auto-index设置。就是为所有的org文件生成索引。
         ;; 每次用`org-publish'命令发布这个项目的时候，它会用所有搜索到的.org文件在根目录下生成
         ;; index.org文件(:index-filename "index.org")，里面包含了所有的org链接，同时还会把
         ;; index.org发布成index.html(:link-home "index.html"))，这样看起来就像一个小网站了，
         ;; 也不用再像以前那样手工维护索引文件了
         ;; :index-filename "index.org"  ;;这个文件作为index.html 的源文件
         ;; :index-title "Welcome to My Space"         ;;首页的标题
         :link-home "/index.html"      ;;默认在每上页面上都有home的链接，这个值的默认值在这里设置
         :section-numbers nil
         :auto-sitemap nil                ; Generate sitemap.org automagically...自动生成站点地图所用的site-map.org
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "站点地图"         ; ... with title 'Sitemap'.
;;        :sitemap-function org-publish-org-sitemap
         :preparation-function org-publish-org-tag
;;         :makeindex
;;         :style ,(surround-css-with-style-type (format "%sstyle/emacs.css" note-org-src-dir)) ;;din't need it now
        ; :style "<link rel=\"stylesheet\" href=\"/style/emacs.css\" type=\"text/css\"/>"
       )
       ("base-note-static"                         ;;有了`note-org' 那一组的注释，这里就不详细给出注释了
         :base-directory ,note-org-src-dir
         :publishing-directory ,note-org-public-html-dir
         :recursive t
         :base-extension "pl\\|css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el\\|reg\\|htm\\|exe\\|msi\\|c\\|xml\\|doc"
         :publishing-function org-publish-attachment
         )

       ("base-note-org-org"  ;;直接把src/目录下org 文件copy 到，public_html目录，并且把src/目录下的.org.html 也copy到public_html
         :base-directory ,note-org-src-dir              ;;原始的org 文件所在目录
         :publishing-directory ,note-org-public-org-src-dir   ;;发布生后成的文件存放的目录
         :base-extension "org"  ;; 对于以`org' 结尾的文件进行处理
         :recursive t       ;;递归的处理`note-org-src-dir'目录里的`org'文件
         :publishing-function org-publish-org-to-org
         :plain-source   ;;这个直接 copy org文件
         :htmlized-source ;;这个copy org.html 文件，这种文件一般是htmlfontify-buffer 生成的html 文件
         )
       ("base-note-org-htmlize"       ;;把org 文件，htmlize 化，生成的文件便于网上浏览，face 就是我所使用的Emacs 对应的face(即语法着色)
       	:base-directory ,note-org-src-dir
       	:base-extension "org"
       	:html-extension "org.html"
       	:publishing-directory ,note-org-public-org-htmlized-src-dir
       	:recursive t
       	:htmlized-source t
       	:publishing-function org-publish-org-to-org)
      ))


(eval-after-load 'org-publish
'(progn
   (setq org-publish-timestamp-directory  (convert-standard-filename "~/.emacs.d/cache/org-files-timestamps"))
))
(eval-after-load 'org-html
'(progn
   (setq
      org-export-default-language "zh"
      ;;org 的文档是用* 一级级表示出来的，而此处设置前两级用作标题，其他是这些标题下的子项目
      ;; 在每个org 文件开头，加 #+OPTIONS: H:4 可以覆盖这里的默认值，
      org-export-headline-levels 2

      org-export-html-extension "html"  ;;
      org-export-html-xml-declaration '(("html" . "");;这个表示在生成的html 文件首行添加<%xml ...%> 一句，感觉没必要，且会引起一些问题
                                        ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))
      org-export-html-validation-link "" ;;不在生成的html中插入validation 的链接
      org-export-with-timestamps t
      org-export-html-with-timestamp t
      org-export-with-section-numbers nil
      org-export-with-tags 'not-in-toc
      org-export-skip-text-before-1st-heading nil
      org-export-with-sub-superscripts '{}
      org-export-with-LaTeX-fragments t
      org-export-with-archived-trees nil
      org-export-highlight-first-table-line t
      org-export-latex-listings-w-names nil
      org-export-html-style-include-default nil
      org-export-htmlize-output-type 'css
      org-startup-folded 'nofold
      org-publish-list-skipped-files t
      org-publish-use-timestamps-flag t ;;这个在发布一个网站的时候它会记住每一个org文件的最后修改时间，下次发布时如果这个文件没被修改就不会发布此文件，只发布修改过的文件
      org-export-babel-evaluate nil
      org-confirm-babel-evaluate nil
      org-export-html-postamble-format '(("en" "<p class=\"author\">Author: %a (%e)</p><p class=\"date\">Date: %d</p><p class=\"creator\">Generated by %c</p><p class=\"xhtml-validation\">%v</p> ")
                                         ("zh" "<p class=\"author\">Author: %a (%e)</p>\n<p class=\"date\">Date: %d</p>\n<p class=\"creator\">Generated by %c</p>\n<p class=\"xhtml-validation\">%v</p>\n"))
      org-export-html-home/up-format "<div id=\"org-div-home-and-up\" style=\"text-align:right;font-size:70%%;white-space:nowrap;\">\n <a accesskey=\"h\" href=\"%s\"> 站点地图 </a>\n |\n <a accesskey=\"H\" href=\"%s\"> 首页 </a>\n</div>"
      )

))


;;;###autoload
(defun publish-my-note-force()
  (interactive)
  (setq org-publish-use-timestamps-flag nil)
  ;;  (load "joseph-org-publish.el")
  ;;  (shell-command (format "find  %s  |xargs touch  " note-org-src-dir ))
  (publish-my-note)
  (setq org-publish-use-timestamps-flag t)
  )

;;;###autoload
(defun publish-my-note()
  "发布我的`note'笔记"
  (interactive)
  (publish-my-note-src)
  (publish-my-note-html)
  )

;;;###autoload
(defun publish-my-note-html()
  "发布我的`note'笔记"
  (interactive)
  ;;(add-hook 'org-publish-before-export-hook 'org-generate-tag-links)
  (add-hook 'org-publish-before-export-hook 'org-generate-tag-links)
  (add-hook 'org-publish-before-export-hook 'include-diffenert-org-in-different-level)
  (add-hook 'org-publish-before-export-hook 'set-diffenert-js-path-in-diffenert-dir-level)
  (add-hook 'org-publish-before-export-hook 'insert-src-link-2-each-page)
  (publish-single-project "note-html")
;;  (org-publish (assoc "note-html" org-publish-project-alist))
  (remove-hook 'org-publish-before-export-hook 'org-generate-tag-links)
  (remove-hook 'org-publish-before-export-hook 'include-diffenert-org-in-different-level)
  (remove-hook 'org-publish-before-export-hook 'set-diffenert-js-path-in-diffenert-dir-level)
  (remove-hook 'org-publish-before-export-hook 'insert-src-link-2-each-page)
  )

;;;###autoload
(defun publish-my-note-src()
  "这个直接把我的org 文件copy 到相应的目录，所以不需要`include-diffenert-org-in-different-level'
这个hook,因为它会修改org 的文件，如果这样的话copy 过去的文件就不是原始文件了。"
  (interactive)
  (publish-single-project "note-src")
  ;;(org-publish (assoc "note-src" org-publish-project-alist))
  )


;;之所以定义这个繁锁的publish-single-project 是因为，我启用了auto-insert
;;在新建文件时它会自动加入一部分内容，为了排除它的影响，我会在publish 时关闭这个功能
;;publish 结束后，再启用这个功能 。
;;如果你没用auto-insert则只需要适当调整hook该运行的内容
(defcustom  before-publish-single-project-hook nil
  ""
  :type 'hook)
(defcustom  after-publish-single-project-hook nil
  ""
  :type 'hook)
(defun publish-single-project(project-name)
  "publish single project ,and add before and after hooks"
  (run-hooks 'before-publish-single-project-hook)
  (org-publish (assoc project-name org-publish-project-alist))
  (run-hooks 'after-publish-single-project-hook)
  )
(add-hook 'before-publish-single-project-hook 'before-publish-single-project-hook-func)

(defun before-publish-single-project-hook-func()
   (auto-insert-mode -1)
  (remove-hook 'emacs-lisp-mode-hook 'joseph-el-outline-mode-hook)
  ;; (remove-hook 'find-file-hook 'yasnippet-auto-insert-fun)
  (remove-hook 'perl-mode-hook 'perl-mode-hook-fun)
  )
(add-hook 'after-publish-single-project-hook 'after-publish-single-project-hook-func)
(defun after-publish-single-project-hook-func()
   (auto-insert-mode 1)
  (add-hook 'emacs-lisp-mode-hook 'joseph-el-outline-mode-hook)
  ;; (add-hook 'find-file-hook 'yasnippet-auto-insert-fun)
  (add-hook 'perl-mode-hook 'perl-mode-hook-fun)

  )

(defun include-diffenert-org-in-different-level()
  "这个会根据当前要export的org 文件相对于`note-org-src-dir'的路径深度，决定在当前文件头部引入哪个文件
 如果在`note-org-src-dir'根目录,则 引入~/.emacs.d/org-templates/`level-0.org' ,在一层子目录则是`level-1.org'
"
  (let* ((relative-path-of-note-src-path (file-relative-name (buffer-file-name) note-org-src-dir))
         (relative-level 0))
    (dolist (char (string-to-list relative-path-of-note-src-path))
      (when (char-equal ?/ char)(setq relative-level (1+ relative-level))))
(save-excursion
   (goto-char (point-min))
   (insert (format "#+SETUPFILE: ~/.emacs.d/org-templates/level-setupfile-%d.org\n" relative-level))
   (insert (format "#+INCLUDE: ~/.emacs.d/org-templates/level-%d.org\n" relative-level))
   (insert "#+INCLUDE: ~/.emacs.d/org-templates/level-all.org\n")
  )))


(defun set-diffenert-js-path-in-diffenert-dir-level()
  "这个函数会根据当前要export的org 文件相对于`note-org-src-dir'的
路径深度决定`note-org-src-dir'/js/emacs.js 文件的相对路径。
不使用绝对路径以保证无论发布到本地还是网上都可以正常浏览。"
  (let* ((relative-path-of-js-file
          (file-relative-name
           (format "%sjs/emacs.js" note-org-src-dir)
           (file-name-directory (buffer-file-name)))))
    (setq org-export-html-scripts
          (format "<script type='text/javascript' src='%s'> </script>" relative-path-of-js-file))))

;;(add-hook 'org-publish-before-export-hook 'set-diffenert-js-path-in-diffenert-dir-level)
(defun insert-src-link-2-each-page()
(let* ((relative-path-of-cur-buf (file-relative-name  buffer-file-name note-org-src-dir ))
      (relative-link-to-src-file-in-public-html-dir (file-relative-name  (concat note-org-public-org-src-dir relative-path-of-cur-buf) (file-name-directory (concat note-org-public-html-dir relative-path-of-cur-buf))))
      (relative-link-to-htmlized-src-file-in-public-html-dir  (format "%s.html" (file-relative-name  (concat note-org-public-org-htmlized-src-dir relative-path-of-cur-buf) (file-name-directory (concat note-org-public-html-dir relative-path-of-cur-buf)))))
      )
      (save-excursion
        (goto-char (point-max))
        (insert (format "\n#+begin_html\n<div id='my-src'>\n<div id='org-src'><a href='%s'>src</a></div>\n<div id='htmlized-src'><a href='%s'>htmlized-src</a></div>\n</div>\n#+end_html"
                        relative-link-to-src-file-in-public-html-dir relative-link-to-htmlized-src-file-in-public-html-dir))
        )
      ))
(autoload 'joseph-all-files-under-dir-recursively "joseph-file-util" "get all file under dir ,match regexp" nil)

(defun joseph-get-all-tag-buffer-alist(project)
  "get all tag names from all org files under `note-org-src-dir'
the key is tagname ,and value = a list of file contains this tag"
  (let* ((project-plist (cdr project))
         (exclude-regexp (plist-get project-plist :exclude))
         (all-org-files (nreverse (org-publish-get-base-files project exclude-regexp)))
        buf-tags tag-buf-alist tag-name tag-buf-kv cdr-val buf-exists)
    (dolist (org all-org-files)
      (setq buf-exists  (find-buffer-visiting org))
      (with-current-buffer (or buf-exists (find-file-noselect org))
        (setq buf-tags (org-get-buffer-tags))
        (when (> (length buf-tags) 0)
          (dolist (tag buf-tags)
            (setq tag-name (substring-no-properties (car tag)))
            (setq tag-buf-kv (assoc  tag-name tag-buf-alist))
            (if tag-buf-kv
                (progn
                  (setq cdr-val (cdr tag-buf-kv))
                  (setcdr tag-buf-kv (add-to-list  'cdr-val (buffer-file-name))))
              (setq tag-buf-alist (cons (list tag-name (buffer-file-name) )tag-buf-alist))
              )))
        (unless buf-exists (kill-buffer))))
    tag-buf-alist))

;;(joseph-get-all-tag-buffer-alist (assoc "base-note-org-html" org-publish-project-alist))
(defvar tag-buf-alist nil "tagname-buffers alist")
(defun org-publish-org-tag ()
  "Create a tag of pages in set defined by PROJECT.
Optionally set the filename of the tag with SITEMAP-FILENAME.
Default for SITEMAP-FILENAME is 'tag.org'."
  (setq tag-buf-alist (joseph-get-all-tag-buffer-alist project))
  (let* ( (dir (file-name-as-directory (concat (file-name-as-directory
                                                (plist-get project-plist :base-directory)) "tags")))
         (indent-str (make-string 2 ?\ ))
         (tag-buf-alist tag-buf-alist)
         files  file tag-buffer tag-title tag-filename visiting ifn)
    (dolist (tag-buf-kv tag-buf-alist)
      (setq tag-title (concat  "Tag: " (car tag-buf-kv)) )
      (setq tag-filename (concat dir (car tag-buf-kv) ".org"))
      (setq visiting (find-buffer-visiting tag-filename))
      (setq ifn (file-name-nondirectory tag-filename))
      (setq files (cdr tag-buf-kv))
      (with-current-buffer (setq tag-buffer
                                 (or visiting (find-file tag-filename)))
        (erase-buffer)
        (insert  "# -*- coding:utf-8 -*-\n\n")
        (insert (concat "#+TITLE: " tag-title "\n\n"))
        (insert  "#+LANGUAGE:  zh\n")
        (while (setq file (pop files))
          (let ((fn (file-name-nondirectory file))
                (link (file-relative-name file dir))
                )
              (let ((entry
                     (org-publish-format-file-entry org-sitemap-file-entry-format
                                                    file project-plist))
                    (regexp "\\(.*\\)\\[\\([^][]+\\)\\]\\(.*\\)"))
                (cond ((string-match-p regexp entry)
                       (string-match regexp entry)
                       (insert (concat indent-str " + " (match-string 1 entry)
                                       "[[file:" link "]["
                                       (match-string 2 entry)
                                       "]]" (match-string 3 entry) "\n")))
                      (t
                       (insert (concat indent-str " + [[file:" link "]["
                                       entry
                                       "]]\n")))))))
        (save-buffer))
      (or visiting (kill-buffer tag-buffer))
      )
    ))

(defun org-generate-tag-links()
  "Create a tag of pages in set defined by PROJECT.
Optionally set the filename of the tag with SITEMAP-FILENAME.
Default for SITEMAP-FILENAME is 'tag.org'."
    (let* ( (dir default-directory)
            (indent-str (make-string 2 ?\ ))
            (tag-buf-alist tag-buf-alist)
            (tags (mapcar 'car tag-buf-alist))
              file    html link)
      (save-excursion
        (goto-char (point-max))
        (insert "\n#+begin_html\n<div id='tags'><span id='tags-title'>Tags:</span><br />\n#+end_html\n")
        (dolist (tag-name tags)
          (setq file (concat (file-name-as-directory note-org-src-dir) "tags/" tag-name ".org"))
          (setq link (file-relative-name file dir))
          (insert (concat indent-str "  [[file:" link "]["
                          tag-name
                          "]]\n"))
          )
        (insert "\n#+begin_html\n</div>\n#+end_html\n")
        )
      )
  )


;; (defun insert-tag-links-in-each-org()
;;   (let* ((relative-path-of-js-file
;;           (file-relative-name
;;            (format "%sjs/emacs.js" note-org-src-dir)
;;            (file-name-directory (buffer-file-name)))))
;;     (setq org-export-html-scripts
;;           (format "<script type='text/javascript' src='%s'> </script>" relative-path-of-js-file))))
(provide 'joseph-org-publish)


