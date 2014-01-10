# -*- coding:gbk -*-
.PHONY: compile
ROOT_DIR=`pwd`
help:
	@echo "[Warning]:if you are not the author of git@github.com:jixiuf/emacs_conf.git"
	@echo "[Warning]:please modify variable MODULE_FILE_NAME in ./make.sh to ./site-lisp/submodules/modules_public"
	@echo please use make like this:
	@echo make linux
	@echo make mac
	@echo make pull
	@echo make update-autoloads
	@echo make compile
	@echo make push
	@echo make st[atus]
compile:
	@-emacs --batch --no-site-file -l site-lisp/joseph/joseph-byte-compile.el --eval '(byte-compile-all-my-el-files-batch)'
	@-./make.sh configure
	@-./make.sh make
	@-rm site-lisp/lisp/joseph-loaddefs.el
	@-emacs --batch --no-site-file -l site-lisp/joseph/joseph-autoload.el --eval '(update-directory-autoloads-recursively)'
update-autoloads:
	@-rm site-lisp/lisp/joseph-loaddefs.el
	@-emacs --batch --no-site-file -l site-lisp/joseph/joseph-autoload.el --eval '(update-directory-autoloads-recursively)'
linux:	
	@echo 请手动运行以下命令 if you are not root 
	@echo sudo  cp  bin/ec /bin/	
	@echo sudo  cp  bin/em /bin/
	@sudo cp bin/ec /bin/
	@sudo cp bin/em /bin/
	@ln  --symbolic -n --force  "$(ROOT_DIR)/snippets/erlang-mode" "$(ROOT_DIR)/snippets/erlang-shell-mode"  
	@echo try to edit your /etc/conf.d/emacs EMACS_STOP=\"$(ROOT_DIR)/bin/emacs-stop.sh\"
mac:
	@ln  -s -n   "$(ROOT_DIR)/snippets/erlang-mode" "$(ROOT_DIR)/snippets/erlang-shell-mode"  
init:
	@-git pull
	@-./make.sh init
push:
	@-git pull
	@-git push
	@-./make.sh push
	@-cd $(ROOT_DIR)/site-lisp/submodules/dotemacs_priv && git pull &&git add mail/* && git commit -m "update mail" -a &&  git push 

status:
	@./make.sh status

st:status

fetch:	init
	@-git pull
pull:init

# emacs --batch --no-site-file -l site-lisp/joseph/joseph-byte-compile.el --eval '(byte-compile-file "/home/jixiuf/emacs_conf/site-lisp/joseph/joseph-org-publish.el")'
# emacs --batch --no-site-file -l /home/jixiuf/.emacs.d/site-lisp/joseph/joseph-byte-compile.el  -l /home/jixiuf/.emacs.d/site-lisp/joseph/joseph_byte_compile_include.el --eval '(byte-compile-file "/home/jixiuf/emacs_conf/site-lisp/submodules/helm-replace-string/helm-replace-string.el")'


