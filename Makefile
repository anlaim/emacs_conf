.PHONY: compile
ROOT_DIR=`pwd`
help:
	@echo please use make like this:
	@echo make linux
	@echo make init
	@echo make compile
	@echo make push
	@echo make status
compile:
	emacs --batch --no-site-file -l site-lisp/joseph/joseph-byte-compile.el --eval '(byte-compile-all-my-el-files-batch)'
	cd site-lisp/emacs-jabber-0.8.90/ && ./configure &&make
	cd site-lisp/cedet-1.1/ &&make
	@./make configure
	@./make make
	emacs --batch --no-site-file -l site-lisp/joseph/joseph-autoload.el --eval '(update-directory-autoloads-recursively)'
linux:	
	@echo 请手动运行以下命令 if you are not root 
	@echo sudo  cp  bin/ec /bin/	
	@echo sudo  cp  bin/em /bin/
	@sudo cp bin/ec /bin/
	@sudo cp bin/em /bin/
	@echo try to edit your /etc/conf.d/emacs EMACS_STOP=\"$(ROOT_DIR)/bin/emacs-stop.sh\"

init:
	@./make init
push:
	@./make push

status:
	@./make status

st:status

fetch:init
pull:init
# emacs --batch --no-site-file -l site-lisp/joseph/joseph-byte-compile.el --eval '(byte-compile-file "/home/jixiuf/emacs_conf/site-lisp/joseph/joseph-org-publish.el")'


