.PHONY: compile
ROOT_DIR=`pwd`
help:
	@echo please use make like this:
	@echo make linux
	@echo make pull
	@echo make compile
	@echo make push
	@echo make st[atus]
compile:
	@-emacs --batch --no-site-file -l site-lisp/joseph/joseph-byte-compile.el --eval '(byte-compile-all-my-el-files-batch)'
	@-cd site-lisp/cedet-1.1/ &&make
	@-./make configure
	@-./make make
	@-cd site-lisp/emacs-jabber-0.8.90/ && ./configure &&make
	@-emacs --batch --no-site-file -l site-lisp/joseph/joseph-autoload.el --eval '(update-directory-autoloads-recursively)'
linux:	
	@echo 请手动运行以下命令 if you are not root 
	@echo sudo  cp  bin/ec /bin/	
	@echo sudo  cp  bin/em /bin/
	@sudo cp bin/ec /bin/
	@sudo cp bin/em /bin/
	@ln  --symbolic -n --force  "$(ROOT_DIR)/snippets/erlang-mode" "$(ROOT_DIR)/snippets/erlang-shell-mode"  
	@ln  --symbolic -n --force  "$(ROOT_DIR)/site-lisp/submodules/yasnippet/snippets/erlang-mode" "$(ROOT_DIR)/site-lisp/submodules/yasnippet/snippets/erlang-shell-mode"  
	@echo try to edit your /etc/conf.d/emacs EMACS_STOP=\"$(ROOT_DIR)/bin/emacs-stop.sh\"

init:
	@-git pull
	@-./make init
push:
	@-git pull
	@-git push
	@-./make push
	@-cd $(ROOT_DIR)/site-lisp/submodules/dotemacs_priv && git pull &&git add mail/* && git add todo.org&& git add notes.org && git commit -m "update mail" -a &&  git push 

status:
	@./make status

st:status

fetch:	init
	@-git pull
pull:init

# emacs --batch --no-site-file -l site-lisp/joseph/joseph-byte-compile.el --eval '(byte-compile-file "/home/jixiuf/emacs_conf/site-lisp/joseph/joseph-org-publish.el")'
# emacs --batch --no-site-file -l /home/jixiuf/.emacs.d/site-lisp/joseph/joseph-byte-compile.el  -l /home/jixiuf/.emacs.d/site-lisp/joseph/joseph_byte_compile_include.el --eval '(byte-compile-file "/home/jixiuf/emacs_conf/site-lisp/submodules/helm-replace-string/helm-replace-string.el")'


