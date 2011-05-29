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

(when (equal system-type 'gnu/linux)
  (setq note-root-dir (expand-file-name "~/documents/org/")))
(when (equal system-type 'windows-nt)
  (setq note-root-dir "d:/Document/org/"))

(setq note-org-src-dir (concat note-root-dir "src/"))
(setq note-org-public-html-dir (concat note-root-dir "public_html/"))



;;ע�⣬���alist �ֳ��������֣�`note-org' ,`note-static' `note'
;;����`note-org' ��ɵĹ����ǰ�`note-org-src-dir'Ŀ¼�µ�����org �ļ���
;; ת������html �ļ������ŵ�`org-publish-org-to-html'Ŀ¼��
(setq org-publish-project-alist
      `(("base-note-org-html"
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
         :index-title "index"         ;;��ҳ�ı���
         :link-home "index.html"      ;;Ĭ����ÿ��ҳ���϶���home�����ӣ����ֵ��Ĭ��ֵ����������
         :section-numbers nil
         :style "<link rel=\"stylesheet\" href=\"./style/emacs.css\" type=\"text/css\"/>")
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
        ("note-html"
         :components ("base-note-org-html" "base-note-static")
         :author "jixiuf@gmail.com" ))
      )

;;;###autoload
(defun publish-my-note()
  "�����ҵ�`note'�ʼ�"
  (interactive)
  (org-publish (assoc "note-html" org-publish-project-alist)))

(provide 'joseph-org-publish)
