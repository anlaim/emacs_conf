;;; joseph-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ace-jump-mode) "ace-jump-mode" "../ace-jump-mode/ace-jump-mode.el"
;;;;;;  (20386 40218))
;;; Generated autoloads from ../ace-jump-mode/ace-jump-mode.el

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
;;;;;;  (20430 14492))
;;; Generated autoloads from ../ajc-java-complete/ajc-java-complete.el

(autoload 'ajc-reload "ajc-java-complete" "\
restart Auto Java Complete ,when your tag file changed,
you can use this function restart AutoJavaComplete

\(fn)" t nil)

(defalias 'auto-java-complete-reload 'ajc-reload)

;;;***

;;;### (autoloads (ajc-4-jsp-find-file-hook ajc-java-complete-mode)
;;;;;;  "ajc-java-complete-config" "../ajc-java-complete/ajc-java-complete-config.el"
;;;;;;  (20432 50921))
;;; Generated autoloads from ../ajc-java-complete/ajc-java-complete-config.el

(autoload 'ajc-java-complete-mode "ajc-java-complete-config" "\
AutoJavaComplete mode

\(fn &optional ARG)" t nil)

(defalias 'auto-java-complete-mode 'ajc-java-complete-mode)

(autoload 'ajc-4-jsp-find-file-hook "ajc-java-complete-config" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (android-mode) "android-mode" "../android-mode/android-mode.el"
;;;;;;  (20120 14304))
;;; Generated autoloads from ../android-mode/android-mode.el

(autoload 'android-mode "android-mode" "\
Android application development minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (batch-mode) "batch-mode" "../batch-mode.el" (20143
;;;;;;  54196))
;;; Generated autoloads from ../batch-mode.el

(autoload 'batch-mode "batch-mode" "\
Major mode for editing batch scripts.

\(fn)" t nil)

;;;***

;;;### (autoloads (command-log-mode) "command-log-mode" "../command-log-mode/command-log-mode.el"
;;;;;;  (20319 3833))
;;; Generated autoloads from ../command-log-mode/command-log-mode.el

(autoload 'command-log-mode "command-log-mode" "\
Toggle keyboard command logging.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (compile-dwim-run compile-dwim-compile compile-dwim-alist)
;;;;;;  "compile-dwim" "../compile-dwim.el" (20122 29903))
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
;;;;;;  "../csharp-mode/csharp-mode-0.8.5.el" (20049 12868))
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

;;;### (autoloads (ctags-update-minor-mode ctags-update) "ctags-update"
;;;;;;  "../helm-etags-plus/ctags-update.el" (20323 14244))
;;; Generated autoloads from ../helm-etags-plus/ctags-update.el

(autoload 'ctags-update "ctags-update" "\
update TAGS in parent directory using `exuberant-ctags' you
can call this function directly , or enable
`ctags-update-minor-mode' or with prefix `C-u' then you can
generate a new TAGS file in directory

\(fn &optional ARGS)" t nil)

(autoload 'ctags-update-minor-mode "ctags-update" "\
auto update TAGS using `exuberant-ctags' in parent directory.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "diff-mode-" "../diff-mode-.el" (20122 29903))
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
;;;;;;  "../dired-filetype-face/dired-filetype-face.el" (20254 22590))
;;; Generated autoloads from ../dired-filetype-face/dired-filetype-face.el

(autoload 'dired-filetype-face-mode-func "dired-filetype-face" "\
this function will be added to `dired-mode-hook'

\(fn)" nil nil)

;;;***

;;;### (autoloads (doremi-increment-color-component doremi-increment-face-fg-color
;;;;;;  doremi-all-faces-fg+ doremi-face-fg-color-name+ doremi-face-fg-hue-stepping-saturation+
;;;;;;  doremi-face-fg+ doremi-increment-face-bg-color doremi-all-faces-bg+
;;;;;;  doremi-face-bg-color-name+ doremi-face-bg-hue-stepping-saturation+
;;;;;;  doremi-face-bg+ doremi-undo-last-face-change doremi-toggle-wrap-color
;;;;;;  doremi-set-foreground-color doremi-increment-foreground-color
;;;;;;  doremi-all-frames-fg+ doremi-fg+ doremi-fg-hue-stepping-saturation+
;;;;;;  doremi-fg-value+ doremi-fg-saturation+ doremi-fg-hue+ doremi-fg-yellow+
;;;;;;  doremi-fg-magenta+ doremi-fg-cyan+ doremi-fg-blue+ doremi-fg-green+
;;;;;;  doremi-fg-red+ doremi-fg-color-name+ doremi-set-background-color
;;;;;;  doremi-increment-background-color doremi-all-frames-bg+ doremi-bg-hue-stepping-saturation+
;;;;;;  doremi-bg+ doremi-bg-value+ doremi-bg-saturation+ doremi-bg-hue+
;;;;;;  doremi-bg-yellow+ doremi-bg-magenta+ doremi-bg-cyan+ doremi-bg-blue+
;;;;;;  doremi-bg-green+ doremi-bg-red+ doremi-bg-color-name+ doremi-undo-last-frame-color-change
;;;;;;  doremi-frame-configs+ doremi-frame-vertically+ doremi-frame-horizontally+
;;;;;;  doremi-frame-height+ doremi-frame-width+ doremi-font+ doremi-frame-font-size+
;;;;;;  doremi-wrap-color-flag doremi-RGB-increment-factor doremi-push-frame-config-for-cmds-flag
;;;;;;  doremi-move-frame-wrap-within-display-flag doremi-frame-config-ring-size
;;;;;;  doremi-frame-commands) "doremi-frm" "../auto-install/doremi-frm.el"
;;;;;;  (20033 26271))
;;; Generated autoloads from ../auto-install/doremi-frm.el

(let ((loads (get 'doremi-frame-commands 'custom-loads))) (if (member '"doremi-frm" loads) nil (put 'doremi-frame-commands 'custom-loads (cons '"doremi-frm" loads))))

(defvar doremi-frame-config-ring-size 20 "\
*Maximum number of stored frame configurations.")

(custom-autoload 'doremi-frame-config-ring-size "doremi-frm" t)

(defvar doremi-move-frame-wrap-within-display-flag t "\
*Non-nil means wrap frame movements within the display.
Commands `doremi-frame-horizontally+' and `doremi-frame-vertically+'
then move the frame back onto the display when it moves off of it.
If nil, you can move the frame as far off the display as you like.")

(custom-autoload 'doremi-move-frame-wrap-within-display-flag "doremi-frm" t)

(defvar doremi-push-frame-config-for-cmds-flag nil "\
*Non-nil means commands that change frame config save it first.
This is done by advising all commands that change frame configuration
when library `doremi-frm.el' is loaded.")

(custom-autoload 'doremi-push-frame-config-for-cmds-flag "doremi-frm" t)

(defvar doremi-RGB-increment-factor 1 "\
*Factor to scale up RGB incrementing for some Do Re Mi functions.
Because RGB incrementing is by nature finer scale than HSV
incrementing, some Do Re Mi commands automatically scale up the
incrementing by this factor, so you need not iterate (cycle) so many
times to see an appreciable change.  When this is the case, it is
noted for the individual function.

The scale factor to use depends on how many hex digits there are in
your color representations.  A scale factor of 16 (and an input
increment of 1) means that, for each RGB component, it is the second
component digit from the right, not the rightmost, that is incremented
with each key press.  A factor of 256 means that the third digit from
the right cycles.  The default value is 1: no scaling.

If the digit that would be cycled is greater than the length of your
color components, then no incrementation occurs.  For example, if the
colors you use have the format #RRGGBB, so that each component has two
hex digits, then a factor of 256 is not appropriate, since it leaves
the component value unchanged (wraparound).  In that case, change the
value.

In general, 256 is good for colors represented as #RRRRGGGGBBBB, 16 is
good for #RRRGGGBBB, and 1 (no scaling) is appropriate for #RRGGBB.

What counts is the color representation you use, not what Emacs can
actually display for your screen.  On most platforms, Emacs can really
only display 8-bit color components, so #RRGGBB is the best it can do.
But you might well have defined your colors using the format
#RRRRGGGGBBBB.  That's OK, and it lets you see information reflecting
a more precise correspondance between RGB codes and color names, but
that extra precision is in fact ignored by Emacs and your display.

Personally, I use the longer format, ##RRRRGGGGBBBB, because I like to
see more info about the colors I use, even though my display cannot
really distinguish that many.  I also use libraries `hexrgb.el' and
`palette.el', and I convert color information between various formats
\(RGB, HSV, color names).  So I prefer to use the finer-grained
format, even though I can't see all the differences it provides.
Thus, I customize this option to 256.

The commands that use this option to scale up incrementing do so for
convenience.  You can always use other commands that perform no such
scaling.  For example, `doremi-bg+' scales RGB, but you can use
`doremi-increment-background-color' instead, for finer tuning.")

(custom-autoload 'doremi-RGB-increment-factor "doremi-frm" t)

(defvar doremi-wrap-color-flag t "\
*Non-nil means wrap color changes around past the max and min.
For example, if non-nil, a current color value has FFFF as the red
component, and the red component is incremented by 1, then the result
has a red component of 0000.  If nil, the same example yields FFFF,
because the red component is already at its maximum.")

(custom-autoload 'doremi-wrap-color-flag "doremi-frm" t)

(defalias 'doremi-font-size+ 'doremi-frame-font-size+)

(autoload 'doremi-frame-font-size+ "doremi-frm" "\
Change font size for FRAME by INCREMENT.
Interactively, INCREMENT is given by the prefix argument.
Optional FRAME parameter defaults to current frame.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'doremi-font+ "doremi-frm" "\
Successively cycle among fonts, choosing by name.
Operates on the current frame. Cycled font list is (x-list-fonts \"*\").

\(fn)" t nil)

(autoload 'doremi-frame-width+ "doremi-frm" "\
Change width of current frame incrementally.
Width of frame FRAME is increased in increments of amount INCREMENT.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'doremi-frame-height+ "doremi-frm" "\
Change height of current frame incrementally.
Height of frame FRAME is increased in increments of amount INCREMENT.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'doremi-frame-horizontally+ "doremi-frm" "\
Move frame left/right incrementally.
Prefix arg is the INCREMENT to move (default value interactively: 10).
FRAME defaults to the selected frame.

Variable `doremi-move-frame-wrap-within-display-flag' controls whether
or not you can move the frame completely off the display. The default
behavior (value `t') is to wrap frame movement around the display.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'doremi-frame-vertically+ "doremi-frm" "\
Move frame up/down incrementally.
Prefix arg is the INCREMENT to move (default value interactively: 10).
FRAME defaults to the selected frame.

Variable `doremi-move-frame-wrap-within-display-flag' controls whether or
not you can move the frame completely off the display. The default
behavior (value `t') is to wrap frame movement around the display.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'doremi-frame-configs+ "doremi-frm" "\
Cycle among frame configurations recorded in `doremi-frame-config-ring'.

\(fn)" t nil)

(autoload 'doremi-undo-last-frame-color-change "doremi-frm" "\
Restore last frame color changed by `doremi-fg+' or `doremi-bg+'.
This acts as a toggle between the last two values.
Optional arg FRAME defaults to the selected frame.
  The last frame-color change must have been to FRAME, or the result
  will likely not be what you expect.
Note: This does not undo changes made by `doremi-all-frames-fg+' or
`doremi-all-frames-bg+'

\(fn &optional FRAME)" t nil)

(autoload 'doremi-bg-color-name+ "doremi-frm" "\
Successively cycle among background colors, choosing by name.
Operates on FRAME, which is the current frame when interactive.

\(fn &optional FRAME INTERACTIVE-P)" t nil)

(autoload 'doremi-bg-red+ "doremi-frm" "\
Change frame background red value incrementally.  See `doremi-bg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-bg-green+ "doremi-frm" "\
Change frame background green value incrementally.  See `doremi-bg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-bg-blue+ "doremi-frm" "\
Change frame background blue value incrementally.  See `doremi-bg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-bg-cyan+ "doremi-frm" "\
Change frame background cyan value incrementally.  See `doremi-bg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-bg-magenta+ "doremi-frm" "\
Change frame background green value incrementally.  See `doremi-bg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-bg-yellow+ "doremi-frm" "\
Change frame background blue value incrementally.  See `doremi-bg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-bg-hue+ "doremi-frm" "\
Change frame background hue incrementally.  See `doremi-bg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(defalias 'doremi-bg-purity+ 'doremi-bg-saturation+)

(autoload 'doremi-bg-saturation+ "doremi-frm" "\
Change frame background color saturation incrementally.
Prefix arg is the INCREMENT to change.  See `doremi-bg+'.

\(fn &optional INCREMENT)" t nil)

(defalias 'doremi-bg-brightness+ 'doremi-bg-value+)

(autoload 'doremi-bg-value+ "doremi-frm" "\
Change frame background brightness (HSV \"value\") incrementally.
Prefix arg is the INCREMENT to change.  See `doremi-bg+'.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-bg+ "doremi-frm" "\
Change FRAME's background color incrementally.
Optional arg FRAME defaults to the selected frame.

You are prompted for the color COMPONENT to increment/decrement (a
character):
  `r' - red
  `g' - green
  `b' - blue
  `h' - hue (basic color)
  `s' - saturation (purity)
  `v' - value (brightness)

  `R' - red, green, and blue, at the same time
  `H' - hue, saturation, and value, at the same time

`R' and `H' increment all components of the respective color spaces,
according to the value of INCREMENT.

You can at any time change, to increment/decrement a different color
component (r, g, b, h, s, v, R, or H).  For example, you can type `r'
and use the arrow keys or mouse wheel to change the red component,
then type `b' and use the arrows or wheel to change the blue
component, and so on, all in the same call to `doremi-bg+'.

Tip: To increment or decrement the cyan, magenta, or yellow component,
     just decrement or increment the red, green, or blue component,
     respectively.  CMY is just the opposite direction from RGB.

INCREMENT is the increment to change.  The value can be a number or a
list of 3 numbers.  The default value is 1.  You can use a prefix
argument to specify a number value.  Otherwise, you are prompted to
input the value.

If the value is a list of 3 numbers, they are used to increment the
individual components red, green, and blue, respectively, as well as
hue, saturation, and value, respectively.  If you change the
component(s) to increment, then the original input INCREMENT is
reapplied.

For example, if INCREMENT is (0.2 -0.5 1.1) and the initial COMPONENT
value is `R', then red is incremented by 0.2, green by -0.5, and blue
by 1.1.  If you then hit `h', hue is incremented by 0.2.  If you then
hit `b', blue is incremented by 1.1.

For RGB, INCREMENT is actually multiplied by
`doremi-RGB-increment-factor', for convenience.  If you need finer
control than that provides, use command
`doremi-increment-background-color' to refine the color.  If it seems
that no incrementing occurs, then reduce
`doremi-RGB-increment-factor'.

The initial color value is converted to a hexadecimal RGB (red, green,
blue) string that starts with \"#\".  The initial value is the current
background color of the selected frame.

If `eyedrop-picked-background' is non-nil and you use plain `C-u'
instead of a numeric prefix argument (or, non-interactively, PICKUP-P
is non-nil), then the frame background is first set to the value of
`eyedrop-picked-background'.  This happens only if library
`eyedropper.el' or `palette.el' is loaded.  This lets you pick up a
background color from somewhere, using `eyedrop-pick-background-at-*',
and then use that as the initial value for `doremi-bg+'.

Colors can be expressed in Emacs as color names or hex RGB strings.
Depending on your operating system, the RGB components for a given
Emacs color can have different numbers of hex digits.  For example, on
one system RGB component values might vary from 000 to FFF; on another
system they might vary from 0000 to FFFF.  Incrementing or
decrementing a given color's RGB spec makes it roll over when the
limit (say 000 or FFF) is reached.

As for all Do Re Mi incrementation commands, use
`doremi-boost-up-keys' and `doremi-boost-down-keys' for faster
incrementation.  The change is `doremi-boost-scale-factor' times
faster than for `doremi-up-keys' and `doremi-down-keys'.

\(fn COMPONENT &optional INCREMENT FRAME PICKUP-P INTERACTIVE-P)" t nil)

(autoload 'doremi-bg-hue-stepping-saturation+ "doremi-frm" "\
Increment frame background hue, stepping saturation down after each cycle.
Repeatedly increment hue until it reaches its maximum.  Then increment
saturation once.  Then repeatedly increment hue again - and so on.

You can think of this as moving along a row of the hue x saturation
color plane, then down to the next row and across, and so on.

See `doremi-bg+' for more info (e.g. other args).

\(fn &optional INCREMENT FRAME PICKUP-P INTERACTIVE-P)" t nil)

(autoload 'doremi-all-frames-bg+ "doremi-frm" "\
Change background color of all visible frames incrementally.
You are prompted for the color COMPONENT to increment.
Prefix arg is the INCREMENT to change; the default value is 1.

See command `doremi-bg+'.  This command behaves similarly, but it
changes the background color of all frames, not just one frame.

NOTE: You cannot use `C-g' to cancel and revert changes you make using
this command, and you cannot use `doremi-undo-last-frame-color-change'
to undo changes.  (There is no single initial color to revert to,
since multiple frames are affected.)

For RGB, INCREMENT is multiplied by `doremi-RGB-increment-factor', for
convenience.  If you need finer control than that provides, use
command `doremi-increment-background-color' to refine the color.  If
it seems that no incrementing occurs, then reduce
`doremi-RGB-increment-factor'.

Option `doremi-wrap-color-flag' is bound to nil during this command,
which means that an individual color change stops when the limit is
reached.

\(fn COMPONENT INCREMENT)" t nil)

(autoload 'doremi-increment-background-color "doremi-frm" "\
Change frame background color by INCREMENT of color COMPONENT.
You are prompted for the color COMPONENT to increment/decrement.
COMPONENT and INCREMENT are as for `doremi-increment-color'.
Optional arg FRAME defaults to the selected frame.  See `doremi-bg+'.

\(fn COMPONENT INCREMENT &optional FRAME INTERACTIVE-P)" t nil)

(autoload 'doremi-set-background-color "doremi-frm" "\
Set the background color of the FRAME to COLOR-NAME.
When called interactively, prompt for the name of the color to use.
To get the frame's current background color, use `frame-parameters'.
This is the same as `set-background-color', except that this accepts a
FRAME parameter.

\(fn COLOR-NAME &optional FRAME INTERACTIVE-P)" t nil)

(autoload 'doremi-fg-color-name+ "doremi-frm" "\
Successively cycle among foreground colors, choosing by name.
Operates on FRAME, which is the current frame when interactive.

\(fn &optional FRAME INTERACTIVE-P)" t nil)

(autoload 'doremi-fg-red+ "doremi-frm" "\
Change frame foreground red value incrementally.  See `doremi-fg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-fg-green+ "doremi-frm" "\
Change frame foreground green value incrementally.  See `doremi-fg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-fg-blue+ "doremi-frm" "\
Change frame foreground blue value incrementally.  See `doremi-fg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-fg-cyan+ "doremi-frm" "\
Change frame foreground cyan value incrementally.  See `doremi-fg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-fg-magenta+ "doremi-frm" "\
Change frame foreground green value incrementally.  See `doremi-fg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-fg-yellow+ "doremi-frm" "\
Change frame foreground blue value incrementally.  See `doremi-fg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-fg-hue+ "doremi-frm" "\
Change frame foreground hue incrementally.  See `doremi-fg+'.
Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(defalias 'doremi-fg-purity+ 'doremi-fg-saturation+)

(autoload 'doremi-fg-saturation+ "doremi-frm" "\
Change frame foreground color saturation incrementally.
See `doremi-fg+'.  Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(defalias 'doremi-fg-brightness+ 'doremi-fg-value+)

(autoload 'doremi-fg-value+ "doremi-frm" "\
Change frame foreground brightness (HSV \"value\") incrementally.
See `doremi-fg+'.  Prefix arg is the INCREMENT to change.

\(fn &optional INCREMENT)" t nil)

(autoload 'doremi-fg-hue-stepping-saturation+ "doremi-frm" "\
Increment frame foreground hue, stepping saturation down after each cycle.
See `doremi-bg-hue-stepping-saturation+'.
`doremi-fg-hue-stepping-saturation+' is the same, with \"foreground\"
substituted for \"background\".

\(fn &optional INCREMENT FRAME PICKUP-P INTERACTIVE-P)" t nil)

(autoload 'doremi-fg+ "doremi-frm" "\
Change FRAME's foreground color incrementally.
See `doremi-bg+'; `doremi-fg+' is the same, with \"foreground\"
substituted for \"background\".

\(fn COMPONENT &optional INCREMENT FRAME PICKUP-P INTERACTIVE-P)" t nil)

(autoload 'doremi-all-frames-fg+ "doremi-frm" "\
Change foreground color of all visible frames incrementally.
You are prompted for the color COMPONENT to increment.
Prefix arg is the INCREMENT to change; the default value is 1.

See command `doremi-fg+'.  This command behaves similarly, but it
changes the foreground color of all frames, not just one frame.

NOTE: You cannot use `C-g' to cancel and revert changes you make using
this command, and you cannot use `doremi-undo-last-frame-color-change'
to undo changes.  (There is no single initial color to revert to,
since multiple frames are affected.)

For RGB, INCREMENT is multiplied by `doremi-RGB-increment-factor', for
convenience.  If you need finer control than this, use command
`doremi-increment-foreground-color' to refine the color.  If it seems
that no incrementing occurs, then reduce
`doremi-RGB-increment-factor'.

Option `doremi-wrap-color-flag' is bound to nil during this command,
which means that an individual color change stops when the limit is
reached.

\(fn COMPONENT INCREMENT)" t nil)

(autoload 'doremi-increment-foreground-color "doremi-frm" "\
Change foreground color of FRAME by INCREMENT of color COMPONENT.
You are prompted for the color COMPONENT to increment/decrement.
COMPONENT and INCREMENT are as for `doremi-increment-color'.
Optional arg FRAME defaults to the selected frame.  See `doremi-bg+'.

\(fn COMPONENT INCREMENT &optional FRAME INTERACTIVE-P)" t nil)

(autoload 'doremi-set-foreground-color "doremi-frm" "\
Set the foreground color of the FRAME to COLOR-NAME.
When called interactively, prompt for the name of the color to use.
To get the frame's current foreground color, use `frame-parameters'.
This is the same as `set-foreground-color', except that this accepts a
FRAME parameter.

\(fn COLOR-NAME &optional FRAME INTERACTIVE-P)" t nil)

(defalias 'toggle-doremi-wrap-color 'doremi-toggle-wrap-color)

(autoload 'doremi-toggle-wrap-color "doremi-frm" "\
Toggle value of `doremi-wrap-color-flag'.

\(fn)" t nil)

(autoload 'doremi-undo-last-face-change "doremi-frm" "\
Return last face changed by `doremi-face-*' to its previous value.
This acts as a toggle between the last two values of the face.
Note: This does not undo changes made by `doremi-all-faces-fg+' or
`doremi-all-faces-bg+'.

\(fn)" t nil)

(autoload 'doremi-face-bg+ "doremi-frm" "\
Change background color of FACE incrementally.
The color is changed on all frames.
You are prompted for the FACE, the color COMPONENT to increment.
Unless you use a prefix argument, you are prompted for the INCREMENT.

See command `doremi-bg+'.  This command behaves the same, except that
it is the background color of FACE that is changed, not the frame
background color.

For RGB, INCREMENT is actually multiplied by
`doremi-RGB-increment-factor', for convenience.  If you need finer
control than this, use command `doremi-increment-face-bg-color' to
refine the color.  If it seems that no incrementing occurs, then
reduce `doremi-RGB-increment-factor'.

If `eyedrop-picked-background' is non-nil and you use plain `C-u'
instead of a numeric prefix argument (or, non-interactively, PICKUP-P
is non-nil), then the face background is first set to the value of
`eyedrop-picked-background'.  This happens only if library
`eyedropper.el' or `palette.el' is loaded.  This lets you pick up a
background color from somewhere, using `eyedrop-pick-background-at-*',
and then use that as the initial value for `doremi-face-bg+'.

\(fn FACE COMPONENT &optional INCREMENT PICKUP-P INTERACTIVE-P)" t nil)

(autoload 'doremi-face-bg-hue-stepping-saturation+ "doremi-frm" "\
Increment FACE background hue, stepping saturation down after each cycle.

See command `doremi-bg-hue-stepping-saturation+'.  This command
behaves the same, except that it is the background color of FACE that
is changed, not the frame background color.
See `doremi-face-bg+' for more info (e.g. other args).

\(fn FACE &optional INCREMENT PICKUP-P INTERACTIVE-P)" t nil)

(autoload 'doremi-face-bg-color-name+ "doremi-frm" "\
Successively cycle among background colors for FACE, choosing by name.
The color is changed on all frames.
You are prompted for the FACE.

See command `doremi-bg-color-name+'.  This command behaves the same,
except that it is the background color of FACE that is changed, not
the frame background color.

\(fn FACE &optional INTERACTIVE-P)" t nil)

(autoload 'doremi-all-faces-bg+ "doremi-frm" "\
Change background color of all faces incrementally, for all frames.
See command `doremi-face-bg+'.  This command behaves similarly, but it
is the background color of all faces that is changed, not one face.

For RGB, INCREMENT is actually multiplied by
`doremi-RGB-increment-factor'.  If you need finer control than this,
use command `doremi-increment-face-bg-color' to refine the color.  If
it seems that no incrementing occurs, then reduce
`doremi-RGB-increment-factor'.

Option `doremi-wrap-color-flag' is bound to nil during this command.

NOTE: You cannot use `C-g' to cancel and revert changes you make using
this command, and you cannot use `doremi-undo-last-face-change' to
undo changes.  (There is no single initial color to revert to, since
multiple faces are affected.)

\(fn COMPONENT INCREMENT)" t nil)

(autoload 'doremi-increment-face-bg-color "doremi-frm" "\
Change background color of FACE by INCREMENT of COMPONENT.
The color is changed on all frames.
You are prompted for the FACE and the color COMPONENT to increment.
COMPONENT and INCREMENT are as for `doremi-increment-color'.

\(fn FACE COMPONENT INCREMENT)" t nil)

(autoload 'doremi-face-fg+ "doremi-frm" "\
Change foreground color of FACE incrementally.
See `doremi-face-bg+'; `doremi-face-fg+' is the same, with
\"foreground\" substituted for \"background\".

\(fn FACE COMPONENT &optional INCREMENT PICKUP-P INTERACTIVE-P)" t nil)

(autoload 'doremi-face-fg-hue-stepping-saturation+ "doremi-frm" "\
Increment FACE background hue, stepping saturation down after each cycle.
See `doremi-face-bg+' for info about the other args.

\(fn FACE &optional INCREMENT PICKUP-P INTERACTIVE-P)" t nil)

(autoload 'doremi-face-fg-color-name+ "doremi-frm" "\
Successively cycle among foreground colors for FACE, choosing by name.
The color is changed on all frames.
You are prompted for the FACE.

See command `doremi-fg-color-name+'.  This command behaves the same,
except that it is the foreground color of FACE that is changed, not
the frame foreground color.

\(fn FACE &optional INTERACTIVE-P)" t nil)

(autoload 'doremi-all-faces-fg+ "doremi-frm" "\
Change foreground color of all faces incrementally, for all frames.
See command `doremi-face-fg+'.  This command behaves similarly, but it
is the foreground color of all faces that is changed, not one face.

For RGB, INCREMENT is actually multiplied by
`doremi-RGB-increment-factor'.  If you need finer control than this,
use command `doremi-increment-face-fg-color' to refine the color.  If
it seems that no incrementing occurs, then reduce
`doremi-RGB-increment-factor'.

Option `doremi-wrap-color-flag' is bound to nil during this command.

NOTE: You cannot use `C-g' to cancel and revert changes you make using
this command, and you cannot use `doremi-undo-last-face-change' to
undo changes.  (There is no single initial color to revert to, since
multiple faces are affected.)

\(fn COMPONENT INCREMENT)" t nil)

(autoload 'doremi-increment-face-fg-color "doremi-frm" "\
Change foreground color of FACE by INCREMENT of COMPONENT.
The color is changed on all frames.
You are prompted for the FACE and the color COMPONENT to increment.
COMPONENT and INCREMENT are as for `doremi-increment-color'.

\(fn FACE COMPONENT INCREMENT)" t nil)

(autoload 'doremi-increment-color-component "doremi-frm" "\
Increase COMPONENT (RGB or HSV) of COLOR by INCREMENT.
Returns a hexadecimal RGB code (a string) for the new color, of the
form #RRRRGGGGBBBB (RRRR: red, GGGG: green, BBBB: blue).

COMPONENT is the color component to increment (a character):
  `r' - red
  `g' - green
  `b' - blue
  `h' - hue (basic color)
  `s' - saturation (purity)
  `v' - value (brightness)
  The default is `h' (hue).
COLOR is a string representing a color.  It can be a color name or a
  hexadecimal RGB string of the form #RRRRGGGGBBBB.
INCREMENT is the increment to increase the value component of COLOR.

\(fn COMPONENT COLOR INCREMENT)" t nil)

;;;***

;;;### (autoloads (inferior-erlang erlang-compile erlang-shell erlang-find-tag-other-window
;;;;;;  erlang-find-tag erlang-mode) "erlang" "../erlang/erlang.el"
;;;;;;  (20316 36277))
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
;;;;;;  erlang-compile-dwim erlang-make erlang-emake erlang-create-project
;;;;;;  erlang-export-current-function) "erlang-dired-mode" "../erlang-dired-mode/erlang-dired-mode.el"
;;;;;;  (20431 28246))
;;; Generated autoloads from ../erlang-dired-mode/erlang-dired-mode.el

(autoload 'erlang-export-current-function "erlang-dired-mode" "\
export current function.

\(fn)" t nil)

(autoload 'erlang-create-project "erlang-dired-mode" "\


\(fn ROOT-DIR)" t nil)

(autoload 'erlang-emake "erlang-dired-mode" "\
run make:all(load) in project root of erlang application,if Emakefile doesn't exists ,call `erlang-compile' instead

\(fn ARG)" t nil)

(autoload 'erlang-make "erlang-dired-mode" "\
run make command at project root directory

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

;;;### (autoloads (etags-table-search-up-depth etags-table-alist
;;;;;;  etags-table) "etags-table" "../etags-table.el" (20122 29904))
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
;;;;;;  (20386 39738))
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
;;;;;;  (20033 19868))
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
;;;;;;  (20122 29904))
;;; Generated autoloads from ../goto-last-change.el

(autoload 'goto-last-change "goto-last-change" "\
Set point to the position of the last change.
Consecutive calls set point to the position of the previous change.
With a prefix arg (optional arg MARK-POINT non-nil), set mark so \\[exchange-point-and-mark]
will return point to the current position.

\(fn &optional MARK-POINT MINIMAL-LINE-DISTANCE)" t nil)

;;;***

;;;### (autoloads (helm-descbinds-install helm-descbinds) "helm-descbinds"
;;;;;;  "../helm-descbinds/helm-descbinds.el" (20335 5854))
;;; Generated autoloads from ../helm-descbinds/helm-descbinds.el

(autoload 'helm-descbinds "helm-descbinds" "\
Yet Another `describe-bindings' with `helm'.

\(fn &optional PREFIX BUFFER)" t nil)

(autoload 'helm-descbinds-install "helm-descbinds" "\
Use `helm-descbinds' as a replacement of `describe-bindings'.

\(fn)" t nil)

;;;***

;;;### (autoloads (helm-dired-history-view helm-dired-history-update)
;;;;;;  "helm-dired-history" "../helm-dired-history/helm-dired-history.el"
;;;;;;  (20323 5481))
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
;;;;;;  (20323 9137))
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

;;;### (autoloads (helm-replace-string helm-replace-string-push-history)
;;;;;;  "helm-replace-string" "../helm-replace-string/helm-replace-string.el"
;;;;;;  (20323 5414))
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

;;;### (autoloads (highlight-parentheses-mode) "highlight-parentheses"
;;;;;;  "../highlight-parentheses.el" (20122 29904))
;;; Generated autoloads from ../highlight-parentheses.el

(autoload 'highlight-parentheses-mode "highlight-parentheses" "\
Minor mode to highlight the surrounding parentheses.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (htmlize-many-files-dired htmlize-many-files htmlize-file
;;;;;;  htmlize-region htmlize-buffer) "htmlize" "../htmlize.el"
;;;;;;  (20122 29904))
;;; Generated autoloads from ../htmlize.el

(autoload 'htmlize-buffer "htmlize" "\
Convert BUFFER to HTML, preserving colors and decorations.

The generated HTML is available in a new buffer, which is returned.
When invoked interactively, the new buffer is selected in the current
window.  The title of the generated document will be set to the buffer's
file name or, if that's not available, to the buffer's name.

Note that htmlize doesn't fontify your buffers, it only uses the
decorations that are already present.  If you don't set up font-lock or
something else to fontify your buffers, the resulting HTML will be
plain.  Likewise, if you don't like the choice of colors, fix the mode
that created them, or simply alter the faces it uses.

\(fn &optional BUFFER)" t nil)

(autoload 'htmlize-region "htmlize" "\
Convert the region to HTML, preserving colors and decorations.
See `htmlize-buffer' for details.

\(fn BEG END)" t nil)

(autoload 'htmlize-file "htmlize" "\
Load FILE, fontify it, convert it to HTML, and save the result.

Contents of FILE are inserted into a temporary buffer, whose major mode
is set with `normal-mode' as appropriate for the file type.  The buffer
is subsequently fontified with `font-lock' and converted to HTML.  Note
that, unlike `htmlize-buffer', this function explicitly turns on
font-lock.  If a form of highlighting other than font-lock is desired,
please use `htmlize-buffer' directly on buffers so highlighted.

Buffers currently visiting FILE are unaffected by this function.  The
function does not change current buffer or move the point.

If TARGET is specified and names a directory, the resulting file will be
saved there instead of to FILE's directory.  If TARGET is specified and
does not name a directory, it will be used as output file name.

\(fn FILE &optional TARGET)" t nil)

(autoload 'htmlize-many-files "htmlize" "\
Convert FILES to HTML and save the corresponding HTML versions.

FILES should be a list of file names to convert.  This function calls
`htmlize-file' on each file; see that function for details.  When
invoked interactively, you are prompted for a list of files to convert,
terminated with RET.

If TARGET-DIRECTORY is specified, the HTML files will be saved to that
directory.  Normally, each HTML file is saved to the directory of the
corresponding source file.

\(fn FILES &optional TARGET-DIRECTORY)" t nil)

(autoload 'htmlize-many-files-dired "htmlize" "\
HTMLize dired-marked files.

\(fn ARG &optional TARGET-DIRECTORY)" t nil)

;;;***

;;;### (autoloads (iedit-mode) "iedit" "../iedit.el" (20296 59851))
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
;;;;;;  (20121 44935))
;;; Generated autoloads from ../joseph/joseph-animate.el

(autoload 'hello "joseph-animate" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (update-directory-autoloads-recursively) "joseph-autoload"
;;;;;;  "../joseph/joseph-autoload.el" (20343 1546))
;;; Generated autoloads from ../joseph/joseph-autoload.el

(autoload 'update-directory-autoloads-recursively "joseph-autoload" "\
update autoload cookies .scanning all directories under
~/.emacs.d/site-lisp/ recursively. to
` ~/.emacs.d/site-lisp/lisp/joseph-loaddefs.el'

\(fn)" t nil)

;;;***

;;;### (autoloads (byte-compile-all-my-el-files joseph_compile_current_el_without_output
;;;;;;  joseph-byte-compile-files-outside) "joseph-byte-compile"
;;;;;;  "../joseph/joseph-byte-compile.el" (20179 29031))
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
;;;;;;  bury-buffer-and-window copy-above-while-same diff-2-ediff
;;;;;;  vc-command log-view-ediff ibuffer-ediff-merge date joseph-goto-line-by-percent
;;;;;;  joseph-comment-dwim-line joseph-backward-4-line joseph-forward-4-line
;;;;;;  scroll-other-window-down-or-next-buffer scroll-other-window-up-or-previous-buffer
;;;;;;  joseph-hide-frame joseph-append-semicolon-at-eol try-joseph-dabbrev-substring
;;;;;;  kill-buffer-or-server-edit joseph-untabify-hook joseph-trailing-whitespace-hook
;;;;;;  joseph-kill-region-or-line just-one-space-or-delete-horizontal-space
;;;;;;  sdcv-to-buffer query-stardict move-forward-paren move-backward-paren
;;;;;;  switch-to-scratch-buffer joseph-jump-to-space-forward kill-syntax-backward
;;;;;;  kill-syntax-forward org-mode-smart-end-of-line smart-end-of-line
;;;;;;  org-mode-smart-beginning-of-line smart-beginning-of-line
;;;;;;  open-line-or-new-line-dep-pos joseph-join-lines goto-match-paren)
;;;;;;  "joseph-command" "../joseph/joseph-command.el" (20324 22023))
;;; Generated autoloads from ../joseph/joseph-command.el

(autoload 'goto-match-paren "joseph-command" "\
Go to the matching paren if on a paren; otherwise insert %.

\(fn ARG)" t nil)

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

(autoload 'joseph-jump-to-space-forward "joseph-command" "\


\(fn)" t nil)

(autoload 'switch-to-scratch-buffer "joseph-command" "\
Toggle between *scratch* buffer and the current buffer.
     If the *scratch* buffer does not exist, create it.

\(fn)" t nil)

(autoload 'move-backward-paren "joseph-command" "\


\(fn)" t nil)

(autoload 'move-forward-paren "joseph-command" "\


\(fn)" t nil)

(autoload 'query-stardict "joseph-command" "\
Serch dict in stardict.

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

(autoload 'joseph-untabify-hook "joseph-command" "\


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

(autoload 'diff-2-ediff "joseph-command" "\
invoke ediff on the context of 2 files in diff-mode

\(fn)" t nil)

(autoload 'copy-above-while-same "joseph-command" "\
Copy from the previous two lines until the first difference.
对前两行：进行对比，复制他们前部相同的部分。在shell中，多用，只有某一个参数不同，
其他都相同。可多次按下

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
;;;;;;  (20192 46413))
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
;;;;;;  1546))
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
;;;;;;  (20383 62421))
;;; Generated autoloads from ../joseph/joseph-erlang.el

(autoload 'my-erlang-insert-edoc "joseph-erlang" "\
Insert edoc.

\(fn)" t nil)

;;;***

;;;### (autoloads (eshell/clear toggle-e-zsh toggle-e-zsh-cd toggle-e-bash
;;;;;;  toggle-e-bash-cd) "joseph-eshell" "../joseph/joseph-eshell.el"
;;;;;;  (20322 8180))
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
;;;;;;  "../joseph/joseph-faces.el" (20322 8215))
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
;;;;;;  (20116 10055))
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

;;;### (autoloads (int-2-binary hex-to-int binary++ hexadecimal++
;;;;;;  decimal++) "joseph-fun4-bin-hex" "../joseph/joseph-fun4-bin-hex.el"
;;;;;;  (20223 56933))
;;; Generated autoloads from ../joseph/joseph-fun4-bin-hex.el

(autoload 'decimal++ "joseph-fun4-bin-hex" "\
Increment the number forward from point by 'arg'.

\(fn &optional ARG)" t nil)

(defalias 'int++ 'decimal++)

(autoload 'hexadecimal++ "joseph-fun4-bin-hex" "\
Increment the number forward from point by 'arg'.

\(fn &optional ARG)" t nil)

(autoload 'binary++ "joseph-fun4-bin-hex" "\
Increment the number forward from point by 'arg'.

\(fn &optional ARG)" t nil)

(autoload 'hex-to-int "joseph-fun4-bin-hex" "\
for example:`(hex-to-int \"af\")'

\(fn HEXSTRING)" nil nil)

(autoload 'int-2-binary "joseph-fun4-bin-hex" "\


\(fn)" t nil)

(defalias 'decimal-2-binary 'int-2-binary)

;;;***

;;;### (autoloads (mysql-mode) "joseph-mysql" "../joseph/joseph-mysql.el"
;;;;;;  (20247 63755))
;;; Generated autoloads from ../joseph/joseph-mysql.el

(autoload 'mysql-mode "joseph-mysql" "\
mysql mode

\(fn)" t nil)

(defadvice sql-mysql (around start-mysql-complete-minor-mode activate) "\
enable `mysql-complete-minor-mode' minor mode." ad-do-it (mysql-complete-minor-mode))

;;;***

;;;### (autoloads (oracle-mode) "joseph-oracle" "../joseph/joseph-oracle.el"
;;;;;;  (20088 29421))
;;; Generated autoloads from ../joseph/joseph-oracle.el

(autoload 'oracle-mode "joseph-oracle" "\
start oracle in sqlplus-mode

\(fn)" t nil)

;;;***

;;;### (autoloads (surround-css-with-style-type read-file-as-var
;;;;;;  publish-my-note-src publish-my-note-html publish-my-note
;;;;;;  publish-my-note-force) "joseph-org-publish" "../joseph/joseph-org-publish.el"
;;;;;;  (20370 51794))
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
;;;;;;  (20268 47531))
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
;;;;;;  (20322 7762))
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
;;;;;;  (20324 43808))
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
;;;;;;  "../joseph-single-dired/joseph-single-dired.el" (20261 29009))
;;; Generated autoloads from ../joseph-single-dired/joseph-single-dired.el

(autoload 'dired-mouse-find-alternate-file "joseph-single-dired" "\
In dired, visit the file or directory you click on instead of the dired buffer.

\(fn EVENT)" t nil)

;;;***

;;;### (autoloads (sqlserver-create-table sqlserver-mode) "joseph-sqlserver"
;;;;;;  "../joseph/joseph-sqlserver.el" (20180 60230))
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
;;;;;;  "../joseph/joseph-util.el" (20155 59800))
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
;;;;;;  63755))
;;; Generated autoloads from ../joseph/joseph-vb.el

(autoload 'run-vb "joseph-vb" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (erlang-mysql-excle-export) "joseph-ylqf-mysql2excel"
;;;;;;  "../joseph/joseph-ylqf-mysql2excel.el" (20357 38727))
;;; Generated autoloads from ../joseph/joseph-ylqf-mysql2excel.el

(autoload 'erlang-mysql-excle-export "joseph-ylqf-mysql2excel" "\
generate excel about mysql tables info.

\(fn)" t nil)

;;;***

;;;### (autoloads (toggle-read-only-file-with-sudo) "joseph_sudo"
;;;;;;  "../joseph/joseph_sudo.el" (20431 28677))
;;; Generated autoloads from ../joseph/joseph_sudo.el

(autoload 'toggle-read-only-file-with-sudo "joseph_sudo" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (js2-mode) "js2" "../js2/js2.el" (20050 17837))
;;; Generated autoloads from ../js2/js2.el
 (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'js2-mode "js2" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

;;;***

;;;### (autoloads (keep-buffers-query) "keep-buffers" "../keep-buffers.el"
;;;;;;  (20122 29904))
;;; Generated autoloads from ../keep-buffers.el

(autoload 'keep-buffers-query "keep-buffers" "\
The query function that disable deletion of buffers we protect.

\(fn)" nil nil)

;;;***

;;;### (autoloads (key-chord-define key-chord-define-global key-chord-mode)
;;;;;;  "key-chord" "../key-chord.el" (20122 29904))
;;; Generated autoloads from ../key-chord.el

(autoload 'key-chord-mode "key-chord" "\
Toggle key chord mode.
With positive ARG enable the mode. With zero or negative arg disable the mode.
A key chord is two keys that are pressed simultaneously, or one key quickly
pressed twice.
See functions `key-chord-define-global' or `key-chord-define'
and variables `key-chord-two-keys-delay' and `key-chord-one-key-delay'.

\(fn ARG)" t nil)

(autoload 'key-chord-define-global "key-chord" "\
Define a key-chord of two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

\(fn KEYS COMMAND)" t nil)

(autoload 'key-chord-define "key-chord" "\
Define in KEYMAP, a key-chord of two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

\(fn KEYMAP KEYS COMMAND)" nil nil)

;;;***

;;;### (autoloads (linkd-wiki-find-page linkd-latex-export linkd-export-default
;;;;;;  linkd-edit-link-at-point linkd-insert-link linkd-insert-lisp
;;;;;;  linkd-insert-wiki linkd-insert-star linkd-insert-tag linkd-insert-single-arg-link
;;;;;;  linkd-previous-link linkd-next-link linkd-follow-at-point
;;;;;;  linkd-back linkd-version) "linkd" "../linkd.el" (20168 60896))
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

;;;### (autoloads (magit-status) "magit" "../magit/magit.el" (20432
;;;;;;  51018))
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
;;;;;;  (20432 51018))
;;; Generated autoloads from ../magit/magit-blame.el

(autoload 'magit-blame-mode "magit-blame" "\
Display blame information inline.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (turn-on-magit-stgit magit-stgit-mode) "magit-stgit"
;;;;;;  "../magit/magit-stgit.el" (20432 51018))
;;; Generated autoloads from ../magit/magit-stgit.el

(autoload 'magit-stgit-mode "magit-stgit" "\
StGit support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-stgit "magit-stgit" "\
Unconditionally turn on `magit-stgit-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-svn magit-svn-mode) "magit-svn"
;;;;;;  "../magit/magit-svn.el" (20432 51018))
;;; Generated autoloads from ../magit/magit-svn.el

(autoload 'magit-svn-mode "magit-svn" "\
SVN support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-svn "magit-svn" "\
Unconditionally turn on `magit-svn-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-topgit magit-topgit-mode) "magit-topgit"
;;;;;;  "../magit/magit-topgit.el" (20432 51018))
;;; Generated autoloads from ../magit/magit-topgit.el

(autoload 'magit-topgit-mode "magit-topgit" "\
Topgit support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-topgit "magit-topgit" "\
Unconditionally turn on `magit-topgit-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (markdown-mode) "markdown-mode" "../markdown/markdown-mode.el"
;;;;;;  (20343 51741))
;;; Generated autoloads from ../markdown/markdown-mode.el

(autoload 'markdown-mode "markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads (mysql-table2entity-4csharp-interactively mtec-generate-all-classes)
;;;;;;  "mysql-table2entity-4csharp" "../sqlparse/mysql-table2entity-4csharp.el"
;;;;;;  (20287 5696))
;;; Generated autoloads from ../sqlparse/mysql-table2entity-4csharp.el

(autoload 'mtec-generate-all-classes "mysql-table2entity-4csharp" "\


\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'mysql-table2entity-4csharp-interactively "mysql-table2entity-4csharp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (mysql-table2entity-4java-interactively) "mysql-table2entity-4java"
;;;;;;  "../sqlparse/mysql-table2entity-4java.el" (20287 5660))
;;; Generated autoloads from ../sqlparse/mysql-table2entity-4java.el

(autoload 'mysql-table2entity-4java-interactively "mysql-table2entity-4java" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (mysql-procedure-generate-records) "mysql-table2procedure"
;;;;;;  "../joseph/mysql-table2procedure.el" (20365 30897))
;;; Generated autoloads from ../joseph/mysql-table2procedure.el

(autoload 'mysql-procedure-generate-records "mysql-table2procedure" "\
generate records from mysql tables

\(fn)" t nil)

;;;***

;;;### (autoloads (erlang-mysql-generate-records) "mysql-table2record-erlang"
;;;;;;  "../sqlparse/mysql-table2record-erlang.el" (20380 47711))
;;; Generated autoloads from ../sqlparse/mysql-table2record-erlang.el

(autoload 'erlang-mysql-generate-records "mysql-table2record-erlang" "\
generate records from mysql tables

\(fn)" t nil)

;;;***

;;;### (autoloads (openwith-mode) "openwith" "../dired/openwith.el"
;;;;;;  (20033 19868))
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
;;;;;;  "oracle-query" "../sqlparse/oracle-query.el" (20242 54707))
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
;;;;;;  (20242 64199))
;;; Generated autoloads from ../sqlparse/oracle-table2entity-4csharp.el

(autoload 'otec-generate-all-classes "oracle-table2entity-4csharp" "\


\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'oracle-table2entity-4csharp-interactively "oracle-table2entity-4csharp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (oracle-table2entity-4java-interactively otej-generate-all-classes)
;;;;;;  "oracle-table2entity-4java" "../sqlparse/oracle-table2entity-4java.el"
;;;;;;  (20287 5512))
;;; Generated autoloads from ../sqlparse/oracle-table2entity-4java.el

(autoload 'otej-generate-all-classes "oracle-table2entity-4java" "\


\(fn PACKAGE SAVEPATH)" nil nil)

(autoload 'oracle-table2entity-4java-interactively "oracle-table2entity-4java" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (svn-status svn-checkout) "psvn" "../psvn.el" (20122
;;;;;;  29904))
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
;;;;;;  (20432 51018))
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
;;;;;;  "rect-mark" "../rect-mark.el" (20122 29874))
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
;;;;;;  (20322 9721))
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
;;;;;;  (20322 9871))
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
;;;;;;  "../sqlparse/sqlparser-sqlserver-complete.el" (20322 9765))
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
;;;;;;  54793))
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
;;;;;;  (20242 54805))
;;; Generated autoloads from ../sqlparse/sqlserver-table2entity-4csharp.el

(autoload 'sstec-generate-all-classes "sqlserver-table2entity-4csharp" "\


\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'sqlserver-table2entity-4csharp-interactively "sqlserver-table2entity-4csharp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (sqlserver-table2entity-4java-interactively stej-generate-all-classes)
;;;;;;  "sqlserver-table2entity-4java" "../sqlparse/sqlserver-table2entity-4java.el"
;;;;;;  (20287 5780))
;;; Generated autoloads from ../sqlparse/sqlserver-table2entity-4java.el

(autoload 'stej-generate-all-classes "sqlserver-table2entity-4java" "\


\(fn PACKAGE SAVEPATH)" nil nil)

(autoload 'sqlserver-table2entity-4java-interactively "sqlserver-table2entity-4java" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (find-fn-or-var-nearest-point near-point-y-distance
;;;;;;  near-point-x-distance) "thingatpt+" "../auto-install/thingatpt+.el"
;;;;;;  (20033 26314))
;;; Generated autoloads from ../auto-install/thingatpt+.el

(defvar near-point-x-distance 50 "\
*Maximum number of characters from point to search, left and right.
Used by functions that provide default text for minibuffer input.
Some functions might ignore or override this setting temporarily.")

(custom-autoload 'near-point-x-distance "thingatpt+" t)

(defvar near-point-y-distance 5 "\
*Maximum number of lines from point to search, up and down.
To constrain search to the same line as point, set this to zero.
Used by functions that provide default text for minibuffer input.
Some functions might ignore or override this setting temporarily.")

(custom-autoload 'near-point-y-distance "thingatpt+" t)

(intern "whitespace-&-newlines")

(autoload 'find-fn-or-var-nearest-point "thingatpt+" "\
Go to the definition of the function or variable nearest the cursor.
With a prefix arg, or if no function or variable is near the cursor,
prompt for the function or variable to find, instead.

\(fn &optional CONFIRMP)" t nil)

;;;***

;;;### (autoloads (kill-ring-save-dwim kill-region-dwim upward-mark-thing
;;;;;;  mark-thing copy-thing kill-thing) "thingopt" "../thingopt-el/thingopt.el"
;;;;;;  (20319 8903))
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
;;;;;;  (20237 43699))
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
;;;;;;  12202))
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
;;;;;;  45779))
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

;;;### (autoloads (yas/global-mode yas/minor-mode) "yasnippet" "../yasnippet-0.6.1c/yasnippet.el"
;;;;;;  (20324 20010))
;;; Generated autoloads from ../yasnippet-0.6.1c/yasnippet.el

(autoload 'yas/minor-mode "yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, the `tas/trigger-key' key expands
snippets of code depending on the mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

You can customize the key through `yas/trigger-key'.

Key bindings:
\\{yas/minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas/global-mode nil "\
Non-nil if Yas/Global mode is enabled.
See the command `yas/global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas/global-mode'.")

(custom-autoload 'yas/global-mode "yasnippet" nil)

(autoload 'yas/global-mode "yasnippet" "\
Toggle Yas/Minor mode in all buffers.
With prefix ARG, enable Yas/Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas/Minor mode is enabled in all buffers where
`yas/minor-mode-on' would do it.
See `yas/minor-mode' for more information on Yas/Minor mode.

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
