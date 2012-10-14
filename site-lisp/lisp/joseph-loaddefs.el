;;; joseph-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ace-jump-mode ace-jump-line-mode ace-jump-word-mode
;;;;;;  ace-jump-char-mode ace-jump-mode-pop-mark) "ace-jump-mode"
;;;;;;  "../ace-jump-mode/ace-jump-mode.el" (20550 7247 834912 481000))
;;; Generated autoloads from ../ace-jump-mode/ace-jump-mode.el

(autoload 'ace-jump-mode-pop-mark "ace-jump-mode" "\
Pop up a postion from `ace-jump-mode-mark-ring', and jump back to that position

\(fn)" t nil)

(autoload 'ace-jump-char-mode "ace-jump-mode" "\
AceJump char mode

\(fn QUERY-CHAR)" t nil)

(autoload 'ace-jump-word-mode "ace-jump-mode" "\
AceJump word mode.
You can set `ace-jump-word-mode-use-query-char' to nil to prevent
asking for a head char, that will mark all the word in current
buffer.

\(fn HEAD-CHAR)" t nil)

(autoload 'ace-jump-line-mode "ace-jump-mode" "\
AceJump line mode.
Marked each no empty line and move there

\(fn)" t nil)

(autoload 'ace-jump-mode "ace-jump-mode" "\
AceJump mode is a minor mode for you to quick jump to a
position in the curret view.
   There is three submode now:
     `ace-jump-char-mode'
     `ace-jump-word-mode'
     `ace-jump-line-mode'

You can specify the sequence about which mode should enter
by customize `ace-jump-mode-submode-list'.

If you do not want to query char for word mode, you can change
`ace-jump-word-mode-use-query-char' to nil.

If you don't like the default move keys, you can change it by
setting `ace-jump-mode-move-keys'.

You can constrol whether use the case sensitive via
`ace-jump-mode-case-fold'.

\(fn &optional PREFIX)" t nil)

;;;***

;;;### (autoloads (ajc-reload) "ajc-java-complete" "../ajc-java-complete/ajc-java-complete.el"
;;;;;;  (20550 6555 646914 226000))
;;; Generated autoloads from ../ajc-java-complete/ajc-java-complete.el

(autoload 'ajc-reload "ajc-java-complete" "\
restart Auto Java Complete ,when your tag file changed,
you can use this function restart AutoJavaComplete

\(fn)" t nil)

(defalias 'auto-java-complete-reload 'ajc-reload)

;;;***

;;;### (autoloads (ajc-4-jsp-find-file-hook ajc-java-complete-mode)
;;;;;;  "ajc-java-complete-config" "../ajc-java-complete/ajc-java-complete-config.el"
;;;;;;  (20548 52826 320081 995000))
;;; Generated autoloads from ../ajc-java-complete/ajc-java-complete-config.el

(autoload 'ajc-java-complete-mode "ajc-java-complete-config" "\
AutoJavaComplete mode

\(fn &optional ARG)" t nil)

(defalias 'auto-java-complete-mode 'ajc-java-complete-mode)

(autoload 'ajc-4-jsp-find-file-hook "ajc-java-complete-config" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (android-mode) "android-mode" "../android-mode/android-mode.el"
;;;;;;  (20550 7289 16908 361000))
;;; Generated autoloads from ../android-mode/android-mode.el

(autoload 'android-mode "android-mode" "\
Android application development minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (auto-complete) "auto-complete" "../auto-complete/auto-complete.el"
;;;;;;  (20580 27895 811546 928000))
;;; Generated autoloads from ../auto-complete/auto-complete.el

(autoload 'auto-complete "auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

;;;***

;;;### (autoloads (batch-mode) "batch-mode" "../batch-mode.el" (20143
;;;;;;  54196 686597 125000))
;;; Generated autoloads from ../batch-mode.el

(autoload 'batch-mode "batch-mode" "\
Major mode for editing batch scripts.

\(fn)" t nil)

;;;***

;;;### (autoloads (command-log-mode) "command-log-mode" "../command-log-mode/command-log-mode.el"
;;;;;;  (20439 27338 526937 924000))
;;; Generated autoloads from ../command-log-mode/command-log-mode.el

(autoload 'command-log-mode "command-log-mode" "\
Toggle keyboard command logging.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (compile-dwim-run compile-dwim-compile compile-dwim-alist)
;;;;;;  "compile-dwim" "../compile-dwim.el" (20122 29903 934506 551000))
;;; Generated autoloads from ../compile-dwim.el

(defvar compile-dwim-alist `((perl (or (name . "\\.pl$") (mode . cperl-mode)) "%i -wc \"%f\"" "%i \"%f\"") (c (or (name . "\\.c$") (mode . c-mode)) ("gcc -o %n %f" "gcc -g -o %n %f") ("./%n" "cint %f") "%n") (c++ (or (name . "\\.cpp$") (mode . c++-mode)) ("g++ -o %n %f" "g++ -g -o %n %f") "./%n" "%n") (java (or (name . "\\.java$") (mode . java-mode)) "javac %f" "java %n" "%n.class") (python (or (name . "\\.py$") (mode . python-mode)) "%i %f" "%i %f") (javascript (or (name . "\\.js$") (mode . javascript-mode)) "smjs -f %f" "smjs -f %f") (tex (or (name . "\\.tex$") (name . "\\.ltx$") (mode . tex-mode) (mode . latex-mode)) "latex %f" "latex %f" "%n.dvi") (texinfo (name . "\\.texi$") (makeinfo-buffer) (makeinfo-buffer) "%.info") (sh (or (name . "\\.sh$") (mode . sh-mode)) "%i ./%f" "%i ./%f") (f99 (name . "\\.f90$") "f90 %f -o %n" "./%n" "%n") (f77 (name . "\\.[Ff]$") "f77 %f -o %n" "./%n" "%n") (php (or (name . "\\.php$") (mode . php-mode)) "php %f" "php %f") (elisp (or (name . "\\.el$") (mode . emacs-lisp-mode) (mode . lisp-interaction-mode)) (emacs-lisp-byte-compile) (emacs-lisp-byte-compile) "%fc")) "\
Settings for certain file type.
A list like ((TYPE CONDITION COMPILE-COMMAND RUN-COMMAND EXE-FILE) ...).
In commands, these format specification are available:

  %i  interpreter name
  %F  absolute pathname            ( /usr/local/bin/netscape.bin )
  %f  file name without directory  ( netscape.bin )
  %n  file name without extention  ( netscape )
  %e  extention of file name       ( bin )

The interpreter is the program in the shebang line. If the
program is valid(test with `executable-find'), then use this program,
otherwise, use interpreter in `interpreter-mode-alist' according
to the major mode.")

(custom-autoload 'compile-dwim-alist "compile-dwim" t)

(autoload 'compile-dwim-compile "compile-dwim" "\


\(fn FORCE &optional SENTINEL)" t nil)

(autoload 'compile-dwim-run "compile-dwim" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (csharp-mode csharp-cmd-line-limit csharp-msbuild-tool
;;;;;;  csharp-make-tool csharp-want-imenu csharp-want-yasnippet-fixup
;;;;;;  csharp-want-flymake-fixup csharp-mode-hook) "csharp-mode-0.8.5"
;;;;;;  "../csharp-mode/csharp-mode-0.8.5.el" (20049 12868 607096
;;;;;;  170000))
;;; Generated autoloads from ../csharp-mode/csharp-mode-0.8.5.el

(defvar csharp-mode-hook nil "\
*Hook called by `csharp-mode'.")

(custom-autoload 'csharp-mode-hook "csharp-mode-0.8.5" t)

(defvar csharp-want-flymake-fixup t "\
*Whether to enable the builtin C# support for flymake. This is meaningful
only if flymake is loaded.")

(custom-autoload 'csharp-want-flymake-fixup "csharp-mode-0.8.5" t)

(defvar csharp-want-yasnippet-fixup t "\
*Whether to enable the builtin C# support for yasnippet. This is meaningful
only if flymake is loaded.")

(custom-autoload 'csharp-want-yasnippet-fixup "csharp-mode-0.8.5" t)

(defvar csharp-want-imenu t "\
*Whether to generate a buffer index via imenu for C# buffers.")

(custom-autoload 'csharp-want-imenu "csharp-mode-0.8.5" t)

(defvar csharp-make-tool "nmake.exe" "\
*The make tool to use. Defaults to nmake, found on path. Specify
a full path or alternative program name, to tell csharp-mode to use
a different make tool in compile commands.

See also, `csharp-msbuild-tool'.

")

(custom-autoload 'csharp-make-tool "csharp-mode-0.8.5" t)

(defvar csharp-msbuild-tool "msbuild.exe" "\
*The tool to use to build .csproj files. Defaults to msbuild, found on
path. Specify a full path or alternative program name, to tell csharp-mode
to use a different make tool in compile commands.

See also, `csharp-make-tool'.

")

(custom-autoload 'csharp-msbuild-tool "csharp-mode-0.8.5" t)

(defvar csharp-cmd-line-limit 28 "\
The number of lines at the top of the file to look in, to find
the command that csharp-mode will use to compile the current
buffer, or the command \"stub\" that csharp-mode will use to
check the syntax of the current buffer via flymake.

If the value of this variable is zero, then csharp-mode looks
everywhere in the file.  If the value is positive, then only in
the first N lines. If negative, then only in the final N lines.

The line should appear in a comment inside the C# buffer.


Compile
--------

In the case of compile, the compile command must be prefixed with
\"compile:\".  For example,

 // compile: csc.exe /r:Hallo.dll Arfie.cs


This command will be suggested as the compile command when the
user invokes `compile' for the first time.


Flymake
--------

In the case of flymake, the command \"stub\" string must be
prefixed with \"flymake:\".  For example,

 // flymake: DOTNETDIRcsc.exe /target:netmodule /r:foo.dll @@FILE@@

In the case of flymake, the string should NOT include the name of
the file for the buffer being checked. Instead, use the token
@@FILE@@ .  csharp-mode will replace this token with the name of
the source file to compile, before passing the command to flymake
to run it.

If for some reason the command is invalid or illegal, flymake
will report an error and disable itself.

It might be handy to run fxcop, for example, via flymake.

 // flymake: fxcopcmd.exe /c  /f:MyLibrary.dll



In all cases
------------

Be sure to specify the proper path for your csc.exe, whatever
version that might be, or no path if you want to use the system
PATH search.

If the buffer depends on external libraries, then you will want
to include /R arguments to that csc.exe command.

To be clear, this variable sets the number of lines to search for
the command.  This cariable is an integer.

If the marker string (either \"compile:\" or \"flymake:\"
is present in the given set of lines, csharp-mode will take
anything after the marker string as the command to run.

")

(custom-autoload 'csharp-cmd-line-limit "csharp-mode-0.8.5" t)

(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

(autoload 'csharp-mode "csharp-mode-0.8.5" "\
Major mode for editing C# code. This mode is derived from CC Mode to
support C#.

Normally, you'd want to autoload this mode by setting `auto-mode-alist' with
an entry for csharp, in your .emacs file:

   (autoload 'csharp-mode \"csharp-mode\" \"Major mode for editing C# code.\" t)
   (setq auto-mode-alist
      (append '((\"\\.cs$\" . csharp-mode)) auto-mode-alist))

The mode provides fontification and indent for C# syntax, as well
as some other handy features.

At mode startup, there are two interesting hooks that run:
`c-mode-common-hook' is run with no args, then `csharp-mode-hook' is run after
that, also with no args.

To run your own logic after csharp-mode starts, do this:

  (defun my-csharp-mode-fn ()
    \"my function that runs when csharp-mode is initialized for a buffer.\"
    (turn-on-font-lock)
    (turn-on-auto-revert-mode) ;; helpful when also using Visual Studio
    (setq indent-tabs-mode nil) ;; tabs are evil
    (flymake-mode 1)
    (yas/minor-mode-on)
    (require 'rfringe)  ;; handy for flymake
    (require 'flymake-cursor) ;; also handy for flymake
    ....your own code here...
  )
  (add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)


The function above is just a suggestion.


Compile integration:
========================

csharp-mode binds the function `csharp-invoke-compile-interactively' to
\"\" .  This function attempts to intellgently guess the format of the
compile command to use for a buffer.  It looks in the comments at the head of
the buffer for a line that begins with compile: .  For exammple:

  // compile: csc.exe /t:library /r:Mylib.dll Foo.cs

If csharp-mode finds a line like this, it will suggest the text that follows
as the compilation command when running `compile' for the first time.  If such
a line is not found, csharp-mode falls back to a msbuild or nmake command.
See the documentation on `csharp-cmd-line-limit' for further information. If
you don't want this magic, then you can just run `compile' directly, rather
than `csharp-invoke-compile-interactively' .

This mode will also automatically add a symbol and regexp to the
`compilation-error-regexp-alist' and`compilation-error-regexp-alist-alist'
respectively, for Csc.exe error and warning messages. If you invoke `compile',
then `next-error' should work properly for error messages produced by csc.exe.


Flymake Integraiton
========================

You can use flymake with csharp mode to automatically check the syntax of your
csharp code, and highlight errors.  To do so, add a comment line like this to
each .cs file that you use flymake with:

   //  flymake: csc.exe /t:module /R:Foo.dll @@FILE@@

csharp-mode replaces special tokens in the command with different values:

  @@ORIG@@ - gets replaced with the original filename
  @@FILE@@ - gets replaced with the name of the temporary file
      created by flymake. This is usually what you want in place of the
      name of the file to be compiled.

See the documentation on `csharp-cmd-line-limit' for further information.

You may also want to run a syntax checker, like fxcop:

   //  flymake: fxcopcmd.exe /c /F:MyLibrary.dll

In this case you don't need either of the tokens described above.

If the module has no external dependencies, then you need not specify any
flymake command at all. csharp-mode will implicitly act as if you had
specified the command:

     // flymake: csc.exe /t:module /nologo @@FILE@@

It looks for the EXE on the path.  You can specify a full path if you like.


YASnippet and IMenu Integraiton
===============================

Check the menubar for menu entries for YASnippet and Imenu; the latter
is labelled \"Index\".

The Imenu index gets computed when the file is .cs first opened and loaded.
This may take a moment or two.  If you don't like this delay and don't
use imenu, you can turn this off with the variable `csharp-want-imenu'.



Key bindings:
\\{csharp-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (turn-on-ctags-auto-update-mode ctags-auto-update-mode
;;;;;;  ctags-update) "ctags-update" "../helm-etags-plus/ctags-update.el"
;;;;;;  (20588 6774 35341 890000))
;;; Generated autoloads from ../helm-etags-plus/ctags-update.el

(autoload 'ctags-update "ctags-update" "\
update TAGS in parent directory using `exuberant-ctags'.
1. you can call this function directly,
2. enable `ctags-auto-update-mode',
3. with prefix `C-u' then you can generate a new TAGS file in directory,
4. with prefix `C-uC-u' save the command to king-ring instead of execute it.

\(fn &optional ARGS)" t nil)

(autoload 'ctags-auto-update-mode "ctags-update" "\
auto update TAGS using `exuberant-ctags' in parent directory.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "\
turn on `ctags-auto-update-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "diff-mode-" "../diff-mode-.el" (20122 29903
;;;;;;  988756 65000))
;;; Generated autoloads from ../diff-mode-.el

(defface diff-file1-hunk-header '((((background dark)) (:foreground "Yellow" :background "#3E3E00003E3E")) (t (:foreground "Blue" :background "DarkSeaGreen1"))) "\
Face used to highlight a diff hunk for the first `diff' argument." :group (quote diff-mode))

(defface diff-file2-hunk-header '((((background dark)) (:foreground "Cyan" :background "#111117175555")) (t (:foreground "Red" :background "PaleGoldenrod"))) "\
Face used to highlight a diff hunk for the second `diff' argument." :group (quote diff-mode))

(defface diff-indicator-changed '((((background dark)) (:foreground "#111117175555" :background "Yellow")) (t (:foreground "PaleGoldenrod" :background "MediumBlue"))) "\
*Face used to highlight the line-start indicator of a modified line." :group (quote diff-mode))

(defface diff-indicator-added '((((background dark)) (:foreground "#111117175555" :background "#FFFF9B9BFFFF")) (t (:foreground "PaleGoldenrod" :background "DarkGreen"))) "\
*Face used to highlight the line-start indicator of an inserted line." :group (quote diff-mode))

(defface diff-indicator-removed '((((background dark)) (:foreground "#111117175555" :background "#7474FFFF7474")) (t (:foreground "PaleGoldenrod" :background "DarkMagenta"))) "\
*Face used to highlight the line-start indicator of a removed line." :group (quote diff-mode))

;;;***

;;;### (autoloads (dired-filetype-face-mode-func) "dired-filetype-face"
;;;;;;  "../dired-filetype-face/dired-filetype-face.el" (20254 22590
;;;;;;  397114 781000))
;;; Generated autoloads from ../dired-filetype-face/dired-filetype-face.el

(autoload 'dired-filetype-face-mode-func "dired-filetype-face" "\
this function will be added to `dired-mode-hook'

\(fn)" nil nil)

;;;***

;;;### (autoloads (inferior-erlang erlang-compile erlang-shell erlang-find-tag-other-window
;;;;;;  erlang-find-tag erlang-mode) "erlang" "../erlang/erlang.el"
;;;;;;  (20316 36277 739760 660000))
;;; Generated autoloads from ../erlang/erlang.el

(autoload 'erlang-mode "erlang" "\
Major mode for editing Erlang source files in Emacs.
It knows about syntax and comment, it can indent code, it is capable
of fontifying the source file, the TAGS commands are aware of Erlang
modules, and the Erlang man pages can be accessed.

Should this module, \"erlang.el\", be installed properly, Erlang mode
is activated whenever an Erlang source or header file is loaded into
Emacs.  To indicate this, the mode line should contain the word
\"Erlang\".

The main feature of Erlang mode is indentation, press TAB and the
current line will be indented correctly.

Comments starting with only one `%' are indented to the column stored
in the variable `comment-column'.  Comments starting with two `%':s
are indented with the same indentation as code.  Comments starting
with at least three `%':s are indented to the first column.

However, Erlang mode contains much more, this is a list of the most
useful commands:
     TAB     - Indent the line.
     C-c C-q - Indent current function.
     M-;     - Create a comment at the end of the line.
     M-q     - Fill a comment, i.e. wrap lines so that they (hopefully)
         will look better.
     M-a     - Goto the beginning of an Erlang clause.
     M-C-a   - Ditto for function.
     M-e     - Goto the end of an Erlang clause.
     M-C-e   - Ditto for function.
     M-h     - Mark current Erlang clause.
     M-C-h   - Ditto for function.
     C-c C-z - Start, or switch to, an inferior Erlang shell.
     C-c C-k - Compile current file.
     C-x `   - Next error.
     ,       - Electric comma.
     ;       - Electric semicolon.

Erlang mode check the name of the file against the module name when
saving, whenever a mismatch occurs Erlang mode offers to modify the
source.

The variable `erlang-electric-commands' controls the electric
commands.  To deactivate all of them, set it to nil.

There exists a large number of commands and variables in the Erlang
module.  Please press `M-x apropos RET erlang RET' to see a complete
list.  Press `C-h f name-of-function RET' and `C-h v name-of-variable
RET'to see the full description of functions and variables,
respectively.

On entry to this mode the contents of the hook `erlang-mode-hook' is
executed.

Please see the beginning of the file `erlang.el' for more information
and examples of hooks.

Other commands:
\\{erlang-mode-map}

\(fn)" t nil)

(autoload 'erlang-find-tag "erlang" "\
Like `find-tag'.  Capable of retrieving Erlang modules.

Tags can be given on the forms `tag', `module:', `module:tag'.

\(fn MODTAGNAME &optional NEXT-P REGEXP-P)" t nil)

(autoload 'erlang-find-tag-other-window "erlang" "\
Like `find-tag-other-window' but aware of Erlang modules.

\(fn TAGNAME &optional NEXT-P REGEXP-P)" t nil)

(autoload 'erlang-shell "erlang" "\
Start a new Erlang shell.

The variable `erlang-shell-function' decides which method to use,
default is to start a new Erlang host.  It is possible that, in the
future, a new shell on an already running host will be started.

\(fn)" t nil)
 (autoload 'run-erlang "erlang" "Start a new Erlang shell." t)

(autoload 'erlang-compile "erlang" "\
Compile Erlang module in current buffer.

\(fn)" t nil)

(autoload 'inferior-erlang "erlang" "\
Run an inferior Erlang.
With prefix command, prompt for command to start Erlang with.

This is just like running Erlang in a normal shell, except that
an Emacs buffer is used for input and output.
\\<comint-mode-map>
The command line history can be accessed with  \\[comint-previous-input]  and  \\[comint-next-input].
The history is saved between sessions.

Entry to this mode calls the functions in the variables
`comint-mode-hook' and `erlang-shell-mode-hook' with no arguments.

The following commands imitate the usual Unix interrupt and
editing control characters:
\\{erlang-shell-mode-map}

\(fn &optional COMMAND)" t nil)

;;;***

;;;### (autoloads (erlang-mode-hook-1 erlang-dired-mode-fun erlang-dired-mode
;;;;;;  erlang-compile-dwim erlang-auto-compile erlang-make erlang-emake
;;;;;;  erlang-create-project erlang-export-current-function) "erlang-dired-mode"
;;;;;;  "../erlang-dired-mode/erlang-dired-mode.el" (20602 54536
;;;;;;  280553 788000))
;;; Generated autoloads from ../erlang-dired-mode/erlang-dired-mode.el

(autoload 'erlang-export-current-function "erlang-dired-mode" "\
export current function.,with prefix `C-u' save `funname/argc' to king-ring.

\(fn &optional ARG)" t nil)

(autoload 'erlang-create-project "erlang-dired-mode" "\


\(fn ROOT-DIR)" t nil)

(autoload 'erlang-emake "erlang-dired-mode" "\
run make:all(load) in project root of erlang application,if Emakefile doesn't exists ,call `erlang-compile' instead

\(fn ARG)" t nil)

(autoload 'erlang-make "erlang-dired-mode" "\
run make command at project root directory

\(fn)" t nil)

(autoload 'erlang-auto-compile "erlang-dired-mode" "\
auto compile current buffer to `project-root'/ebin when save

\(fn)" t nil)

(autoload 'erlang-compile-dwim "erlang-dired-mode" "\
call `erlang-emake', if with prefix `C-u' then run call `erlang-make'.

\(fn &optional ARG)" t nil)

(autoload 'erlang-dired-mode "erlang-dired-mode" "\
Erlang application development minor mode.

\(fn &optional ARG)" t nil)

(autoload 'erlang-dired-mode-fun "erlang-dired-mode" "\


\(fn)" nil nil)

(add-hook 'dired-mode-hook 'erlang-dired-mode-fun)

(autoload 'erlang-mode-hook-1 "erlang-dired-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (ert-deftest) "ert" "../auto-complete/lib/ert/lisp/emacs-lisp/ert.el"
;;;;;;  (20575 74 48139 208000))
;;; Generated autoloads from ../auto-complete/lib/ert/lisp/emacs-lisp/ert.el

(autoload 'ert-deftest "ert" "\
Define NAME (a symbol) as a test.

BODY is evaluated as a `progn' when the test is run.  It should
signal a condition on failure or just return if the test passes.

`should', `should-not' and `should-error' are useful for
assertions in BODY.

Use `ert' to run tests interactively.

Tests that are expected to fail can be marked as such
using :expected-result.  See `ert-test-result-type-p' for a
description of valid values for RESULT-TYPE.

\(fn NAME () [DOCSTRING] [:expected-result RESULT-TYPE] [:tags '(TAG...)] BODY...)" nil (quote macro))

(put 'ert-deftest 'lisp-indent-function 2)

(put 'ert-info 'lisp-indent-function 1)

;;;***

;;;### (autoloads (ert-run-tests-batch-and-exit ert-run-tests-batch)
;;;;;;  "ert-batch" "../auto-complete/lib/ert/lisp/emacs-lisp/ert-batch.el"
;;;;;;  (20575 74 47149 335000))
;;; Generated autoloads from ../auto-complete/lib/ert/lisp/emacs-lisp/ert-batch.el

(autoload 'ert-run-tests-batch "ert-batch" "\
Run the tests specified by SELECTOR, printing results to the terminal.

SELECTOR works as described in `ert-select-tests', except if
SELECTOR is nil, in which case all tests rather than none will be
run; this makes the command line \"emacs -batch -l my-tests.el -f
ert-run-tests-batch-and-exit\" useful.

Returns the stats object.

\(fn &optional SELECTOR)" nil nil)

(autoload 'ert-run-tests-batch-and-exit "ert-batch" "\
Like `ert-run-tests-batch', but exits Emacs when done.

The exit status will be 0 if all test results were as expected, 1
on unexpected results, or 2 if the framework detected an error
outside of the tests (e.g. invalid SELECTOR or bug in the code
that runs the tests).

\(fn &optional SELECTOR)" nil nil)

;;;***

;;;### (autoloads (ert-select-tests ert-test-result-type-p) "ert-run"
;;;;;;  "../auto-complete/lib/ert/lisp/emacs-lisp/ert-run.el" (20575
;;;;;;  74 47149 335000))
;;; Generated autoloads from ../auto-complete/lib/ert/lisp/emacs-lisp/ert-run.el

(autoload 'ert-test-result-type-p "ert-run" "\
Return non-nil if RESULT matches type RESULT-TYPE.

Valid result types:

nil -- Never matches.
t -- Always matches.
:failed, :passed -- Matches corresponding results.
\(and TYPES...) -- Matches if all TYPES match.
\(or TYPES...) -- Matches if some TYPES match.
\(not TYPE) -- Matches if TYPE does not match.
\(satisfies PREDICATE) -- Matches if PREDICATE returns true when called with
                           RESULT.

\(fn RESULT RESULT-TYPE)" nil nil)

(autoload 'ert-select-tests "ert-run" "\
Return the tests that match SELECTOR.

UNIVERSE specifies the set of tests to select from; it should be
a list of tests, or t, which refers to all tests named by symbols
in `obarray'.

Returns the set of tests as a list.

Valid selectors:

nil -- Selects the empty set.
t -- Selects UNIVERSE.
:new -- Selects all tests that have not been run yet.
:failed, :passed -- Select tests according to their most recent result.
:expected, :unexpected -- Select tests according to their most recent result.
a string -- Selects all tests that have a name that matches the string,
            a regexp.
a test -- Selects that test.
a symbol -- Selects the test that the symbol names, errors if none.
\(member TESTS...) -- Selects TESTS, a list of tests or symbols naming tests.
\(eql TEST) -- Selects TEST, a test or a symbol naming a test.
\(and SELECTORS...) -- Selects the tests that match all SELECTORS.
\(or SELECTORS...) -- Selects the tests that match any SELECTOR.
\(not SELECTOR) -- Selects all tests that do not match SELECTOR.
\(tag TAG) -- Selects all tests that have TAG on their tags list.
\(satisfies PREDICATE) -- Selects all tests that satisfy PREDICATE.

Only selectors that require a superset of tests, such
as (satisfies ...), strings, :new, etc. make use of UNIVERSE.
Selectors that do not, such as (member ...), just return the
set implied by them without checking whether it is really
contained in UNIVERSE.

\(fn SELECTOR UNIVERSE)" nil nil)

;;;***

;;;### (autoloads (ert-describe-test ert-run-tests-interactively)
;;;;;;  "ert-ui" "../auto-complete/lib/ert/lisp/emacs-lisp/ert-ui.el"
;;;;;;  (20575 74 47149 335000))
;;; Generated autoloads from ../auto-complete/lib/ert/lisp/emacs-lisp/ert-ui.el

(autoload 'ert-run-tests-interactively "ert-ui" "\
Run the tests specified by SELECTOR and display the results in a buffer.

SELECTOR works as described in `ert-select-tests'.
OUTPUT-BUFFER-NAME and MESSAGE-FN should normally be nil; they
are used for automated self-tests and specify which buffer to use
and how to display message.

\(fn SELECTOR &optional OUTPUT-BUFFER-NAME MESSAGE-FN)" t nil)

(defalias 'ert 'ert-run-tests-interactively)

(autoload 'ert-describe-test "ert-ui" "\
Display the documentation for TEST-OR-TEST-NAME (a symbol or ert-test).

\(fn TEST-OR-TEST-NAME)" t nil)

;;;***

;;;### (autoloads (ert-kill-all-test-buffers) "ert-x" "../auto-complete/lib/ert/lisp/emacs-lisp/ert-x.el"
;;;;;;  (20575 74 47149 335000))
;;; Generated autoloads from ../auto-complete/lib/ert/lisp/emacs-lisp/ert-x.el

(put 'ert-with-test-buffer 'lisp-indent-function 1)

(autoload 'ert-kill-all-test-buffers "ert-x" "\
Kill all test buffers that are still live.

\(fn)" t nil)

;;;***

;;;### (autoloads (etags-table-search-up-depth etags-table-alist
;;;;;;  etags-table) "etags-table" "../etags-table.el" (20122 29904
;;;;;;  19832 999000))
;;; Generated autoloads from ../etags-table.el

(let ((loads (get 'etags-table 'custom-loads))) (if (member '"etags-table" loads) nil (put 'etags-table 'custom-loads (cons '"etags-table" loads))))

(defvar etags-table-alist nil "\
*Map filename to tag file(s)

Example:

\(setq etags-table-alist
      (list
       '(\"/home/me/Projects/foo/.*\\\\.[ch]$\" \"/home/me/Projects/lib1/TAGS\" \"/home/me/Projects/lib2/TAGS\")
       '(\"/home/me/Projects/bar/.*\\\\.py$\" \"/home/me/Projects/python/common/TAGS\")
       '(\".*\\\\.[ch]$\" \"/usr/local/include/TAGS\")
       ))

A file named, for example, \"/home/me/Projects/foo/main.c\" would set the
`tags-table-list' to a list of:

\"/home/me/Projects/lib1/TAGS\"
\"/home/me/Projects/lib2/TAGS\"
\"/usr/local/include/TAGS\"

and possibly a local tags file at the head of the list if `etags-table-search-up-depth'
is non-nil.  You can use \\&, \\1, etc. in the tag file names to substitute pieces
captured with \\(\\) in the key.
")

(custom-autoload 'etags-table-alist "etags-table" t)

(defvar etags-table-search-up-depth nil "\
*Max depth to search up for a tags file.  nil means don't search.")

(custom-autoload 'etags-table-search-up-depth "etags-table" t)

;;;***

;;;### (autoloads (ethan-wspace-mode) "ethan-wspace" "../ethan-wspace/lisp/ethan-wspace.el"
;;;;;;  (20461 55399 115501 323000))
;;; Generated autoloads from ../ethan-wspace/lisp/ethan-wspace.el

(autoload 'ethan-wspace-mode "ethan-wspace" "\
Minor mode for coping with whitespace.

This just activates each whitespace type in this buffer.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (describe-file dired-mouse-describe-file dired-describe-file
;;;;;;  dired-mouse-describe-listed-directory dired-describe-listed-directory
;;;;;;  display-buffer-other-frame switch-to-buffer-other-frame switch-to-buffer-other-window
;;;;;;  minibuffer-with-setup-hook) "files+" "../dired/files+.el"
;;;;;;  (20033 19868 461628 20000))
;;; Generated autoloads from ../dired/files+.el

(autoload 'minibuffer-with-setup-hook "files+" "\
Add FUN to `minibuffer-setup-hook' while executing BODY.
BODY should use the minibuffer at most once.
Recursive uses of the minibuffer will not be affected.

\(fn FUN &rest BODY)" nil t)

(put 'minibuffer-with-setup-hook 'lisp-indent-function '1)

(autoload 'switch-to-buffer-other-window "files+" "\
Select buffer BUFFER in another window.
If BUFFER does not identify an existing buffer, then this function
creates a buffer with that name.

When called from Lisp, BUFFER can be a buffer, a string (a buffer name),
or nil.  If BUFFER is nil, then this function chooses another buffer
using `other-buffer' (or `another-buffer', if it is defined).

Optional second arg NORECORD non-nil means
do not put this buffer at the front of the list of recently selected ones.

Returns the buffer switched to.

This uses function `display-buffer' as a subroutine; see its
documentation for additional customization information.

\(fn BUFFER &optional NORECORD)" t nil)

(autoload 'switch-to-buffer-other-frame "files+" "\
Switch to buffer BUFFER in another frame.
Optional second arg NORECORD non-nil means
do not put this buffer at the front of the list of recently selected ones.

Returns the buffer switched to.

This uses function `display-buffer' as a subroutine; see its
documentation for additional customization information.

\(fn BUFFER &optional NORECORD)" t nil)

(autoload 'display-buffer-other-frame "files+" "\
Show BUFFER in another frame, but don't select it.
See documentation of `display-buffer' for more information.

\(fn BUFFER)" t nil)

(autoload 'dired-describe-listed-directory "files+" "\
In Dired, describe the current listed directory.

\(fn)" t nil)

(autoload 'dired-mouse-describe-listed-directory "files+" "\
Describe the current listed directory.

\(fn EVENT)" t nil)

(autoload 'dired-describe-file "files+" "\
In Dired, describe this file or directory.

\(fn)" t nil)

(autoload 'dired-mouse-describe-file "files+" "\
Describe the clicked file.

\(fn EVENT)" t nil)

(autoload 'describe-file "files+" "\
Describe the file named FILENAME.
If FILENAME is nil, describe the current directory.

\(fn FILENAME)" t nil)

;;;***

;;;### (autoloads (goto-last-change) "goto-last-change" "../goto-last-change.el"
;;;;;;  (20122 29904 68514 205000))
;;; Generated autoloads from ../goto-last-change.el

(autoload 'goto-last-change "goto-last-change" "\
Set point to the position of the last change.
Consecutive calls set point to the position of the previous change.
With a prefix arg (optional arg MARK-POINT non-nil), set mark so \\[exchange-point-and-mark]
will return point to the current position.

\(fn &optional MARK-POINT MINIMAL-LINE-DISTANCE)" t nil)

;;;***

;;;### (autoloads (helm-descbinds-uninstall helm-descbinds-install
;;;;;;  helm-descbinds) "helm-descbinds" "../helm-descbinds/helm-descbinds.el"
;;;;;;  (20439 27512 153186 422000))
;;; Generated autoloads from ../helm-descbinds/helm-descbinds.el

(autoload 'helm-descbinds "helm-descbinds" "\
Yet Another `describe-bindings' with `helm'.

\(fn &optional PREFIX BUFFER)" t nil)

(autoload 'helm-descbinds-install "helm-descbinds" "\
Use `helm-descbinds' as a replacement of `describe-bindings'.

\(fn)" t nil)

(autoload 'helm-descbinds-uninstall "helm-descbinds" "\
Restore original `describe-bindings'.

\(fn)" t nil)

;;;***

;;;### (autoloads (helm-dired-history-view helm-dired-history-update)
;;;;;;  "helm-dired-history" "../helm-dired-history/helm-dired-history.el"
;;;;;;  (20323 5481 220330 13000))
;;; Generated autoloads from ../helm-dired-history/helm-dired-history.el

(autoload 'helm-dired-history-update "helm-dired-history" "\
update variable `helm-dired-history-variable'.

\(fn)" nil nil)

(add-hook 'dired-after-readin-hook 'helm-dired-history-update)

(defvar helm-c-source-dired-history '((name . "Dired History:") (candidates . helm-dired-history-variable) (action ("Go" lambda (candidate) (dired candidate)))))

(autoload 'helm-dired-history-view "helm-dired-history" "\
call `helm' to show dired history.

\(fn)" t nil)

;;;***

;;;### (autoloads (helm-etags+-history helm-etags+-history-go-forward
;;;;;;  helm-etags+-history-go-back helm-etags+-select-one-key helm-etags+-select-at-point
;;;;;;  helm-etags+-select) "helm-etags+" "../helm-etags-plus/helm-etags+.el"
;;;;;;  (20588 6774 36343 356000))
;;; Generated autoloads from ../helm-etags-plus/helm-etags+.el

(autoload 'helm-etags+-select "helm-etags+" "\
Tag jump using etags and `helm'.
If SYMBOL-NAME is non-nil, jump tag position with SYMBOL-NAME.

\(fn)" t nil)

(autoload 'helm-etags+-select-at-point "helm-etags+" "\
Tag jump with current symbol using etags and `helm'.

\(fn)" t nil)

(autoload 'helm-etags+-select-one-key "helm-etags+" "\
you can bind this to `M-.'

\(fn &optional ARGS)" t nil)

(defvar helm-c-source-etags+-select '((name . "Etags+") (init . helm-etags+-get-available-tag-table-buffers) (candidates . helm-etags+-get-candidates-with-cache-support) (volatile) (pattern-transformer (lambda (helm-pattern) (setq helm-etags+-untransformed-helm-pattern helm-pattern) (regexp-quote (replace-regexp-in-string "\\\\_<\\|\\\\_>" "" helm-pattern)))) (requires-pattern . 3) (delayed) (action ("Goto the location" . helm-c-etags+-goto-location))))

(autoload 'helm-etags+-history-go-back "helm-etags+" "\
Go Back.

\(fn)" t nil)

(autoload 'helm-etags+-history-go-forward "helm-etags+" "\
Go Forward.

\(fn)" t nil)

(autoload 'helm-etags+-history "helm-etags+" "\
show all tag historys using `helm'

\(fn)" t nil)

;;;***

;;;### (autoloads (helm-ls-git-ls) "helm-ls-git" "../helm-ls-git/helm-ls-git.el"
;;;;;;  (20598 51329 791486 456000))
;;; Generated autoloads from ../helm-ls-git/helm-ls-git.el

(autoload 'helm-ls-git-ls "helm-ls-git" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (helm-replace-string helm-replace-string-push-history)
;;;;;;  "helm-replace-string" "../helm-replace-string/helm-replace-string.el"
;;;;;;  (20323 5414 511312 553000))
;;; Generated autoloads from ../helm-replace-string/helm-replace-string.el

(defadvice replacen-string (before helm-replace-string-replace-string (from-string to-string &optional delimited start end) activate) (helm-replace-string-push-history from-string to-string 'replace-string))

(defadvice query-replace (before helm-replace-string-query-replace (from-string to-string &optional delimited start end) activate) (helm-replace-string-push-history from-string to-string 'query-string))

(defadvice query-replace-regexp (before helm-replace-string-query-replace (from-string to-string &optional delimited start end) activate) (helm-replace-string-push-history from-string to-string 'query-regexp))

(defadvice replace-regexp (before helm-replace-string-query-replace (from-string to-string &optional delimited start end) activate) (helm-replace-string-push-history from-string to-string 'replace-regexp))

(autoload 'helm-replace-string-push-history "helm-replace-string" "\
Push replace history.

\(fn FROM-STRING TO-STRING &optional REPLACE-TYPE)" nil nil)

(autoload 'helm-replace-string "helm-replace-string" "\
Replace string from history.

\(fn)" t nil)

;;;***

;;;### (autoloads (helm-shell-pcomplete) "helm-shell" "../helm-shell/helm-shell.el"
;;;;;;  (20580 37714 445802 410000))
;;; Generated autoloads from ../helm-shell/helm-shell.el

(autoload 'helm-shell-pcomplete "helm-shell" "\
Preconfigured helm to provide helm completion in shell.

\(fn)" t nil)

;;;***

;;;### (autoloads (iedit-mode) "iedit" "../iedit.el" (20296 59851
;;;;;;  934738 575000))
;;; Generated autoloads from ../iedit.el

(autoload 'iedit-mode "iedit" "\
Toggle iedit mode.
If iedit mode is off, turn iedit mode on, off otherwise.

In Transient Mark mode, when iedit mode is turned on, all the
occurrences of the current region are highlighted.  If one
occurrence is modified, the change are propagated to all other
occurrences simultaneously.

If Transient Mark mode is disabled or the region is not active,
the current symbol (returns from `current-word') is used as the
occurrence by default.  The occurrences of the current
symbol, but not include occurrences that are part of other
symbols, are highlighted.  This is good for renaming refactoring
during programming.  If you still want to match all the
occurrences, even though they are parts of other symbols, you may
have to select the symbol first.

You can also switch to iedit mode from isearch mode directly. The
current search string is used as occurrence.  All occurrences of
the current search string are highlighted.

With a universal prefix argument and no active region, the
occurrence when iedit is turned off last time is used as
occurrence.  This is intended to recover last iedit which is
turned off by mistake.

With a universal prefix argument and region active, interactively
edit region as a string rectangle.

Commands:
\\{iedit-current-keymap}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (hello) "joseph-animate" "../joseph/joseph-animate.el"
;;;;;;  (20121 44935 789168 640000))
;;; Generated autoloads from ../joseph/joseph-animate.el

(autoload 'hello "joseph-animate" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (update-directory-autoloads-recursively) "joseph-autoload"
;;;;;;  "../joseph/joseph-autoload.el" (20540 64741 836839 791000))
;;; Generated autoloads from ../joseph/joseph-autoload.el

(autoload 'update-directory-autoloads-recursively "joseph-autoload" "\
update autoload cookies .scanning all directories under
~/.emacs.d/site-lisp/ recursively. to
` ~/.emacs.d/site-lisp/lisp/joseph-loaddefs.el'

\(fn)" t nil)

;;;***

;;;### (autoloads (byte-compile-all-my-el-files joseph_compile_current_el_without_output
;;;;;;  joseph-byte-compile-files-outside) "joseph-byte-compile"
;;;;;;  "../joseph/joseph-byte-compile.el" (20540 64623 475594 438000))
;;; Generated autoloads from ../joseph/joseph-byte-compile.el

(autoload 'joseph-byte-compile-files-outside "joseph-byte-compile" "\
调用外部的emacs byte compile 所有files 中指定的文件.
输出的结果呈现在当前emacs 中的一个buffer中, `files' can be a list of file ,
or a simple file ,前提是emacs.exe emacs 在$PATH路径下

\(fn FILES)" nil nil)

(autoload 'joseph_compile_current_el_without_output "joseph-byte-compile" "\


\(fn)" nil nil)

(autoload 'byte-compile-all-my-el-files "joseph-byte-compile" "\
byte compile all by el files under ~/.emacs.d/site-lisp/ except cedet .

\(fn)" t nil)

;;;***

;;;### (autoloads (unix2dos dos2unix minibuffer-refocus minibuffer-quit
;;;;;;  toggle-menu-bar-tool-bar keyboard-quit-or-bury-buffer-and-window
;;;;;;  bury-buffer-and-window vc-command log-view-ediff ibuffer-ediff-merge
;;;;;;  date joseph-goto-line-by-percent joseph-comment-dwim-line
;;;;;;  joseph-backward-4-line joseph-forward-4-line scroll-other-window-down-or-next-buffer
;;;;;;  scroll-other-window-up-or-previous-buffer joseph-hide-frame
;;;;;;  joseph-append-semicolon-at-eol try-joseph-dabbrev-substring
;;;;;;  kill-buffer-or-server-edit joseph-trailing-whitespace-hook
;;;;;;  joseph-kill-region-or-line just-one-space-or-delete-horizontal-space
;;;;;;  sdcv-to-buffer switch-to-scratch-buffer kill-syntax-backward
;;;;;;  kill-syntax-forward org-mode-smart-end-of-line smart-end-of-line
;;;;;;  org-mode-smart-beginning-of-line smart-beginning-of-line
;;;;;;  open-line-or-new-line-dep-pos joseph-join-lines) "joseph-command"
;;;;;;  "../joseph/joseph-command.el" (20522 30782 990978 636000))
;;; Generated autoloads from ../joseph/joseph-command.el

(autoload 'joseph-join-lines "joseph-command" "\


\(fn &optional ARG)" t nil)

(autoload 'open-line-or-new-line-dep-pos "joseph-command" "\
binding this to `C-j' if point is at head of line then
open-line if point is at end of line , new-line-and-indent

\(fn)" t nil)

(autoload 'smart-beginning-of-line "joseph-command" "\
Move point to first non-whitespace character or beginning-of-line.
Move point to beginning-of-line ,if point was already at that position,
  move point to first non-whitespace character.

\(fn)" t nil)

(autoload 'org-mode-smart-beginning-of-line "joseph-command" "\
Move point to first non-whitespace character or beginning-of-line.
Move point to beginning-of-line ,if point was already at that position,
  move point to first non-whitespace character.

\(fn)" t nil)

(autoload 'smart-end-of-line "joseph-command" "\
like `org-end-of-line' move point to
   virtual end of line
or Move point to end of line (ignore white space)
or end-of-line.
Move point to end-of-line ,if point was already at end of line (ignore white space)
  move point to end of line .if `C-u', then move to end of line directly.

\(fn &optional ARG)" t nil)

(autoload 'org-mode-smart-end-of-line "joseph-command" "\
Move point to first non-whitespace character or end-of-line.
Move point to end-of-line ,if point was already at that position,
  move point to first non-whitespace character.

\(fn)" t nil)

(autoload 'kill-syntax-forward "joseph-command" "\
Kill characters with syntax at point.

\(fn)" t nil)

(autoload 'kill-syntax-backward "joseph-command" "\
Kill characters with syntax at point.

\(fn)" t nil)

(autoload 'switch-to-scratch-buffer "joseph-command" "\
Toggle between *scratch* buffer and the current buffer.
     If the *scratch* buffer does not exist, create it.

\(fn)" t nil)

(autoload 'sdcv-to-buffer "joseph-command" "\
Search dict in region or world.

\(fn)" t nil)

(autoload 'just-one-space-or-delete-horizontal-space "joseph-command" "\
just one space or delete all horizontal space.

\(fn)" t nil)

(autoload 'joseph-kill-region-or-line "joseph-command" "\
this function is a wrapper of (kill-line).
   When called interactively with no active region, this function
  will call (kill-line) ,else kill the region.

\(fn &optional ARG)" t nil)

(autoload 'joseph-trailing-whitespace-hook "joseph-command" "\


\(fn)" nil nil)

(autoload 'kill-buffer-or-server-edit "joseph-command" "\


\(fn)" t nil)

(autoload 'try-joseph-dabbrev-substring "joseph-command" "\


\(fn OLD)" nil nil)

(autoload 'joseph-append-semicolon-at-eol "joseph-command" "\
在当前行任何位置输入分号都在行尾添加分号，除非本行有for 这个关键字，
如果行尾已经有分号则删除行尾的分号，将其插入到当前位置,就是说输入两次分号则不在行尾插入而是像正常情况一样.

\(fn &optional ARG)" t nil)

(autoload 'joseph-hide-frame "joseph-command" "\
hide current frame

\(fn)" t nil)

(autoload 'scroll-other-window-up-or-previous-buffer "joseph-command" "\
if there is an `other-window' ,then scroll it up ,if
 not ,call (previous-buffer)

\(fn &optional ARG)" t nil)

(autoload 'scroll-other-window-down-or-next-buffer "joseph-command" "\
if there is an `other-window' ,then scroll it down ,if
 not ,call (next-buffer)

\(fn &optional LINES)" t nil)

(autoload 'joseph-forward-4-line "joseph-command" "\


\(fn)" t nil)

(autoload 'joseph-backward-4-line "joseph-command" "\


\(fn)" t nil)

(autoload 'joseph-comment-dwim-line "joseph-command" "\
Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line.

\(fn &optional ARG)" t nil)

(autoload 'joseph-goto-line-by-percent "joseph-command" "\


\(fn)" t nil)

(autoload 'date "joseph-command" "\
Insert a nicely formated date string.

\(fn)" t nil)

(autoload 'ibuffer-ediff-merge "joseph-command" "\
run ediff with marked buffer in ibuffer mode
如果有两个marked 的buffer,对这两个进行ediff ,默认在merge 模式,
`C-u'的话,即普通的ediff,不进行merge
如果是mark了三个buffer ,则会让你选哪一个是ancestor(祖先),然后进行三方合并
`C-u'的话,不进行合并,仅进行三方合并

\(fn &optional ARG)" t nil)

(autoload 'log-view-ediff "joseph-command" "\
the ediff version of `log-view-diff'

\(fn BEG END)" t nil)

(autoload 'vc-command "joseph-command" "\
run vc command

\(fn)" t nil)

(autoload 'bury-buffer-and-window "joseph-command" "\
bury buffer and window

\(fn)" t nil)

(autoload 'keyboard-quit-or-bury-buffer-and-window "joseph-command" "\
C-gC-g (bury buffer and window)

\(fn)" t nil)

(autoload 'toggle-menu-bar-tool-bar "joseph-command" "\
toggle menu-bar and tool-bar

\(fn)" t nil)

(autoload 'minibuffer-quit "joseph-command" "\
Quit the minibuffer command, even when the minibuffer loses focus.

\(fn)" t nil)

(autoload 'minibuffer-refocus "joseph-command" "\
Refocus the minibuffer if it is waiting for input.

\(fn)" t nil)

(autoload 'dos2unix "joseph-command" "\


\(fn)" t nil)

(autoload 'unix2dos "joseph-command" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (csharp-db-2-seter-getter csharp-setter-getter
;;;;;;  add-csc-2-path-env my-csharp-mode-fn) "joseph-csharp" "../joseph/joseph-csharp.el"
;;;;;;  (20192 46413 662250 416000))
;;; Generated autoloads from ../joseph/joseph-csharp.el

(autoload 'my-csharp-mode-fn "joseph-csharp" "\
function that runs when csharp-mode is initialized for a buffer.

\(fn)" nil nil)

(autoload 'add-csc-2-path-env "joseph-csharp" "\
add csc.exe to $PATH

\(fn)" nil nil)

(autoload 'csharp-setter-getter "joseph-csharp" "\
generate sets and gets for c#.

\(fn BEG END)" t nil)

(autoload 'csharp-db-2-seter-getter "joseph-csharp" "\
generate setter getter depends on db

\(fn BEG END)" t nil)

;;;***

;;;### (autoloads (dired-ediff dired-add-to-load-path-or-load-it
;;;;;;  dired-end-of-buffer dired-begining-of-buffer helm-dired dired-name-filter-only-show-matched-lines)
;;;;;;  "joseph-dired-lazy" "../joseph/joseph-dired-lazy.el" (20343
;;;;;;  1546 15351 310000))
;;; Generated autoloads from ../joseph/joseph-dired-lazy.el

(autoload 'dired-name-filter-only-show-matched-lines "joseph-dired-lazy" "\


\(fn FILTER-REGEXP)" t nil)

(autoload 'helm-dired "joseph-dired-lazy" "\
call `helm' to show dired history and files in current buffers.

\(fn)" t nil)

(autoload 'dired-begining-of-buffer "joseph-dired-lazy" "\


\(fn)" t nil)

(autoload 'dired-end-of-buffer "joseph-dired-lazy" "\


\(fn)" t nil)

(autoload 'dired-add-to-load-path-or-load-it "joseph-dired-lazy" "\
on `dired-mode',if thing under point is directory add it to `load-path'
if it is a el-file ,then `load' it

\(fn)" t nil)

(autoload 'dired-ediff "joseph-dired-lazy" "\
在dired buffer中,如果mark了两个文件,则对此二文件进行diff
,如果仅mark了一个文件,则将其作为其中之一,另一个文件名则让用户选择,默认是光标下的文件
,如果没有mark任何文件,以当前文件作其一,另一,让用户选择.
默认使用ediff进行比较,`C-u'则使用diff

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (my-erlang-insert-edoc) "joseph-erlang" "../joseph/joseph-erlang.el"
;;;;;;  (20602 54012 693802 845000))
;;; Generated autoloads from ../joseph/joseph-erlang.el

(autoload 'my-erlang-insert-edoc "joseph-erlang" "\
Insert edoc.

\(fn)" t nil)

;;;***

;;;### (autoloads (eshell/clear toggle-e-zsh toggle-e-zsh-cd toggle-e-bash
;;;;;;  toggle-e-bash-cd) "joseph-eshell" "../joseph/joseph-eshell.el"
;;;;;;  (20522 30757 278727 553000))
;;; Generated autoloads from ../joseph/joseph-eshell.el

(autoload 'toggle-e-bash-cd "joseph-eshell" "\


\(fn &optional ARG DIR)" t nil)

(autoload 'toggle-e-bash "joseph-eshell" "\


\(fn &optional ARG DIR)" t nil)

(autoload 'toggle-e-zsh-cd "joseph-eshell" "\


\(fn &optional ARG DIR)" t nil)

(autoload 'toggle-e-zsh "joseph-eshell" "\


\(fn &optional ARG DIR)" t nil)

(autoload 'eshell/clear "joseph-eshell" "\
04Dec2001 - sailor, to clear the eshell buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads (apply-args-to-fun apply-args-list-to-fun) "joseph-faces"
;;;;;;  "../joseph/joseph-faces.el" (20322 8215 972275 942000))
;;; Generated autoloads from ../joseph/joseph-faces.el

(autoload 'apply-args-list-to-fun "joseph-faces" "\
Apply args list to function FUN-LIST.
FUN-LIST can be a symbol, also can be a list whose element is a symbol.

\(fn FUN-LIST ARGS-LIST)" nil nil)

(autoload 'apply-args-to-fun "joseph-faces" "\
Apply args to function FUN.

\(fn FUN ARGS)" nil nil)

;;;***

;;;### (autoloads (get-system-file-path joseph-delete-matched-files
;;;;;;  joseph-all-subdirs-under-dir-without-borring-dirs all-files-under-dir-recursively)
;;;;;;  "joseph-file-util" "../joseph-file-util/joseph-file-util.el"
;;;;;;  (20116 10055 633563 950000))
;;; Generated autoloads from ../joseph-file-util/joseph-file-util.el

(autoload 'all-files-under-dir-recursively "joseph-file-util" "\
return all files matched `include-regexp' under directory `dir' recursively.
if `include-regexp' is nil ,return all.
when `include-regexp-absolute-path-p' is nil or omited ,filename is used to match `include-regexp'
when `include-regexp-absolute-path-p' is t then full file path is used to match `include-regexp'
when `exclude-regexp-absolute-path-p' is nil or omited ,filename is used to match `exclude-regexp'
when `exclude-regexp-absolute-path-p' is t then full file path is used to match `exclude-regexp'

\(fn DIR &optional INCLUDE-REGEXP INCLUDE-REGEXP-ABSOLUTE-PATH-P EXCLUDE-REGEX EXCLUDE-REGEX-ABSOLUTE-P)" nil nil)

(autoload 'joseph-all-subdirs-under-dir-without-borring-dirs "joseph-file-util" "\
return all sub directories under `dir' exclude those borring directory.

\(fn DIR)" nil nil)

(autoload 'joseph-delete-matched-files "joseph-file-util" "\
delete matched files from `files' the new list of files
will be returned ,`files' is a list of file or directory.
when `absolute-path-p' is nil,
the name of file is used to match the `pattern',
 if not , only the absolute path of file is used.

\(fn FILES PATTERN &optional ABSOLUTE-PATH-P)" nil nil)

(autoload 'get-system-file-path "joseph-file-util" "\
when on windows `expand-file-name' will translate from \\ to /
some times it is not needed . then this function is used to translate /
to \\ when on windows

\(fn FILE-PATH)" nil nil)

;;;***

;;;### (autoloads (mysql-mode) "joseph-mysql" "../joseph/joseph-mysql.el"
;;;;;;  (20247 63755 84716 319000))
;;; Generated autoloads from ../joseph/joseph-mysql.el

(autoload 'mysql-mode "joseph-mysql" "\
mysql mode

\(fn)" t nil)

(defadvice sql-mysql (around start-mysql-complete-minor-mode activate) "\
enable `mysql-complete-minor-mode' minor mode." ad-do-it (mysql-complete-minor-mode))

;;;***

;;;### (autoloads (oracle-mode) "joseph-oracle" "../joseph/joseph-oracle.el"
;;;;;;  (20088 29421 109850 861000))
;;; Generated autoloads from ../joseph/joseph-oracle.el

(autoload 'oracle-mode "joseph-oracle" "\
start oracle in sqlplus-mode

\(fn)" t nil)

;;;***

;;;### (autoloads (surround-css-with-style-type read-file-as-var
;;;;;;  publish-my-note-src publish-my-note-html publish-my-note
;;;;;;  publish-my-note-force) "joseph-org-publish" "../joseph/joseph-org-publish.el"
;;;;;;  (20370 51794 772593 402000))
;;; Generated autoloads from ../joseph/joseph-org-publish.el

(autoload 'publish-my-note-force "joseph-org-publish" "\


\(fn)" t nil)

(autoload 'publish-my-note "joseph-org-publish" "\
发布我的`note'笔记

\(fn)" t nil)

(autoload 'publish-my-note-html "joseph-org-publish" "\
发布我的`note'笔记

\(fn)" t nil)

(autoload 'publish-my-note-src "joseph-org-publish" "\
这个直接把我的org 文件copy 到相应的目录，所以不需要`include-diffenert-org-in-different-level'
这个hook,因为它会修改org 的文件，如果这样的话copy 过去的文件就不是原始文件了。

\(fn)" t nil)

(autoload 'read-file-as-var "joseph-org-publish" "\
read file content and return it as string

\(fn FILE-NAME)" nil nil)

(autoload 'surround-css-with-style-type "joseph-org-publish" "\
read css file content ,and surround it with <style></style>

\(fn CSS-FILE-NAME)" nil nil)

;;;***

;;;### (autoloads (joseph-scroll-half-screen-up joseph-scroll-half-screen-down)
;;;;;;  "joseph-scroll-screen" "../joseph-scroll-screen/joseph-scroll-screen.el"
;;;;;;  (20268 47531 617383 103000))
;;; Generated autoloads from ../joseph-scroll-screen/joseph-scroll-screen.el

(autoload 'joseph-scroll-half-screen-down "joseph-scroll-screen" "\
scroll half screen down

\(fn)" t nil)

(autoload 'joseph-scroll-half-screen-up "joseph-scroll-screen" "\
scroll half screen up

\(fn)" t nil)

;;;***

;;;### (autoloads (joseph-backward-symbol-or-isearch-regexp-backward
;;;;;;  joseph-forward-symbol-or-isearch-regexp-forward joseph-backward-symbol
;;;;;;  joseph-forward-symbol) "joseph-search-replace" "../joseph/joseph-search-replace.el"
;;;;;;  (20598 56271 438484 923000))
;;; Generated autoloads from ../joseph/joseph-search-replace.el

(autoload 'joseph-forward-symbol "joseph-search-replace" "\
直接搜索当前`symbol',并跳到相应位置

\(fn &optional SYMBOL)" t nil)

(autoload 'joseph-backward-symbol "joseph-search-replace" "\
直接搜索当前`symbol',并跳到相应位置(反向)

\(fn &optional SYMBOL)" t nil)

(autoload 'joseph-forward-symbol-or-isearch-regexp-forward "joseph-search-replace" "\
`C-s' call `isearch-forward-regexp'
`C-uC-s' call `joseph-forward-symbol'
when `mark-active' then use selected text as keyword
`C-s' call `joseph-forward-symbol'
`C-uC-s' call `isearch-forward-regexp'

\(fn &optional PARAM)" t nil)

(autoload 'joseph-backward-symbol-or-isearch-regexp-backward "joseph-search-replace" "\
`C-s' call `joseph-backward-symbol'
`C-uC-s' call `isearch-backward-regexp'
when `mark-active' then use selected text as keyword
`C-s' call `isearch-backward-regexp'
`C-uC-s' call  `joseph-backward-symbol'

\(fn &optional PARAM)" t nil)

;;;***

;;;### (autoloads (cmdproxy toggle-zsh toggle-zsh-cd toggle-bash
;;;;;;  toggle-bash-cd toggle-shell) "joseph-shell" "../joseph/joseph-shell.el"
;;;;;;  (20588 6448 94339 166000))
;;; Generated autoloads from ../joseph/joseph-shell.el

(autoload 'toggle-shell "joseph-shell" "\
Start `bash' shell.

\(fn &optional SHELL-NAME SHELL-BUFFER-NAME)" t nil)

(autoload 'toggle-bash-cd "joseph-shell" "\


\(fn &optional ARG DIR)" t nil)

(autoload 'toggle-bash "joseph-shell" "\


\(fn &optional ARG DIR)" t nil)

(autoload 'toggle-zsh-cd "joseph-shell" "\


\(fn &optional ARG DIR)" t nil)

(autoload 'toggle-zsh "joseph-shell" "\


\(fn &optional ARG DIR)" t nil)

(autoload 'cmdproxy "joseph-shell" "\
Set shell to `cmdproxy'.

\(fn)" t nil)

;;;***

;;;### (autoloads (dired-mouse-find-alternate-file) "joseph-single-dired"
;;;;;;  "../joseph-single-dired/joseph-single-dired.el" (20261 29009
;;;;;;  870097 589000))
;;; Generated autoloads from ../joseph-single-dired/joseph-single-dired.el

(autoload 'dired-mouse-find-alternate-file "joseph-single-dired" "\
In dired, visit the file or directory you click on instead of the dired buffer.

\(fn EVENT)" t nil)

;;;***

;;;### (autoloads (sqlserver-create-table sqlserver-mode) "joseph-sqlserver"
;;;;;;  "../joseph/joseph-sqlserver.el" (20180 60230 775201 722000))
;;; Generated autoloads from ../joseph/joseph-sqlserver.el

(autoload 'sqlserver-mode "joseph-sqlserver" "\
sqlserver mode

\(fn)" t nil)

(defadvice sql-ms (around start-sqlserver-complete-minor-mode activate) "\
enable `sqlserver-complete-minor-mode' minor mode." ad-do-it (sqlserver-complete-minor-mode))

(autoload 'sqlserver-create-table "joseph-sqlserver" "\
做项目的时候用到的自动将excel表格格式的，创建成建表语句。region的格式如上面注释，注意顶格写

\(fn REGION-BEGIN REGION-END)" t nil)

;;;***

;;;### (autoloads (define-key-lazy add-hooks add-auto-mode) "joseph-util"
;;;;;;  "../joseph/joseph-util.el" (20155 59800 386361 620000))
;;; Generated autoloads from ../joseph/joseph-util.el

(autoload 'add-auto-mode "joseph-util" "\


\(fn MODE &rest PATTERNS)" nil nil)

(autoload 'add-hooks "joseph-util" "\
Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.
HOOKS can be one list or just a hook.
将function绑到一个或多个hook上

\(fn HOOKS FUNCTION &optional APPEND LOCAL)" nil nil)

(autoload 'define-key-lazy "joseph-util" "\
define-key in `eval-after-load' block. `feature' is the file name where defined `mode-map'

\(fn MODE-MAP KEY CMD &optional FEATURE)" nil t)

;;;***

;;;### (autoloads (run-vb) "joseph-vb" "../joseph/joseph-vb.el" (20247
;;;;;;  63755 92907 374000))
;;; Generated autoloads from ../joseph/joseph-vb.el

(autoload 'run-vb "joseph-vb" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (erlang-mysql-excel-export) "joseph-ylqf-mysql2excel"
;;;;;;  "../joseph/joseph-ylqf-mysql2excel.el" (20522 32907 783732
;;;;;;  513000))
;;; Generated autoloads from ../joseph/joseph-ylqf-mysql2excel.el

(autoload 'erlang-mysql-excel-export "joseph-ylqf-mysql2excel" "\
generate excel about mysql tables info.

\(fn)" t nil)

;;;***

;;;### (autoloads (toggle-read-only-file-with-sudo) "joseph_sudo"
;;;;;;  "../joseph/joseph_sudo.el" (20431 28677 425404 254000))
;;; Generated autoloads from ../joseph/joseph_sudo.el

(autoload 'toggle-read-only-file-with-sudo "joseph_sudo" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (js2-mode) "js2" "../js2/js2.el" (20050 17837 700669
;;;;;;  990000))
;;; Generated autoloads from ../js2/js2.el
 (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'js2-mode "js2" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

;;;***

;;;### (autoloads (keep-buffers-query) "keep-buffers" "../keep-buffers.el"
;;;;;;  (20122 29904 243505 557000))
;;; Generated autoloads from ../keep-buffers.el

(autoload 'keep-buffers-query "keep-buffers" "\
The query function that disable deletion of buffers we protect.

\(fn)" nil nil)

;;;***

;;;### (autoloads (linkd-wiki-find-page linkd-latex-export linkd-export-default
;;;;;;  linkd-edit-link-at-point linkd-insert-link linkd-insert-lisp
;;;;;;  linkd-insert-wiki linkd-insert-star linkd-insert-tag linkd-insert-single-arg-link
;;;;;;  linkd-previous-link linkd-next-link linkd-follow-at-point
;;;;;;  linkd-back linkd-version) "linkd" "../linkd.el" (20168 60896
;;;;;;  225296 416000))
;;; Generated autoloads from ../linkd.el

(autoload 'linkd-version "linkd" "\
Display Linkd version.

\(fn)" t nil)

(autoload 'linkd-back "linkd" "\
Return to the buffer being viewed before the last link was followed.

\(fn)" t nil)

(autoload 'linkd-follow-at-point "linkd" "\
Follow the link at point.

\(fn)" t nil)

(autoload 'linkd-next-link "linkd" "\
Move point to the next link, if any.

\(fn)" t nil)

(autoload 'linkd-previous-link "linkd" "\
Move point to the previous link, if any.

\(fn)" t nil)

(autoload 'linkd-insert-single-arg-link "linkd" "\
Insert a link containing ARGUMENT.

\(fn TYPE-STRING ARGUMENT)" nil nil)

(autoload 'linkd-insert-tag "linkd" "\
Insert a tag.

\(fn TAG-NAME)" t nil)

(autoload 'linkd-insert-star "linkd" "\
Insert a star.

\(fn STAR-NAME)" t nil)

(autoload 'linkd-insert-wiki "linkd" "\
Insert a wiki link.

\(fn WIKI-NAME)" t nil)

(autoload 'linkd-insert-lisp "linkd" "\
Insert a Lisp sexp.

\(fn SEXP)" t nil)

(autoload 'linkd-insert-link "linkd" "\
Insert a link.
Optional arg TYPE is the link type.
Optional arg CURRENT-VALUES is a property list of current values.

\(fn &optional TYPE CURRENT-VALUES)" t nil)

(autoload 'linkd-edit-link-at-point "linkd" "\
Edit the Linkd link at point.

\(fn)" t nil)

(autoload 'linkd-export-default "linkd" "\
Export the current buffer with default settings to all available formats.

\(fn)" t nil)

(autoload 'linkd-latex-export "linkd" "\
Render a buffer as a LaTeX book chapter.

\(fn)" t nil)

(autoload 'linkd-wiki-find-page "linkd" "\
Find Linkd wiki page named PAGE-NAME.

\(fn PAGE-NAME)" t nil)

;;;***

;;;### (autoloads (magit-status) "magit" "../magit/magit.el" (20598
;;;;;;  51477 962497 143000))
;;; Generated autoloads from ../magit/magit.el

(autoload 'magit-status "magit" "\
Open a Magit status buffer for the Git repository containing
DIR.  If DIR is not within a Git repository, offer to create a
Git repository in DIR.

Interactively, a prefix argument means to ask the user which Git
repository to use even if `default-directory' is under Git control.
Two prefix arguments means to ignore `magit-repo-dirs' when asking for
user input.

\(fn DIR)" t nil)

;;;***

;;;### (autoloads (magit-blame-mode) "magit-blame" "../magit/magit-blame.el"
;;;;;;  (20550 7912 705160 561000))
;;; Generated autoloads from ../magit/magit-blame.el

(autoload 'magit-blame-mode "magit-blame" "\
Display blame information inline.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (turn-on-magit-stgit magit-stgit-mode) "magit-stgit"
;;;;;;  "../magit/magit-stgit.el" (20432 51018 781310 454000))
;;; Generated autoloads from ../magit/magit-stgit.el

(autoload 'magit-stgit-mode "magit-stgit" "\
StGit support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-stgit "magit-stgit" "\
Unconditionally turn on `magit-stgit-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-svn magit-svn-mode) "magit-svn"
;;;;;;  "../magit/magit-svn.el" (20432 51018 781310 454000))
;;; Generated autoloads from ../magit/magit-svn.el

(autoload 'magit-svn-mode "magit-svn" "\
SVN support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-svn "magit-svn" "\
Unconditionally turn on `magit-svn-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-topgit magit-topgit-mode) "magit-topgit"
;;;;;;  "../magit/magit-topgit.el" (20432 51018 781310 454000))
;;; Generated autoloads from ../magit/magit-topgit.el

(autoload 'magit-topgit-mode "magit-topgit" "\
Topgit support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-topgit "magit-topgit" "\
Unconditionally turn on `magit-topgit-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (global-magit-wip-save-mode magit-wip-save-mode
;;;;;;  magit-wip-mode) "magit-wip" "../magit/magit-wip.el" (20574
;;;;;;  63830 323385 889000))
;;; Generated autoloads from ../magit/magit-wip.el

(defvar magit-wip-mode nil "\
Non-nil if Magit-Wip mode is enabled.
See the command `magit-wip-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `magit-wip-mode'.")

(custom-autoload 'magit-wip-mode "magit-wip" nil)

(autoload 'magit-wip-mode "magit-wip" "\
In Magit log buffers; give wip refs a special appearance.

\(fn &optional ARG)" t nil)

(autoload 'magit-wip-save-mode "magit-wip" "\
Magit support for committing to a work-in-progress ref.

When this minor mode is turned on and a file is saved inside a writable
git repository then it is also committed to a special work-in-progress
ref.

\(fn &optional ARG)" t nil)

(defvar global-magit-wip-save-mode nil "\
Non-nil if Global-Magit-Wip-Save mode is enabled.
See the command `global-magit-wip-save-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-magit-wip-save-mode'.")

(custom-autoload 'global-magit-wip-save-mode "magit-wip" nil)

(autoload 'global-magit-wip-save-mode "magit-wip" "\
Toggle Magit-Wip-Save mode in all buffers.
With prefix ARG, enable Global-Magit-Wip-Save mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Magit-Wip-Save mode is enabled in all buffers where
`turn-on-magit-wip-save' would do it.
See `magit-wip-save-mode' for more information on Magit-Wip-Save mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (markdown-mode) "markdown-mode" "../markdown/markdown-mode.el"
;;;;;;  (20343 51741 884922 622000))
;;; Generated autoloads from ../markdown/markdown-mode.el

(autoload 'markdown-mode "markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads (mysql-table2entity-4csharp-interactively mtec-generate-all-classes)
;;;;;;  "mysql-table2entity-4csharp" "../sqlparse/mysql-table2entity-4csharp.el"
;;;;;;  (20287 5696 705193 895000))
;;; Generated autoloads from ../sqlparse/mysql-table2entity-4csharp.el

(autoload 'mtec-generate-all-classes "mysql-table2entity-4csharp" "\


\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'mysql-table2entity-4csharp-interactively "mysql-table2entity-4csharp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (mysql-table2entity-4java-interactively) "mysql-table2entity-4java"
;;;;;;  "../sqlparse/mysql-table2entity-4java.el" (20287 5660 393874
;;;;;;  301000))
;;; Generated autoloads from ../sqlparse/mysql-table2entity-4java.el

(autoload 'mysql-table2entity-4java-interactively "mysql-table2entity-4java" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (mysql-procedure-generate-records) "mysql-table2procedure"
;;;;;;  "../joseph/mysql-table2procedure.el" (20365 30897 362026
;;;;;;  121000))
;;; Generated autoloads from ../joseph/mysql-table2procedure.el

(autoload 'mysql-procedure-generate-records "mysql-table2procedure" "\
generate records from mysql tables

\(fn)" t nil)

;;;***

;;;### (autoloads (erlang-mysql-generate-records) "mysql-table2record-erlang"
;;;;;;  "../sqlparse/mysql-table2record-erlang.el" (20380 47711 822037
;;;;;;  576000))
;;; Generated autoloads from ../sqlparse/mysql-table2record-erlang.el

(autoload 'erlang-mysql-generate-records "mysql-table2record-erlang" "\
generate records from mysql tables

\(fn)" t nil)

;;;***

;;;### (autoloads (openwith-mode) "openwith" "../dired/openwith.el"
;;;;;;  (20033 19868 461628 20000))
;;; Generated autoloads from ../dired/openwith.el

(defvar openwith-mode nil "\
Non-nil if Openwith mode is enabled.
See the command `openwith-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `openwith-mode'.")

(custom-autoload 'openwith-mode "openwith" nil)

(autoload 'openwith-mode "openwith" "\
Automatically open files with external programs.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (oracle-query oracle-query-close-connection oracle-query-create-connection)
;;;;;;  "oracle-query" "../sqlparse/oracle-query.el" (20242 54707
;;;;;;  700693 491000))
;;; Generated autoloads from ../sqlparse/oracle-query.el

(autoload 'oracle-query-create-connection "oracle-query" "\
create a connection to oracle using sqlplus ,and return the
created process

\(fn CONNECT-STRING)" t nil)

(autoload 'oracle-query-close-connection "oracle-query" "\
close connection.kill oracle process and buffer .

\(fn CONNECTION)" nil nil)

(autoload 'oracle-query "oracle-query" "\
execute sql using `sqlplus' ,and return the result of it.

\(fn SQL &optional ORACLE-QUERY-CONNECTION)" nil nil)

;;;***

;;;### (autoloads (oracle-table2entity-4csharp-interactively otec-generate-all-classes)
;;;;;;  "oracle-table2entity-4csharp" "../sqlparse/oracle-table2entity-4csharp.el"
;;;;;;  (20242 64199 727947 513000))
;;; Generated autoloads from ../sqlparse/oracle-table2entity-4csharp.el

(autoload 'otec-generate-all-classes "oracle-table2entity-4csharp" "\


\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'oracle-table2entity-4csharp-interactively "oracle-table2entity-4csharp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (oracle-table2entity-4java-interactively otej-generate-all-classes)
;;;;;;  "oracle-table2entity-4java" "../sqlparse/oracle-table2entity-4java.el"
;;;;;;  (20287 5512 327943 600000))
;;; Generated autoloads from ../sqlparse/oracle-table2entity-4java.el

(autoload 'otej-generate-all-classes "oracle-table2entity-4java" "\


\(fn PACKAGE SAVEPATH)" nil nil)

(autoload 'oracle-table2entity-4java-interactively "oracle-table2entity-4java" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (popwin:messages popwin:find-file-tail popwin:find-file
;;;;;;  popwin:popup-buffer-tail popwin:one-window popwin:universal-display
;;;;;;  popwin:pop-to-buffer popwin:display-last-buffer popwin:display-buffer
;;;;;;  popwin:popup-buffer) "popwin" "../popwin-el/popwin.el" (20550
;;;;;;  7940 635910 106000))
;;; Generated autoloads from ../popwin-el/popwin.el

(autoload 'popwin:popup-buffer "popwin" "\
Show BUFFER in a popup window and return the popup window. If
NOSELECT is non-nil, the popup window will not be selected. If
STICK is non-nil, the popup window will be stuck. If TAIL is
non-nil, the popup window will show the last contents. Calling
`popwin:popup-buffer' during `popwin:popup-buffer' is allowed. In
that case, the buffer of the popup window will be replaced with
BUFFER.

\(fn BUFFER &key (width popwin:popup-window-width) (height popwin:popup-window-height) (position popwin:popup-window-position) NOSELECT DEDICATED STICK TAIL)" t nil)

(autoload 'popwin:display-buffer "popwin" "\
Display BUFFER-OR-NAME, if possible, in a popup window, or as
usual. This function can be used as a value of
`display-buffer-function'.

\(fn BUFFER-OR-NAME &optional NOT-THIS-WINDOW)" t nil)

(autoload 'popwin:display-last-buffer "popwin" "\
Display the lastly shown buffer by `popwin:display-buffer' and
`popwin:special-display-popup-window'.

\(fn)" t nil)

(autoload 'popwin:pop-to-buffer "popwin" "\
Same as `pop-to-buffer' except that this function will use
`popwin:display-buffer-1' instead of `display-buffer'.

\(fn BUFFER &optional OTHER-WINDOW NORECORD)" t nil)

(autoload 'popwin:universal-display "popwin" "\
Call the following command interactively with letting
`popwin:special-display-config' be
`popwin:universal-display-config'. This wil be useful when
displaying buffers in popup windows temporarily.

\(fn)" t nil)

(autoload 'popwin:one-window "popwin" "\
Delete other window than the popup window. C-g restores the
original window configuration.

\(fn)" t nil)

(autoload 'popwin:popup-buffer-tail "popwin" "\
Same as `popwin:popup-buffer' except that the buffer will be
`recenter'ed at the bottom.

\(fn &rest SAME-AS-POPWIN:POPUP-BUFFER)" t nil)

(autoload 'popwin:find-file "popwin" "\
Edit file FILENAME with popup window by `popwin:popup-buffer'.

\(fn FILENAME &optional WILDCARDS)" t nil)

(autoload 'popwin:find-file-tail "popwin" "\
Edit file FILENAME with popup window by
`popwin:popup-buffer-tail'.

\(fn FILE &optional WILDCARD)" t nil)

(autoload 'popwin:messages "popwin" "\
Display *Messages* buffer in a popup window.

\(fn)" t nil)

;;;***

;;;### (autoloads (protobuf-mode) "protobuf-mode" "../protobuf-mode.el"
;;;;;;  (20572 33721 204968 504000))
;;; Generated autoloads from ../protobuf-mode.el
 (add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

(autoload 'protobuf-mode "protobuf-mode" "\
Major mode for editing Protocol Buffers description language.

The hook `c-mode-common-hook' is run with no argument at mode
initialization, then `protobuf-mode-hook'.

Key bindings:
\\{protobuf-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (svn-status svn-checkout) "psvn" "../psvn.el" (20122
;;;;;;  29904 470755 811000))
;;; Generated autoloads from ../psvn.el

(autoload 'svn-checkout "psvn" "\
Run svn checkout REPOS-URL PATH.

\(fn REPOS-URL PATH)" t nil)
 (defalias 'svn-examine 'svn-status)

(autoload 'svn-status "psvn" "\
Examine the status of Subversion working copy in directory DIR.
If ARG is -, allow editing of the parameters. One could add -N to
run svn status non recursively to make it faster.
For every other non nil ARG pass the -u argument to `svn status', which
asks svn to connect to the repository and check to see if there are updates
there.

If there is no .svn directory, examine if there is CVS and run
`cvs-examine'. Otherwise ask if to run `dired'.

\(fn DIR &optional ARG)" t nil)

;;;***

;;;### (autoloads (rebase-mode) "rebase-mode" "../magit/rebase-mode.el"
;;;;;;  (20432 51018 780317 578000))
;;; Generated autoloads from ../magit/rebase-mode.el

(autoload 'rebase-mode "rebase-mode" "\
Major mode for editing of a Git rebase file.

Rebase files are generated when you run 'git rebase -i' or run
`magit-interactive-rebase'.  They describe how Git should perform
the rebase.  See the documentation for git-rebase (e.g., by
running 'man git-rebase' at the command line) for details.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("git-rebase-todo" . rebase-mode))

;;;***

;;;### (autoloads (rm-mouse-drag-region rm-kill-ring-save rm-kill-region
;;;;;;  rm-exchange-point-and-mark rm-set-mark rm-example-picture-mode-bindings)
;;;;;;  "rect-mark" "../rect-mark.el" (20122 29874 770796 214000))
;;; Generated autoloads from ../rect-mark.el
 (define-key ctl-x-map "r\C-@" 'rm-set-mark)
 (define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
 (define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
 (define-key ctl-x-map "r\C-w" 'rm-kill-region)
 (define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
 (define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)

(autoload 'rm-example-picture-mode-bindings "rect-mark" "\
Example rect-mark keyboard and mouse bindings for picture mode.

\(fn)" nil nil)

(autoload 'rm-set-mark "rect-mark" "\
Set mark like `set-mark-command' but anticipates a rectangle.
This arranges for the rectangular region between point and mark
to be highlighted using the same face that is used to highlight
the region in `transient-mark-mode'.  This special state lasts only
until the mark is deactivated, usually by executing a text-modifying
command like \\[kill-rectangle], by inserting text, or by typing \\[keyboard-quit].

With optional argument FORCE, arrange for tabs to be expanded and
for spaces to inserted as necessary to keep the region perfectly
rectangular.  This is the default in `picture-mode'.

\(fn FORCE)" t nil)

(autoload 'rm-exchange-point-and-mark "rect-mark" "\
Like `exchange-point-and-mark' but treats region as a rectangle.
See `rm-set-mark' for more details.

With optional argument FORCE, tabs are expanded and spaces are
inserted as necessary to keep the region perfectly rectangular.
This is the default in `picture-mode'.

\(fn FORCE)" t nil)

(autoload 'rm-kill-region "rect-mark" "\
Like kill-rectangle except the rectangle is also saved in the kill ring.
Since rectangles are not ordinary text, the killed rectangle is saved
in the kill ring as a series of lines, one for each row of the rectangle.
The rectangle is also saved as the killed rectangle so it is available for
insertion with yank-rectangle.

\(fn START END)" t nil)

(autoload 'rm-kill-ring-save "rect-mark" "\
Copies the region like rm-kill-region would but the rectangle isn't killed.

\(fn START END)" t nil)

(autoload 'rm-mouse-drag-region "rect-mark" "\
Highlight a rectangular region of text as the the mouse is dragged over it.
This must be bound to a button-down mouse event.

\(fn START-EVENT)" t nil)

;;;***

;;;### (autoloads (sqlparser-mysql-complete mysql-complete-minor-mode)
;;;;;;  "sqlparser-mysql-complete" "../sqlparse/sqlparser-mysql-complete.el"
;;;;;;  (20322 9721 982524 928000))
;;; Generated autoloads from ../sqlparse/sqlparser-mysql-complete.el

(autoload 'mysql-complete-minor-mode "sqlparser-mysql-complete" "\
mode for editing mysql script

\(fn &optional ARG)" t nil)

(autoload 'sqlparser-mysql-complete "sqlparser-mysql-complete" "\
complete tablename or column name depending on current point position .
when you first call this command ,it will ask you for the dbname ,user ,password
host and port. the info will be stored in `mysql-connection-4-complete'. it can be
reused . with `C-u' you can change the dbname.
with `C-uC-u' you can use another new mysql connection

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (sqlparser-oracle-complete oracle-complete-minor-mode)
;;;;;;  "sqlparser-oracle-complete" "../sqlparse/sqlparser-oracle-complete.el"
;;;;;;  (20322 9871 635274 824000))
;;; Generated autoloads from ../sqlparse/sqlparser-oracle-complete.el

(autoload 'oracle-complete-minor-mode "sqlparser-oracle-complete" "\
mode for editing oracle script

\(fn &optional ARG)" t nil)

(autoload 'sqlparser-oracle-complete "sqlparser-oracle-complete" "\
complete tablename or column name depending on current point
position . with `C-u',use a new connection string to complete.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (helm-sqlserver-complete sqlparser-sqlserver-complete
;;;;;;  sqlserver-complete-minor-mode) "sqlparser-sqlserver-complete"
;;;;;;  "../sqlparse/sqlparser-sqlserver-complete.el" (20322 9765
;;;;;;  88277 687000))
;;; Generated autoloads from ../sqlparse/sqlparser-sqlserver-complete.el

(autoload 'sqlserver-complete-minor-mode "sqlparser-sqlserver-complete" "\
mode for editing sqlserver script

\(fn &optional ARG)" t nil)

(autoload 'sqlparser-sqlserver-complete "sqlparser-sqlserver-complete" "\
complete tablename or column name depending on current point
position .

\(fn)" t nil)

(autoload 'helm-sqlserver-complete "sqlparser-sqlserver-complete" "\
call `helm' to complete tablename and column name for sqlserver.

\(fn)" t nil)

;;;***

;;;### (autoloads (sqlserver-query sqlserver-query-with-heading sqlserver-query-close-connection)
;;;;;;  "sqlserver-query" "../sqlparse/sqlserver-query.el" (20242
;;;;;;  54793 373695 157000))
;;; Generated autoloads from ../sqlparse/sqlserver-query.el

(autoload 'sqlserver-query-close-connection "sqlserver-query" "\
close connection.kill sqlserver process and buffer .

\(fn CONNECTION)" nil nil)

(autoload 'sqlserver-query-with-heading "sqlserver-query" "\
execute sql using `sqlcmd' or `osql' ,and return the result of it.
the `car' of result is heading

\(fn SQL &optional SQLSERVER-QUERY-CONNECTION)" nil nil)

(autoload 'sqlserver-query "sqlserver-query" "\
execute sql using `sqlcmd' or `osql' ,and return the result of it.

\(fn SQL &optional SQLSERVER-QUERY-CONNECTION)" nil nil)

;;;***

;;;### (autoloads (sqlserver-table2entity-4csharp-interactively sstec-generate-all-classes)
;;;;;;  "sqlserver-table2entity-4csharp" "../sqlparse/sqlserver-table2entity-4csharp.el"
;;;;;;  (20242 54805 401692 570000))
;;; Generated autoloads from ../sqlparse/sqlserver-table2entity-4csharp.el

(autoload 'sstec-generate-all-classes "sqlserver-table2entity-4csharp" "\


\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'sqlserver-table2entity-4csharp-interactively "sqlserver-table2entity-4csharp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (sqlserver-table2entity-4java-interactively stej-generate-all-classes)
;;;;;;  "sqlserver-table2entity-4java" "../sqlparse/sqlserver-table2entity-4java.el"
;;;;;;  (20287 5780 190192 978000))
;;; Generated autoloads from ../sqlparse/sqlserver-table2entity-4java.el

(autoload 'stej-generate-all-classes "sqlserver-table2entity-4java" "\


\(fn PACKAGE SAVEPATH)" nil nil)

(autoload 'sqlserver-table2entity-4java-interactively "sqlserver-table2entity-4java" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (kill-ring-save-dwim kill-region-dwim upward-mark-thing
;;;;;;  mark-thing copy-thing kill-thing) "thingopt" "../thingopt-el/thingopt.el"
;;;;;;  (20319 8903 128679 241000))
;;; Generated autoloads from ../thingopt-el/thingopt.el

(autoload 'kill-thing "thingopt" "\


\(fn THING)" t nil)

(autoload 'copy-thing "thingopt" "\


\(fn THING)" t nil)

(autoload 'mark-thing "thingopt" "\


\(fn THING)" t nil)

(autoload 'upward-mark-thing "thingopt" "\


\(fn)" t nil)

(autoload 'kill-region-dwim "thingopt" "\


\(fn)" t nil)

(autoload 'kill-ring-save-dwim "thingopt" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (visual-basic-mode) "visual-basic-mode" "../visual-basic-mode.el"
;;;;;;  (20237 43699 344268 94000))
;;; Generated autoloads from ../visual-basic-mode.el

(autoload 'visual-basic-mode "visual-basic-mode" "\
A mode for editing Microsoft Visual Basic programs.
Features automatic indentation, font locking, keyword capitalization,
and some minor convenience functions.
Commands:
\\{visual-basic-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (windresize) "windresize" "../windresize.el" (20170
;;;;;;  12202 961080 7000))
;;; Generated autoloads from ../windresize.el

(autoload 'windresize "windresize" "\
Resize windows interactively.
INCREMENT is the number of lines by which borders should move.

By default, the method for resizing is by moving the borders.
The left/right key will move the only movable vertical border to
the left/right and the up/down key will move the only horizontal
movable border up/down.  If there are two movable borders, the
right and the bottom border will have priority over the left and
upper border.  You can reverse this priority by using \\[windresize-left-force-left],
\\[windresize-right-force-left], etc.

Resizing can also be done by increasing/decreasing the window
width and height.  The up and down arrow keys will enlarge or
shrink the window vertically and the right and left arrow keys
will enlarge or shrink the window horizontally.

You can toggle the method with \\[windresize-toggle-method].

You can set the number of line by which a border should move by
calling \\[windresize-set-increment] with a numeric prefix.
You can temporarily negate the number of lines by which the
windows are resized by using \\[windresize-left-minus], \\[windresize-right-minus], etc.
If you want to permanently negate this increment value,
use `\\[windresize-negate-increment]' instead.

You can also save window configurations with `\\[windresize-save-window-configuration]' in a ring,
and restore them with `\\[windresize-restore-window-configuration]'.

`\\[windresize-cancel-and-quit]' will quit `windresize' and cancel any change.  `\\[windresize-exit]'
will set the new window configuration and exit.

\\{windresize-map}

\(fn &optional INCREMENT)" t nil)

;;;***

;;;### (autoloads (xahk-mode) "xahk-mode" "../xahk-mode.el" (20268
;;;;;;  45779 168368 278000))
;;; Generated autoloads from ../xahk-mode.el

(autoload 'xahk-mode "xahk-mode" "\
Major mode for editing AutoHotKey script (AHK).

Shortcuts             Command Name
\\[comment-dwim]       `comment-dwim'

\\[xahk-complete-symbol]      `xahk-complete-symbol'

\\[xahk-lookup-ahk-ref]     `xahk-lookup-ahk-ref'

Complete documentation at URL `http://xahlee.org/mswin/emacs_autohotkey_mode.html'.

\(fn)" t nil)

;;;***

;;;### (autoloads (yas-global-mode yas-minor-mode) "yasnippet" "../yasnippet-0.6.1c/yasnippet.el"
;;;;;;  (20580 24304 181547 277000))
;;; Generated autoloads from ../yasnippet-0.6.1c/yasnippet.el

(autoload 'yas-minor-mode "yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, the `yas-trigger-key' key expands
snippets of code depending on the major mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

You can customize the key through `yas-trigger-key'.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet" nil)

(autoload 'yas-global-mode "yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

;;;***

(provide 'joseph-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; joseph-loaddefs.el ends here
