;;����ļ���Ҫ�õ���Emacs �Դ���org-publish.el�ļ��Ĺ��ܣ�
;;��Ҫ�ǽ���д��org �ļ����Զ�����(����org�ļ��Զ���������)����Ӧ��html �ļ�����ȻҲ���Է�����������ʽ����pdf����
;;�������������html�ļ� ,�һ�����ϴ��������ҵ�һ�����php�ռ��
;;Ҳ����˵����Ҫ��Emacs ��org-publish.el ���ܣ������ҵĸ��˿ռ�
;;�ҵıʼǵ������ļ�����`note-root-dir'�������ָ����Ŀ¼�
;;��Ϊ�һ���linux ,��Windows ����ϵͳ��ͬʱʹ�ã��������ϵͳ�Ĳ�ͬ���ò�ͬ��ֵ��
;;���� `note-root-dir' ��ֵΪ`d:/documents/org'
;;��ô������Ŀ¼�ṹ����
;; `d:/documents/org/'
;; `d:/documents/org/src'
;; `d:/documents/org/public_html'
;; `d:/documents/org/public_html/src'
;; `d:/documents/org/public_html/htmlized-src'
;;
;; `d:/documents/org/src'Ŀ¼������ԭʼ��org�ļ�����ȻҲ���ܰ���jpg js,gif mp3 css ��������ʽ���ļ���
;; Emacs ��org-publish.el�Ĺ��ܾ��Ǹ������Ŀ¼����ļ��Զ�������Ӧ��html�ļ����Է���Ϊhtml ��ʽΪ������
;; ���Զ����ɵ��ļ���ŵ�`d:/documents/org/public_html'Ŀ¼��
;;ע�����Ŀ¼�ṹ�����Զ���ģ�����ȫ����org �ļ�����`c:/' ,�����ɵ�`html'�ļ��������κ�����ŵ�Ŀ¼
;;

(defvar note-root-dir nil)
(defvar note-org-src-dir nil)
(defvar note-org-public-html-dir nil "�������ɵ�html ��������ļ�����")
(defvar note-org-public-org-src-dir nil "�һ���ҵ�org Դ�ļ�Ҳ�ŵ����ϡ����Ի������Ŀ¼")
(defvar note-org-public-org-htmlized-src-dir nil
  "�һ���ҵ�org Դ�ļ�Ҳ�ŵ����ϡ�������Ǳ�����ҳ����ġ���Ϊ���﷨��ɫ��")

;;ע��������޸��������·������Ҫ��֤Ŀ¼���ƺ���һ��Ҫ��"/"
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



;;ע�⣬���alist �ֳ��������֣�`note-org' ,`note-static' `note'
;;����`note-org' ��ɵĹ����ǰ�`note-org-src-dir'Ŀ¼�µ�����org �ļ���
;; ת������html �ļ������ŵ�`org-publish-org-to-html'Ŀ¼��
(setq org-publish-project-alist
      `(
        ("note-html"
         :components ("base-note-org-html" "base-note-static" )
         :author "jixiuf@gmail.com")
        ("note-src"  ;;�������org��Դ���룬ֱ�Ӱ�orgԴ����copy ����ӦĿ¼��copy htmlized���org.html����ӦĿ¼
         :components ( "base-note-org-org" "base-note-org-htmlize")
         :author "jixiuf@gmail.com")
       ("base-note-org-html"
         :base-directory ,note-org-src-dir              ;;ԭʼ��org �ļ�����Ŀ¼
         :publishing-directory ,note-org-public-html-dir   ;;��������ɵ��ļ���ŵ�Ŀ¼
         :base-extension "org"  ;; ������`org' ��β���ļ����д���
         :recursive t       ;;�ݹ�Ĵ���`note-org-src-dir'Ŀ¼���`org'�ļ�
         :publishing-function org-publish-org-to-html ;;������ʽ,��html ��ʽ
         ;; :auto-index nil        ;;���Զ�������ҳ,����������`index-filename'ָ�����ļ��������ɵ�html��Ϊ��ҳ
         ;; :auto-index t        ;;�Զ�������ҳ
         ;; auto-index���á�����Ϊ���е�org�ļ�����������
         ;; ÿ����`org-publish'����������Ŀ��ʱ��������������������.org�ļ��ڸ�Ŀ¼������
         ;; index.org�ļ�(:index-filename "index.org")��������������е�org���ӣ�ͬʱ�����
         ;; index.org������index.html(:link-home "index.html"))����������������һ��С��վ�ˣ�
         ;; Ҳ����������ǰ�����ֹ�ά�������ļ���
         ;; :index-filename "index.org"  ;;����ļ���Ϊindex.html ��Դ�ļ�
         ;; :index-title "Welcome to My Space"         ;;��ҳ�ı���
         :link-home "/index.html"      ;;Ĭ����ÿ��ҳ���϶���home�����ӣ����ֵ��Ĭ��ֵ����������
         :section-numbers nil
         :auto-sitemap nil                ; Generate sitemap.org automagically...�Զ�����վ���ͼ���õ�site-map.org
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "վ���ͼ"         ; ... with title 'Sitemap'.
;;        :sitemap-function org-publish-org-sitemap
         :preparation-function org-publish-org-tag
;;         :makeindex
;;         :style ,(surround-css-with-style-type (format "%sstyle/emacs.css" note-org-src-dir)) ;;din't need it now
        ; :style "<link rel=\"stylesheet\" href=\"/style/emacs.css\" type=\"text/css\"/>"
       )
       ("base-note-static"                         ;;����`note-org' ��һ���ע�ͣ�����Ͳ���ϸ����ע����
         :base-directory ,note-org-src-dir
         :publishing-directory ,note-org-public-html-dir
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el\\|reg\\|htm\\|exe\\|msi\\|c\\|xml\\|doc"
         :publishing-function org-publish-attachment
         )

       ("base-note-org-org"  ;;ֱ�Ӱ�src/Ŀ¼��org �ļ�copy ����public_htmlĿ¼�����Ұ�src/Ŀ¼�µ�.org.html Ҳcopy��public_html
         :base-directory ,note-org-src-dir              ;;ԭʼ��org �ļ�����Ŀ¼
         :publishing-directory ,note-org-public-org-src-dir   ;;��������ɵ��ļ���ŵ�Ŀ¼
         :base-extension "org"  ;; ������`org' ��β���ļ����д���
         :recursive t       ;;�ݹ�Ĵ���`note-org-src-dir'Ŀ¼���`org'�ļ�
         :publishing-function org-publish-org-to-org
         :plain-source   ;;���ֱ�� copy org�ļ�
         :htmlized-source ;;���copy org.html �ļ��������ļ�һ����htmlfontify-buffer ���ɵ�html �ļ�
         )
       ("base-note-org-htmlize"       ;;��org �ļ���htmlize �������ɵ��ļ��������������face ��������ʹ�õ�Emacs ��Ӧ��face(���﷨��ɫ)
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
      ;;org ���ĵ�����* һ������ʾ�����ģ����˴�����ǰ�����������⣬��������Щ�����µ�����Ŀ
      ;; ��ÿ��org �ļ���ͷ���� #+OPTIONS: H:4 ���Ը��������Ĭ��ֵ��
      org-export-headline-levels 2

      org-export-html-extension "html"  ;;
      org-export-html-xml-declaration '(("html" . "");;�����ʾ�����ɵ�html �ļ��������<%xml ...%> һ�䣬�о�û��Ҫ���һ�����һЩ����
                                        ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))
      org-export-html-validation-link "" ;;�������ɵ�html�в���validation ������
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
      org-publish-use-timestamps-flag t ;;����ڷ���һ����վ��ʱ�������סÿһ��org�ļ�������޸�ʱ�䣬�´η���ʱ�������ļ�û���޸ľͲ��ᷢ�����ļ���ֻ�����޸Ĺ����ļ�
      org-export-babel-evaluate nil
      org-confirm-babel-evaluate nil
      org-export-html-postamble-format '(("en" "<p class=\"author\">Author: %a (%e)</p><p class=\"date\">Date: %d</p><p class=\"creator\">Generated by %c</p><p class=\"xhtml-validation\">%v</p> ")
                                         ("zh" "<p class=\"author\">Author: %a (%e)</p>\n<p class=\"date\">Date: %d</p>\n<p class=\"creator\">Generated by %c</p>\n<p class=\"xhtml-validation\">%v</p>\n"))
      org-export-html-home/up-format "<div id=\"org-div-home-and-up\" style=\"text-align:right;font-size:70%%;white-space:nowrap;\">\n <a accesskey=\"h\" href=\"%s\"> վ���ͼ </a>\n |\n <a accesskey=\"H\" href=\"%s\"> ��ҳ </a>\n</div>"
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
  "�����ҵ�`note'�ʼ�"
  (interactive)
  (publish-my-note-src)
  (publish-my-note-html)
  )

;;;###autoload
(defun publish-my-note-html()
  "�����ҵ�`note'�ʼ�"
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
  "���ֱ�Ӱ��ҵ�org �ļ�copy ����Ӧ��Ŀ¼�����Բ���Ҫ`include-diffenert-org-in-different-level'
���hook,��Ϊ�����޸�org ���ļ�����������Ļ�copy ��ȥ���ļ��Ͳ���ԭʼ�ļ��ˡ�"
  (interactive)
  (publish-single-project "note-src")
  ;;(org-publish (assoc "note-src" org-publish-project-alist))
  )


;;֮���Զ������������publish-single-project ����Ϊ����������auto-insert
;;���½��ļ�ʱ�����Զ�����һ�������ݣ�Ϊ���ų�����Ӱ�죬�һ���publish ʱ�ر��������
;;publish ������������������� ��
;;�����û��auto-insert��ֻ��Ҫ�ʵ�����hook�����е�����
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
(add-hook 'before-publish-single-project-hook '(lambda()(auto-insert-mode -1)))
(add-hook 'after-publish-single-project-hook '(lambda( ) (auto-insert-mode 1)))

(defun include-diffenert-org-in-different-level()
  "�������ݵ�ǰҪexport��org �ļ������`note-org-src-dir'��·����ȣ������ڵ�ǰ�ļ�ͷ�������ĸ��ļ�
 �����`note-org-src-dir'��Ŀ¼,�� ����~/.emacs.d/org-templates/`level-0.org' ,��һ����Ŀ¼����`level-1.org'
"
  (let* ((relative-path-of-note-src-path (file-relative-name (buffer-file-name) note-org-src-dir))
         (relative-level 0))
    (dolist (char (string-to-list relative-path-of-note-src-path))
      (when (char-equal ?/ char)(setq relative-level (1+ relative-level))))
(save-excursion
   (goto-char (point-min))
   (insert (format "#+SETUPFILE: ~/.emacs.d/org-templates/level-%d.org\n" relative-level))
  )))


(defun set-diffenert-js-path-in-diffenert-dir-level()
  "�����������ݵ�ǰҪexport��org �ļ������`note-org-src-dir'��
·����Ⱦ���`note-org-src-dir'/js/emacs.js �ļ������·����
��ʹ�þ���·���Ա�֤���۷��������ػ������϶��������������"
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
        (insert (format "\n#+begin_html
           <div id='my-src'>
             <div id='org-src'><a href='%s'>src</a></div>
             <div id='htmlized-src'><a href='%s'>htmlized-src</a></div>
           </div>
           #+end_html
          " relative-link-to-src-file-in-public-html-dir relative-link-to-htmlized-src-file-in-public-html-dir))
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
        (insert (concat "#+TITLE: " tag-title "\n\n"))
        (insert  "# -*- coding:utf-8 -*-\n\n")
        (insert  "#+LANGUAGE:  zh\n")
        (while (setq file (pop files))
          (let ((fn (file-name-nondirectory file))
                (link (file-relative-name file dir))
                )
              (let ((entry
                     (org-publish-format-file-entry sitemap-file-entry-format
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
        (insert "\n#+begin_html
                   \n<div id='tags'><span id='tags-title'>Tags:</span>
                 #+end_html")
        (dolist (tag-name tags)
          (setq file (concat (file-name-as-directory note-org-src-dir) "tags/" tag-name ".org"))
          (setq link (file-relative-name file dir))
          (insert (concat indent-str "  [[file:" link "]["
                          tag-name
                          "]]\n"))

          )
        (insert "\n#+begin_html
                       \n<div>\n
                 #+end_html\n")
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


