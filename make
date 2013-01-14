#!/bin/sh
MODULE_FILE_NAME=./site-lisp/submodules/modules
WORD_DIR=`pwd`/site-lisp/submodules/

case "$1" in  
    "init" )  
        # 过滤掉开头是#的注释行
        for url in  `cat $MODULE_FILE_NAME|grep -v "^[ \t]*#" ` ; do
            mod=`echo $url|sed 's|.*/||g'|awk -F '.git$' '{print $1}'`
            abs_mod_path=$WORD_DIR/$mod
            if [ -d $abs_mod_path ] && [ -d $abs_mod_path/.git ] ; then
        # 如果库已经存在
                echo $abs_mod_path 
                cd $abs_mod_path
                git checkout master
                git pull
            else
                cd $WORD_DIR
                git clone $url
            fi
        done
        ;;  
    
    "push" )  
        # 过滤掉开头是#的注释行
        for url in  `cat $MODULE_FILE_NAME|grep -v "^[ \t]*#" ` ; do
            mod=`echo $url|sed 's|.*/||g'|awk -F '.git$' '{print $1}'`
            abs_mod_path=$WORD_DIR/$mod
            # url 中含jixiuf 是我有权限push的
            if [ -d $abs_mod_path ] && [ -d $abs_mod_path/.git  ] && [ `echo $url | grep -c "jixiuf"`  -gt 0 ] ; then
                # my private repos 
                echo git push $url 
                cd $abs_mod_path
                git checkout master
                git pull
                git push
            fi
        done
        
        ;;  
    "status" )  
        # 过滤掉开头是#的注释行
        for url in  `cat $MODULE_FILE_NAME|grep -v "^[ \t]*#" ` ; do
            mod=`echo $url|sed 's|.*/||g'|awk -F '.git$' '{print $1}'`
            abs_mod_path=$WORD_DIR/$mod
            cd $abs_mod_path
            echo $url
            git status
            echo 
        done
        
        ;;  
    
esac 
