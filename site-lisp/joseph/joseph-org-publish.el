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
;;
;; `d:/documents/org/src'Ŀ¼������ԭʼ��org�ļ�����ȻҲ���ܰ���jpg js,gif mp3 css ��������ʽ���ļ���
;; Emacs ��org-publish.el�Ĺ��ܾ��Ǹ������Ŀ¼����ļ��Զ�������Ӧ��html�ļ����Է���Ϊhtml ��ʽΪ������
;; ���Զ����ɵ��ļ���ŵ�`d:/documents/org/public_html'Ŀ¼��
;;ע�����Ŀ¼�ṹ�����Զ���ģ�����ȫ����org �ļ�����`c:/' ,�����ɵ�`html'�ļ��������κ�����ŵ�Ŀ¼
;;

(defvar note-root-dir nil)
(defvar note-org-src-dir nil)
(defvar note-org-public-html-dir)

;;ע��������޸��������·������Ҫ��֤Ŀ¼���ƺ���һ��Ҫ��"/"
(when (equal system-type 'gnu/linux)
  (setq note-root-dir (expand-file-name "~/documents/org/")))
(when (equal system-type 'windows-nt)
  (setq note-root-dir "d:/Document/org/"))

(setq note-org-src-dir (concat note-root-dir "src/"))
(setq note-org-public-html-dir (concat note-root-dir "public_html/"))



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
         :components ("base-note-org-html-remote" "base-note-static")
         :author "jixiuf@gmail.com" )
       ("base-note-org-html-remote"
         :base-directory ,note-org-src-dir              ;;ԭʼ��org �ļ�����Ŀ¼
         :publishing-directory ,note-org-public-html-dir   ;;��������ɵ��ļ���ŵ�Ŀ¼
         :base-extension "org"  ;; ������`org' ��β���ļ����д���
         :recursive t       ;;�ݹ�Ĵ���`note-org-src-dir'Ŀ¼���`org'�ļ�
         :publishing-function org-publish-org-to-html ;;������ʽ,��html ��ʽ
         :auto-index t        ;;���Զ�������ҳ,����������`index-filename'ָ�����ļ��������ɵ�html��Ϊ��ҳ
         ;; :auto-index t        ;;�Զ�������ҳ
         ;; auto-index���á�����Ϊ���е�org�ļ�����������
         ;; ÿ����`org-publish'����������Ŀ��ʱ��������������������.org�ļ��ڸ�Ŀ¼������
         ;; index.org�ļ�(:index-filename "index.org")��������������е�org���ӣ�ͬʱ�����
         ;; index.org������index.html(:link-home "index.html"))����������������һ��С��վ�ˣ�
         ;; Ҳ����������ǰ�����ֹ�ά�������ļ���
         :index-filename "index.org"  ;;����ļ���Ϊindex.html ��Դ�ļ�
         :index-title "Welcome to My Space"         ;;��ҳ�ı���
         :link-home "/index.html"      ;;Ĭ����ÿ��ҳ���϶���home�����ӣ����ֵ��Ĭ��ֵ����������
         :section-numbers nil
         :auto-sitemap t                ; Generate sitemap.org automagically...�Զ�����վ���ͼ���õ�site-map.org
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "վ���ͼ"         ; ... with title 'Sitemap'.

;;         :style ,(surround-css-with-style-type (format "%sstyle/emacs.css" note-org-src-dir)) ;;din't need it now
        ; :style "<link rel=\"stylesheet\" href=\"/style/emacs.css\" type=\"text/css\"/>"
       )
       ("base-note-static"                         ;;����`note-org' ��һ���ע�ͣ�����Ͳ���ϸ����ע����
         :base-directory ,note-org-src-dir
         :publishing-directory ,note-org-public-html-dir
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)

       ("base-note-org-org"  ;;ֱ�Ӱ�src/Ŀ¼��org �ļ�copy ����public_htmlĿ¼�����Ұ�src/Ŀ¼�µ�.org.html Ҳcopy��public_html
         :base-directory ,note-org-src-dir              ;;ԭʼ��org �ļ�����Ŀ¼
         :publishing-directory ,note-org-public-html-dir   ;;��������ɵ��ļ���ŵ�Ŀ¼
         :base-extension "org"  ;; ������`org' ��β���ļ����д���
         :recursive t       ;;�ݹ�Ĵ���`note-org-src-dir'Ŀ¼���`org'�ļ�
         :publishing-function org-publish-org-to-org
         :plain-source   ;;���ֱ�� copy org�ļ�
         :htmlized-source ;;���copy org.html �ļ��������ļ�һ����htmlfontify-buffer ���ɵ�html �ļ�
         )
       ("my-org-htmlize"
       	:base-directory ,note-org-src-dir
       	:base-extension "org"
       	:html-extension "org.html"
       	:publishing-directory ,note-org-public-html-dir
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
      org-startup-folded nil
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
(defun publish-my-note()
  "�����ҵ�`note'�ʼ�"
  (interactive)
  (org-publish (assoc "note-html" org-publish-project-alist)))

;;;###autoload
(defun publish-my-note-force()
  (interactive)
  (setq org-publish-use-timestamps-flag nil)
;;  (load "joseph-org-publish.el")
;;  (shell-command (format "find  %s  |xargs touch  " note-org-src-dir ))
  (publish-my-note)
  )

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
(add-hook 'org-publish-before-export-hook 'include-diffenert-org-in-different-level)



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

(add-hook 'org-publish-before-export-hook 'set-diffenert-js-path-in-diffenert-dir-level)

(provide 'joseph-org-publish)


