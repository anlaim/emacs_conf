.PHONY: all

all: 
	emacs --batch --no-site-file -l site-lisp/joseph/joseph-byte-compile.el --eval '(byte-compile-all-my-el-files-batch)'
	cd site-lisp/helm && make
	cd site-lisp/distel/ && make
	cd site-lisp/org-mode-git/ && make
	cd site-lisp/emacs-jabber-0.8.90/ && ./configure &&make
	cd site-lisp/cedet-1.1/  &&make
	cd site-lisp/magit/ && make
	cd site-lisp/evil/ && make
	cd site-lisp/popwin-el && make
	cd site-lisp/auto-complete/ && make
# emacs --batch --no-site-file -l site-lisp/joseph/joseph-byte-compile.el --eval '(byte-compile-file "/home/jixiuf/emacs_conf/site-lisp/joseph/joseph-org-publish.el")'


