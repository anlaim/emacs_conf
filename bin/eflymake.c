//file name : eflymake.c
//created at: 2011-12-2 16:10:37
//author:  纪秀峰

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

/*
  you need add D:\usr\erl5.8.5\bin to %Path%
  flymake for erlang
  with eflymake.erl
 */
int main(int argc, char *argv[]){
  char cmd[1024] ;
  if (argc==0){
    printf("need a arg as erlang src file name.");
    return 1;
  }
  /* sprintf(cmd,"escript.exe %s" ,argv[1]); /\* on windows *\/ */
  sprintf(cmd,"escript %s" ,argv[1]); /* on linux */
  system(cmd);
  return 0;
}
