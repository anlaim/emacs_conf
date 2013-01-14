.PHONY: compile
help:
	@echo please use make like this:
	@echo make init
	@echo make compile
	@echo make push
	@echo make status
compile:
	emacs --batch --no-site-file -l site-lisp/joseph/joseph-byte-compile.el --eval '(byte-compile-all-my-el-files-batch)'
	cd site-lisp/emacs-jabber-0.8.90/ && ./configure &&make
	@./make configure
	@./make make
	@echo 请手动运行以下命令
	@echo sudo  cp  bin/ec /bin/	
	@echo sudo  cp  bin/em /bin/
	sudo cp bin/ec /bin/
	sudo cp bin/em /bin/

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


