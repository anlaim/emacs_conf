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
;;
;; `d:/documents/org/src'目录下是最原始的org文件，当然也可能包含jpg js,gif mp3 css 等其他格式的文件，
;; Emacs 的org-publish.el的功能就是根据这个目录里的文件自动生成相应的html文件（以发布为html 格式为例），
;; 而自动生成的文件会放到`d:/documents/org/public_html'目录下
;;注意这个目录结构是我自定议的，你完全可以org 文件放在`c:/' ,而生成的`html'文件，放在任何你想放的目录
;;

(defvar note-root-dir nil)
(defvar note-org-src-dir nil)
(defvar note-org-public-html-dir)

(when (equal system-type 'gnu/linux)
  (setq note-root-dir (expand-file-name "~/documents/org/")))
(when (equal system-type 'windows-nt)
  (setq note-root-dir "d:/Document/org/"))

(setq note-org-src-dir (concat note-root-dir "src/"))
(setq note-org-public-html-dir (concat note-root-dir "public_html/"))



;;注意，这个alist 分成了三部分，`note-org' ,`note-static' `note'
;;其中`note-org' 完成的功能是把`note-org-src-dir'目录下的所有org 文件，
;; 转换生成html 文件，并放到`org-publish-org-to-html'目录中
(setq org-publish-project-alist
      `(("base-note-org-html"
         :base-directory ,note-org-src-dir              ;;原始的org 文件所在目录
         :publishing-directory ,note-org-public-html-dir   ;;发布生后成的文件存放的目录
         :base-extension "org"  ;; 对于以`org' 结尾的文件进行处理
         :recursive t       ;;递归的处理`note-org-src-dir'目录里的`org'文件
         :publishing-function org-publish-org-to-html ;;发布方式,以html 方式
         :auto-index t        ;;不自动生成首页,而是让下面`index-filename'指定的文件，所生成的html作为首页
         ;; :auto-index t        ;;自动生成首页
         ;; auto-index设置。就是为所有的org文件生成索引。
         ;; 每次用`org-publish'命令发布这个项目的时候，它会用所有搜索到的.org文件在根目录下生成
         ;; index.org文件(:index-filename "index.org")，里面包含了所有的org链接，同时还会把
         ;; index.org发布成index.html(:link-home "index.html"))，这样看起来就像一个小网站了，
         ;; 也不用再像以前那样手工维护索引文件了
         :index-filename "index.org"  ;;这个文件作为index.html 的源文件
         :index-title "index"         ;;首页的标题
         :link-home "index.html"      ;;默认在每上页面上都有home的链接，这个值的默认值在这里设置
         :section-numbers nil
         :style "<link rel=\"stylesheet\" href=\"./style/emacs.css\" type=\"text/css\"/>")
        ("base-note-static"                         ;;有了`note-org' 那一组的注释，这里就不详细给出注释了
         :base-directory ,note-org-src-dir
         :publishing-directory ,note-org-public-html-dir
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("base-note-org-org"  ;;直接把src/目录下org 文件copy 到，public_html目录，并且把src/目录下的.org.html 也copy到public_html
         :base-directory ,note-org-src-dir              ;;原始的org 文件所在目录
         :publishing-directory ,note-org-public-html-dir   ;;发布生后成的文件存放的目录
         :base-extension "org"  ;; 对于以`org' 结尾的文件进行处理
         :recursive t       ;;递归的处理`note-org-src-dir'目录里的`org'文件
         :publishing-function org-publish-org-to-org
         :plain-source   ;;这个直接 copy org文件
         :htmlized-source ;;这个copy org.html 文件，这种文件一般是htmlfontify-buffer 生成的html 文件
         )
        ("note-html"
         :components ("base-note-org-html" "base-note-static")
         :author "jixiuf@gmail.com" ))
      )

;;;###autoload
(defun publish-my-note()
  "发布我的`note'笔记"
  (interactive)
  (org-publish (assoc "note-html" org-publish-project-alist)))

(provide 'joseph-org-publish)
