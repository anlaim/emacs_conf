;;; joseph-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ahk-mode) "ahk-mode" "../ahk-mode/ahk-mode.el"
;;;;;;  (20033 19868))
;;; Generated autoloads from ../ahk-mode/ahk-mode.el

(add-to-list 'auto-mode-alist '("\\.ahk$" . ahk-mode))

(autoload 'ahk-mode "ahk-mode" "\
Major mode for editing AutoHotKey Scripts.

The hook functions in `ahk-mode-hook' are run after mode initialization.

Key bindings:
\\{ahk-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (ajc-reload) "ajc-java-complete" "../ajc-java-complete/ajc-java-complete.el"
;;;;;;  (20083 23271))
;;; Generated autoloads from ../ajc-java-complete/ajc-java-complete.el

(autoload 'ajc-reload "ajc-java-complete" "\
restart Auto Java Complete ,when your tag file changed,
you can use this function restart AutoJavaComplete

\(fn)" t nil)

(defalias 'auto-java-complete-reload 'ajc-reload)

;;;***

;;;### (autoloads (ajc-4-jsp-find-file-hook ajc-java-complete-mode)
;;;;;;  "ajc-java-complete-config" "../ajc-java-complete/ajc-java-complete-config.el"
;;;;;;  (20083 14910))
;;; Generated autoloads from ../ajc-java-complete/ajc-java-complete-config.el

(autoload 'ajc-java-complete-mode "ajc-java-complete-config" "\
AutoJavaComplete mode

\(fn &optional ARG)" t nil)

(defalias 'auto-java-complete-mode 'ajc-java-complete-mode)

(autoload 'ajc-4-jsp-find-file-hook "ajc-java-complete-config" "\
Not documented

\(fn)" nil nil)

;;;***

;;;### (autoloads (anything-other-buffer anything-at-point anything)
;;;;;;  "anything" "../anything-config/anything.el" (20075 2659))
;;; Generated autoloads from ../anything-config/anything.el

(autoload 'anything "anything" "\
Main function to execute anything sources.
When call interactively with no arguments deprecated `anything-sources'
will be used if non--nil.

PLIST is a list like (:key1 val1 :key2 val2 ...) or
 (&optional sources input prompt resume preselect buffer keymap).

Basic keywords are the following:

- :sources

  Temporary value of `anything-sources'.  It also accepts a
  symbol, interpreted as a variable of an anything source.  It
  also accepts an alist representing an anything source, which is
  detected by (assq 'name ANY-SOURCES)

- :input

  Temporary value of `anything-pattern', ie. initial input of minibuffer.

- :prompt

  Prompt other than \"pattern: \".

- :resume

  If t, Resurrect previously instance of `anything'.  Skip the initialization.
  If 'noresume, this instance of `anything' cannot be resumed.

- :preselect

  Initially selected candidate.  Specified by exact candidate or a regexp.
  Note that it is not working with delayed sources.

- :buffer

  `anything-buffer' instead of *anything*.

- :keymap

  `anything-map' for current `anything' session.


Of course, conventional arguments are supported, the two are same.

 (anything :sources sources :input input :prompt prompt :resume resume
           :preselect preselect :buffer buffer :keymap keymap)
 (anything sources input prompt resume preselect buffer keymap)


Other keywords are interpreted as local variables of this anything session.
The `anything-' prefix can be omitted.  For example,

 (anything :sources 'anything-c-source-buffers
           :buffer \"*buffers*\" :candidate-number-limit 10)

means starting anything session with `anything-c-source-buffers'
source in *buffers* buffer and set variable `anything-candidate-number-limit'
to 10 as session local variable.

\(fn &rest PLIST)" t nil)

(autoload 'anything-at-point "anything" "\
Call anything with symbol at point as initial input.
ANY-SOURCES ANY-INPUT ANY-PROMPT ANY-RESUME ANY-PRESELECT and ANY-BUFFER
are same args as in `anything'.

\(fn &optional ANY-SOURCES ANY-INPUT ANY-PROMPT ANY-RESUME ANY-PRESELECT ANY-BUFFER)" t nil)

(autoload 'anything-other-buffer "anything" "\
Simplified interface of `anything' with other `anything-buffer'.
Call `anything' with only ANY-SOURCES and ANY-BUFFER as args.

\(fn ANY-SOURCES ANY-BUFFER)" nil nil)

;;;***

;;;### (autoloads (anything-c-toggle-match-plugin anything-c-reset-adaptative-history
;;;;;;  anything-c-set-variable anything-c-call-interactively w32-shell-execute-open-file
;;;;;;  anything-lisp-completion-or-file-name-at-point anything-lisp-completion-at-point-or-indent
;;;;;;  anything-c-complete-file-name-at-point anything-lisp-completion-at-point
;;;;;;  anything-completion-mode anything-yaoddmuse-cache-pages anything-yank-text-at-point
;;;;;;  anything-c-grep-run-save-buffer anything-c-grep-run-other-window-action
;;;;;;  anything-c-grep-run-default-action anything-c-grep-run-persistent-action
;;;;;;  anything-c-goto-next-file anything-c-goto-precedent-file
;;;;;;  anything-dired-mode anything-ff-run-kill-buffer-persistent
;;;;;;  anything-ff-properties-persistent anything-ff-run-print-file
;;;;;;  anything-ff-run-etags anything-ff-run-gnus-attach-files anything-ff-run-locate
;;;;;;  anything-ff-run-open-file-externally anything-ff-run-switch-other-frame
;;;;;;  anything-ff-run-switch-other-window anything-ff-run-switch-to-eshell
;;;;;;  anything-ff-run-complete-fn-at-point anything-ff-run-delete-file
;;;;;;  anything-ff-run-symlink-file anything-ff-run-ediff-merge-file
;;;;;;  anything-ff-run-ediff-file anything-ff-run-eshell-command-on-file
;;;;;;  anything-ff-run-load-file anything-ff-run-byte-compile-file
;;;;;;  anything-ff-run-rename-file anything-ff-run-copy-file anything-ff-run-zgrep
;;;;;;  anything-ff-run-pdfgrep anything-ff-run-grep anything-ff-run-switch-to-history
;;;;;;  anything-ff-run-toggle-auto-update anything-buffer-run-ediff
;;;;;;  anything-buffer-switch-to-elscreen anything-buffer-switch-other-frame
;;;;;;  anything-buffer-switch-other-window anything-buffer-run-query-replace
;;;;;;  anything-buffer-run-query-replace-regexp anything-buffer-run-zgrep
;;;;;;  anything-buffer-run-grep anything-buffer-run-kill-buffers
;;;;;;  anything-buffer-save-persistent anything-buffer-revert-persistent
;;;;;;  anything-buffer-diff-persistent anything-toggle-all-marks
;;;;;;  anything-unmark-all anything-mark-all anything-test-sources
;;;;;;  anything-ratpoison-commands anything-c-run-external-command
;;;;;;  anything-eshell-history anything-esh-pcomplete anything-apt
;;;;;;  anything-world-time anything-select-xfont anything-top anything-create
;;;;;;  anything-execute-anything-command anything-call-source anything-surfraw
;;;;;;  anything-calcul-expression anything-eval-expression-with-eldoc
;;;;;;  anything-eval-expression anything-yaoddmuse-emacswiki-post-library
;;;;;;  anything-yaoddmuse-emacswiki-edit-or-view anything-all-mark-rings
;;;;;;  anything-global-mark-ring anything-mark-ring anything-simple-call-tree
;;;;;;  anything-bookmark-ext anything-manage-advice anything-M-x
;;;;;;  anything-filelist+ anything-filelist anything-do-zgrep anything-do-grep
;;;;;;  anything-dired-hardlink-file anything-dired-symlink-file
;;;;;;  anything-dired-copy-file anything-dired-rename-file anything-insert-file
;;;;;;  anything-write-file anything-find-files anything-regexp anything-info-gnus
;;;;;;  anything-org-headlines anything-browse-code anything-occur
;;;;;;  anything-list-emacs-process anything-timers anything-bm-list
;;;;;;  anything-eev-anchors anything-emms anything-org-keywords
;;;;;;  anything-man-woman anything-register anything-c-insert-latex-math
;;;;;;  anything-c-pp-bookmarks anything-bookmarks anything-colors
;;;;;;  anything-firefox-bookmarks anything-w3m-bookmarks anything-locate
;;;;;;  anything-bbdb anything-buffers-list anything-for-buffers
;;;;;;  anything-yahoo-suggest anything-google-suggest anything-imenu
;;;;;;  anything-gentoo anything-minibuffer-history anything-show-kill-ring
;;;;;;  anything-info-emacs anything-info-at-point anything-recentf
;;;;;;  anything-for-files anything-mini anything-etags-help anything-pdfgrep-help
;;;;;;  anything-grep-help anything-generic-file-help anything-ff-help
;;;;;;  anything-c-buffer-help anything-configuration) "anything-config"
;;;;;;  "../anything-config/anything-config.el" (20079 17399))
;;; Generated autoloads from ../anything-config/anything-config.el

(autoload 'anything-configuration "anything-config" "\
Customize `anything'.

\(fn)" t nil)

(defvar anything-command-map)

(autoload 'anything-c-buffer-help "anything-config" "\
Help command for anything buffers.

\(fn)" t nil)

(autoload 'anything-ff-help "anything-config" "\
Help command for `anything-find-files'.

\(fn)" t nil)

(autoload 'anything-generic-file-help "anything-config" "\
Not documented

\(fn)" t nil)

(autoload 'anything-grep-help "anything-config" "\
Not documented

\(fn)" t nil)

(autoload 'anything-pdfgrep-help "anything-config" "\
Not documented

\(fn)" t nil)

(autoload 'anything-etags-help "anything-config" "\
The help function for etags.

\(fn)" t nil)

(autoload 'anything-mini "anything-config" "\
Preconfigured `anything' lightweight version (buffer -> recentf).

\(fn)" t nil)

(autoload 'anything-for-files "anything-config" "\
Preconfigured `anything' for opening files.
ffap -> recentf -> buffer -> bookmark -> file-cache -> files-in-current-dir -> locate.

\(fn)" t nil)

(autoload 'anything-recentf "anything-config" "\
Preconfigured `anything' for `recentf'.

\(fn)" t nil)

(autoload 'anything-info-at-point "anything-config" "\
Preconfigured `anything' for searching info at point.
With a prefix-arg insert symbol at point.

\(fn ARG)" t nil)

(autoload 'anything-info-emacs "anything-config" "\
Preconfigured anything for Emacs manual index.

\(fn)" t nil)

(autoload 'anything-show-kill-ring "anything-config" "\
Preconfigured `anything' for `kill-ring'.
It is drop-in replacement of `yank-pop'.
You may bind this command to M-y.
First call open the kill-ring browser, next calls move to next line.

\(fn)" t nil)

(autoload 'anything-minibuffer-history "anything-config" "\
Preconfigured `anything' for `minibuffer-history'.

\(fn)" t nil)

(autoload 'anything-gentoo "anything-config" "\
Preconfigured `anything' for gentoo linux.

\(fn)" t nil)

(autoload 'anything-imenu "anything-config" "\
Preconfigured `anything' for `imenu'.

\(fn)" t nil)

(autoload 'anything-google-suggest "anything-config" "\
Preconfigured `anything' for google search with google suggest.

\(fn)" t nil)

(autoload 'anything-yahoo-suggest "anything-config" "\
Preconfigured `anything' for Yahoo searching with Yahoo suggest.

\(fn)" t nil)

(autoload 'anything-for-buffers "anything-config" "\
Preconfigured `anything' for buffer.

\(fn)" t nil)

(autoload 'anything-buffers-list "anything-config" "\
Enhanced preconfigured `anything' for buffer.

\(fn)" t nil)

(autoload 'anything-bbdb "anything-config" "\
Preconfigured `anything' for BBDB.

Needs BBDB.

http://bbdb.sourceforge.net/

\(fn)" t nil)

(autoload 'anything-locate "anything-config" "\
Preconfigured `anything' for Locate.
Note: you can add locate options after entering pattern.
See 'man locate' for valid options.

You can specify a specific database with prefix argument ARG (C-u).
Many databases can be used: navigate and mark them.
See also `anything-locate-with-db'.

To create a user specific db, use
\"updatedb -l 0 -o db_path -U directory\".
Where db_path is a filename matched by
`anything-locate-db-file-regexp'.

\(fn ARG)" t nil)

(autoload 'anything-w3m-bookmarks "anything-config" "\
Preconfigured `anything' for w3m bookmark.

Needs w3m and emacs-w3m.

http://w3m.sourceforge.net/
http://emacs-w3m.namazu.org/

\(fn)" t nil)

(autoload 'anything-firefox-bookmarks "anything-config" "\
Preconfigured `anything' for firefox bookmark.
You will have to enable html bookmarks in firefox:
open about:config in firefox and double click on this line to enable value to true:

user_pref(\"browser.bookmarks.autoExportHTML\", false);

You should have now:

user_pref(\"browser.bookmarks.autoExportHTML\", true);

After closing firefox, you will be able to browse you bookmarks.

\(fn)" t nil)

(autoload 'anything-colors "anything-config" "\
Preconfigured `anything' for color.

\(fn)" t nil)

(autoload 'anything-bookmarks "anything-config" "\
Preconfigured `anything' for bookmarks.

\(fn)" t nil)

(autoload 'anything-c-pp-bookmarks "anything-config" "\
Preconfigured `anything' for bookmarks (pretty-printed).

\(fn)" t nil)

(autoload 'anything-c-insert-latex-math "anything-config" "\
Preconfigured anything for latex math symbols completion.

\(fn)" t nil)

(autoload 'anything-register "anything-config" "\
Preconfigured `anything' for Emacs registers.

\(fn)" t nil)

(autoload 'anything-man-woman "anything-config" "\
Preconfigured `anything' for Man and Woman pages.

\(fn)" t nil)

(autoload 'anything-org-keywords "anything-config" "\
Preconfigured `anything' for org keywords.

\(fn)" t nil)

(autoload 'anything-emms "anything-config" "\
Preconfigured `anything' for emms sources.

\(fn)" t nil)

(autoload 'anything-eev-anchors "anything-config" "\
Preconfigured `anything' for eev anchors.

\(fn)" t nil)

(autoload 'anything-bm-list "anything-config" "\
Preconfigured `anything' for visible bookmarks.

Needs bm.el

http://cvs.savannah.gnu.org/viewvc/*checkout*/bm/bm/bm.el

\(fn)" t nil)

(autoload 'anything-timers "anything-config" "\
Preconfigured `anything' for timers.

\(fn)" t nil)

(autoload 'anything-list-emacs-process "anything-config" "\
Preconfigured `anything' for emacs process.

\(fn)" t nil)

(autoload 'anything-occur "anything-config" "\
Preconfigured Anything for Occur source.
If region is active, search only in region,
otherwise search in whole buffer.

\(fn)" t nil)

(autoload 'anything-browse-code "anything-config" "\
Preconfigured anything to browse code.

\(fn)" t nil)

(autoload 'anything-org-headlines "anything-config" "\
Preconfigured anything to show org headlines.

\(fn)" t nil)

(autoload 'anything-info-gnus "anything-config" "\
Preconfigured anything to browse Gnus Manual.

\(fn)" t nil)

(autoload 'anything-regexp "anything-config" "\
Preconfigured anything to build regexps and run query-replace-regexp against.

\(fn)" t nil)

(autoload 'anything-find-files "anything-config" "\
Preconfigured `anything' for anything implementation of `find-file'.
Called with a prefix arg show history if some.
Don't call it from programs, use `anything-find-files-1' instead.
This is the starting point for nearly all actions you can do on files.

\(fn ARG)" t nil)

(autoload 'anything-write-file "anything-config" "\
Preconfigured `anything' providing completion for `write-file'.

\(fn)" t nil)

(autoload 'anything-insert-file "anything-config" "\
Preconfigured `anything' providing completion for `insert-file'.

\(fn)" t nil)

(autoload 'anything-dired-rename-file "anything-config" "\
Preconfigured `anything' to rename files from dired.

\(fn)" t nil)

(autoload 'anything-dired-copy-file "anything-config" "\
Preconfigured `anything' to copy files from dired.

\(fn)" t nil)

(autoload 'anything-dired-symlink-file "anything-config" "\
Preconfigured `anything' to symlink files from dired.

\(fn)" t nil)

(autoload 'anything-dired-hardlink-file "anything-config" "\
Preconfigured `anything' to hardlink files from dired.

\(fn)" t nil)

(autoload 'anything-do-grep "anything-config" "\
Preconfigured anything for grep.
Contrarily to Emacs `grep' no default directory is given, but
the full path of candidates in ONLY.
That allow to grep different files not only in `default-directory' but anywhere
by marking them (C-<SPACE>). If one or more directory is selected
grep will search in all files of these directories.
You can use also wildcard in the base name of candidate.
If a prefix arg is given use the -r option of grep.
The prefix arg can be passed before or after start.
See also `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-do-zgrep "anything-config" "\
Preconfigured anything for zgrep.

\(fn CANDIDATE)" nil nil)

(autoload 'anything-filelist "anything-config" "\
Preconfigured `anything' to open files instantly.

See `anything-c-filelist-file-name' docstring for usage.

\(fn)" t nil)

(autoload 'anything-filelist+ "anything-config" "\
Preconfigured `anything' to open files/buffers/bookmarks instantly.

This is a replacement for `anything-for-files'.
See `anything-c-filelist-file-name' docstring for usage.

\(fn)" t nil)

(autoload 'anything-M-x "anything-config" "\
Preconfigured `anything' for Emacs commands.
It is `anything' replacement of regular `M-x' `execute-extended-command'.

\(fn)" t nil)

(autoload 'anything-manage-advice "anything-config" "\
Preconfigured `anything' to disable/enable function advices.

\(fn)" t nil)

(autoload 'anything-bookmark-ext "anything-config" "\
Preconfigured `anything' for bookmark-extensions sources.
Needs bookmark-ext.el:
<http://mercurial.intuxication.org/hg/emacs-bookmark-extension>.
Contain also `anything-c-source-google-suggest'.

\(fn)" t nil)

(autoload 'anything-simple-call-tree "anything-config" "\
Preconfigured `anything' for simple-call-tree. List function relationships.

Needs simple-call-tree.el.
http://www.emacswiki.org/cgi-bin/wiki/download/simple-call-tree.el

\(fn)" t nil)

(autoload 'anything-mark-ring "anything-config" "\
Preconfigured `anything' for `anything-c-source-mark-ring'.

\(fn)" t nil)

(autoload 'anything-global-mark-ring "anything-config" "\
Preconfigured `anything' for `anything-c-source-global-mark-ring'.

\(fn)" t nil)

(autoload 'anything-all-mark-rings "anything-config" "\
Preconfigured `anything' for `anything-c-source-global-mark-ring' and `anything-c-source-mark-ring'.

\(fn)" t nil)

(autoload 'anything-yaoddmuse-emacswiki-edit-or-view "anything-config" "\
Preconfigured `anything' to edit or view EmacsWiki page.

Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el

\(fn)" t nil)

(autoload 'anything-yaoddmuse-emacswiki-post-library "anything-config" "\
Preconfigured `anything' to post library to EmacsWiki.

Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el

\(fn)" t nil)

(autoload 'anything-eval-expression "anything-config" "\
Preconfigured anything for `anything-c-source-evaluation-result'.

\(fn ARG)" t nil)

(autoload 'anything-eval-expression-with-eldoc "anything-config" "\
Preconfigured anything for `anything-c-source-evaluation-result' with `eldoc' support.

\(fn)" t nil)

(autoload 'anything-calcul-expression "anything-config" "\
Preconfigured anything for `anything-c-source-calculation-result'.

\(fn)" t nil)

(autoload 'anything-surfraw "anything-config" "\
Preconfigured `anything' to search PATTERN with search ENGINE.

\(fn PATTERN ENGINE)" t nil)

(autoload 'anything-call-source "anything-config" "\
Preconfigured `anything' to call anything source.

\(fn)" t nil)

(autoload 'anything-execute-anything-command "anything-config" "\
Preconfigured `anything' to execute preconfigured `anything'.

\(fn)" t nil)

(autoload 'anything-create "anything-config" "\
Preconfigured `anything' to do many create actions from STRING.
See also `anything-create--actions'.

\(fn &optional STRING INITIAL-INPUT)" t nil)

(autoload 'anything-top "anything-config" "\
Preconfigured `anything' for top command.

\(fn)" t nil)

(autoload 'anything-select-xfont "anything-config" "\
Preconfigured `anything' to select Xfont.

\(fn)" t nil)

(autoload 'anything-world-time "anything-config" "\
Preconfigured `anything' to show world time.

\(fn)" t nil)

(autoload 'anything-apt "anything-config" "\
Preconfigured `anything' : frontend of APT package manager.
With a prefix arg reload cache.

\(fn ARG QUERY)" t nil)

(autoload 'anything-esh-pcomplete "anything-config" "\
Preconfigured anything to provide anything completion in eshell.

\(fn)" t nil)

(autoload 'anything-eshell-history "anything-config" "\
Preconfigured anything for eshell history.

\(fn)" t nil)

(autoload 'anything-c-run-external-command "anything-config" "\
Preconfigured `anything' to run External PROGRAM asyncronously from Emacs.
If program is already running exit with error.
You can set your own list of commands with
`anything-c-external-commands-list'.

\(fn PROGRAM)" t nil)

(autoload 'anything-ratpoison-commands "anything-config" "\
Preconfigured `anything' to execute ratpoison commands.

\(fn)" t nil)

(autoload 'anything-test-sources "anything-config" "\
List all anything sources for test.
The output is sexps which are evaluated by \\[eval-last-sexp].

\(fn)" t nil)

(autoload 'anything-mark-all "anything-config" "\
Mark all visible unmarked candidates in current source.

\(fn)" t nil)

(autoload 'anything-unmark-all "anything-config" "\
Unmark all candidates in all sources of current anything session.

\(fn)" t nil)

(autoload 'anything-toggle-all-marks "anything-config" "\
Toggle all marks.
Mark all visible candidates of current source or unmark all candidates
visible or invisible in all sources of current anything session

\(fn)" t nil)

(autoload 'anything-buffer-diff-persistent "anything-config" "\
Toggle diff buffer without quitting anything.

\(fn)" t nil)

(autoload 'anything-buffer-revert-persistent "anything-config" "\
Revert buffer without quitting anything.

\(fn)" t nil)

(autoload 'anything-buffer-save-persistent "anything-config" "\
Save buffer without quitting anything.

\(fn)" t nil)

(autoload 'anything-buffer-run-kill-buffers "anything-config" "\
Run kill buffer action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-grep "anything-config" "\
Run Grep action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-zgrep "anything-config" "\
Run Grep action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-query-replace-regexp "anything-config" "\
Run Query replace regexp action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-query-replace "anything-config" "\
Run Query replace action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-switch-other-window "anything-config" "\
Run switch to other window action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-switch-other-frame "anything-config" "\
Run switch to other frame action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-switch-to-elscreen "anything-config" "\
Run switch to elscreen  action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-ediff "anything-config" "\
Run ediff action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-ff-run-toggle-auto-update "anything-config" "\
Not documented

\(fn)" t nil)

(autoload 'anything-ff-run-switch-to-history "anything-config" "\
Run Switch to history action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-grep "anything-config" "\
Run Grep action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-pdfgrep "anything-config" "\
Run Pdfgrep action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-zgrep "anything-config" "\
Run Grep action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-copy-file "anything-config" "\
Run Copy file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-rename-file "anything-config" "\
Run Rename file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-byte-compile-file "anything-config" "\
Run Byte compile file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-load-file "anything-config" "\
Run Load file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-eshell-command-on-file "anything-config" "\
Run eshell command on file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-ediff-file "anything-config" "\
Run Ediff file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-ediff-merge-file "anything-config" "\
Run Ediff merge file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-symlink-file "anything-config" "\
Run Symlink file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-delete-file "anything-config" "\
Run Delete file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-complete-fn-at-point "anything-config" "\
Run complete file name action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-switch-to-eshell "anything-config" "\
Run switch to eshell action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-switch-other-window "anything-config" "\
Run switch to other window action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-switch-other-frame "anything-config" "\
Run switch to other frame action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-open-file-externally "anything-config" "\
Run open file externally command action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-locate "anything-config" "\
Run locate action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-gnus-attach-files "anything-config" "\
Run gnus attach files command action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-etags "anything-config" "\
Run Etags command action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-print-file "anything-config" "\
Run Print file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-properties-persistent "anything-config" "\
Show properties without quitting anything.

\(fn)" t nil)

(autoload 'anything-ff-run-kill-buffer-persistent "anything-config" "\
Execute `anything-ff-kill-buffer-fname' whitout quitting.

\(fn)" t nil)

(defvar anything-dired-mode "Enable anything completion in Dired functions.\nBindings affected are C, R, S, H." "\
Non-nil if Anything-Dired mode is enabled.
See the command `anything-dired-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `anything-dired-mode'.")

(custom-autoload 'anything-dired-mode "anything-config" nil)

(autoload 'anything-dired-mode "anything-config" "\
Toggle Anything-Dired mode on or off.
Interactively, with no prefix argument, toggle the mode.
With universal prefix ARG turn mode on.
With zero or negative ARG turn mode off.
\\{anything-dired-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'anything-c-goto-precedent-file "anything-config" "\
Go to precedent file in anything grep/etags buffers.

\(fn)" t nil)

(autoload 'anything-c-goto-next-file "anything-config" "\
Go to precedent file in anything grep/etags buffers.

\(fn)" t nil)

(autoload 'anything-c-grep-run-persistent-action "anything-config" "\
Run grep persistent action from `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-c-grep-run-default-action "anything-config" "\
Run grep default action from `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-c-grep-run-other-window-action "anything-config" "\
Run grep goto other window action from `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-c-grep-run-save-buffer "anything-config" "\
Run grep save results action from `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-yank-text-at-point "anything-config" "\
Yank text at point in minibuffer.

\(fn)" t nil)

(autoload 'anything-yaoddmuse-cache-pages "anything-config" "\
Fetch the list of files on emacswiki and create cache file.
If load is non--nil load the file and feed `yaoddmuse-pages-hash'.

\(fn &optional LOAD)" t nil)

(defvar anything-completion-mode nil "\
Non-nil if Anything-Completion mode is enabled.
See the command `anything-completion-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `anything-completion-mode'.")

(custom-autoload 'anything-completion-mode "anything-config" nil)

(autoload 'anything-completion-mode "anything-config" "\
Toggle generic anything completion.
All functions in Emacs that use `completing-read'
or `read-file-name' and friends will use anything interface
when this mode is turned on.
Called with a positive arg, turn on inconditionnaly, with a
negative arg turn off.
You can turn it on with `ac-mode'.

Some crap emacs functions may not be supported,
e.g `ffap-alternate-file' and maybe others.

\(fn &optional ARG)" t nil)

(autoload 'anything-lisp-completion-at-point "anything-config" "\
Anything lisp symbol completion at point.

\(fn)" t nil)

(autoload 'anything-c-complete-file-name-at-point "anything-config" "\
Complete file name at point.

\(fn)" t nil)

(autoload 'anything-lisp-completion-at-point-or-indent "anything-config" "\
First call indent and second call complete lisp symbol.
The second call should happen before `anything-lisp-completion-or-indent-delay',
after this delay, next call will indent again.
After completion, next call is always indent.
See that like click and double mouse click.
One hit indent, two quick hits maybe indent and complete.

\(fn ARG)" t nil)

(autoload 'anything-lisp-completion-or-file-name-at-point "anything-config" "\
Complete lisp symbol or filename at point.
Filename completion happen if filename is started in
or between double quotes.

\(fn)" t nil)

(autoload 'w32-shell-execute-open-file "anything-config" "\
Not documented

\(fn FILE)" t nil)

(autoload 'anything-c-call-interactively "anything-config" "\
Execute CMD-OR-NAME as Emacs command.
It is added to `extended-command-history'.
`anything-current-prefix-arg' is used as the command's prefix argument.

\(fn CMD-OR-NAME)" nil nil)

(autoload 'anything-c-set-variable "anything-config" "\
Set value to VAR interactively.

\(fn VAR)" t nil)

(autoload 'anything-c-reset-adaptative-history "anything-config" "\
Delete all `anything-c-adaptive-history' and his file.
Useful when you have a old or corrupted `anything-c-adaptive-history-file'.

\(fn)" t nil)

(autoload 'anything-c-toggle-match-plugin "anything-config" "\
Toggle anything-match-plugin.

\(fn)" t nil)

;;;***

;;;### (autoloads (anything-dired-history-view) "anything-dired-history"
;;;;;;  "../anything-dired-history/anything-dired-history.el" (20074
;;;;;;  26278))
;;; Generated autoloads from ../anything-dired-history/anything-dired-history.el

(autoload 'anything-dired-history-view "anything-dired-history" "\
call `anything' to show dired history.

\(fn)" t nil)

;;;***

;;;### (autoloads (anything-replace-string anything-replace-string-push-history)
;;;;;;  "anything-replace-string" "../anything-replace-string/anything-replace-string.el"
;;;;;;  (20077 39589))
;;; Generated autoloads from ../anything-replace-string/anything-replace-string.el

(defadvice replacen-string (before anything-replace-string-replace-string (from-string to-string &optional delimited start end) activate) (anything-replace-string-push-history from-string to-string 'replace-string))

(defadvice query-replace (before anything-replace-string-query-replace (from-string to-string &optional delimited start end) activate) (anything-replace-string-push-history from-string to-string 'query-string))

(defadvice query-replace-regexp (before anything-replace-string-query-replace (from-string to-string &optional delimited start end) activate) (anything-replace-string-push-history from-string to-string 'query-regexp))

(defadvice replace-regexp (before anything-replace-string-query-replace (from-string to-string &optional delimited start end) activate) (anything-replace-string-push-history from-string to-string 'replace-regexp))

(autoload 'anything-replace-string-push-history "anything-replace-string" "\
Push replace history.

\(fn FROM-STRING TO-STRING &optional REPLACE-TYPE)" nil nil)

(autoload 'anything-replace-string "anything-replace-string" "\
Replace string from history.

\(fn)" t nil)

;;;***

;;;### (autoloads (autodoc-insert-header autodoc-update-all) "autodoc"
;;;;;;  "../anything-config/developer-tools/autodoc.el" (20033 22256))
;;; Generated autoloads from ../anything-config/developer-tools/autodoc.el

(autoload 'autodoc-update-all "autodoc" "\
Eval all autodoc headers found.

\(fn)" t nil)

(autoload 'autodoc-insert-header "autodoc" "\
Insert an auto documentation line of commented code to eval.
With prefix arg insert also the docstring argument.
See headers of `autodoc.el' for example.

\(fn TITLE &optional DOCSTRING)" t nil)

;;;***

;;;### (autoloads (col-highlight-flash col-highlight-set-interval
;;;;;;  col-highlight-toggle-when-idle column-highlight-mode col-highlight-period
;;;;;;  col-highlight-vline-face-flag column-highlight) "col-highlight"
;;;;;;  "../icicles/col-highlight.el" (20033 19868))
;;; Generated autoloads from ../icicles/col-highlight.el

(let ((loads (get 'column-highlight 'custom-loads))) (if (member '"col-highlight" loads) nil (put 'column-highlight 'custom-loads (cons '"col-highlight" loads))))

(defvar col-highlight-vline-face-flag t "\
*Non-nil means `column-highlight-mode' uses `col-highlight-face'.
nil means that it uses `vline-face'.")

(custom-autoload 'col-highlight-vline-face-flag "col-highlight" t)

(defvar col-highlight-period 1 "\
*Number of seconds to highlight the current column.")

(custom-autoload 'col-highlight-period "col-highlight" t)

(defface col-highlight '((t (:background "SlateGray3"))) "\
*Face for current-column highlighting by `column-highlight-mode'.
Not used if `col-highlight-vline-face-flag' is nil." :group (quote column-highlight) :group (quote faces))

(defvar column-highlight-mode nil "\
Non-nil if Column-Highlight mode is enabled.
See the command `column-highlight-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `column-highlight-mode'.")

(custom-autoload 'column-highlight-mode "col-highlight" nil)

(autoload 'column-highlight-mode "col-highlight" "\
Toggle highlighting the current column.
With ARG, turn column highlighting on if and only if ARG is positive.

Column-Highlight mode uses the functions
`col-highlight-unhighlight' and `col-highlight-highlight'
on `pre-command-hook' and `post-command-hook'.

\(fn &optional ARG)" t nil)

(defalias 'toggle-highlight-column-when-idle 'col-highlight-toggle-when-idle)

(autoload 'col-highlight-toggle-when-idle "col-highlight" "\
Turn on or off highlighting the current column when Emacs is idle.
With prefix argument, turn on if ARG > 0; else turn off.

\(fn &optional ARG)" t nil)

(autoload 'col-highlight-set-interval "col-highlight" "\
Set wait until highlight current column when Emacs is idle.
Whenever Emacs is idle for this many seconds, the current column
will be highlighted in the face that is the value of variable
`col-highlight-face'.

To turn on or off automatically highlighting the current column
when Emacs is idle, use `\\[toggle-highlight-column-when-idle].

\(fn SECS)" t nil)

(defalias 'flash-column-highlight 'col-highlight-flash)

(autoload 'col-highlight-flash "col-highlight" "\
Highlight the current column for `col-highlight-period' seconds.
With a prefix argument, highlight for that many seconds.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (compile-dwim-run compile-dwim-compile compile-dwim-alist)
;;;;;;  "compile-dwim" "../compile-dwim.el" (20033 27977))
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
Not documented

\(fn FORCE &optional SENTINEL)" t nil)

(autoload 'compile-dwim-run "compile-dwim" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (crosshairs-unhighlight crosshairs-highlight crosshairs
;;;;;;  crosshairs-flash crosshairs-toggle-when-idle crosshairs-mode
;;;;;;  crosshairs-vline-same-face-flag crosshairs-overlay-priority
;;;;;;  crosshairs) "crosshairs" "../icicles/crosshairs.el" (20033
;;;;;;  19868))
;;; Generated autoloads from ../icicles/crosshairs.el

(let ((loads (get 'crosshairs 'custom-loads))) (if (member '"crosshairs" loads) nil (put 'crosshairs 'custom-loads (cons '"crosshairs" loads))))

(defvar crosshairs-overlay-priority nil "\
*Priority to use for overlay `global-hl-line-overlay'.")

(custom-autoload 'crosshairs-overlay-priority "crosshairs" t)

(defvar crosshairs-vline-same-face-flag t "\
*Non-nil means use face `hl-line' for column highlighting also.
nil means highlight the column according to the value of `vline-style'
and face `vline'.")

(custom-autoload 'crosshairs-vline-same-face-flag "crosshairs" t)

(defvar crosshairs-mode nil "\
Non-nil if Crosshairs mode is enabled.
See the command `crosshairs-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `crosshairs-mode'.")

(custom-autoload 'crosshairs-mode "crosshairs" nil)

(autoload 'crosshairs-mode "crosshairs" "\
Toggle highlighting the current line and column.
With ARG, turn highlighting on if and only if ARG is positive.

\(fn &optional ARG)" t nil)

(defalias 'toggle-crosshairs-when-idle 'crosshairs-toggle-when-idle)

(autoload 'crosshairs-toggle-when-idle "crosshairs" "\
Toggle highlighting the current line and column when Emacs is idle.
With prefix argument, turn on if ARG > 0; else turn off.
You can use commands `col-highlight-set-interval' and
`hl-line-when-idle-interval' to change the idle times.

\(fn &optional ARG)" t nil)

(defalias 'flash-crosshairs 'crosshairs-flash)

(autoload 'crosshairs-flash "crosshairs" "\
Highlight the current line and column temporarily.
Highlight the line for `hl-line-flash-show-period' and the column for
`column-show-period' seconds.  With prefix argument SECONDS, highlight
both for SECONDS seconds.

\(fn &optional SECONDS)" t nil)

(autoload 'crosshairs "crosshairs" "\
Highlight current position with crosshairs.
With no prefix arg, highlighting turns off at the next command.
With a prefix arg, highlighting stays on until you toggle it off using
`crosshairs-mode'.

\(fn &optional MODALP)" t nil)

(autoload 'crosshairs-highlight "crosshairs" "\
Echo current position and highlight it with crosshairs.
If optional arg MODE is `line-only', then highlight only the line.
If optional arg MODE is `col-only', then highlight only the column.
 Interactively:
  A non-negative prefix argument uses MODE `line-only'.
  A negative prefix argument uses MODE `col-only'.

Optional arg NOMSG non-nil means show no message.

If the current buffer is not the same as the value of `orig-buff',
then indicate the buffer, as well as the position.  Variable
`orig-buff' is not bound here; if you want to take advantage of this
feature in your code, then bind it.

Return current position as a marker.

\(fn &optional MODE NOMSG)" t nil)

(autoload 'crosshairs-unhighlight "crosshairs" "\
Turn off crosshairs highlighting of current position.
Optional arg nil means do nothing if this event is a frame switch.

\(fn &optional ARG)" t nil)

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

;;;### (autoloads nil "diff-mode-" "../diff-mode-.el" (20033 19868))
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
;;;;;;  "../dired-filetype-face/dired-filetype-face.el" (20033 22321))
;;; Generated autoloads from ../dired-filetype-face/dired-filetype-face.el

(autoload 'dired-filetype-face-mode-func "dired-filetype-face" "\
this function will be added to `dired-mode-hook'

\(fn)" nil nil)

;;;***

;;;### (autoloads (doremi-boost-scale-factor doremi-boost-down-keys
;;;;;;  doremi-boost-up-keys doremi-down-keys doremi-up-keys doremi)
;;;;;;  "doremi" "../icicles/doremi.el" (20033 19868))
;;; Generated autoloads from ../icicles/doremi.el

(let ((loads (get 'doremi 'custom-loads))) (if (member '"doremi" loads) nil (put 'doremi 'custom-loads (cons '"doremi" loads))))

(defvar doremi-up-keys '(up) "\
*Keys (events) associated with one direction of adjusting by `doremi'.
The other direction is associated with `doremi-down-keys'.

The value must be a list of keyboard events: characters or symbols.
For example, a list element might be `?' or `prior'.")

(custom-autoload 'doremi-up-keys "doremi" t)

(defvar doremi-down-keys '(down) "\
*Keys (events) associated with one direction of adjusting by `doremi'.
The other direction is associated with `doremi-up-keys'.

The value must be a list of keyboard events: characters or symbols.
For example, a list element might be `?' or `next'.")

(custom-autoload 'doremi-down-keys "doremi" t)

(defvar doremi-boost-up-keys '(M-up) "\
*Like `doremi-up-keys', but increments by `doremi-boost-scale-factor'.

The value must be a list of keyboard events: characters or symbols.
For example, a list element might be `?\360' or `S-prior'.")

(custom-autoload 'doremi-boost-up-keys "doremi" t)

(defvar doremi-boost-down-keys '(M-down) "\
*Like `doremi-down-keys', but increments by `doremi-boost-scale-factor'.

The value must be a list of keyboard events: characters or symbols.
For example, a list element might be `?\356' or `S-next'.")

(custom-autoload 'doremi-boost-down-keys "doremi" t)

(defvar doremi-boost-scale-factor 10 "\
*Factor to boost incremental change of numerical properties.
Using `doremi-boost-up-keys' or `doremi-boost-down-keys', instead of
`doremi-up-keys' or `doremi-down-keys' means that the increment is
this many times larger.  Using a modifier key with the mouse wheel has
the same effect as using `doremi-boost-up-keys' or
`doremi-boost-down-keys'.")

(custom-autoload 'doremi-boost-scale-factor "doremi" t)

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

;;;### (autoloads (etags-table-search-up-depth etags-table-alist
;;;;;;  etags-table) "etags-table" "../etags-table.el" (20033 19868))
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

\(fn FUN &rest BODY)" nil (quote macro))

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
;;;;;;  (20033 28031))
;;; Generated autoloads from ../goto-last-change.el

(autoload 'goto-last-change "goto-last-change" "\
Set point to the position of the last change.
Consecutive calls set point to the position of the previous change.
With a prefix arg (optional arg MARK-POINT non-nil), set mark so \\[exchange-point-and-mark]
will return point to the current position.

\(fn &optional MARK-POINT MINIMAL-LINE-DISTANCE)" t nil)

;;;***

;;;### (autoloads (hexrgb-blue hexrgb-green hexrgb-red hexrgb-value
;;;;;;  hexrgb-saturation hexrgb-hue hexrgb-complement hexrgb-read-color
;;;;;;  hexrgb-canonicalize-defined-colors-flag) "hexrgb" "../icicles/hexrgb.el"
;;;;;;  (20033 19868))
;;; Generated autoloads from ../icicles/hexrgb.el

(eval-and-compile (defun hexrgb-canonicalize-defined-colors (list) "Copy of LIST with color names canonicalized.\nLIST is a list of color names (strings).\nCanonical names are lowercase, with no whitespace.\nThere are no duplicate names." (let ((tail list) this new) (while tail (setq this (car tail) this (hexrgb-delete-whitespace-from-string (downcase this) 0 (length this))) (unless (member this new) (push this new)) (pop tail)) (nreverse new))) (defun hexrgb-delete-whitespace-from-string (string &optional from to) "Remove whitespace from substring of STRING from FROM to TO.\nIf FROM is nil, then start at the beginning of STRING (FROM = 0).\nIf TO is nil, then end at the end of STRING (TO = length of STRING).\nFROM and TO are zero-based indexes into STRING.\nCharacter FROM is affected (possibly deleted).  Character TO is not." (setq from (or from 0) to (or to (length string))) (with-temp-buffer (insert string) (goto-char (+ from (point-min))) (let ((count from) char) (while (and (not (eobp)) (< count to)) (setq char (char-after)) (if (memq char '(32 9 10)) (delete-char 1) (forward-char 1)) (setq count (1+ count))) (buffer-string)))))

(defconst hexrgb-defined-colors (eval-when-compile (and window-system (x-defined-colors))) "\
List of all supported colors.")

(defconst hexrgb-defined-colors-no-dups (eval-when-compile (and window-system (hexrgb-canonicalize-defined-colors (x-defined-colors)))) "\
List of all supported color names, with no duplicates.
Names are all lowercase, without any spaces.")

(defconst hexrgb-defined-colors-alist (eval-when-compile (and window-system (mapcar #'list (x-defined-colors)))) "\
Alist of all supported color names, for use in completion.
See also `hexrgb-defined-colors-no-dups-alist', which is the same
thing, but without any duplicates, such as \"light blue\" and
\"LightBlue\".")

(defconst hexrgb-defined-colors-no-dups-alist (eval-when-compile (and window-system (mapcar #'list (hexrgb-canonicalize-defined-colors (x-defined-colors))))) "\
Alist of all supported color names, with no duplicates, for completion.
Names are all lowercase, without any spaces.")

(defvar hexrgb-canonicalize-defined-colors-flag t "\
*Non-nil means remove duplicate color names.
Names are considered duplicates if they are the same when abstracting
from whitespace and letter case.")

(custom-autoload 'hexrgb-canonicalize-defined-colors-flag "hexrgb" t)

(autoload 'hexrgb-read-color "hexrgb" "\
Read a color name or RGB hex value: #RRRRGGGGBBBB.
Completion is available for color names, but not for RGB hex strings.
If you input an RGB hex string, it must have the form #XXXXXXXXXXXX or
XXXXXXXXXXXX, where each X is a hex digit.  The number of Xs must be a
multiple of 3, with the same number of Xs for each of red, green, and
blue.  The order is red, green, blue.

Color names that are normally considered equivalent are canonicalized:
They are lowercased, whitespace is removed, and duplicates are
eliminated.  E.g. \"LightBlue\" and \"light blue\" are both replaced
by \"lightblue\".  If you do not want this behavior, but want to
choose names that might contain whitespace or uppercase letters, then
customize option `hexrgb-canonicalize-defined-colors-flag' to nil.

In addition to standard color names and RGB hex values, the following
are available as color candidates.  In each case, the corresponding
color is used.

* `*copied foreground*'  - last copied foreground, if available
* `*copied background*'  - last copied background, if available
* `*mouse-2 foreground*' - foreground where you click `mouse-2'
* `*mouse-2 background*' - background where you click `mouse-2'
* `*point foreground*'   - foreground under the cursor
* `*point background*'   - background under the cursor

\(You can copy a color using eyedropper commands such as
`eyedrop-pick-foreground-at-mouse'.)

Checks input to be sure it represents a valid color.  If not, raises
an error (but see exception for empty input with non-nil
ALLOW-EMPTY-NAME-P).

Interactively, or with optional arg CONVERT-TO-RGB-P non-nil, converts
an input color name to an RGB hex string.  Returns the RGB hex string.

Optional arg ALLOW-EMPTY-NAME-P controls what happens if you enter an
empty color name (that is, you just hit `RET').  If non-nil, then
`hexrgb-read-color' returns an empty color name, \"\".  If nil, then
it raises an error.  Programs must test for \"\" if ALLOW-EMPTY-NAME-P
is non-nil.  They can then perform an appropriate action in case of
empty input.

Optional arg PROMPT is the prompt.  Nil means use a default prompt.

\(fn &optional CONVERT-TO-RGB-P ALLOW-EMPTY-NAME-P PROMPT)" t nil)

(autoload 'hexrgb-complement "hexrgb" "\
Return the color that is the complement of COLOR.

\(fn COLOR)" t nil)

(autoload 'hexrgb-hue "hexrgb" "\
Return the hue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-saturation "hexrgb" "\
Return the saturation component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-value "hexrgb" "\
Return the value component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-red "hexrgb" "\
Return the red component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-green "hexrgb" "\
Return the green component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-blue "hexrgb" "\
Return the blue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

;;;***

;;;### (autoloads (highlight-parentheses-mode) "highlight-parentheses"
;;;;;;  "../highlight-parentheses.el" (20033 28702))
;;; Generated autoloads from ../highlight-parentheses.el

(autoload 'highlight-parentheses-mode "highlight-parentheses" "\
Minor mode to highlight the surrounding parentheses.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (hl-line-flash hl-line-when-idle-interval hl-line-toggle-when-idle
;;;;;;  hl-line-inhibit-highlighting-for-modes hl-line-flash-show-period)
;;;;;;  "hl-line+" "../icicles/hl-line+.el" (20033 19868))
;;; Generated autoloads from ../icicles/hl-line+.el

(defface hl-line '((t (:background "SlateGray3"))) "\
*Face to use for `hl-line-face'." :group (quote hl-line))

(defvar hl-line-flash-show-period 1 "\
*Number of seconds for `hl-line-flash' to highlight the line.")

(custom-autoload 'hl-line-flash-show-period "hl-line+" t)

(defvar hl-line-inhibit-highlighting-for-modes nil "\
*Modes where highlighting is inhibited for `hl-line-highlight-now'.
A list of `major-mode' values (symbols).")

(custom-autoload 'hl-line-inhibit-highlighting-for-modes "hl-line+" t)

(defalias 'toggle-hl-line-when-idle 'hl-line-toggle-when-idle)

(autoload 'hl-line-toggle-when-idle "hl-line+" "\
Turn on or off using `global-hl-line-mode' when Emacs is idle.
When on, use `global-hl-line-mode' whenever Emacs is idle.
With prefix argument, turn on if ARG > 0; else turn off.

\(fn &optional ARG)" t nil)

(autoload 'hl-line-when-idle-interval "hl-line+" "\
Set wait until using `global-hl-line-mode' when Emacs is idle.
Whenever Emacs is idle for this many seconds, `global-hl-line-mode'
will be turned on.

To turn on or off using `global-hl-line-mode' when idle,
use `\\[toggle-hl-line-when-idle].

\(fn SECS)" t nil)

(defalias 'flash-line-highlight 'hl-line-flash)

(autoload 'hl-line-flash "hl-line+" "\
Highlight the current line for `hl-line-flash-show-period' seconds.
With a prefix argument, highlight for that many seconds.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (htmlize-many-files-dired htmlize-many-files htmlize-file
;;;;;;  htmlize-region htmlize-buffer) "htmlize" "../htmlize.el"
;;;;;;  (20033 28052))
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

;;;### (autoloads (ibuffer-vc-set-filter-groups-by-vc-root) "ibuffer-vc"
;;;;;;  "../ibuffer-vc/ibuffer-vc.el" (20071 36502))
;;; Generated autoloads from ../ibuffer-vc/ibuffer-vc.el

(autoload 'ibuffer-vc-set-filter-groups-by-vc-root "ibuffer-vc" "\
Set the current filter groups to filter by vc root dir.

\(fn)" t nil)
 (autoload 'ibuffer-do-sort-by-vc-status "ibuffer-vc")

;;;***

;;;### (autoloads (icicle-cd-for-loc-files icicle-locate-file-no-symlinks-other-window
;;;;;;  icicle-locate-file-no-symlinks icicle-locate-file-other-window
;;;;;;  icicle-locate-file icicle-find-file-read-only-other-window
;;;;;;  icicle-find-file-read-only icicle-cd-for-abs-files icicle-file-other-window
;;;;;;  icicle-file icicle-yank-maybe-completing icicle-delete-window
;;;;;;  icicle-select-window-by-name icicle-select-frame-by-name
;;;;;;  icicle-other-window-or-frame icicle-pop-tag-mark icicle-find-tag
;;;;;;  icicle-bookmarked-file-list icicle-bookmarked-buffer-list
;;;;;;  icicle-define-bookmark-other-window-command icicle-define-bookmark-command
;;;;;;  icicle-define-bookmark-command-1 icicle-bookmark-w3m-narrow
;;;;;;  icicle-bookmark-url-narrow icicle-bookmark-this-buffer-narrow
;;;;;;  icicle-bookmark-specific-files-narrow icicle-bookmark-specific-buffers-narrow
;;;;;;  icicle-bookmark-remote-file-narrow icicle-bookmark-region-narrow
;;;;;;  icicle-bookmark-non-file-narrow icicle-bookmark-man-narrow
;;;;;;  icicle-bookmark-local-file-narrow icicle-bookmark-info-narrow
;;;;;;  icicle-bookmark-gnus-narrow icicle-bookmark-file-narrow icicle-bookmark-dired-narrow
;;;;;;  icicle-bookmark-desktop-narrow icicle-bookmark-bookmark-list-narrow
;;;;;;  icicle-bookmark-jump-other-window icicle-bookmark-jump icicle-bookmark-set
;;;;;;  icicle-bookmark-cmd icicle-doremi-increment-variable+ icicle-grep-saved-file-candidates
;;;;;;  icicle-dired-project-other-window icicle-dired-project icicle-dired-saved-file-candidates-other-window
;;;;;;  icicle-dired-saved-file-candidates icicle-dired-save-marked-persistently
;;;;;;  icicle-dired-save-marked-to-variable icicle-dired-save-marked-more
;;;;;;  icicle-dired-save-marked icicle-bookmark-save-marked-files-persistently
;;;;;;  icicle-bookmark-save-marked-files-to-variable icicle-bookmark-save-marked-files-more
;;;;;;  icicle-bookmark-save-marked-files icicle-remove-entry-from-saved-completion-set
;;;;;;  icicle-add-entry-to-saved-completion-set icicle-repeat-complex-command
;;;;;;  icicle-customize-apropos-options-of-type icicle-customize-apropos-options
;;;;;;  icicle-customize-apropos-groups icicle-customize-apropos-faces
;;;;;;  icicle-customize-apropos icicle-customize-face-other-window
;;;;;;  icicle-customize-face icicle-send-bug-report icicle-customize-icicles-group
;;;;;;  icicle-lisp-complete-symbol icicle-bbdb-complete-name icicle-dabbrev-completion
;;;;;;  icicle-gud-gdb-complete-command icicle-ess-R-complete-object-name
;;;;;;  icicle-ess-internal-complete-object-name icicle-ess-complete-object-name
;;;;;;  icicle-shell-dynamic-complete-environment-variable icicle-shell-dynamic-complete-filename
;;;;;;  icicle-comint-replace-by-expanded-filename icicle-shell-dynamic-complete-command
;;;;;;  icicle-comint-dynamic-complete-filename icicle-comint-dynamic-complete
;;;;;;  icicle-recompute-shell-command-candidates icicle-pp-eval-expression)
;;;;;;  "icicles-cmd1" "../icicles/icicles-cmd1.el" (20033 30029))
;;; Generated autoloads from ../icicles/icicles-cmd1.el

(autoload 'icicle-pp-eval-expression "icicles-cmd1" "\
Evaluate Emacs-Lisp sexp EXPRESSION, and pretty-print its value.
Add the value to the front of the variable `values'.
With a prefix arg, insert the value into the current buffer at point.
 With a negative prefix arg, if the value is a string, then insert it
 into the buffer without double-quotes (`\"').
With no prefix arg:
 If the value fits on one line (frame width) show it in the echo area.
 Otherwise, show the value in buffer `*Pp Eval Output*'.

This command respects user options
`icicle-pp-eval-expression-print-length',
`icicle-pp-eval-expression-print-level', and
`eval-expression-debug-on-error'.

Emacs-Lisp mode completion and indentation bindings are in effect.

By default, Icicle mode remaps all key sequences that are normally
bound to `eval-expression' or `pp-eval-expression' to
`icicle-pp-eval-expression'.  If you do not want this remapping, then
customize option `icicle-top-level-key-bindings'.

\(fn EXPRESSION &optional INSERT-VALUE)" t nil)

(autoload 'icicle-recompute-shell-command-candidates "icicles-cmd1" "\
Update option `icicle-shell-command-candidates-cache'.
Recompute the available shell commands using your search path.
Return the new option value.
With a prefix argument, the updated option is saved persistently.

If the value of option `icicle-guess-commands-in-path' is not `load',
then turning on Icicle mode (again) resets the cache value to ().
If the value of `icicle-guess-commands-in-path' is `first-use', then
the cache is updated when you next use it, but it is not saved.

\(fn &optional SAVEP)" t nil)

(autoload 'icicle-comint-dynamic-complete "icicles-cmd1" "\
Dynamically perform completion at point.
Calls the functions in `comint-dynamic-complete-functions', but with
Icicles functions substituted, to perform completion until a function
returns non-nil, at which point completion is assumed to have
occurred.

Uses Icicles completion.

\(fn)" t nil)

(autoload 'icicle-comint-dynamic-complete-filename "icicles-cmd1" "\
Dynamically complete the filename at point.
Completes if after a filename.  See `comint-match-partial-filename' and
`icicle-comint-dynamic-complete-as-filename'.
This function is similar to `comint-replace-by-expanded-filename', except that
it won't change parts of the filename already entered in the buffer; it just
adds completion characters to the end of the filename.  A completions listing
may be shown in a help buffer if completion is ambiguous.

Completion is dependent on the value of `comint-completion-addsuffix',
`comint-completion-recexact' and `comint-completion-fignore', and the timing of
completions listing is dependent on the value of `comint-completion-autolist'.

Returns t if successful.

Uses Icicles completion.

\(fn)" t nil)

(autoload 'icicle-shell-dynamic-complete-command "icicles-cmd1" "\
Dynamically complete the command at point.
Similar to `icicle-comint-dynamic-complete-filename', but this
searches `exec-path' (minus the trailing Emacs library path) for
completion candidates.  Note that this may not be the same as the
shell's idea of the path.

Completion is dependent on the value of `shell-completion-execonly',
plus those that effect file completion.
See `icicle-shell-dynamic-complete-as-command'.

Returns t if successful.

Uses Icicles completion.

\(fn)" t nil)

(autoload 'icicle-comint-replace-by-expanded-filename "icicles-cmd1" "\
`comint-replace-by-expanded-filename', but uses Icicles completion.
Dynamically complete, expand, and canonicalize the filename at point.

\(fn)" t nil)

(autoload 'icicle-shell-dynamic-complete-filename "icicles-cmd1" "\
Dynamically complete the filename at point.
Completes only if point is at a suitable position for a filename
argument.

\(fn)" t nil)

(autoload 'icicle-shell-dynamic-complete-environment-variable "icicles-cmd1" "\
`shell-dynamic-complete-environment-variable' but uses Icicles completion.

\(fn)" t nil)

(autoload 'icicle-ess-complete-object-name "icicles-cmd1" "\
`ess-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.
This is `icicle-ess-R-complete-object-name' if `ess-use-R-completion',
and `icicle-ess-internal-complete-object-name' otherwise.

\(fn &optional LISTCOMP)" t nil)

(autoload 'icicle-ess-internal-complete-object-name "icicles-cmd1" "\
`ess-internal-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.

\(fn &optional LISTCOMP)" t nil)

(autoload 'icicle-ess-R-complete-object-name "icicles-cmd1" "\
`ess-R-complete-object-name', but uses Icicles completion.
Completion in R.

\(fn)" t nil)

(autoload 'icicle-gud-gdb-complete-command "icicles-cmd1" "\
`gud-gdb-complete-command', but uses Icicles completion.
Perform completion on the GDB command preceding point.

\(fn &optional COMMAND A B)" t nil)

(autoload 'icicle-dabbrev-completion "icicles-cmd1" "\
Completion on current word.
Like \\[dabbrev-expand], but finds all expansions in the current buffer
and presents suggestions for completion.

With a prefix argument, it searches all buffers accepted by
`dabbrev-friend-buffer-function', to find the completions.

If the prefix argument is 16 (which comes from `C-u C-u'), then it
searches *ALL* buffers.

With no prefix argument, it reuses an old completion list
if there is a suitable one already.

\(fn &optional ARG)" t nil)

(autoload 'icicle-bbdb-complete-name "icicles-cmd1" "\
Complete the user full-name or net-address before point.
Completes only up to the preceding newline, colon, or comma, or the
value of START-POS.

If what has been typed is unique, insert an entry of the form \"User
Name <net-addr>\" (but see `bbdb-dwim-net-address-allow-redundancy').
If it is a valid completion but not unique, you can choose from the
list of completions using Icicles completion.

If your input is completed and `bbdb-complete-name-allow-cycling' is
true, then you can repeat to cycle through the nets for the matching
record.

When called with a prefix arg, display a list of all nets.  You can
control completion behaviour using `bbdb-completion-type'.

\(fn &optional START-POS)" t nil)

(autoload 'icicle-lisp-complete-symbol "icicles-cmd1" "\
Complete the Lisp symbol preceding point against known Lisp symbols.
If there is more than one completion, use the minibuffer to complete.

When called from a program, optional arg PREDICATE is a predicate
determining which symbols are considered, e.g. `commandp'.

If PREDICATE is nil, the context determines which symbols are
considered.  If the symbol starts just after an open-parenthesis, only
symbols with function definitions are considered.  Otherwise, all
symbols with function definitions, values or properties are
considered.

\(fn &optional PREDICATE)" t nil)

(autoload 'icicle-customize-icicles-group "icicles-cmd1" "\
Customize Icicles options and faces.  View their documentation.

\(fn)" t nil)

(autoload 'icicle-send-bug-report "icicles-cmd1" "\
Send a bug report about an Icicles problem.

\(fn)" t nil)

(autoload 'icicle-customize-face "icicles-cmd1" "\
Customize face FACE.
Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active:

`C-mouse-2', `C-RET' - Act on current completion candidate only
`C-down'  - Move to next completion candidate and act
`C-up'    - Move to previous completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`C-end'   - Move to next prefix-completion candidate and act
`C-home'  - Move to previous prefix-completion candidate and act
`M-!'     - Act on *all* candidates (or all that are saved):
            Customize all in the same buffer.
`C-!'     - Act on *all* candidates (or all that are saved):
            Customize each in a separate buffer.

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
or `C-g' to quit.

With a prefix argument, you can enter multiple faces at the same time
with `RET' (in Emacs 22 or later).  This gives you the completion
behavior of `customize-face' in vanilla Emacs.  The advantage is that
the default value is the list of all faces under the cursor.  The
disadvantage is that face candidates are not WYSIWYG in buffer
`*Completions*'.

This is an Icicles command - see command `icicle-mode'.

\(fn FACE)" t nil)

(autoload 'icicle-customize-face-other-window "icicles-cmd1" "\
Customize face FACE in another window.
Same as `icicle-customize-face' except it uses a different window.

\(fn FACE)" t nil)

(autoload 'icicle-customize-apropos "icicles-cmd1" "\
Customize all user options matching REGEXP.
If ALL is `options', include only options.
If ALL is `faces', include only faces.
If ALL is `groups', include only groups.
If ALL is t (interactively, with prefix arg), include options which
  are not user-settable, as well as faces and groups.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.

\(fn REGEXP &optional ALL)" t nil)

(autoload 'icicle-customize-apropos-faces "icicles-cmd1" "\
Customize all user faces matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.

\(fn REGEXP)" t nil)

(autoload 'icicle-customize-apropos-groups "icicles-cmd1" "\
Customize all user groups matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.

\(fn REGEXP)" t nil)

(autoload 'icicle-customize-apropos-options "icicles-cmd1" "\
Customize all user options matching REGEXP.
With prefix argument, include options which are not user-settable.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.

\(fn REGEXP &optional ARG)" t nil)

(autoload 'icicle-customize-apropos-options-of-type "icicles-cmd1" "\
Customize all loaded customizable options of type TYPE that match REGEXP.
With no prefix arg, each option is defined with `defcustom' type TYPE.
With a prefix arg, either each option is defined with `defcustom' type
 TYPE or its current value is compatible with TYPE.

If TYPE is nil (the default value) then all `defcustom' variables are
potential candidates.

Use `S-TAB', `next', and `prior', to match regexp input - this lets
you see which options will be available in the customize buffer.

\(fn TYPE REGEXP)" t nil)

(autoload 'icicle-repeat-complex-command "icicles-cmd1" "\
Edit and re-evaluate the last complex command, or ARGth from last.
A complex command is one that used the minibuffer.
ARG is the prefix argument numeric value.

You can edit the past command you choose before executing it.  The
Lisp form of the command is used.  If the command you enter differs
from the previous complex command, then it is added to the front of
the command history.

Icicles completion is available for choosing a past command.  You can
still use the vanilla Emacs bindings `\\<minibuffer-local-map>\\[next-history-element]' and `\\[previous-history-element]' to cycle inputs,
and `\\[repeat-matching-complex-command]' to match regexp input, but Icicles input cycling (`up',
`down', `next', `prior', `home', `end') and apropos completion
\(`S-TAB') are superior and more convenient.

\(fn ARG)" t nil)

(autoload 'icicle-add-entry-to-saved-completion-set "icicles-cmd1" "\
Add ENTRY to saved completion-candidates set SET-NAME.
ENTRY is normally a single candidate (a string).
 With a prefix arg, however, and if option
 `icicle-filesets-as-saved-completion-sets-flag' is non-nil, then
 ENTRY is the name of an Emacs fileset (Emacs 22 or later).
TYPE is the type of entry to add: `Fileset' or `Candidate'.

\(fn SET-NAME ENTRY TYPE)" t nil)

(autoload 'icicle-remove-entry-from-saved-completion-set "icicles-cmd1" "\
Remove an entry from saved completion-candidates set SET-NAME.
SET-NAME can be an Icicles saved completions set (cache file) or the
name of an Emacs fileset.

The entry to remove can be a single completion candidate (a string) or
an Emacs fileset.  You can thus remove a file name from a fileset or
remove a fileset from an Icicles saved completion set.  (You can also
remove a file name from a saved completion set.)  If a saved set has
both a file and a fileset of the same name, then both are removed.

To use filesets here, use Emacs 22 or later, load library `filesets',
use `(filesets-init)', and ensure that option
`icicle-filesets-as-saved-completion-sets-flag' is non-nil.

\(fn SET-NAME)" t nil)
 (autoload 'icicle-remove-saved-completion-set "icicles-cmd1.el")

(autoload 'icicle-bookmark-save-marked-files "icicles-cmd1" "\
Save file names of marked bookmarks as a set of completion candidates.
Saves file names in variable `icicle-saved-completion-candidates', by
default.  Marked bookmarks that have no associated file are ignored.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.
 To subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of file-name candidates during
completion using `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').

\(fn &optional ARG)" t nil)

(autoload 'icicle-bookmark-save-marked-files-more "icicles-cmd1" "\
Add the file names of the marked bookmarks to the saved candidates set.
Marked bookmarks that have no associated file are ignored.
Add candidates to `icicle-saved-completion-candidates', by default.
A prefix argument acts the same as for `icicle-candidate-set-save'.

The existing saved candidates remain saved.  The current candidates
are added to those already saved.

You can retrieve the saved set of candidates with `C-M-<'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').

\(fn &optional ARG)" t nil)

(autoload 'icicle-bookmark-save-marked-files-to-variable "icicles-cmd1" "\
Save the file names of the marked bookmarks to a variable.
Marked bookmarks that have no associated file are ignored.

You can retrieve the saved set of file-name candidates during
completion using `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').

\(fn)" t nil)

(defalias 'icicle-bookmark-save-marked-files-as-project 'icicle-bookmark-save-marked-files-persistently)

(autoload 'icicle-bookmark-save-marked-files-persistently "icicles-cmd1" "\
Save the file names of the marked bookmarks as a persistent set.
Marked bookmarks that have no associated file are ignored.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of file-name candidates during
completion using `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').

\(fn FILESETP)" t nil)

(autoload 'icicle-dired-save-marked "icicles-cmd1" "\
Save the marked file names in Dired as a set of completion candidates.
Saves file names in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.
 To subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of file-name candidates during
completion using `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.

\(fn &optional ARG)" t nil)

(autoload 'icicle-dired-save-marked-more "icicles-cmd1" "\
Add the marked file names in Dired to the saved candidates set.
Add candidates to `icicle-saved-completion-candidates', by default.
A prefix argument acts the same as for `icicle-candidate-set-save'.

The existing saved candidates are still saved.  The current candidates
are added to those already saved.

You can retrieve the saved set of candidates with `C-M-<'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.

\(fn &optional ARG)" t nil)

(autoload 'icicle-dired-save-marked-to-variable "icicles-cmd1" "\
Save the marked file names in Dired to a variable as a candidate set.
You can retrieve the saved set of file-name candidates during
completion using `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.

\(fn)" t nil)

(defalias 'icicle-dired-save-marked-as-project 'icicle-dired-save-marked-persistently)

(autoload 'icicle-dired-save-marked-persistently "icicles-cmd1" "\
Save the marked file names in Dired as a persistent set.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of file-name candidates during
completion using `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.

\(fn FILESETP)" t nil)

(defalias 'icicle-dired-chosen-files 'icicle-dired-saved-file-candidates)

(autoload 'icicle-dired-saved-file-candidates "icicles-cmd1" "\
Open Dired on a set of files and directories of your choice.
If you have saved a set of file names using \\<minibuffer-local-completion-map>`\\[icicle-candidate-set-save]', then it is used.
If not, you are prompted to choose the files.
With a prefix argument, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).

\(fn PROMPT-FOR-DIR-P)" t nil)

(defalias 'icicle-dired-chosen-files-other-window 'icicle-dired-saved-file-candidates-other-window)

(autoload 'icicle-dired-saved-file-candidates-other-window "icicles-cmd1" "\
Open Dired in other window on set of files & directories of your choice.
If you have saved a set of file names using \\<minibuffer-local-completion-map>`\\[icicle-candidate-set-save]', then it is used.
If not, you are prompted to choose the files.
With a prefix arg, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).

\(fn PROMPT-FOR-DIR-P)" t nil)

(autoload 'icicle-dired-project "icicles-cmd1" "\
Open Dired on a saved project.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.

You can use `C-x m' during completion to access Dired bookmarks, if
you use library `bookmark+.el'.

\(fn PROMPT-FOR-DIR-P)" t nil)

(autoload 'icicle-dired-project-other-window "icicles-cmd1" "\
Open Dired on a saved project in another window.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.

You can use `C-x m' during completion to access Dired bookmarks, if
you use library `bookmark+.el'.

\(fn PROMPT-FOR-DIR-P)" t nil)

(autoload 'icicle-grep-saved-file-candidates "icicles-cmd1" "\
Run `grep' on the set of completion candidates saved with \\<minibuffer-local-completion-map>`\\[icicle-candidate-set-save]'.
Saved names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the default
directory.

\(fn COMMAND-ARGS)" t nil)
 (autoload 'icicle-execute-extended-command "icicles-cmd1.el")
 (autoload 'icicle-command-abbrev "icicles-cmd1.el")
 (autoload 'icicle-command-abbrev-command "icicles-cmd1.el")
 (autoload 'icicle-execute-named-keyboard-macro "icicles-cmd1.el")
 (autoload 'icicle-kmacro "icicles-cmd1.el")
 (autoload 'icicle-set-option-to-t "icicles-cmd1.el")
 (autoload 'icicle-clear-history "icicles-cmd1.el")
 (autoload 'icicle-clear-current-history "icicles-cmd1.el")
 (autoload 'icicle-reset-option-to-nil "icicles-cmd1.el")
 (autoload 'icicle-toggle-option "icicles-cmd1.el")
 (autoload 'icicle-increment-option "icicles-cmd1.el")
 (autoload 'icicle-increment-variable "icicles-cmd1.el")

(autoload 'icicle-doremi-increment-variable+ "icicles-cmd1" "\
Increment VARIABLE by INCREMENT (default 1).
Use arrow key `up' or `down' or mouse wheel to increase or decrease.
You can use the `Meta' key (e.g. `M-up') to increment in larger steps.

Interactively, you can choose VARIABLE using completion.
With a prefix arg, only user options are available to choose from.
Raises an error if VARIABLE's value is not a number.

\(fn VARIABLE &optional INCREMENT OPTIONP)" t nil)
 (autoload 'icicle-bookmark-list "icicles-cmd1.el")

(autoload 'icicle-bookmark-cmd "icicles-cmd1" "\
Set bookmark or visit bookmark(s).
With a negative prefix arg, visit bookmark(s), using
  `icicle-bookmark-other-window' (see that command for more info).

Otherwise, set a bookmark, as follows:

* No prefix arg: Prompt for the bookmark name.

  If feature `bookmark+' is present:

  . You can use (lax) completion for the bookmark name.
    The candidates are bookmarks in the current buffer (or all
    bookmarks if there are none in this buffer).

  . If the region is active and nonempty, then use the buffer name
    followed by the region prefix as the default name.

  If feature `bookmark+' is not present, then completion is not
  available, and the default bookmark name is the last one used in
  this buffer.

  Note: You can use command `icicle-bookmark-set' with a numeric
  prefix arg if you want to complete against all bookmark names,
  instead of those for the current buffer.

* Plain prefix arg (`C-u'): Same as no prefix arg, but do not
  overwrite any existing bookmark that has the same name.

* Non-negative numeric prefix arg: Do not prompt for bookmark name.
  If feature `bookmark+' is present and the region is active and
    nonempty, then use the buffer name followed by a prefix of the
    region text as the bookmark name.
  Otherwise, use the buffer name followed by the text of the current
    line, starting at point.
  Use at most `icicle-bookmark-name-length-max' chars, in either case.
  If the prefix arg is 0, then do not overwrite any existing bookmark
    that has the same name.

By default, Icicle mode remaps all key sequences that are normally
bound to `bookmark-set' to `icicle-bookmark-cmd'.  If you do not want
this remapping, then customize option `icicle-top-level-key-bindings'.
In particular, you might prefer to remap `bookmark-set' to
`icicle-bookmark-set' (see Note, above).

\(fn &optional PARG)" t nil)

(autoload 'icicle-bookmark-set "icicles-cmd1" "\
With Bookmark+, this is `bookmark-set' with Icicles multi-completions.
In particular, you can use (lax) completion for the bookmark name.
Without library `bookmark+.el', this is the same as vanilla Emacs
`bookmark-set'.

\(fn &optional NAME PARG INTERACTIVEP)" t nil)
 (autoload 'icicle-bookmark "icicles-cmd1.el")
 (autoload 'icicle-bookmark-other-window "icicles-cmd1.el")

(autoload 'icicle-bookmark-jump "icicles-cmd1" "\
Jump to BOOKMARK.
If `crosshairs.el' is loaded, then highlight the target position.
You probably don't want to use this.  Use `icicle-bookmark' instead.

\(fn BOOKMARK)" t nil)

(autoload 'icicle-bookmark-jump-other-window "icicles-cmd1" "\
Jump to BOOKMARK in another window.
If `crosshairs.el' is loaded, then highlight the target position.
You probably don't want to use this.  Use
`icicle-bookmark-other-window' instead.

\(fn BOOKMARK)" t nil)

(autoload 'icicle-bookmark-bookmark-list-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to bookmark-list bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-desktop-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to desktop bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-dired-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to Dired bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-file-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to file bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-gnus-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to Gnus bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-info-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to Info bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-local-file-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to local-file bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-man-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to `man'-page bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-non-file-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to non-file (buffer-only) bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-region-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to bookmarks with regions.

\(fn)" t nil)

(autoload 'icicle-bookmark-remote-file-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to remote-file bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-specific-buffers-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to bookmarks for specific BUFFERS.
You are prompted for the BUFFERS.

\(fn BUFFERS)" t nil)

(autoload 'icicle-bookmark-specific-files-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to bookmarks for specific FILES.
You are prompted for the FILES.

\(fn FILES)" t nil)

(autoload 'icicle-bookmark-this-buffer-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to bookmarks for the current buffer.

\(fn)" t nil)

(autoload 'icicle-bookmark-url-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to URL bookmarks.

\(fn)" t nil)

(autoload 'icicle-bookmark-w3m-narrow "icicles-cmd1" "\
Narrow the bookmark candidates to W3M (URL) bookmarks.

\(fn)" t nil)

(autoload 'icicle-define-bookmark-command-1 "icicles-cmd1" "\
Helper macro for `icicle-define*-bookmark-command' macros.
The command defined raises an error unless library `bookmark+.el' can
be loaded.

\(fn OTHERP TYPE PROMPT ARGS)" nil (quote macro))

(autoload 'icicle-define-bookmark-command "icicles-cmd1" "\
Define an Icicles multi-command for jumping to bookmarks of type TYPE.
TYPE is a string to be used for the doc string, default prompt, and in
 function names.  It should be lowercase and contain no spaces.
Optional arg PROMPT is the completion prompt.
ARGS is a list of any additional arguments to be passed to the
appropriate `bmkp-TYPE-alist-only' function.

\(fn TYPE &optional PROMPT &rest ARGS)" nil (quote macro))

(autoload 'icicle-define-bookmark-other-window-command "icicles-cmd1" "\
Same as `icicle-define-bookmark-command', but command uses other window.

\(fn TYPE &optional PROMPT &rest ARGS)" nil (quote macro))
 (autoload 'icicle-bookmark-non-file "icicles-cmd1.el")
 (autoload 'icicle-bookmark-non-file-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-bookmark-list "icicles-cmd1.el")
 (autoload 'icicle-bookmark-dired "icicles-cmd1.el")
 (autoload 'icicle-bookmark-dired-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-this-dir "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-this-dir-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-gnus "icicles-cmd1.el")
 (autoload 'icicle-bookmark-gnus-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-info "icicles-cmd1.el")
 (autoload 'icicle-bookmark-info-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-desktop "icicles-cmd1.el")
 (autoload 'icicle-bookmark-local-file "icicles-cmd1.el")
 (autoload 'icicle-bookmark-local-file-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-man "icicles-cmd1.el")
 (autoload 'icicle-bookmark-man-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-remote-file "icicles-cmd1.el")
 (autoload 'icicle-bookmark-remote-file-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-region "icicles-cmd1.el")
 (autoload 'icicle-bookmark-region-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-all-tags "icicles-cmd1.el")
 (autoload 'icicle-bookmark-all-tags-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-some-tags "icicles-cmd1.el")
 (autoload 'icicle-bookmark-some-tags-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-all-tags-regexp "icicles-cmd1.el")
 (autoload 'icicle-bookmark-all-tags-regexp-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-some-tags-regexp "icicles-cmd1.el")
 (autoload 'icicle-bookmark-some-tags-regexp-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-all-tags "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-all-tags-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-some-tags "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-some-tags-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-all-tags-regexp "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-all-tags-regexp-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-some-tags-regexp "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-some-tags-regexp-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-this-dir-file-all-tags "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-this-dir-all-tags-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-this-dir-some-tags "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-this-dir-some-tags-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-this-dir-all-tags-regexp "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-this-dir-all-tags-regexp-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-this-dir-some-tags-regexp "icicles-cmd1.el")
 (autoload 'icicle-bookmark-file-this-dir-some-tags-regexp-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-url "icicles-cmd1.el")
 (autoload 'icicle-bookmark-url-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-w3m "icicles-cmd1.el")
 (autoload 'icicle-bookmark-w3m-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-this-buffer "icicles-cmd1.el")
 (autoload 'icicle-bookmark-this-buffer-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-specific-buffers "icicles-cmd1.el")
 (autoload 'icicle-bookmark-specific-buffers-other-window "icicles-cmd1.el")
 (autoload 'icicle-bookmark-specific-files "icicles-cmd1.el")
 (autoload 'icicle-bookmark-specific-files-other-window "icicles-cmd1.el")

(defalias 'icicle-select-bookmarked-region 'icicle-bookmark-region-other-window)

(autoload 'icicle-bookmarked-buffer-list "icicles-cmd1" "\
`icicle-buffer-list', but only for bookmarked buffers.

\(fn)" t nil)

(autoload 'icicle-bookmarked-file-list "icicles-cmd1" "\
`icicle-buffer-list', but only for bookmarked buffers.

\(fn)" t nil)
 (autoload 'icicle-find-first-tag "icicles-cmd1.el")
 (autoload 'icicle-find-first-tag-other-window "icicles-cmd1.el")

(autoload 'icicle-find-tag "icicles-cmd1" "\
Navigate among all tags that match REGEXP.
You are prompted for the REGEXP to match.  Enter REGEXP with `RET'.
You can use completion to choose a tag in the current tags table as
REGEXP.  You can use `\\[icicle-pop-tag-mark]' to return to your starting point.

All matching tags are shown, including duplicate tags from the same or
different source files.  This means that you do not need `M-,' - you
see all tags as candidates to visit.

By default:

* Tags from all tags files are candidates.
* In `*Completions*', the source file name is shown after each tag.

A prefix argument changes this default behavior, as follows:

* ARG = 0 or ARG > 0: only the current tag table is used
* ARG = 0 or ARG < 0: source file names are not shown

By default, Icicle mode remaps all key sequences that are normally
bound to `find-tag' to `icicle-find-tag'.  If you do not want this
remapping, then customize option `icicle-top-level-key-bindings'.

If `crosshairs.el' is loaded, then the target position is highlighted.

\(fn REGEXP &optional ARG)" t nil)

(autoload 'icicle-pop-tag-mark "icicles-cmd1" "\
Like `pop-tag-mark', but uses `pop-to-buffer', not `switch-to-buffer'.
By default, Icicle mode remaps all key sequences that are normally
bound to `pop-tag-mark' to `icicle-pop-tag-mark'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn)" t nil)

(autoload 'icicle-other-window-or-frame "icicles-cmd1" "\
Select a window or frame, by name or by order.
This command combines Emacs commands `other-window' and `other-frame',
together with Icicles multi-commands `icicle-select-window', and
`icicle-select-frame'.  Use the prefix argument to choose, as follows:

 With no prefix arg or a non-zero numeric prefix arg:
  If the selected frame has multiple windows, then this is
  `other-window'.  Otherwise, it is `other-frame'.

 With a zero prefix arg (e.g. `C-0'):
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows in the frame as candidates.
  Otherwise (single-window frame), this is `icicle-select-frame'.

 With plain `C-u':
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows from all visible frames as
  candidates.  Otherwise, this is `icicle-select-frame'.

By default, Icicle mode remaps all key sequences that are normally
bound to `other-window' to `icicle-other-window-or-frame'.  If you do
not want this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn ARG)" t nil)
 (autoload 'icicle-select-frame "icicles-cmd1.el")

(autoload 'icicle-select-frame-by-name "icicles-cmd1" "\
Select the frame named NAME, and raise it.
Optional argument FRAME-ALIST is an alist of frames to choose from.
Each element has the form (FNAME . FRAME), where FNAME names FRAME.
See `icicle-make-frame-alist' for more about FNAME.

\(fn NAME &optional FRAME-ALIST)" t nil)
 (autoload 'icicle-select-window "icicles-cmd1.el")

(autoload 'icicle-select-window-by-name "icicles-cmd1" "\
Select the window named NAME.
Optional argument WINDOW-ALIST is an alist of windows to choose from.

Interactively:
 A prefix arg means windows from all visible frames are candidates.
 No prefix arg means windows from the selected frame are candidates.

Each alist element has the form (WNAME . WINDOW), where WNAME names
WINDOW.  See `icicle-make-window-alist' for more about WNAME.

If `crosshairs.el' is loaded, then the target position is highlighted.

\(fn NAME &optional WINDOW-ALIST)" t nil)
 (autoload 'icicle-delete-windows "icicles-cmd1.el")

(autoload 'icicle-delete-window "icicles-cmd1" "\
`delete-window' or prompt for buffer and delete all its windows.
When called from the minibuffer, remove the `*Completions*' window.

Otherwise:
 With no prefix argument, delete the selected window.
 With a prefix argument, prompt for a buffer and delete all windows,
   on any frame, that show that buffer.

 With a prefix argument, this is an Icicles multi-command - see
 command `icicle-mode'.  Input-candidate completion and cycling are
 available.  While cycling, these keys with prefix `C-' are active:

 `C-RET'   - Act on current completion candidate only
 `C-down'  - Move to next completion candidate and act
 `C-up'    - Move to previous completion candidate and act
 `C-next'  - Move to next apropos-completion candidate and act
 `C-prior' - Move to previous apropos-completion candidate and act
 `C-end'   - Move to next prefix-completion candidate and act
 `C-home'  - Move to previous prefix-completion candidate and act
 `C-!'     - Act on *all* candidates (or all that are saved),
             successively (careful!)

 With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
 `C-M-RET', `C-M-down', and so on) provide help about candidates.

 Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
 or `C-g' to quit.

By default, Icicle mode remaps all key sequences that are normally
bound to `delete-window' to `icicle-delete-window'.  If you do not
want this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn BUFFERP)" t nil)
 (autoload 'icicle-kill-buffer "icicles-cmd1.el")
 (autoload 'icicle-buffer "icicles-cmd1.el")
 (autoload 'icicle-buffer-other-window "icicles-cmd1.el")
 (autoload 'icicle-insert-buffer "icicles-cmd1.el")
 (autoload 'icicle-add-buffer-candidate "icicles-cmd1.el")
 (autoload 'icicle-remove-buffer-candidate "icicles-cmd1.el")
 (autoload 'icicle-buffer-config "icicles-cmd1.el")
 (autoload 'icicle-add-buffer-config "icicles-cmd1.el")
 (autoload 'icicle-buffer-list "icicles-cmd1.el")
 (autoload 'icicle-remove-buffer-config "icicles-cmd1.el")
 (autoload 'icicle-face-list "icicles-cmd1.el")
 (autoload 'icicle-color-theme "icicles-cmd1.el")
 (autoload 'icicle-completing-yank "icicles-cmd1.el")

(autoload 'icicle-yank-maybe-completing "icicles-cmd1" "\
`icicle-completing-yank', `icicle-yank', or `icicle-yank-function'.
If called from the minibuffer, call `icicle-yank'.
Otherwise:
 With a negative prefix argument, call `icicle-completing-yank'.
 Otherwise, call the value of user option `icicle-yank-function' (by
 default, `yank').

\(fn &optional ARG)" t nil)
 (autoload 'icicle-delete-file "icicles-cmd1.el")
 (autoload 'icicle-file-list "icicles-cmd1.el")
 (autoload 'icicle-directory-list "icicles-cmd1.el")
 (autoload 'icicle-dired "icicles-cmd1.el")
 (autoload 'icicle-dired-other-window "icicles-cmd1.el")

(autoload 'icicle-file "icicles-cmd1" "\
Visit a file or directory.
With no prefix argument, use relative file names
 (`icicle-find-file').
With a prefix argument, use absolute file names
 (`icicle-find-file-absolute').
With a negative prefix argument, you can choose also by date:
 Completion candidates include the last modification date.

Note that when you use a prefix argument completion matches candidates
as ordinary strings.  It knows nothing of file names per se.  In
particular, you cannot use remote file-name syntax if you use a prefix
argument.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

By default, Icicle mode remaps all key sequences that are normally bound
to `find-file' to `icicle-file'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.

\(fn ARG)" t nil)

(autoload 'icicle-file-other-window "icicles-cmd1" "\
Visit a file or directory in another window.
With no prefix argument, use relative file names
 (`icicle-find-file-other-window').
With a prefix argument, use absolute file names
 (`icicle-find-file-absolute-other-window').
With a negative prefix argument, you can choose also by date:
 Completion candidates include the last modification date.

Note that when you use a prefix argument completion matches candidates
as ordinary strings.  It knows nothing of file names per se.  In
particular, you cannot use remote file-name syntax if you use a prefix
argument.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

By default, Icicle mode remaps all key sequences that are normally
bound to `find-file-other-window' to `icicle-file-other-window'.  If
you do not want this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn ARG)" t nil)
 (autoload 'icicle-find-file-absolute "icicles-cmd1.el")
 (autoload 'icicle-find-file-absolute-other-window "icicles-cmd1.el")

(autoload 'icicle-cd-for-abs-files "icicles-cmd1" "\
Change `default-directory' during `icicle-find-file-absolute'.

\(fn DIR)" t nil)
 (autoload 'icicle-find-file "icicles-cmd1.el")
 (autoload 'icicle-find-file-other-window "icicles-cmd1.el")

(autoload 'icicle-find-file-read-only "icicles-cmd1" "\
Visit a file or directory in read-only mode.
If you use a prefix argument when you act on a candidate file name,
then visit the file without read-only mode.

If you use a prefix arg for the command itself, this reverses the
effect of using a prefix arg on individual candidates.  That is, with
a prefix arg for the command, files are not visited in read-only mode
by default and a prefix arg for an individual file visits it in
read-only mode.

\(fn)" t nil)

(autoload 'icicle-find-file-read-only-other-window "icicles-cmd1" "\
Visit a file or directory in read-only mode in another window.
Same as `icicle-find-file-read-only' except use a different window.

\(fn)" t nil)
 (autoload 'icicle-recent-file "icicles-cmd1.el")
 (autoload 'icicle-recent-file-other-window "icicles-cmd1.el")
 (autoload 'icicle-remove-file-from-recentf-list "icicles-cmd1.el")

(autoload 'icicle-locate-file "icicles-cmd1" "\
Visit a file within a directory or its subdirectories.
With a non-negative (>= 0) prefix argument, you are prompted for the
directory.  Otherwise, the current directory is used.

With a non-positive (<= 0) prefix argument, you can choose also by
date: Completion candidates include the last modification date.

The absolute names of all files within the directory and all of its
subdirectories are targets for completion.  Regexp input is matched
against all parts of the absolute name, not just the file-name part.

Remember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-hiding-common-match]' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

You can use this command to find all files within your file system
that match a regexp, but be aware that gathering and matching the file
names will take some time.

See also command `icicle-locate-file-no-symlinks', which does the same
thing but without following symbolic links.

Remember that you can save the set of files matching your input using
`\\[icicle-candidate-set-save]' or `\\[icicle-candidate-set-save-persistently]'.  You can then retrieve quickly them later using
`\\[icicle-candidate-set-retrieve]' or `\\[icicle-candidate-set-retrieve-persistent]'.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c C-d' (think `cd') to change the `default-directory'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

Directories in `icicle-ignored-directories' are ignored (skipped).  In
addition, these options control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-require-match-flag' - See `icicle-require-match-flag'
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (> (nth 5 (file-attributes file)) 5000))

\(fn)" t nil)

(autoload 'icicle-locate-file-other-window "icicles-cmd1" "\
Same as `icicle-locate-file' except visit file in a different window.
See also command `icicle-locate-file-no-symlinks-other-window', which
does not follow symbolic links.

\(fn)" t nil)

(autoload 'icicle-locate-file-no-symlinks "icicles-cmd1" "\
`icicle-locate-file' except do not follow symlinks.

\(fn)" t nil)

(autoload 'icicle-locate-file-no-symlinks-other-window "icicles-cmd1" "\
`icicle-locate-file-no-symlinks' except visit file in different window.

\(fn)" t nil)
 (autoload 'icicle-locate-file-1 "icicles-cmd1.el")

(autoload 'icicle-cd-for-loc-files "icicles-cmd1" "\
Change `default-directory' during `icicle-locate-file'.
Optional arg NO-SYMLINKS-P non-nil means do not follow symbolic links.

\(fn DIR &optional NO-SYMLINKS-P)" t nil)
 (autoload 'icicle-find-file-in-tags-table "icicles-cmd1.el")
 (autoload 'icicle-find-file-in-tags-table-other-window "icicles-cmd1.el")

;;;***

;;;### (autoloads (icicle-object-action icicle-save-string-to-variable
;;;;;;  icicle-tags-search icicle-imenu icicle-compilation-search
;;;;;;  icicle-comint-search icicle-search-pages icicle-search-paragraphs
;;;;;;  icicle-search-sentences icicle-occur icicle-search-buff-menu-marked
;;;;;;  icicle-search-ibuffer-marked icicle-search-dired-marked icicle-search-bookmark-list-marked
;;;;;;  icicle-search-file icicle-search-buffer icicle-search-bookmarks-together
;;;;;;  icicle-search-word icicle-search-highlight-cleanup icicle-search-text-property
;;;;;;  icicle-search-overlay-property icicle-search-char-property
;;;;;;  icicle-next-visible-thing icicle-previous-visible-thing icicle-hide/show-comments
;;;;;;  icicle-search-thing icicle-search-xml-element-text-node icicle-search-xml-element
;;;;;;  icicle-search-keywords icicle-search icicle-search-generic
;;;;;;  icicle-exchange-point-and-mark icicle-goto-global-marker
;;;;;;  icicle-goto-marker icicle-goto-global-marker-or-pop-global-mark
;;;;;;  icicle-goto-marker-or-set-mark-command icicle-apply icicle-apropos-zippy
;;;;;;  icicle-apropos icicle-non-whitespace-string-p icicle-Info-goto-node
;;;;;;  icicle-Info-goto-node-cmd icicle-Info-menu-cmd icicle-Info-index-20
;;;;;;  icicle-Info-index icicle-Info-index-cmd) "icicles-cmd2" "../icicles/icicles-cmd2.el"
;;;;;;  (20033 30031))
;;; Generated autoloads from ../icicles/icicles-cmd2.el
 (autoload 'icicle-font "icicles-cmd2.el")
 (autoload 'icicle-frame-bg "icicles-cmd2.el")
 (autoload 'icicle-frame-fg "icicles-cmd2.el")

(autoload 'icicle-Info-index-cmd "icicles-cmd2" "\
If in Icicle mode, run `icicle-Info-index'; else, run `Info-index'.
Note: In Emacs versions prior to version 22, this runs `Info-index'.

\(fn)" t nil)

(autoload 'icicle-Info-index "icicles-cmd2" "\
Like `Info-index', but you can use Icicles keys `C-RET', `C-up' etc.

\(fn)" t nil)

(autoload 'icicle-Info-index-20 "icicles-cmd2" "\
Like `Info-index', but you can use completion for the index topic.

\(fn)" t nil)

(autoload 'icicle-Info-menu-cmd "icicles-cmd2" "\
In Icicle mode, run `icicle-Info-menu'; else, `Info-menu'.

\(fn)" t nil)

(autoload 'icicle-Info-goto-node-cmd "icicles-cmd2" "\
In Icicle mode, run `icicle-Info-goto-node'; else, `Info-goto-node'.

\(fn)" t nil)

(autoload 'icicle-Info-goto-node "icicles-cmd2" "\
Go to Info node named NODENAME.
NODENAME has the form NODE or (FILE)NODE-IN-FILE, where:
 NODE names a node in the current Info file or one of its subfiles.
 FILE names an Info file containing node NODE-IN-FILE.
Completion is available for node names in the current Info file.

With a prefix argument:

 * Plain `C-u' means prepend the current Info file name (manual name)
   to each node name.  For example: `(emacs)Paragraphs' instead of
   just `Paragraphs'.

 * A negative numeric prefix arg (e.g. `C--') means present completion
   candidates in book order, and limit the candidates to the current
   node and the rest of the book following it.  In this case, the
   first candidate is `..', which means go up.

 * A negative numeric prefix arg (e.g. `C-1') means show the target
   node in a new Info buffer (not available prior to Emacs 21).
   (This applies only to the final completion choice, not to
   intermediate candidate actions using, e.g., `C-RET'.)

In Lisp code, if optional argument ARG is a string, then show the node
in a new Info buffer named `*info-ARG*'.

With no prefix argument, or with a non-negative prefix arg, you can
use `C-,' to choose how to sort completion candidates.  By default,
they are sorted alphabetically.

Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active:

`C-mouse-2', `C-RET' - Go to current completion candidate (node)
`C-down'  - Go to next completion candidate
`C-up'    - Go to previous completion candidate
`C-next'  - Go to next apropos-completion candidate
`C-prior' - Go to previous apropos-completion candidate
`C-end'   - Go to next prefix-completion candidate
`C-home'  - Go to previous prefix-completion candidate

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate, or
`C-g' to quit.

This is an Icicles command - see command `icicle-mode'.

\(fn NODENAME &optional ARG)" t nil)
 (autoload 'icicle-where-is "icicles-cmd2.el")
 (autoload 'icicle-describe-option-of-type "icicles-cmd2.el")
 (autoload 'icicle-vardoc "icicles-cmd2.el")
 (autoload 'icicle-fundoc "icicles-cmd2.el")
 (autoload 'icicle-plist "icicles-cmd2.el")
 (autoload 'icicle-doc "icicles-cmd2.el")

(autoload 'icicle-non-whitespace-string-p "icicles-cmd2" "\
Return non-nil if STRING is a string and contains a non-whitespace char.
The `standard-syntax-table' definition of whitespace is used.

\(fn STRING)" t nil)

(autoload 'icicle-apropos "icicles-cmd2" "\
Like `apropos', but lets you see the list of matches (with `S-TAB').
Function names are highlighted using face `icicle-special-candidate'.

\(fn APROPOS-REGEXP &optional DO-ALL)" t nil)

(autoload 'icicle-apropos-zippy "icicles-cmd2" "\
Show all Zippy quotes matching the regular-expression input REGEXP.
Return the list of matches.

\(fn REGEXP)" t nil)

(defalias 'icicle-map 'icicle-apply)

(autoload 'icicle-apply "icicles-cmd2" "\
Selectively apply a function to elements in an alist.
Argument ALIST is an alist such as can be used as the COLLECTION
argument for Icicles `completing-read'.  Its elements can represent
multi-completions, for example.  Interactively, COLLECTION is a
variable (a symbol) whose value is an alist.

Argument FN is a function.

Optional argument NOMSG non-nil means do not display an informative
message each time FN is applied.  If nil, then a message shows the key
of the alist element that FN is applied to and the result of the
application.

The remaining arguments are optional.  They are the arguments
PREDICATE, INITIAL-INPUT, HIST, DEF, and INHERIT-INPUT-METHOD for
`completing-read' (that is, all of the `completing-read' args other
than PROMPT, COLLECTION, and REQUIRE-MATCH).  During `icicle-apply'
completion, a match is required (REQUIRE-MATCH is t).

Interactively, you are prompted for both arguments.  Completion is
available for each.  The completion list for ALIST candidates is the
set of variables whose value is a cons.  With no prefix argument, the
names of these variables must end with \"alist\".  With a prefix
argument, the first car of each variable value must itself be a cons.

After choosing the ALIST and FN, you are prompted to choose one or
more keys of the alist elements, and FN is applied to each element
that has a key that you choose.  Multi-command completion is available
for choosing these candidates: you can apply FN to any number of
elements, any number of times.

Examples: If ALIST is `auto-mode-alist' and FN is `cdr', then the
completion candidates are the keys of the alist, and the result of
applying FN to an alist element is simply the value of that key.  If
you choose, for example, candidate \"\\.el\\'\", then the result is
`cdr' applied to the alist element (\"\\.el\\'\" . emacs-lisp-mode),
which is the symbol `emacs-lisp-mode'.  In this case, the function
performs simple lookup.

If FN were instead (lambda (x) (describe-function (cdr x))), then the
result of choosing candidate \"\\.el\\'\" would be to display the help
for function `emacs-lisp-mode'.

NOTE: `icicle-apply' does not, by itself, impose any particular sort
order.  Neither does it inhibit sorting.  If you call this function
from Lisp code and you want it to use a certain sort order or you want
no sorting, then bind `icicle-sort-comparer' accordingly.

During completion you can use multi-command keys.  Each displays the
value of applying FN to an alist element whose key is a completion
candidate.

`C-RET'   - Act on current completion candidate only
`C-down'  - Move to next completion candidate and act
`C-up'    - Move to previous completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`C-end'   - Move to next prefix-completion candidate and act
`C-home'  - Move to previous prefix-completion candidate and act
`C-!'     - Act on *each* candidate (or each that is saved), in turn.
`M-!'     - Act on the list of *all* candidates (or all saved).

Note that `M-!' applies FN to the *list* of chosen alist elements,
whereas `C-!' applies FN to each chosen element, in turn.  For
example, if FN is `length' and your input is `.el', then `M-!' displays
the result of applying `length' to the list of chosen elements:

 ((\"\\.el\\'\" . emacs-lisp-mode) (\"\\.elc'\" . emacs-lisp-mode))

which is 2.

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate, or
`C-g' to quit.  This is an Icicles command - see command
`icicle-mode'.

`icicle-apply' overrides `icicle-ignore-space-prefix-flag', binding it
to nil so that candidates with initial spaces can be matched.

\(fn ALIST FN &optional NOMSG PREDICATE INITIAL-INPUT HIST DEF INHERIT-INPUT-METHOD)" t nil)

(autoload 'icicle-goto-marker-or-set-mark-command "icicles-cmd2" "\
With prefix arg < 0, `icicle-goto-marker'; else `set-mark-command'.
By default, Icicle mode remaps all key sequences that are normally
bound to `set-mark-command' to
`icicle-goto-marker-or-set-mark-command'.  If you do not want this
remapping, then customize option `icicle-top-level-key-bindings'.

\(fn ARG)" t nil)

(autoload 'icicle-goto-global-marker-or-pop-global-mark "icicles-cmd2" "\
With prefix arg < 0, `icicle-goto-global-marker'; else `pop-global-mark'.
By default, Icicle mode remaps all key sequences that are normally
bound to `pop-global-mark' to
`icicle-goto-global-marker-or-pop-global-mark'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn ARG)" t nil)

(autoload 'icicle-goto-marker "icicles-cmd2" "\
Go to a marker in this buffer, choosing it by the line that includes it.
If `crosshairs.el' is loaded, then the target position is highlighted.

By default, candidates are sorted in marker order, that is, with
respect to their buffer positions.  Use `C-M-,' or `C-,' to change the
sort order.

During completion you can use these keys:

`C-RET'   - Goto marker named by current completion candidate
`C-down'  - Goto marker named by next completion candidate
`C-up'    - Goto marker named by previous completion candidate
`C-next'  - Goto marker named by next apropos-completion candidate
`C-prior' - Goto marker named by previous apropos-completion candidate
`C-end'   - Goto marker named by next prefix-completion candidate
`C-home'  - Goto marker named by previous prefix-completion candidate
`S-delete' - Delete marker named by current completion candidate

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to choose a candidate as the final
destination, or `C-g' to quit.  This is an Icicles command - see
command `icicle-mode'.

\(fn)" t nil)

(autoload 'icicle-goto-global-marker "icicles-cmd2" "\
Like `icicle-goto-marker', but visits global, not local, markers.
If user option `icicle-show-multi-completion-flag' is non-nil, then
each completion candidate is annotated (prefixed) with the name of the
marker's buffer, to facilitate orientation.

\(fn)" t nil)

(autoload 'icicle-exchange-point-and-mark "icicles-cmd2" "\
`exchange-point-and-mark' or save a region or select a saved region.
With no prefix arg, invoke `exchange-point-and-mark'.
If you use library `bookmark+.el', then you can use a prefix arg.

 * Plain `C-u': select (activate) one or more bookmarked regions.

 * Numeric prefix arg: bookmark (save) the active region using
   `icicle-bookmark-cmd'.

   Arg < 0: Prompt for the bookmark name.
   Arg > 0: Do not prompt for the bookmark name.  Use the buffer name
            plus a prefix of the region text as the bookmark name.
   Arg = 0: Same as > 0, except do not overwrite any existing bookmark
            with the same name.

By default, Icicle mode remaps all key sequences that are normally
bound to `exchange-point-and-mark' to
`icicle-exchange-point-and-mark'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.

\(fn &optional ARG)" t nil)

(autoload 'icicle-search-generic "icicles-cmd2" "\
Run `icicle-search-command'.  By default, this is `icicle-search'.
In Compilation and Grep modes, this is `icicle-compilation-search'.
In Comint, Shell, GUD, and Inferior Lisp modes, this is
   `icicle-comint-search'.

\(fn)" t nil)

(autoload 'icicle-search "icicles-cmd2" "\
Search for matches, with completion, cycling, and hit replacement.
Search a set of contexts, which are defined interactively by
specifying a regexp (followed by `RET').

After specifying the regexp that defines the search contexts, type
input (e.g. regexp or other pattern) to match within the contexts.
The contexts that match your input are available as completion
candidates.  You can use `M-*' to further narrow the candidates,
typing additional patterns to match.

By default, candidates are in order of buffer occurrence, but you can
sort them in various ways using `C-,'.

You can replace individual matches with another string, as in
`query-replace' or `query-replace-regexp'.  See the Icicles Search doc
for more info.

Non-interactively, search can be for regexp matches or any other kind
of matches.  Argument SCAN-FN-OR-REGEXP is the regexp to match, or it
is a function that defines an alist of buffer zones to search.  You
can navigate among the matching buffer zones (defined either as regexp
matches or via function), called search \"contexts\", and you can
match another regexp against the text in a search context.  See the
end of this description for information about the other arguments.

If the search-context regexp contains regexp subgroups, that is,
subexpressions of the form `(...)', then you are prompted for the
subgroup to use to define the search contexts.  Subgroup 0 means the
context is whatever matches the whole regexp.  Subgroup 1 means the
context is whatever matches the first subgroup, and so on.  The
subgroup number is the number of occurrences of `(', starting at the
beginning of the regexp.

Search respects `icicle-regexp-quote-flag' and
`icicle-search-whole-word-flag'.  You can toggle these during search,
by using `C-`' and `M-q', respectively.  If `icicle-regexp-quote-flag'
is non-nil, then regexp special characters are quoted, so that they
become non-special.  If `icicle-search-whole-word-flag' is non-nil,
then whole-word searching is done.  (You can also use
`\\[icicle-search-word]' to perform word search.)


Optional Behaviors: Prefix Argument
-----------------------------------

By default, search only the current buffer.  Search the active region,
or, if there is none, then search the entire buffer.

With a prefix argument, you can search multiple buffers, files, or
bookmarks, as follows:

- With a plain prefix arg (`C-u'), search bookmarks.  This is the
same as command `icicle-search-bookmarks-together'.  (To search
bookmarks one at a time instead of together, use multi-command
`icicle-search-bookmark'.)

- With a non-negative numeric prefix arg, search multiple buffers
completely.  You are prompted for the buffers to search - all of each
buffer is searched.  Any existing buffers can be chosen.  If the
prefix arg is 99, then only buffers visiting files are candidates.
This is the same as command `icicle-search-buffer'.

- With a negative numeric prefix arg, search multiple files
completely.  You are prompted for the files to search - all of each
file is searched.  Any existing files in the current directory can be
chosen.  This is the same as command `icicle-search-file'.


Navigation and Help
-------------------

The use of completion for this command is special.  It is not unusual
in this context to have multiple completion candidates that are
identical - only the positions of their occurrences in the search
buffer(s) differ.  In that case, you cannot choose one simply by
completing it in the minibuffer, because the destination would be
ambiguous.  That is, simply completing your input and entering the
completion with `RET' will not take you to its occurrence in the
search buffer, unless it is unique.

Instead, choose search hits to visit using any of the candidate-action
keys: `C-RET', `C-mouse-2', `C-down', `C-up', `C-next', `C-prior',
`C-end', and `C-home'.  All but the first two of these cycle among the
search hits.  The current candidate in `*Completions*' corresponds to
the current location visited (it is not off by one, as is usually the
case in Icicles).

As always, the `C-M-' keys provide help on individual candidates:
`C-M-RET', `C-M-mouse-2', `C-M-down', `C-M-up', `C-M-next',
`C-M-prior', `C-M-end', and `C-M-home'.  For `icicle-search', they
indicate the buffer and position of the search hit.

You can cycle among candidates without moving to their occurrences in
the search buffer, using `down', `up', `next', `prior', `end', or
`home' (no `C-' modifier).


Highlighting
------------

In the search buffer (that is, where the hits are), `icicle-search'
does the following:

- Highlights the current match (buffer zone) for the initial (context)
  regexp, using face `icicle-search-main-regexp-current'.

- Highlights the first `icicle-search-highlight-threshold' context
  matches, using face `icicle-search-main-regexp-others'.

- Highlights 1-8 context levels, within each search context.  This
  happens only if your initial (context) regexp has \\(...\\) groups
  and option `icicle-search-highlight-context-levels-flag' is non-nil.

- Highlights the match for your current input, using face
  `icicle-search-current-input'.  Highlights all such matches if
  option `icicle-search-highlight-all-current-flag' is non-nil;
  otherwise, highlights just the currently visited match.
  You can toggle this option using `C-^'.

If user option `icicle-search-cleanup-flag' is non-nil (the default),
then all search highlighting is removed from the search buffer when
you are finished searching.  If it is nil, then you can remove this
highlighting later using command `icicle-search-highlight-cleanup'.
You can toggle `icicle-search-cleanup-flag' during Icicles search
using `C-.'  in the minibuffer.


Search and Replace
------------------

You can replace the current search match by using any of the
alternative action keys: `C-S-RET', `C-S-mouse-2' (in
`*Completions*'), `C-S-down', `C-S-up', `C-S-next', `C-S-prior',
`C-S-end', and `C-S-home'.  You can use `M-|' to replace all matches
at once.  (And remember that you can activate the region to limit the
search-and-replace space.)


At the first use of any of these, you are prompted for the replacement
string; it is used thereafter, or until you use `M-,'
\(`icicle-search-define-replacement') to change it (anytime).

Unlike `query-replace', you need not visit search matches successively
or exhaustively.  You can visit and replace selected matches in any
order.

What is meant here by a \"search match\"?  It can be either an entire
search context or just a part of the context that your current
minibuffer input matches.

`C-,' toggles option `icicle-search-replace-whole-candidate-flag'.  By
default, the entire current search context is replaced, that is,
whatever matches the context regexp that you entered initially using
`RET'.  However, you can use `C-,' anytime during searching to toggle
between this default behavior and replacement of whatever your current
minibuffer input matches.

Remember this:

 - If `icicle-search-replace-whole-candidate-flag' is non-nil, then
   the granularity of replacement is a complete search context.  In
   this case, replacement behaves similarly to `query-replace-regexp'.
   You can still use minibuffer input to filter the set of search
   contexts, but replacement is on a whole-context basis.

 - If `icicle-search-replace-whole-candidate-flag' is nil, then you
   can replace multiple input matches separately within a search
   context (using `C-S-RET').  This behavior is unique to Icicles.
   You cannot, however skip over one input match and replace the next
   one in the same context - `C-S-RET' always replaces the first
   available match.

If `icicle-search-replace-whole-candidate-flag' is non-nil, then you
can use the navigational alternative action keys, `C-S-down',
`C-S-up', `C-S-next', `C-S-prior', `C-S-end', and `C-S-home',
repeatedly to replace successive search contexts.  At the buffer
limits, these commands wraps around to the other buffer limit (last
search context to first, and vice versa).

Search traversal using these go-to-next-context-and-replace keys is
always by search context, not by individual input match.  This means
that you cannot use these keys to replace input matches within a
search context (except for the first such match, if
`icicle-search-replace-whole-candidate-flag' is nil).

If your input matches multiple parts of a search context, and you want
to replace these in order, then use `C-S-RET' repeatedly.  You can
traverse all matches of your input in the order they appear in the
buffer by repeating `C-S-RET' (provided the replacement text does not
also match your input - see below).  At the buffer limits, repeating
`C-S-RET' wraps around too.

`C-S-RET' always replaces the first input match in the current search
context or, if there are no matches, then the first input match in the
next context.  This behavior has these important consequences:

* If you repeat `C-S-RET' and the previous replacement no longer
  matches your input, then `C-S-RET' moves on to the next input match
  (which is now the first one) and replaces that.  This is why you can
  usually just repeat `C-S-RET' to successively replaces matches of
  your input, including from one context to the next.

* If, on the other hand, after replacement the text still matches your
  input, then repeating `C-S-RET' will just replace that match.
  For example, if you replace the input match `ab' by `abcd', then
  repeating `C-S-RET' produces `abcd', then `abcdcd', then `abcdcd'...

* You cannot replace an input match, skip the next match, and then
  replace the following one, all in the same context.  You can,
  however, replace some matches and then skip (e.g. `C-next') to the
  next context.

What your input matches, hence what gets replaced if
`icicle-search-replace-whole-candidate-flag' is nil, depends on a few
Icicles options:

 - `icicle-regexp-quote-flag' determines whether to use regexp
   matching or literal matching.

 - `icicle-search-highlight-all-current-flag',
   `icicle-expand-input-to-common-match-flag' and
   `icicle-search-replace-common-match-flag' together determine
   whether to replace exactly what your input matches in the current
   search hit or the expanded common match (ECM) of your input among
   all search hits.  If any of these options is nil, then your exact
   input match is replaced; if they are all non-nil, then the ECM is
   replaced.

Finally, the replacement string can be nearly anything that is allowed
as a replacement by `query-replace-regexp'.  In Emacs 22 or later,
this includes Lisp sexp evaluation via `,' and constructs such as
`#' and `N' (back references).  You can also use `?', but it is not
very useful - you might as well use `M-,' instead, to change the
replacement text.


Using Regexps
-------------

At any time, you can use `\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]' (command
`icicle-insert-string-from-variable') to insert text (e.g. a regexp)
from a variable into the minibuffer.  For example, you can search for
ends of sentences by using `C-u \\[icicle-insert-string-from-variable]' and choosing variable
`sentence-end' as the variable.  And you can use
`\\[icicle-save-string-to-variable]' to save a string to a variable
for later use by `\\[icicle-insert-string-from-variable]'.

When employed with useful regexps, `C-=' can turn `icicle-search' into
a general navigator or browser of code, mail messages, and many other
types of buffer.  Imenu regexps work fine, for example - command
`icicle-imenu' simply uses `icicle-search' this way.  See
`icicle-insert-string-from-variable' for more tips on inserting
regexps from variables.


Additional Information
----------------------

If user option `icicle-show-multi-completion-flag' is non-nil, then
each candidate is annotated with the name of the buffer where the
search hit occurs, to facilitate orientation.  Note that even when the
value is nil, you can use `C-M-mouse-2' and so on to see the buffer
name, as well as the position of the hit in the buffer.

Completion is lax if `icicle-show-multi-completion-flag' is non-nil;
otherwise, it is strict.

After you visit a completion candidate, the hooks in variable
`icicle-search-hook' are run.

`icicle-search' overrides `icicle-ignore-space-prefix-flag', binding
it to nil, so that candidates with initial spaces can be matched.

`icicle-search' sets `icicle-search-final-choice' to the final user
choice, which might not be one of the search candidates if
REQUIRE-MATCH is nil.


Non-Interactive Use
-------------------

Function `icicle-search' is not only a powerful command, it is also a
building block for creating your own Icicles search-and-replace
commands.  When called non-interactively, these are the
`icicle-search' arguments:

BEG is the beginning of the region to search; END is the end.
SCAN-FN-OR-REGEXP: Regexp or function that determines the set of
  initial candidates (match zones).  If a function, it is passed, as
  arguments, the buffer to search, the beginning and end of the search
  region in that buffer, and ARGS.
REQUIRE-MATCH is passed to `completing-read'.
Optional arg WHERE is a list of bookmarks, buffers, or files to be
  searched.  If nil, then search only the current buffer or region.
  (To search bookmarks you must also use library `bookmark+.el').
ARGS are arguments that are passed to function SCAN-FN-OR-REGEXP.

Note that if SCAN-FN-OR-REGEXP is a regexp string, then function
`icicle-search-regexp-scan' is used to determine the set of match
zones.  You can limit hits to regexp matches that also satisfy a
predicate, by using `(PREDICATE)' as ARGS: PREDICATE is then passed to
`icicle-search-regexp-scan' as its PREDICATE argument.

This command is intended for use only in Icicle mode.

\(fn BEG END SCAN-FN-OR-REGEXP REQUIRE-MATCH &optional WHERE &rest ARGS)" t nil)

(autoload 'icicle-search-keywords "icicles-cmd2" "\
Search with one or more keywords, which can each be a regexp.
Text that matches *any* of the keywords is found.

You can use completion to choose one or more previously entered
regexps (using `C-RET', `C-mouse-2', `C-next', and so on), or you can
enter new keywords (using `C-RET').  Use `RET' or `mouse-2' to choose
the last keyword.

Keywords are interpreted as regexps.  You can change to substring
completion instead, matching regexp special characters literally, by
using `C-`' during completion to toggle `icicle-regexp-quote-flag'.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the `icicle-search'
documentation.

\(fn BEG END KEYWORDS REQUIRE-MATCH &optional WHERE &rest ARGS)" t nil)

(defalias 'icicle-regexp-list 'icicle-keyword-list)
 (autoload 'icicle-keyword-list "icicles-cmd2.el")
 (autoload 'icicle-search-bookmark "icicles-cmd2.el")

(autoload 'icicle-search-xml-element "icicles-cmd2" "\
`icicle-search' with XML ELEMENTs as search contexts.
ELEMENT is a regexp that is matched against actual element names.

The search contexts are the top-level matching elements within the
search limits, BEG and END.  Those elements might or might not contain
descendent elements that are themselves of type ELEMENT.

You probably need nXML for this command.  It is included in vanilla
Emacs, starting with Emacs 23.

\(fn BEG END REQUIRE-MATCH WHERE ELEMENT)" t nil)

(autoload 'icicle-search-xml-element-text-node "icicles-cmd2" "\
`icicle-search', with text() nodes of XML ELEMENTs as search contexts.
ELEMENT is a regexp that is matched against actual XML element names.

The search contexts are the text() nodes of the top-level matching
elements within the search limits, BEG and END.  (Those elements might
or might not contain descendent elements that are themselves of type
ELEMENT.)

You probably need nXML for this command.  It is included in vanilla
Emacs, starting with Emacs 23.

\(fn BEG END REQUIRE-MATCH WHERE ELEMENT)" t nil)

(autoload 'icicle-search-thing "icicles-cmd2" "\
`icicle-search' with THINGs as search contexts.
Enter the type of THING to search: `sexp', `sentence', `list',
`string', `comment', etc.

Possible THINGs are those for which `bounds-of-thing-at-point' returns
non-nil (and for which the bounds are not equal: an empty thing).
This does not include all THINGs for which `thing-at-point' returns
non-nil.

You can search the region, buffer, multiple buffers, or multiple
files.  See `icicle-search' for a full explanation.

If user option `icicle-ignore-comments-flag' is nil then include
THINGs located within comments.  Non-nil means to ignore comments for
searching.  You can toggle this option using `C-M-;' in the
minibuffer, but depending on when you do so you might need to invoke
this command again.

Non-interactively, if optional arg PREDICATE is non-nil then it is a
predicate that acceptable things must satisfy.  It is passed the thing
in the form of the cons returned by
`icicle-next-visible-thing-and-bounds'.

Non-interactively, if optional arg TRANSFORM-FN is non-nil then it is
a function to apply to each thing plus its bounds and which returns
the actual search-target to push to `icicle-candidates-alist' in place
of THING.  Its argument is the same as PREDICATE's.  It returns the
replacement for the thing plus its bounds, in the same form: a
cons (STRING START . END), where STRING is the search hit string and
START and END are its bounds).

This command is intended only for use in Icicle mode.

NOTE:

1. For best results, use also library `thingatpt+.el'.
2. In some cases it can take a while to gather the candidate THINGs.
   Use the command on an active region when you do not need to search
   THINGS throughout an entire buffer.
3. In `nxml-mode', remember that option `nxml-sexp-element-flag'
   controls what a `sexp' means.  To use whole XML elements as search
   contexts, set it to t, not nil.  (This is already done for the
   predefined Icicles XML search commands.)
4. Remember that if there is only one THING in the buffer or active
   region then no search is done.  Icicles search does nothing when
   there is only one possible search hit.
5. The scan candidate things moves forward a THING at a time.  In
   particular, if either PREDICATE or TRANSFORM-FN disqualifies the
   thing being scanned currently, then scanning skips forward to the
   next thing.  The scan does not dig inside the current thing to look
   for a qualified THING.
6. In Emacs releases prior to Emacs 23 the thing-at-point functions
   can sometimes behave incorrectly.  Thus, `icicle-search-thing' also
   behaves incorrectly in such cases, for Emacs prior to version 23.
7. Prior to Emacs 21 there is no possibility of ignoring comments.

\(fn THING &optional BEG END REQUIRE-MATCH WHERE PREDICATE TRANSFORM-FN)" t nil)

(autoload 'icicle-hide/show-comments "icicles-cmd2" "\
Hide or show comments from START to END.
Interactively, hide comments, or show them if you use a prefix arg.
Interactively, START and END default to the region limits, if active.
Otherwise, including non-interactively, they default to `point-min'
and `point-max'.

Uses `save-excursion', restoring point.

Be aware that using this command to show invisible text shows *all*
such text, regardless of how it was hidden.  IOW, it does not just
show invisible text that you previously hid using this command.

From Lisp, a HIDE/SHOW value of `hide' hides comments.  Other values
show them.

This function does nothing in Emacs versions prior to Emacs 21,
because it needs `comment-search-forward'.

\(fn &optional HIDE/SHOW START END)" t nil)

(autoload 'icicle-previous-visible-thing "icicles-cmd2" "\
Same as `icicle-next-visible-thing', except it moves backward.

\(fn THING START &optional END)" t nil)

(autoload 'icicle-next-visible-thing "icicles-cmd2" "\
Go to the next visible THING.
Start at START.  If END is non-nil then look no farther than END.
Interactively:
 - START is point.
 - If the region is not active, END is the buffer end.  If the region
   is active, END is the region end: the greater of point and mark.

Ignores (skips) comments if `icicle-ignore-comments-flag' is non-nil.
You can toggle this ignoring of comments using `C-M-;' in the
minibuffer, but depending on when you do so you might need to invoke
the current command again.

If you use this command or `icicle-previous-visible-thing'
successively, even mixing the two, you are prompted for the type of
THING only the first time.  You can thus bind these two commands to
simple, repeatable keys (e.g. `f11', `f12'), to navigate among things
quickly.

Non-interactively, THING is a symbol, and optional arg BACKWARD means
go to the previous thing.

Return (THING THING-START . THING-END), with THING-START and THING-END
the bounds of THING.  Return nil if no such THING is found.

\(fn THING &optional START END BACKWARD)" t nil)

(autoload 'icicle-search-char-property "icicles-cmd2" "\
Search for text that has a character property with a certain value.
If the property is `face' or `font-lock-face', then you can pick
multiple faces, using completion.  Text is then searched that has a
face property that includes any of the selected faces.  If you choose
no face (empty input), then text with any face is found.

By \"character property\" is meant either an overlay property or a
text property.  If you want to search for only an overlay property or
only a text property, then use `icicle-search-overlay-property' or
`icicle-search-text-property' instead.

Non-interactively, arguments BEG, END, REQUIRE-MATCH, and WHERE are as
for `icicle-search'.  Arguments PROP, VALUES, and PREDICATE are passed
to `icicle-search-char-property-scan' to define the search contexts.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.

\(fn BEG END REQUIRE-MATCH &optional WHERE PROP VALUES PREDICATE)" t nil)

(autoload 'icicle-search-overlay-property "icicles-cmd2" "\
Same as `icicle-search-char-property', except only overlay property.
That is, do not also search a text property.

\(fn BEG END REQUIRE-MATCH &optional WHERE PROP VALUES PREDICATE)" t nil)

(autoload 'icicle-search-text-property "icicles-cmd2" "\
Same as `icicle-search-char-property', except only text property.
That is, do not also search an overlay property.

\(fn BEG END REQUIRE-MATCH &optional WHERE PROP VALUES PREDICATE)" t nil)

(autoload 'icicle-search-highlight-cleanup "icicles-cmd2" "\
Remove all highlighting from the last use of `icicle-search'.

\(fn)" t nil)

(autoload 'icicle-search-word "icicles-cmd2" "\
Search for a whole word.
The search string is regarded as a whole word, but a \"word\" here can
contain embedded strings of non word-constituent chars (they are
skipped over, when matching, included in the match), and any leading
or trailing word-constituent chars in the search string are dropped
\(ignored for matching, not included in the match): matches begin and
end on a word boundary.

At the prompt for a word, you can use completion against previous
Icicles search inputs to choose the word, or you can enter a new word.

Non-interactively, WORD-REGEXP should be a regexp that matches a word.
The other arguments are the same as for `icicle-search'.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.

\(fn BEG END WORD-REGEXP REQUIRE-MATCH &optional WHERE &rest ARGS)" t nil)

(autoload 'icicle-search-bookmarks-together "icicles-cmd2" "\
Search bookmarked regions (together).
The arguments are the same as for `icicle-search', but without
arguments BEG, END, and WHERE.

This is the same as using a plain prefix arg, `C-u', with
`icicle-search'.

You first choose all of the bookmarked regions to search.  Then your
input is matched against a multi-completion composed of (a) the region
text that matches the regexp and (b) the region's buffer name.

An alternative is multi-command `icicle-search-bookmark', which
searches the bookmarked regions you choose one at a time.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-buffer "icicles-cmd2" "\
Search multiple buffers completely.
Same as using a non-negative numeric prefix arg, such as `C-9', with
`icicle-search'.  You are prompted for the buffers to search.  All of
each buffer is searched.  Any existing buffers can be chosen.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-file "icicles-cmd2" "\
Search multiple files completely.
Same as using a negative numeric prefix arg, such as `C--', with
`icicle-search'.  You are prompted for the files to search.  All of
each file is searched.  Any existing files in the current directory
can be chosen.  Arguments are the same as for `icicle-search', but
without arguments BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-bookmark-list-marked "icicles-cmd2" "\
Search the files of the marked bookmarks in `*Bookmark List*'.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-dired-marked "icicles-cmd2" "\
Search the marked files in Dired.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-ibuffer-marked "icicles-cmd2" "\
Search the marked buffers in Ibuffer, in order.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-buff-menu-marked "icicles-cmd2" "\
Search the marked buffers in Buffer Menu, in order.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(defalias 'icicle-search-lines 'icicle-occur)

(autoload 'icicle-occur "icicles-cmd2" "\
`icicle-search' with a regexp of \".*\".  An `occur' with icompletion.
Type a regexp to match within each line of one or more buffers.  Use
`S-TAB' to show matching lines.  Use `C-RET' or `C-mouse-2' to go to
the line of the current candidate.  Use `C-down', `C-up', `C-next',
`C-prior', `C-end', or `C-home', to cycle among the matching lines.

By default, search only the current buffer.  Search the active region,
or, if none, the entire buffer.  With a prefix argument, you are
prompted for the buffers to search.  You can choose buffers using
completion (`C-RET' and so on).  If the prefix argument is 99, then
only buffers visiting files are candidates.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, see the doc for command
`icicle-search'.

\(fn BEG END &optional BUFFERS)" t nil)

(autoload 'icicle-search-sentences "icicles-cmd2" "\
`icicle-search' with sentences as contexts.
Type a regexp to match within each sentence of one or more buffers.
Use `S-TAB' to show matching sentences.  Use `C-RET' or `C-mouse-2' to
go to the line of the current candidate.  Use `C-down', `C-up',
`C-next', `C-prior', `C-end', or `C-home' to cycle among the matching
sentences.

By default, search only the current buffer.  Search the active region,
or, if none, the entire buffer.  With a prefix argument, you are
prompted for the buffers to search.  You can choose buffers using
completion (`C-RET' and so on).  If the prefix argument is 99, then
only buffers visiting files are candidates.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, see the doc for command
`icicle-search'.

\(fn BEG END &optional BUFFERS)" t nil)

(autoload 'icicle-search-paragraphs "icicles-cmd2" "\
`icicle-search' with paragraphs as contexts.
Type a regexp to match within each paragraph of one or more buffers.
Use `S-TAB' to show matching paragraphs.  Use `C-RET' or `C-mouse-2'
to go to the line of the current candidate.  Use `C-down', `C-up',
`C-next', `C-prior', `C-end', or `C-home' to cycle among the matching
paragraphs.

By default, search only the current buffer.  Search the active region,
or, if none, the entire buffer.  With a prefix argument, you are
prompted for the buffers to search.  You can choose buffers using
completion (`C-RET' and so on).  If the prefix argument is 99, then
only buffers visiting files are candidates.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, see the doc for command
`icicle-search'.

\(fn BEG END &optional BUFFERS)" t nil)

(autoload 'icicle-search-pages "icicles-cmd2" "\
`icicle-search' with pages as contexts.
Type a regexp to match within each page of one or more buffers.  Use
`S-TAB' to show matching page.  Use `C-RET' or `C-mouse-2' to go to
the line of the current candidate.  Use `C-down', `C-up', `C-next',
`C-prior', `C-end', or `C-home', to cycle among the matching pages.

By default, search only the current buffer.  Search the active region,
or, if none, the entire buffer.  With a prefix argument, you are
prompted for the buffers to search.  You can choose buffers using
completion (`C-RET' and so on).  If the prefix argument is 99, then
only buffers visiting files are candidates.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, see the doc for command
`icicle-search'.

\(fn BEG END &optional BUFFERS)" t nil)

(autoload 'icicle-comint-search "icicles-cmd2" "\
Use `icicle-search' to pick up a previous input for reuse.
Use this in a `comint-mode' buffer, such as *shell* or
*inferior-lisp*.  This searches your interactive history in the buffer
for a match to your current input, which you can change dynamically.
When you choose a previous input, it is copied to the current prompt,
for reuse.  If the region is active, then only it is searched;
otherwise, the entire buffer is searched.

Use `C-RET' or `C-mouse-2' to choose a previous input for reuse.  Use
`down', `up', `next', `prior', `end', or `home' to cycle among your
previous inputs.  (You probably do NOT want to use `C-next' etc.,
since such keys will not only cycle to another candidate but also
reuse it immediately.)

As for other Icicles search commands, your current input narrows the
set of possible candidates.  See `icicle-search' for more
information.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

Note that previous commands are identified by looking through the
shell buffer for a shell prompt.  This is not foolproof.  If, for
instance you use command `ls', the output includes an auto-save file
such as #foo.el#, and `#' in the first column represents a shell
prompt, then #foo.el# will be misinterpreted as a previous command.

Also, depending on your shell, you might want to customize variables
such as the following:

`shell-prompt-pattern',`telnet-prompt-pattern'.

Being a search command, `icicle-comint-search' cannot give you access
to previous shell commands that are not visible in the current buffer.
See also \\<comint-mode-map>\\[icicle-comint-command] for another way to reuse commands,
including those from previous sessions.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments, see the doc for command
`icicle-search'.

\(fn BEG END)" t nil)
 (autoload 'icicle-comint-command "icicles-cmd2.el")

(autoload 'icicle-compilation-search "icicles-cmd2" "\
Like `icicle-search', but show the matching compilation-buffer hit.
Use this in a compilation buffer, such as `*grep*', searching for a
regexp as with `icicle-search'.  Use `C-RET' or `C-mouse-2' to show
the target-buffer hit corresponding to the current completion
candidate.  Use `C-down', `C-up', `C-next', `C-prior', `C-end', or
`C-home' to cycle among the target-buffer hits.

As for `icicle-search', you can further narrow the match candidates by
typing a second regexp to search for among the first matches.  See
`icicle-search' for more information.

Altogether, using this with `grep' gives you two or three levels of
regexp searching: 1) the `grep' regexp, 2) the major `icicle-search'
regexp, and optionally 3) the refining `icicle-search' regexp.

In Emacs 22 and later, you can replace search-hit text, as in
`icicle-search'.  In earlier Emacs versions, you cannot replace text.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments, see the doc for command
`icicle-search'.

\(fn BEG END)" t nil)

(defalias 'icicle-search-defs 'icicle-imenu)

(autoload 'icicle-imenu "icicles-cmd2" "\
Go to an Imenu entry using `icicle-search'.
Recommended: Use library `imenu+.el' also.
In Emacs-Lisp mode, `imenu+.el' classifies definitions using these
submenus:

 1. Keys         - keys in the global keymap
 2. Keys in Maps - keys in keymaps other than global keymap
 3. Functions    - functions, whether interactive or not
 4. Macros       - macros defined with `defmacro'
 5. User Options - user variables, from `defcustom'
 6. Variables    - other variables (non-options), from `defvar'
 7. Faces        - faces, from `defface'
 8. Other        - other definitions

Note: If you use this command with a prefix argument, then the Imenu
mode (and `imenu-generic-expression') of the current buffer determines
what kinds of definitions are found.  So, if you want to search for
definitions in a certain language, then invoke this command from a
buffer in that language.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.

\(fn BEG END REQUIRE-MATCH &optional WHERE)" t nil)

(autoload 'icicle-tags-search "icicles-cmd2" "\
Search all source files listed in tags tables for matches for REGEXP.
You are prompted for the REGEXP to match.  Enter REGEXP with `RET'.
You do not need `M-,' - you see all matches as search hits to visit.

All tags in a tags file are used, including duplicate tags from the
same or different source files.

By default, all tags files are used, but if you provide a prefix
argument then only the current tag table is used.

If your TAGS file references source files that no longer exist, those
files are listed.  In that case, you might want to update your TAGS
file.

\(fn REGEXP &optional ARG)" t nil)

(autoload 'icicle-save-string-to-variable "icicles-cmd2" "\
Save a string (text) to a variable.
You are prompted for the string to save.  Typically, you store a
regexp or part of a regexp in the variable.

By default, the variable is user option `icicle-input-string'.
To save to a different variable, use a prefix argument; you are then
prompted for the variable to use.

You can use `\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]' to insert a string from a
variable.

\(fn ASKP)" t nil)

(autoload 'icicle-object-action "icicles-cmd2" "\
Act on an object of type TYPE (a symbol).
You are prompted for the type (\"What\"), then for an object of that
type (\"Which\"), then for the action function to apply to the
object (\"How\").  For Anything types (see below), you are not
prompted for the action function.

The \"type\" of an object is one of these:

a. A type defining an entry `icicle-predicate-types-alist'.
   These are type predicates, such as `bufferp', `keywordp', or `atom'.

b. The `type' of an Anything source, or its `name' if it has no
   `type'.  This is available only if you use library `anything.el'
   and option `icicle-use-anything-candidates-flag' is non-nil.

c. A type defining an entry in user option
   `icicle-type-actions-alist'.

In the case of Anything types (only), this is a multi-command:
* `C-RET', `C-mouse-2', and so on perform the default action.
* `C-S-RET', `C-S-mouse-2', and so on let you choose the action using
  completion.

Though this is not a multi-command for non-Anything types, for types
`buffer' and `file' you can use `S-delete' during completion to delete
the object (buffer or file) named by the current completion candidate.

Objects of types (b) and (c) are easily associated with names.  Their
names are the completion candidates.  So, for instance, if you choose
type `buffer', then you can act on a buffer by choosing its name.

Objects of predicate type (type a) are not necessarily named.  The
completion candidates for these objects are variables (symbols) whose
values are the objects acted upon.  So, for instance, if you choose
type `bufferp', then you can choose a variable whose value is a
buffer, in order to act on that buffer.  Whereas a buffer is always
named, an object of type `stringp' is not.  The value of variable
`emacs-version' is one such string that you can act on.

Anything types and Anything actions are highlighted when used as
candidates in `*Completions*', using face `icicle-special-candidate'.

Be aware that the action function you choose must accommodate the
object you choose as its only an argument.  Also, completion of the
function candidate itself is not strict, so you can enter a lambda
form.

With a prefix argument, the result of applying the function to the
object is pretty-printed using `icicle-pp-eval-expression'.
Otherwise, the function is called for its effect only, and its value
is not displayed.

You can use a prefix argument similarly when you act on an individual
function (\"How\") candidate to apply it to the object, without ending
completion.  That is, `C-u C-RET', `C-u C-mouse-2', and so on, will
pretty-print the result of the individual action.

This command is intended for use only in Icicle mode.

\(fn &optional TYPE)" t nil)
 (autoload 'icicle-choose-faces           "icicles-cmd2.el")
 (autoload 'icicle-choose-invisible-faces "icicles-cmd2.el")
 (autoload 'icicle-choose-visible-faces   "icicles-cmd2.el")
 (autoload 'icicle-hide-faces             "icicles-cmd2.el")
 (autoload 'icicle-hide-only-faces        "icicles-cmd2.el")
 (autoload 'icicle-show-faces             "icicles-cmd2.el")
 (autoload 'icicle-show-only-faces        "icicles-cmd2.el")
 (autoload 'icicle-pick-color-by-name "icicles-cmd2.el")
 (autoload 'synonyms                        "icicles-cmd2.el")
 (autoload 'icicle-synonyms                 "icicles-cmd2.el")
 (autoload 'icicle-insert-thesaurus-entry   "icicles-cmd2.el")
 (autoload 'icicle-complete-thesaurus-entry "icicles-cmd2.el")
 (autoload 'icicle-tag-a-file                              "icicles-cmd2.el")
 (autoload 'icicle-untag-a-file                            "icicles-cmd2.el")
 (autoload 'icicle-find-file-tagged                        "icicles-cmd2.el")
 (autoload 'icicle-find-file-tagged-other-window           "icicles-cmd2.el")
 (autoload 'icicle-find-file-all-tags                      "icicles-cmd2.el")
 (autoload 'icicle-find-file-all-tags-other-window         "icicles-cmd2.el")
 (autoload 'icicle-find-file-all-tags-regexp               "icicles-cmd2.el")
 (autoload 'icicle-find-file-all-tag-regexp-other-windows  "icicles-cmd2.el")
 (autoload 'icicle-find-file-some-tags                     "icicles-cmd2.el")
 (autoload 'icicle-find-file-some-tags-other-window        "icicles-cmd2.el")
 (autoload 'icicle-find-file-some-tags-regexp              "icicles-cmd2.el")
 (autoload 'icicle-find-file-some-tags-regexp-other-window "icicles-cmd2.el")

;;;***

;;;### (autoloads (Icicles-Searching Icicles-Miscellaneous Icicles-Minibuffer-Display
;;;;;;  Icicles-Matching Icicles-Key-Completion Icicles-Key-Bindings
;;;;;;  Icicles-Completions-Display Icicles-Files Icicles-Buffers
;;;;;;  Icicles) "icicles-face" "../icicles/icicles-face.el" (20033
;;;;;;  30039))
;;; Generated autoloads from ../icicles/icicles-face.el

(let ((loads (get 'Icicles 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Buffers 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Buffers 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Files 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Files 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Completions-Display 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Completions-Display 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Key-Bindings 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Key-Bindings 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Key-Completion 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Key-Completion 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Matching 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Matching 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Minibuffer-Display 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Minibuffer-Display 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Miscellaneous 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Miscellaneous 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Searching 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Searching 'custom-loads (cons '"icicles-face" loads))))

(defface icicle-candidate-part '((((background dark)) (:background "#451700143197")) (t (:background "#EF84FFEAF427"))) "\
*Face used to highlight part(s) of a candidate in `*Completions*'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-common-match-highlight-Completions '((((background dark)) (:foreground "#2017A71F2017")) (t (:foreground "magenta3"))) "\
*Face used to highlight candidates common match, in `*Completions*'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-complete-input '((((background dark)) (:foreground "#B19E6A64B19E")) (t (:foreground "DarkGreen"))) "\
*Face used to highlight input when it is complete." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

(defface icicle-completion '((((background dark)) (:foreground "#0000D53CD53C")) (t (:foreground "Red"))) "\
*Face used to indicate minibuffer completion.
It highlights the minibuffer indicator and the `Icy' minor-mode
lighter during completion.
Not used for versions of Emacs before version 21." :group (quote Icicles-Minibuffer-Display) :group (quote Icicles-Miscellaneous) :group (quote faces))

(defface icicle-Completions-instruction-1 '((((background dark)) (:foreground "#AC4AAC4A0000")) (t (:foreground "Blue"))) "\
*Face used to highlight first line of `*Completions*' buffer." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-Completions-instruction-2 '((((background dark)) (:foreground "#0000D53CD53C")) (t (:foreground "Red"))) "\
*Face used to highlight second line of `*Completions*' buffer." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-current-candidate-highlight '((((background dark)) (:background "#69D40A460000")) (t (:background "CadetBlue1"))) "\
*Face used to highlight the current candidate, in `*Completions*'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-extra-candidate '((((background dark)) (:background "#4517305D0000")) (t (:background "#C847D8FEFFFF"))) "\
*Face used to highlight `*Completions*' candidates that are extra.
This means that they belong to list `icicle-extra-candidates'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-historical-candidate '((((background dark)) (:foreground "#DBD599DF0000")) (t (:foreground "Blue"))) "\
*Face used to highlight `*Completions*' candidates that have been used." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-input-completion-fail '((((background dark)) (:background "#22225F5F2222")) (t (:foreground "Black" :background "Plum"))) "\
*Face for highlighting failed part of input during strict completion." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

(defface icicle-input-completion-fail-lax '((((background dark)) (:background "#00005E3B5A8D")) (t (:foreground "Black" :background "#FFFFB8C4BB87"))) "\
*Face for highlighting failed part of input during lax completion." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

(defface icicle-match-highlight-Completions '((((background dark)) (:foreground "#1F1FA21CA21C")) (t (:foreground "Red3"))) "\
*Face used to highlight root that was completed, in `*Completions*'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-match-highlight-minibuffer '((t (:underline t))) "\
*Face used to highlight root that was completed, in minibuffer." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

(defface icicle-mode-line-help '((((background dark)) (:foreground "#AC4AAC4A0000")) (t (:foreground "Blue"))) "\
*Face used to highlight help shown in the mode-line." :group (quote Icicles-Completions-Display) :group (quote Icicles-Miscellaneous) :group (quote faces))

(defface icicle-multi-command-completion '((((background dark)) (:foreground "#0000D53CD53C" :background "#8B3500007533")) (t (:foreground "Red" :background "#78F6FFFF8E4F"))) "\
*Face used to indicate Icicles multi-command completion.
It highlights the minibuffer indicator and the `Icy+' minor-mode
lighter during multi-command completion.
Not used for versions of Emacs before version 21." :group (quote Icicles-Minibuffer-Display) :group (quote Icicles-Miscellaneous) :group (quote faces))

(defface icicle-mustmatch-completion '((((type x w32 mac graphic) (class color)) (:box (:line-width -2 :color "Blue"))) (t (:inverse-video t))) "\
*Face used to indicate strict minibuffer completion.
It highlights the minibuffer indicator and the `Icy' or `Icy+'
minor-mode lighter during strict completion.
Not used for versions of Emacs before version 21." :group (quote Icicles-Minibuffer-Display) :group (quote Icicles-Miscellaneous) :group (quote faces))

(defface icicle-proxy-candidate '((((background dark)) (:background "#316B22970000")) (t (:background "#E1E1EAEAFFFF" :box (:line-width 2 :color "White" :style released-button)))) "\
*Face used to highlight proxy candidates in `*Completions*'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-saved-candidate '((((background dark)) (:background "gray20")) (t (:background "gray80"))) "\
*Face used to highlight `*Completions*' candidates that have been saved." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-search-main-regexp-current '((((background dark)) (:background "#00004AA652F1")) (t (:background "misty rose"))) "\
*Face used to highlight current match of your search context regexp.
This highlighting is done during Icicles searching." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-1 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 80) 10) "#071F473A0000"))) (t (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 80) 10) "#FA6CC847FFFF"))))) "\
*Face used to highlight level (subgroup match) 1 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-2 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 40) 10) "#507400002839"))) (t (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 40) 10) "#C847FFFFE423"))))) "\
*Face used to highlight level (subgroup match) 2 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-3 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 60) 10) "#4517305D0000"))) (t (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 60) 10) "#C847D8FEFFFF"))))) "\
*Face used to highlight level (subgroup match) 3 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-4 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 20) 10) "#176900004E0A"))) (t (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 20) 10) "#EF47FFFFC847"))))) "\
*Face used to highlight level (subgroup match) 4 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-5 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-hue context-bg 80) "#04602BC00000"))) (t (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-hue context-bg 80) "#FCFCE1E1FFFF"))))) "\
*Face used to highlight level (subgroup match) 5 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-6 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-hue context-bg 40) "#32F200001979"))) (t (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-hue context-bg 40) "#E1E1FFFFF0F0"))))) "\
*Face used to highlight level (subgroup match) 6 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-7 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-hue context-bg 60) "#316B22970000"))) (t (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-hue context-bg 60) "#E1E1EAEAFFFF"))))) "\
*Face used to highlight level (subgroup match) 7 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-8 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-hue context-bg 20) "#12EC00003F0E"))) (t (:background ,(if (fboundp 'icicle-increment-color-saturation) (icicle-increment-color-hue context-bg 20) "#F6F5FFFFE1E1"))))) "\
*Face used to highlight level (subgroup match) 8 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-current-input '((((background dark)) (:foreground "White" :background "#7F0D00007F0D")) (t (:foreground "Black" :background "Green"))) "\
*Face used to highlight what your current input matches.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-main-regexp-others '((((background dark)) (:background "#348608690000")) (t (:background "CadetBlue1"))) "\
*Face used to highlight other matches of your search context regexp.
If user option `icicle-search-highlight-threshold' is less than one,
then this face is not used.
This highlighting is done during Icicles searching." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-special-candidate '((((background dark)) (:background "#176900004E0A")) (t (:background "#EF47FFFFC847"))) "\
*Face used to highlight `*Completions*' candidates that are special.
The meaning of special is that their names match
`icicle-special-candidate-regexp'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-whitespace-highlight '((((background dark)) (:background "#000093F402A2")) (t (:background "Magenta"))) "\
*Face used to highlight initial whitespace in minibuffer input." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

;;;***

;;;### (autoloads (icicle-maybe-cached-action icicle-minibuffer-default-add-dired-shell-commands)
;;;;;;  "icicles-fn" "../icicles/icicles-fn.el" (20033 30040))
;;; Generated autoloads from ../icicles/icicles-fn.el

(autoload 'icicle-minibuffer-default-add-dired-shell-commands "icicles-fn" "\
Return a list of all commands associated with current dired files.
The commands are from `minibuffer-default-add-dired-shell-commands',
and if `dired-x.el' is used, `dired-guess-default'.

\(fn)" t nil)

(autoload 'icicle-maybe-cached-action "icicles-fn" "\
Evaluate and return ACTION or `icicle-all-candidates-action'.
If `icicle-all-candidates-action' is nil, use ACTION.
If it is t, then set it to the value of ACTION, so the next call
 returns the same value.

\(fn ACTION)" nil (quote macro))

;;;***

;;;### (autoloads (icicle-define-sort-command icicle-define-file-command
;;;;;;  icicle-define-command icicle-define-add-to-alist-command)
;;;;;;  "icicles-mac" "../icicles/icicles-mac.el" (20033 30042))
;;; Generated autoloads from ../icicles/icicles-mac.el

(autoload 'icicle-define-add-to-alist-command "icicles-mac" "\
Define COMMAND that adds an item to an alist user option.
Any items with the same key are first removed from the alist.
DOC-STRING is the doc string of COMMAND.
CONSTRUCT-ITEM-FN is a function that constructs the new item.
  It reads user input.
ALIST-VAR is the alist user option.
Optional arg DONT-SAVE non-nil means do not call
`customize-save-variable' to save the updated variable.

\(fn COMMAND DOC-STRING CONSTRUCT-ITEM-FN ALIST-VAR &optional DONT-SAVE)" nil (quote macro))

(autoload 'icicle-define-command "icicles-mac" "\
Define COMMAND with DOC-STRING based on FUNCTION.
COMMAND is a symbol.  DOC-STRING is a string.
FUNCTION is a function that takes one argument, read as input.
  (If the argument to FUNCTION is a file name or directory name, then
  use macro `icicle-define-file-command', instead.)

BINDINGS is a list of `let*' bindings added around the command code.
  The following bindings are pre-included - you can refer to them in
  the command body (including in FIRST-SEXP, LAST-SEXP, UNDO-SEXP).

  `icicle-orig-buff'   is bound to (current-buffer)
  `icicle-orig-window' is bound to (selected-window)
BINDINGS is macroexpanded, so it can also be a macro call that expands
to a list of bindings.  For example, you can use
`icicle-buffer-bindings' here.

In case of user quit (`C-g') or error, an attempt is made to restore
the original buffer.

FIRST-SEXP is a sexp evaluated before the main body of the command.
UNDO-SEXP is a sexp evaluated in case of error or if the user quits.
LAST-SEXP is a sexp evaluated after the main body of the command.
NOT-INTERACTIVE-P non-nil means to define COMMAND as a non-interactive
 function that reads multi-command input.

Other arguments are as for `completing-read'.

In order, the created command does this:

 - Uses DOC-STRING, with information about Icicles bindings appended.
 - Binds BINDINGS for the rest of the command.
 - Evaluates FIRST-SEXP.
 - Reads input with `completing-read', using PROMPT, COLLECTION,
   PREDICATE, REQUIRE-MATCH, INITIAL-INPUT, HIST, DEF, and
   INHERIT-INPUT-METHOD.
 - Calls FUNCTION on the input that was read.
 - Evaluates UNDO-SEXP in case of error or if the user quits.
 - Evaluates LAST-SEXP.

The created command also binds `icicle-candidate-action-fn' to a
function that calls FUNCTION on the current completion candidate.
Note that the BINDINGS are of course not in effect within
`icicle-candidate-action-fn'.

\(fn COMMAND DOC-STRING FUNCTION PROMPT COLLECTION &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT HIST DEF INHERIT-INPUT-METHOD BINDINGS FIRST-SEXP UNDO-SEXP LAST-SEXP NOT-INTERACTIVE-P)" nil (quote macro))

(autoload 'icicle-define-file-command "icicles-mac" "\
Define COMMAND with DOC-STRING based on FUNCTION.
COMMAND is a symbol.  DOC-STRING is a string.
FUNCTION is a function that takes one file-name or directory-name
argument, read as input.  (Use macro `icicle-define-command' for a
FUNCTION whose argument is not a file or directory name.)

BINDINGS is a list of `let*' bindings added around the command code.
  The following bindings are pre-included - you can refer to them in
  the command body (including in FIRST-SEXP, LAST-SEXP, UNDO-SEXP).

  `icicle-orig-buff'   is bound to (current-buffer)
  `icicle-orig-window' is bound to (selected-window)
BINDINGS is macroexpanded, so it can also be a macro call that expands
to a list of bindings.  For example, you can use
`icicle-buffer-bindings' or `icicle-file-bindings' here.

In case of user quit (`C-g') or error, an attempt is made to restore
the original buffer.

FIRST-SEXP is a sexp evaluated before the main body of the command.
UNDO-SEXP is a sexp evaluated in case of error or if the user quits.
LAST-SEXP is a sexp evaluated after the main body of the command.
NOT-INTERACTIVE-P non-nil means to define COMMAND as a non-interactive
 function that reads multi-command input.

Other arguments are as for `read-file-name'.

In order, the created command does this:

 - Uses DOC-STRING, with information about Icicles bindings appended.
 - Binds BINDINGS for the rest of the command.
 - Evaluates FIRST-SEXP.
 - Reads input with `read-file-name', using PROMPT, DIR,
   DEFAULT-FILENAME, REQUIRE-MATCH, INITIAL-INPUT, and PREDICATE.
 - Calls FUNCTION on the input that was read.
 - Evaluates UNDO-SEXP in case of error or if the user quits.
 - Evaluates LAST-SEXP.

The created command also binds `icicle-candidate-action-fn' to a
function that calls FUNCTION on the current completion candidate.
Note that the BINDINGS are of course not in effect within
`icicle-candidate-action-fn'.

\(fn COMMAND DOC-STRING FUNCTION PROMPT &optional DIR DEFAULT-FILENAME REQUIRE-MATCH INITIAL-INPUT PREDICATE BINDINGS FIRST-SEXP UNDO-SEXP LAST-SEXP NOT-INTERACTIVE-P)" nil (quote macro))

(autoload 'icicle-define-sort-command "icicles-mac" "\
Define a command to sort completions by SORT-ORDER.
SORT-ORDER is a short string (or symbol) describing the sort order.
 It is used after the phrase \"Sorting is now \".  Examples: \"by date\",
 \"alphabetically\", \"directories first\", and \"previously used first\".

The new command is named by replacing any spaces in SORT-ORDER with
hyphens (`-') and then adding the prefix `icicle-sort-'.

COMPARISON-FN is a function that compares two strings, returning
 non-nil if and only if the first string sorts before the second.

DOC-STRING is the doc string of the new command.

\(fn SORT-ORDER COMPARISON-FN DOC-STRING)" nil (quote macro))

;;;***

;;;### (autoloads (icicle-delete-windows-on icicle-remove-Completions-window
;;;;;;  icicle-toggle-case-sensitivity icicle-toggle-literal-replacement
;;;;;;  icicle-regexp-quote-input icicle-toggle-regexp-quote icicle-toggle-search-cleanup
;;;;;;  icicle-toggle-ignored-extensions icicle-dispatch-C-\. icicle-toggle-highlight-saved-candidates
;;;;;;  icicle-toggle-highlight-historical-candidates icicle-toggle-ignored-space-prefix
;;;;;;  icicle-toggle-show-multi-completion icicle-toggle-hiding-common-match
;;;;;;  icicle-toggle-highlight-all-current icicle-toggle-remote-file-testing
;;;;;;  icicle-dispatch-C-^ icicle-toggle-expand-to-common-match
;;;;;;  icicle-toggle-incremental-completion icicle-toggle-transforming
;;;;;;  icicle-toggle-proxy-candidates icicle-toggle-angle-brackets
;;;;;;  icicle-toggle-sorting icicle-toggle-alternative-sorting icicle-toggle-C-for-actions
;;;;;;  icicle-toggle-~-for-home-dir icicle-toggle-WYSIWYG-Completions
;;;;;;  icicle-doremi-inter-candidates-min-spaces+ icicle-doremi-candidate-width-factor+
;;;;;;  icicle-isearch-complete icicle-history icicle-scroll-Completions-backward
;;;;;;  icicle-scroll-Completions-forward icicle-scroll-backward
;;;;;;  icicle-scroll-forward icicle-change-history-variable icicle-use-interactive-command-history
;;;;;;  icicle-other-history icicle-keep-only-past-inputs icicle-candidate-set-save-persistently
;;;;;;  icicle-candidate-set-save-to-variable icicle-add-file-to-fileset
;;;;;;  icicle-add/update-saved-completion-set icicle-candidate-set-save-more-selected
;;;;;;  icicle-candidate-set-save-selected icicle-candidate-set-save-more
;;;;;;  icicle-candidate-set-save icicle-mouse-candidate-set-save-more
;;;;;;  icicle-mouse-candidate-set-save icicle-mouse-save/unsave-candidate
;;;;;;  icicle-save/unsave-candidate icicle-candidate-set-retrieve-persistent
;;;;;;  icicle-candidate-set-retrieve-from-variable icicle-candidate-set-retrieve-more
;;;;;;  icicle-candidate-set-retrieve-1 icicle-candidate-set-retrieve
;;;;;;  icicle-candidate-set-complement icicle-candidate-set-intersection
;;;;;;  icicle-candidate-set-union icicle-candidate-set-difference
;;;;;;  icicle-candidate-set-define icicle-candidate-set-swap icicle-read+insert-file-name
;;;;;;  icicle-completing-read+insert icicle-save-predicate-to-variable
;;;;;;  icicle-narrow-candidates-with-predicate icicle-apropos-complete-and-narrow
;;;;;;  icicle-apropos-complete-and-widen icicle-narrow-candidates
;;;;;;  icicle-widen-candidates icicle-Completions-mouse-3-menu icicle-mouse-candidate-read-fn-invoke
;;;;;;  icicle-candidate-read-fn-invoke icicle-help-on-candidate
;;;;;;  icicle-mouse-help-on-candidate icicle-delete-candidate-object
;;;;;;  icicle-mouse-remove-candidate icicle-remove-candidate icicle-mouse-candidate-alt-action
;;;;;;  icicle-mouse-candidate-action icicle-candidate-alt-action
;;;;;;  icicle-candidate-action icicle-all-candidates-list-alt-action
;;;;;;  icicle-all-candidates-list-action icicle-all-candidates-alt-action
;;;;;;  icicle-all-candidates-action icicle-beginning-of-line+ icicle-end-of-line+
;;;;;;  icicle-next-line icicle-previous-line icicle-move-to-next-completion
;;;;;;  icicle-move-to-previous-completion icicle-switch-to/from-minibuffer
;;;;;;  icicle-insert-completion icicle-switch-to-Completions-buf
;;;;;;  icicle-apropos-complete-no-display icicle-apropos-complete
;;;;;;  icicle-prefix-word-complete icicle-prefix-complete-no-display
;;;;;;  icicle-prefix-complete icicle-help-on-next-apropos-candidate
;;;;;;  icicle-help-on-previous-apropos-candidate icicle-help-on-next-prefix-candidate
;;;;;;  icicle-help-on-previous-prefix-candidate icicle-next-apropos-candidate-alt-action
;;;;;;  icicle-previous-apropos-candidate-alt-action icicle-next-prefix-candidate-alt-action
;;;;;;  icicle-previous-prefix-candidate-alt-action icicle-next-apropos-candidate-action
;;;;;;  icicle-previous-apropos-candidate-action icicle-next-prefix-candidate-action
;;;;;;  icicle-previous-prefix-candidate-action icicle-next-candidate-per-mode-help
;;;;;;  icicle-previous-candidate-per-mode-help icicle-next-candidate-per-mode-alt-action
;;;;;;  icicle-next-candidate-per-mode-action icicle-previous-candidate-per-mode-alt-action
;;;;;;  icicle-previous-candidate-per-mode-action icicle-next-apropos-candidate
;;;;;;  icicle-previous-apropos-candidate icicle-next-prefix-candidate
;;;;;;  icicle-previous-prefix-candidate icicle-previous-candidate-per-mode
;;;;;;  icicle-next-candidate-per-mode icicle-insert-newline-in-minibuffer
;;;;;;  icicle-pp-eval-expression-in-minibuffer icicle-insert-key-description
;;;;;;  icicle-toggle-search-whole-word icicle-dispatch-M-q icicle-insert-list-join-string
;;;;;;  icicle-insert-string-from-variable icicle-insert-string-at-point
;;;;;;  icicle-insert-history-element icicle-retrieve-last-input
;;;;;;  icicle-retrieve-previous-input icicle-retrieve-next-input
;;;;;;  icicle-universal-argument-minus icicle-universal-argument-other-key
;;;;;;  icicle-universal-argument-more icicle-universal-argument
;;;;;;  icicle-negative-argument icicle-digit-argument icicle-abort-recursive-edit
;;;;;;  icicle-minibuffer-help icicle-plus-saved-sort icicle-reverse-sort-order
;;;;;;  icicle-change-alternative-sort-order icicle-search-define-replacement
;;;;;;  icicle-dispatch-M-comma icicle-change-sort-order icicle-next-S-TAB-completion-method
;;;;;;  icicle-next-TAB-completion-method icicle-doremi-increment-swank-prefix-length+
;;;;;;  icicle-doremi-increment-swank-timeout+ icicle-doremi-increment-max-candidates+
;;;;;;  icicle-toggle-dot icicle-toggle-search-replace-whole icicle-toggle-search-replace-common-match
;;;;;;  icicle-toggle-ignoring-comments icicle-dispatch-M-_ icicle-erase-minibuffer
;;;;;;  icicle-insert-dot-command icicle-insert-a-space icicle-self-insert
;;;;;;  icicle-mouse-yank-secondary icicle-yank-pop icicle-yank icicle-transpose-sexps
;;;;;;  icicle-transpose-words icicle-transpose-chars icicle-goto/kill-failed-input
;;;;;;  icicle-replace-input-w-parent-dir icicle-up-directory icicle-make-directory
;;;;;;  icicle-kill-region icicle-kill-line icicle-kill-paragraph
;;;;;;  icicle-backward-kill-paragraph icicle-kill-sentence icicle-backward-kill-sentence
;;;;;;  icicle-kill-sexp icicle-backward-kill-sexp icicle-kill-word
;;;;;;  icicle-backward-kill-word icicle-delete-char icicle-delete-backward-char
;;;;;;  icicle-backward-delete-char-untabify icicle-backward-char-dots
;;;;;;  icicle-forward-char-dots icicle-erase-minibuffer-or-history-element
;;;;;;  icicle-switch-to-completions icicle-mouse-choose-completion
;;;;;;  icicle-choose-completion icicle-apropos-complete-and-exit
;;;;;;  icicle-minibuffer-complete-and-exit icicle-exit-minibuffer
;;;;;;  icicle-next-history-element) "icicles-mcmd" "../icicles/icicles-mcmd.el"
;;;;;;  (20033 30042))
;;; Generated autoloads from ../icicles/icicles-mcmd.el

(autoload 'icicle-next-history-element "icicles-mcmd" "\
Insert the next element of the minibuffer history in the minibuffer.
With argument N, it uses the Nth following element.

\(fn ARG)" t nil)

(autoload 'icicle-exit-minibuffer "icicles-mcmd" "\
Terminate this minibuffer argument.
Remove `*Completions*' window.  Remove Icicles minibuffer faces.

\(fn)" t nil)

(autoload 'icicle-minibuffer-complete-and-exit "icicles-mcmd" "\
If the minibuffer contents is a valid completion, then exit.
Otherwise try to complete it.

\(fn)" t nil)

(autoload 'icicle-apropos-complete-and-exit "icicles-mcmd" "\
If the minibuffer contents is a valid apropos completion, then exit.
Otherwise try to complete it.  If completion leads to a valid
completion, then exit.
This is to `minibuffer-complete-and-exit' as `icicle-apropos-complete'
is to `minibuffer-complete'.  That is, it is the regexp-match version.

\(fn)" t nil)

(autoload 'icicle-choose-completion "icicles-mcmd" "\
Choose the completion that point is in or next to.

\(fn)" t nil)

(autoload 'icicle-mouse-choose-completion "icicles-mcmd" "\
Click a completion candidate in buffer `*Completions*', to choose it.
Return the number of the candidate: 0 for first, 1 for second, ...

\(fn EVENT)" t nil)

(autoload 'icicle-switch-to-completions "icicles-mcmd" "\
Select the completion list window, `*Completions*'.

\(fn)" t nil)

(autoload 'icicle-erase-minibuffer-or-history-element "icicles-mcmd" "\
`icicle-erase-minibuffer' or, if using history, delete history element.

\(fn)" t nil)

(autoload 'icicle-forward-char-dots "icicles-mcmd" "\
Move forward N chars (backward if N is negative).  Handles dots (`.').

\(fn &optional N)" t nil)

(autoload 'icicle-backward-char-dots "icicles-mcmd" "\
Move backward N chars (forward if N is negative).  Handles dots (`.').

\(fn &optional N)" t nil)

(autoload 'icicle-backward-delete-char-untabify "icicles-mcmd" "\
`backward-delete-char-untabify' + update `*Completions*' with matches.
Handles Icicles dots (`.').

\(fn N &optional KILLFLAG)" t nil)

(autoload 'icicle-delete-backward-char "icicles-mcmd" "\
`delete-backward-char' and update `*Completions*' with input matches.
Handles Icicles dots (`.').

\(fn N &optional KILLFLAG)" t nil)

(autoload 'icicle-delete-char "icicles-mcmd" "\
`delete-char' and update `*Completions*' with input matches.
Handles Icicles dots (`.').

\(fn N &optional KILLFLAG)" t nil)

(autoload 'icicle-backward-kill-word "icicles-mcmd" "\
`backward-kill-word' and update `*Completions*' with input matches.
See description of `backward-kill-word'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-word "icicles-mcmd" "\
`kill-word' and update `*Completions*' with regexp input matches.
See description of `kill-word'.

\(fn ARG)" t nil)

(autoload 'icicle-backward-kill-sexp "icicles-mcmd" "\
`backward-kill-sexp' and update `*Completions*' with input matches.
See description of `backward-kill-sexp'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-sexp "icicles-mcmd" "\
`kill-sexp' and update `*Completions*' with regexp input matches.
See description of `kill-sexp'.

\(fn ARG)" t nil)

(autoload 'icicle-backward-kill-sentence "icicles-mcmd" "\
`backward-kill-sentence' and update `*Completions*' with input matches.
See description of `backward-kill-sentence'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-sentence "icicles-mcmd" "\
`kill-sentence' and update `*Completions*' with regexp input matches.
See description of `kill-sentence'.

\(fn ARG)" t nil)

(autoload 'icicle-backward-kill-paragraph "icicles-mcmd" "\
`backward-kill-paragraph' and update `*Completions*' with input matches.
See description of `backward-kill-paragraph'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-paragraph "icicles-mcmd" "\
`kill-paragraph' and update `*Completions*' with regexp input matches.
See description of `kill-paragraph'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-line "icicles-mcmd" "\
`kill-line' and update `*Completions*' with regexp input matches.
See description of `kill-line'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-region "icicles-mcmd" "\
`kill-region' and update `*Completions*' with regexp input matches.
See description of `kill-region'.

\(fn BEG END)" t nil)

(autoload 'icicle-make-directory "icicles-mcmd" "\
Create a directory.

\(fn DIR)" t nil)

(autoload 'icicle-up-directory "icicles-mcmd" "\
Replace minibuffer input with parent directory, then upate `*Completions*'.

\(fn)" t nil)

(autoload 'icicle-replace-input-w-parent-dir "icicles-mcmd" "\
Replace minibuffer input with the parent directory.

\(fn)" t nil)

(autoload 'icicle-goto/kill-failed-input "icicles-mcmd" "\
Go to start of input portion that does not complete.  Repeat to kill.
Kill (delete) the part of the input that does not complete.
Repeat to delete more.

\(fn)" t nil)

(autoload 'icicle-transpose-chars "icicles-mcmd" "\
`transpose-chars' and update `*Completions*' with regexp input matches.
Handles Icicles dots (`.').

\(fn ARG)" t nil)

(autoload 'icicle-transpose-words "icicles-mcmd" "\
`transpose-words' and update `*Completions*' with regexp input matches.
See description of `transpose-words'.

\(fn ARG)" t nil)

(autoload 'icicle-transpose-sexps "icicles-mcmd" "\
`transpose-sexps' and update `*Completions*' with regexp input matches.
See description of `transpose-sexps'.

\(fn ARG)" t nil)

(autoload 'icicle-yank "icicles-mcmd" "\
`yank' and update `*Completions*' with regexp input matches.
See description of `yank'.

\(fn ARG)" t nil)

(autoload 'icicle-yank-pop "icicles-mcmd" "\
`yank-pop' and update `*Completions*' with regexp input matches.
See description of `yank-pop'.

\(fn ARG)" t nil)

(autoload 'icicle-mouse-yank-secondary "icicles-mcmd" "\
Insert the secondary selection where you click.
Move point to the end of the inserted text.
If `mouse-yank-at-point' is non-nil, insert at point
regardless of where you click.

\(fn EVENT)" t nil)

(autoload 'icicle-self-insert "icicles-mcmd" "\
`self-insert' and update `*Completions*' with regexp input matches.
See description of `self-insert'.

\(fn N)" t nil)

(autoload 'icicle-insert-a-space "icicles-mcmd" "\
Insert a space.
For convenience in the minibuffer - does the same thing as `C-q SPC'.
To use this, bind it to some key sequence in keymaps
`minibuffer-local-completion-map',
`minibuffer-local-filename-completion-map', and
`minibuffer-local-must-match-map'.

\(fn)" t nil)

(autoload 'icicle-insert-dot-command "icicles-mcmd" "\
Insert `icicle-dot-string': either `.' or `icicle-anychar-regexp'.
With a numeric prefix argument, insert the dot that many times.

With a plain prefix arg (`C-u'), insert the opposite kind of dot
\(once) from what is indicated by the current value of
`icicle-dot-string'.

\(fn &optional ARG)" t nil)

(autoload 'icicle-erase-minibuffer "icicles-mcmd" "\
Delete all user input in the minibuffer, then update completions.

\(fn)" t nil)
 (autoload 'icicle-sort-alphabetical "icicles-mcmd.el")
 (autoload 'icicle-sort-special-candidates-first "icicles-mcmd.el")
 (autoload 'icicle-sort-extra-candidates-first "icicles-mcmd.el")
 (autoload 'icicle-sort-proxy-candidates-first "icicles-mcmd.el")
 (autoload 'icicle-sort-case-insensitive "icicles-mcmd.el")
 (autoload 'icicle-sort-by-2nd-parts-alphabetically "icicles-mcmd.el")
 (autoload 'icicle-sort-by-last-file-modification-time "icicles-mcmd.el")
 (autoload 'icicle-sort-by-file-type "icicles-mcmd.el")
 (autoload 'icicle-sort-by-directories-first "icicles-mcmd.el")
 (autoload 'icicle-sort-by-directories-last "icicles-mcmd.el")
 (autoload 'icicle-sort-by-last-use-as-input "icicles-mcmd.el")
 (autoload 'icicle-sort-by-previous-use-alphabetically "icicles-mcmd.el")
 (autoload 'icicle-sort-by-abbrev-frequency "icicles-mcmd.el")
 (autoload 'icicle-sort-turned-OFF "icicles-mcmd.el")

(autoload 'icicle-dispatch-M-_ "icicles-mcmd" "\
Do the right thing for `M-_'.
During Icicles search, call `icicle-toggle-search-replace-whole'.
Otherwise, call `icicle-toggle-ignored-space-prefix'.

Bound to `M-_' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-ignoring-comments 'icicle-toggle-ignoring-comments)

(autoload 'icicle-toggle-ignoring-comments "icicles-mcmd" "\
Toggle the value of option `icicle-ignore-comments-flag'.
If option `ignore-comments-flag' is defined (in library
`thing-cmds.el') then it too is toggled.
Bound to `C-M-;' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-search-replace-common-match 'icicle-toggle-search-replace-common-match)

(autoload 'icicle-toggle-search-replace-common-match "icicles-mcmd" "\
Toggle the value of `icicle-search-replace-common-match-flag'.
Note that that option has no effect if
`icicle-expand-input-to-common-match-flag' is nil.
Bound to `M-;' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-search-replace-whole 'icicle-toggle-search-replace-whole)

(autoload 'icicle-toggle-search-replace-whole "icicles-mcmd" "\
Toggle the value of `icicle-search-replace-whole-candidate-flag'.
Bound to `M-_' in the minibuffer when searching.

\(fn)" t nil)

(defalias 'toggle-icicle-dot 'icicle-toggle-dot)

(defalias 'toggle-icicle-\. 'icicle-toggle-dot)

(defalias 'icicle-toggle-\. 'icicle-toggle-dot)

(autoload 'icicle-toggle-dot "icicles-mcmd" "\
Toggle `icicle-dot-string' between `.' and `icicle-anychar-regexp'.
Bound to `C-M-.' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-doremi-increment-max-candidates+ "icicles-mcmd" "\
Change `icicle-max-candidates' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
 use the `Meta' key (e.g. `M-up') to increment in larger steps.
You can use a numeric prefix arg to specify the increment.
A plain prefix arg (`C-u') resets `icicle-max-candidates' to nil,
 meaning no limit.

\(fn &optional INCREMENT)" t nil)

(autoload 'icicle-doremi-increment-swank-timeout+ "icicles-mcmd" "\
Change `icicle-swank-timeout' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
use the `Meta' key (e.g. `M-up') to increment in larger steps.

\(fn)" t nil)

(autoload 'icicle-doremi-increment-swank-prefix-length+ "icicles-mcmd" "\
Change `icicle-swank-prefix-length' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
use the `Meta' key (e.g. `M-up') to increment in larger steps.

\(fn)" t nil)

(autoload 'icicle-next-TAB-completion-method "icicles-mcmd" "\
Cycle to the next `TAB' completion method.
Bound to \\<minibuffer-local-completion-map>`\\[icicle-next-TAB-completion-method]' in the minibuffer.
Option `icicle-TAB-completion-methods' determines the TAB completion
methods that are available.

With a prefix argument, the newly chosen method is used only for the
current command.  More precisely, the previously active method is
restored as soon as you return to the top level.

\(fn TEMPORARY-P)" t nil)

(autoload 'icicle-next-S-TAB-completion-method "icicles-mcmd" "\
Cycle to the next `S-TAB' completion method.
Bound to `M-(' in the minibuffer.
Option `icicle-S-TAB-completion-methods-alist' customizes the
available TAB completion methods.

With a prefix argument, the newly chosen method is used only for the
current command.  More precisely, the previously active method is
restored as soon as you return to the top level.

\(fn TEMPORARY-P)" t nil)

(autoload 'icicle-change-sort-order "icicles-mcmd" "\
Choose a sort order.
With a numeric prefix arg, reverse the current sort order.

If plain `C-u' is used or `C-u' is not used at all:

- Use completion if `icicle-change-sort-order-completion-flag' is
  non-nil and no prefix arg is used, or if it is nil and a prefix arg
  is used.

- Otherwise, just cycle to the next sort order.

This command updates `icicle-sort-comparer'.  Non-interactively,
optional arg ALTERNATIVEP means change the current alternative sort
order instead, updating `icicle-alternative-sort-comparer'.

\(fn &optional ARG ALTERNATIVEP)" t nil)

(autoload 'icicle-dispatch-M-comma "icicles-mcmd" "\
Do the right thing for `M-,'.
If sorting is possible, call `icicle-change-alternative-sort-order'.
If using `icicle-search', call `icicle-search-define-replacement'.
Otherwise, do nothing.

Bound to `M-,' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-search-define-replacement "icicles-mcmd" "\
Prompt user and set new value of `icicle-search-replacement'.
Bound to `M-,' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-change-alternative-sort-order "icicles-mcmd" "\
Choose an alternative sort order.
Similar to command `icicle-change-sort-order', but change the
alternative sort order, not the current sort order.

\(fn &optional ARG)" t nil)

(autoload 'icicle-reverse-sort-order "icicles-mcmd" "\
Reverse the current sort order.

\(fn)" t nil)

(autoload 'icicle-plus-saved-sort "icicles-mcmd" "\
Sort candidates by combining their current order with the saved order.

\(fn)" t nil)

(autoload 'icicle-minibuffer-help "icicles-mcmd" "\
Describe Icicles minibuffer and *Completion* buffer bindings.

\(fn)" t nil)

(autoload 'icicle-abort-recursive-edit "icicles-mcmd" "\
Abort command that requested this recursive edit or minibuffer input.
This calls `abort-recursive-edit' after killing the `*Completions*'
buffer or (if called from the minibuffer) removing its window.

By default, Icicle mode remaps all key sequences that are normally
bound to `abort-recursive-edit' to `icicle-abort-recursive-edit'.  If
you do not want this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn)" t nil)

(autoload 'icicle-digit-argument "icicles-mcmd" "\
`digit-argument', but also echo the prefix.

\(fn ARG)" t nil)

(autoload 'icicle-negative-argument "icicles-mcmd" "\
`negative-argument', but also echo the prefix.

\(fn ARG)" t nil)

(autoload 'icicle-universal-argument "icicles-mcmd" "\
`universal-argument', but also echo the prefix.

\(fn)" t nil)

(autoload 'icicle-universal-argument-more "icicles-mcmd" "\
`universal-argument-more', but also echo the prefix.

\(fn ARG)" t nil)

(autoload 'icicle-universal-argument-other-key "icicles-mcmd" "\
`universal-argument-other-key', but also echo the prefix.

\(fn ARG)" t nil)

(autoload 'icicle-universal-argument-minus "icicles-mcmd" "\
`universal-argument-minus', but also echo the prefix.

\(fn ARG)" t nil)

(autoload 'icicle-retrieve-next-input "icicles-mcmd" "\
Retrieve next minibuffer input.
Like `icicle-retrieve-previous-input', but traverses history toward
the present.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-retrieve-next-input]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-retrieve-previous-input "icicles-mcmd" "\
Retrieve previous minibuffer input.
The possible inputs were not necessarily those entered with `RET'.
With a negative prefix arg, this just empties the completion history.
Otherwise:
 Use completion if `icicle-C-l-uses-completion-flag' is non-nil and no
   prefix arg is used, or if it is nil and a prefix arg is used, or if
   `icicle-retrieve-previous-input' is not used interactively.
 Otherwise, just cycle to the previous input.

Non-interactively:
 Non-nil argument REVERSEP means reverse the history order: return the
  next, not the previous, input.
 Non-nil ALLOW-EMPTY-P means the retrieved input can be \"\".

You can use this command only from buffer *Completions or from the
minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-retrieve-previous-input]').

\(fn &optional ARG REVERSEP ALLOW-EMPTY-P)" t nil)

(autoload 'icicle-retrieve-last-input "icicles-mcmd" "\
Put the last real input into the minibuffer.
Use this to replace a completion candidate inserted during cycling.
If `icicle-expand-input-to-common-match-flag' is non-nil or this is
prefix completion, then using this once restores the expanded common
match string, and using it twice in succession restores your original
input.

You can use this command only from buffer *Completions or from the
minibuffer.

\(fn)" t nil)

(autoload 'icicle-insert-history-element "icicles-mcmd" "\
Use completion to insert a previously entered input in the minibuffer.
Always available for any minibuffer input, not just during completion.

\(fn)" t nil)

(autoload 'icicle-insert-string-at-point "icicles-mcmd" "\
Insert text at the cursor into the minibuffer.
Each time this command is called, some text at or near the cursor is
inserted into the minibuffer.  One of two things happens, depending on
the value of option `icicle-default-thing-insertion' and whether or
not you use `C-u'.

See the doc for option `icicle-thing-at-point-functions' for a
complete description of its behavior.  What follows is an overview.

`icicle-thing-at-point-functions' is a cons of two parts - call them
ALTERNATIVES and FORWARD-THING.

If ALTERNATIVES is not nil and one of the following is true:
 - FORWARD-THING is nil
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have not used plain `C-u' in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have used plain `C-u' in this series of `M-.'
then the next function in ALTERNATIVES is used to retrieve the text to
be inserted.

If FORWARD-THING is not nil and one of the following is true:
 - ALTERNATIVES is nil
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have not used `C-u' in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have used `C-u' in this series of `M-.'
then function FORWARD-THING is used to retrieve the text to be
inserted.

If you use a numeric prefix arg (not just plain `C-u'), the behavior
is as follows.

* If a function in ALTERNATIVES is used (see above), then the text
  that is grabbed at or near point is read as a Lisp sexp and
  evaluated, and the value is inserted instead of the grabbed text.

  Yes, this means you need to know when the particular ALTERNATIVES
  function that you want is coming up next, and use, say, `C-9' just
  before hitting `M-.' for that alternative.  So if, e.g., you want to
  evaluate the active region and insert the value, then you use
  `M-. C-9 M-.', since it is the second `M-.' that grabs the region.

* If the FORWARD-THING is being used, then the prefix arg determines
  the number of things to grab, and the direction of grabbing.: A
  negative argument grabs text to the left of the cursor; a positive
  argument grabs text to the right.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-insert-string-at-point]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-insert-string-from-variable "icicles-mcmd" "\
Insert text into the minibuffer from a variable.
By default, the variable is user option `icicle-input-string'.
To insert from a different variable, use a prefix argument; you are
then prompted for the variable to use.  You can use command
`icicle-save-string-to-variable' to save a string to a variable.
Typically, you store a regexp or part of a regexp in the variable.
This command is bound in the minibuffer to `C-=', by default.
This is especially useful when used with command `icicle-search'.

Some regexps that you might want to assign to variables:

 \"[A-Za-z0-9_.-]+@[A-Za-z0-9_.-]+\"          ; Email address
 \"\\\\([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+\\\\)\"     ; IP address
 \"[0-9]\\\\\\={4\\\\}-[0-9]\\\\\\={2\\\\}-[0-9]\\\\\\={2\\\\}\"   ; Date: 2006-04-14, Time:
 \"^[ \\=\\t]*[0-9]?[0-9]\\\\([:.]?[0-9][0-9]\\\\)?\\\\(am\\\\|pm\\\\|AM\\\\|PM\\\\)?\"
 \"`\\\\(\\\\sw\\\\sw+\\\\)'\"                        ; Words inside `_'
 \"\\\\*.*\\\\*\"                                 ; Special buffer name: *_*

Standard Emacs Lisp libraries are full of regexps that you can assign
to variables for use with `C-='.
 See `align.el' for regexps for programming languages.
 See `url-dav.el' for regexps matching iso8601 dates.
 See `rmail.el', `sendmail.el', and `mh-show.el' for regexps matching
 mail-header fields.

Imenu regexps occurring as parts of different values of
`imenu-generic-expression' for different buffer types can be used as
variable values for `C-='.  They all work fine with `icicle-search',
turning it into a browser or navigator for the given mode.

See, for example, `generic-x.el' and `lisp-mode.el'.  Here is a regexp
for Javascript function definitions from `generic-x.el':

 \"^function\\\\s-+\\\\([A-Za-z0-9_]+\\\\)\"

And `lisp-imenu-generic-expression' (in `lisp-mode.el') provides
regexps for Lisp function, variable, and type definitions.  Here is
the variable-definition regexp:

 \"^\\\\s-*(\\\\(def\\\\(c\\\\(onst\\\\(ant\\\\)?\\\\|ustom\\\\)\\\\|ine-symbol-macro\\\\|
 parameter\\\\|var\\\\)\\\\)\\\\s-+\\\\(\\\\(\\\\sw\\\\|\\\\s_\\\\)+\\\\)\"

Command `icicle-imenu' exploits this to automatically let you browse
definitions.  It is a specialization of `icicle-search' for Imenu.

For more useful regexps, grep for `font-lock-keywords' in Emacs `lisp'
directory and subdirs.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]').

\(fn ASKP)" t nil)

(autoload 'icicle-insert-list-join-string "icicles-mcmd" "\
Insert `icicle-list-join-string' in the minibuffer.
Then, if `1on1-fit-minibuffer-frame-flag' is defined and non-nil, fit
a standalone minibuffer frame to the new minibuffer contents.
You need library `fit-frame.el' for the frame-fitting part.

\(fn)" t nil)

(autoload 'icicle-dispatch-M-q "icicles-mcmd" "\
Do the right thing for `M-q'.
If searching, call `icicle-toggle-search-whole-word'.
Otherwise, call `icicle-insert-key-description'.
Bound to `M-q' in the minibuffer.

\(fn &optional ARG)" t nil)

(defalias 'toggle-icicle-search-whole-word 'icicle-toggle-search-whole-word)

(autoload 'icicle-toggle-search-whole-word "icicles-mcmd" "\
Toggle the value of `icicle-search-whole-word-flag'.
The new value takes effect for the next Icicles search command.
Bound to `M-q' in the minibuffer when searching.

\(fn)" t nil)

(autoload 'icicle-insert-key-description "icicles-mcmd" "\
Read key and insert its description.
For example, if the key read is ^F, then \"C-f\" is inserted.

`icicle-key-descriptions-use-<>-flag' determines whether angle
brackets (`<', `>') are used for named keys, such as function
keys, but a prefix argument reverses the meaning of
`icicle-key-descriptions-use-<>-flag'.

Bound to `M-q' in the minibuffer during key completion.

\(fn TOGGLE-ANGLE-BRACKETS-P)" t nil)

(autoload 'icicle-pp-eval-expression-in-minibuffer "icicles-mcmd" "\
Evaluate an Emacs-Lisp expression and pretty-print its value.
This just calls `pp-eval-expression' from a recursive minibuffer.

\(fn INSERT-VALUE)" t nil)

(autoload 'icicle-insert-newline-in-minibuffer "icicles-mcmd" "\
Insert a newline character (`C-j'), in the minibuffer.
Then, if `1on1-fit-minibuffer-frame-flag' is defined and non-nil, fit
a standalone minibuffer frame to the new minibuffer contents.
You need library `fit-frame.el' for the frame-fitting part.

\(fn ARG)" t nil)

(autoload 'icicle-next-candidate-per-mode "icicles-mcmd" "\
Replace input by NTH next completion candidate.
Default value of NTH is 1, meaning use the next candidate.
Negative NTH means use a previous, not subsequent, candidate.

Uses the next prefix or apropos completion command, depending on
`icicle-current-completion-mode'.  If that is nil and
`icicle-default-cycling-mode' is non-nil, uses the next history
element instead.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-candidate-per-mode]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-candidate-per-mode "icicles-mcmd" "\
Replace input by NTH previous completion candidate.
Default value of NTH is 1, meaning use the previous candidate.
Negative NTH means use a subsequent, not previous, candidate.

Uses the previous prefix or apropos completion command, depending on
`icicle-current-completion-mode'. If that is nil and
`icicle-default-cycling-mode' is non-nil, uses the previous history
element instead.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-candidate-per-mode]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-prefix-candidate "icicles-mcmd" "\
Replace input by NTH previous prefix completion for an input.
Default value of NTH is 1, meaning use the previous prefix completion.
Negative NTH means use a subsequent, not previous, prefix completion.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-prefix-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-prefix-candidate "icicles-mcmd" "\
Replace input by NTH next prefix completion for an input.
Default value of NTH is 1, meaning use the next prefix completion.
Negative NTH means use a previous, not subsequent, prefix completion.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-prefix-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-apropos-candidate "icicles-mcmd" "\
Replace input by NTH previous apropos completion for an input.
Default value of NTH is 1, meaning use the previous apropos completion.
Negative NTH means use a subsequent, not previous, apropos completion.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-apropos-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-apropos-candidate "icicles-mcmd" "\
Replace input by NTH next apropos completion for an input.
Default value of NTH is 1, meaning use the next apropos completion.
Negative NTH means use a previous, not subsequent, apropos completion.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-apropos-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-candidate-per-mode-action "icicles-mcmd" "\
`icicle-previous-candidate-per-mode' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-candidate-per-mode-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-candidate-per-mode-alt-action "icicles-mcmd" "\
`icicle-previous-candidate-per-mode' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-candidate-per-mode-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-candidate-per-mode-action "icicles-mcmd" "\
`icicle-next-candidate-per-mode' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-candidate-per-mode-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-candidate-per-mode-alt-action "icicles-mcmd" "\
`icicle-next-candidate-per-mode' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-candidate-per-mode-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-candidate-per-mode-help "icicles-mcmd" "\
`icicle-previous-candidate-per-mode' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-candidate-per-mode-help]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-candidate-per-mode-help "icicles-mcmd" "\
`icicle-next-candidate-per-mode' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-candidate-per-mode-help]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-prefix-candidate-action "icicles-mcmd" "\
`icicle-previous-prefix-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-prefix-candidate-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-prefix-candidate-action "icicles-mcmd" "\
`icicle-next-prefix-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-prefix-candidate-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-apropos-candidate-action "icicles-mcmd" "\
`icicle-previous-apropos-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-apropos-candidate-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-apropos-candidate-action "icicles-mcmd" "\
`icicle-next-apropos-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-apropos-candidate-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-prefix-candidate-alt-action "icicles-mcmd" "\
`icicle-previous-prefix-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-prefix-candidate-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-prefix-candidate-alt-action "icicles-mcmd" "\
`icicle-next-prefix-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-prefix-candidate-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-apropos-candidate-alt-action "icicles-mcmd" "\
`icicle-previous-apropos-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-apropos-candidate-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-apropos-candidate-alt-action "icicles-mcmd" "\
`icicle-next-apropos-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-apropos-candidate-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-help-on-previous-prefix-candidate "icicles-mcmd" "\
`icicle-previous-prefix-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-help-on-previous-prefix-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-help-on-next-prefix-candidate "icicles-mcmd" "\
`icicle-next-prefix-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-help-on-next-prefix-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-help-on-previous-apropos-candidate "icicles-mcmd" "\
`icicle-previous-apropos-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-help-on-previous-apropos-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-help-on-next-apropos-candidate "icicles-mcmd" "\
`icicle-next-apropos-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-help-on-next-apropos-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-prefix-complete "icicles-mcmd" "\
Complete the minibuffer contents as far as possible, as a prefix.
Repeat this to cycle among candidate completions.
If no characters can be completed, display the possible completions.
Candidate completions are appropriate names whose prefix is the
minibuffer input, where appropriateness is determined by the context
\(command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-prefix-complete]').

\(fn)" t nil)

(autoload 'icicle-prefix-complete-no-display "icicles-mcmd" "\
Like `icicle-prefix-complete', but without displaying `*Completions*'.
Optional arg NO-MSG-P non-nil means do not show a minibuffer message
indicating that candidates were updated.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-prefix-complete-no-display]').

\(fn &optional NO-MSG-P)" t nil)

(autoload 'icicle-prefix-word-complete "icicles-mcmd" "\
Complete the minibuffer contents at most a single word.
Repeating this completes additional words.
Spaces and hyphens in candidates are considered word separators.
If only a single candidate matches, the input is completed entirely.
Return nil if there is no valid completion, else t.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-prefix-word-complete]').

\(fn)" t nil)

(autoload 'icicle-apropos-complete "icicles-mcmd" "\
Complete the minibuffer contents as far as possible.
Repeat this to cycle among candidate completions.
This uses \"apropos completion\", defined as follows:
A completion contains the minibuffer input somewhere, as a substring.
Display a list of possible completions in buffer `*Completions*'.
Candidate completions are appropriate names that match the current
input, taken as a regular expression, where appropriateness is
determined by the context (command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-apropos-complete]').

\(fn)" t nil)

(autoload 'icicle-apropos-complete-no-display "icicles-mcmd" "\
Like `icicle-apropos-complete', but without displaying `*Completions*'.
Optional arg NO-MSG-P non-nil means do not show a minibuffer message
indicating that candidates were updated.
You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-apropos-complete-no-display]').

\(fn &optional NO-MSG-P)" t nil)

(autoload 'icicle-switch-to-Completions-buf "icicles-mcmd" "\
Select the completion list window.
The cursor is placed on the first occurrence of the current minibuffer
content.  You can use \\<completion-list-mode-map>`\\[icicle-insert-completion]' to get back to the minibuffer.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-switch-to-Completions-buf]').

\(fn)" t nil)

(autoload 'icicle-insert-completion "icicles-mcmd" "\
Select the active minibuffer window.  Insert current completion.
The current candidate in `*Completions*' (under the cursor) is
inserted into the minibuffer as the current input.  You can use \\<minibuffer-local-completion-map>`\\[icicle-switch-to-Completions-buf]'
to switch to the `*Completions*' window.

You can use this command only from buffer `*Completions*' (`\\<completion-list-mode-map>\\[icicle-insert-completion]').

Non-interactively, optional arg COMPLETION is the completion inserted.

\(fn &optional COMPLETION)" t nil)

(autoload 'icicle-switch-to/from-minibuffer "icicles-mcmd" "\
Switch to minibuffer or previous buffer, in other window.
If current buffer is the minibuffer, then switch to the buffer that
was previously current.  Otherwise, switch to the minibuffer.

\(fn)" t nil)

(autoload 'icicle-move-to-previous-completion "icicles-mcmd" "\
Move to the previous item in the completion list.

You can use this command only from buffer `*Completions*' (`\\<completion-list-mode-map>\\[icicle-move-to-previous-completion]').

\(fn N)" t nil)

(autoload 'icicle-move-to-next-completion "icicles-mcmd" "\
Move to the next item in the completion list.
With prefix argument N, move N items (negative N means move backward).
Optional second argument, if non-nil, means do not copy the completion
back to the minibuffer.

You can use this command only from buffer `*Completions*' (`\\<completion-list-mode-map>\\[icicle-move-to-next-completion]').

\(fn N &optional NO-MINIBUFFER-FOLLOW-P)" t nil)

(autoload 'icicle-previous-line "icicles-mcmd" "\
Move up a line, in `*Completions*' buffer.  Wrap around first to last.
You can use this command only from buffer `*Completions*' (`\\<completion-list-mode-map>\\[icicle-previous-line]').

\(fn)" t nil)

(autoload 'icicle-next-line "icicles-mcmd" "\
Move down a line, in `*Completions*' buffer.  Wrap around last to first.
You can use this command only from buffer `*Completions*' (`\\<completion-list-mode-map>\\[icicle-next-line]').

\(fn)" t nil)

(autoload 'icicle-end-of-line+ "icicles-mcmd" "\
Move cursor to end of current line or end of next line if repeated.
This is similar to `end-of-line', but:
  If called interactively with no prefix arg:
     If the previous command was also `end-of-line+', then move to the
     end of the next line.  Else, move to the end of the current line.
  Otherwise, move to the end of the Nth next line (Nth previous line
     if N<0).  Command `end-of-line', by contrast, moves to the end of
     the (N-1)th next line.

\(fn &optional N)" t nil)

(autoload 'icicle-beginning-of-line+ "icicles-mcmd" "\
Move cursor to beginning of current line or next line if repeated.
This is the similar to `beginning-of-line', but:
1. With arg N, the direction is the opposite: this command moves
   backward, not forward, N lines.
2. If called interactively with no prefix arg:
      If the previous command was also `beginning-of-line+', then move
      to the beginning of the previous line.  Else, move to the
      beginning of the current line.
   Otherwise, move to the beginning of the Nth previous line (Nth next
      line if N<0).  Command `beginning-of-line', by contrast, moves to
      the beginning of the (N-1)th next line.

\(fn &optional N)" t nil)

(autoload 'icicle-all-candidates-action "icicles-mcmd" "\
Take action on each completion candidate, in turn.
Apply `icicle-candidate-action-fn' successively to each saved
completion candidate (if any) or each candidate that matches the
current input (a regular expression).  The candidates that were not
successfully acted upon are listed in buffer *Help*.

If there are saved completion candidates, then they are acted on;
if not, then all current matching candidates are acted on.

If `icicle-candidate-action-fn' is nil but
`icicle-all-candidates-list-action-fn' is not, then apply the latter
to the list of candidates as a whole, instead.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-all-candidates-action]').

\(fn)" t nil)

(autoload 'icicle-all-candidates-alt-action "icicles-mcmd" "\
Take alternative action on each completion candidate, in turn.
Apply `icicle-candidate-alt-action-fn' successively to each saved
completion candidate (if any) or each candidate that matches the
current input (a regular expression).  The candidates that were not
successfully acted upon are listed in buffer *Help*.

If there are saved completion candidates, then they are acted on; if
not, then all current matching candidates are acted on.

If `icicle-candidate-alt-action-fn' is nil but
`icicle-all-candidates-list-alt-action-fn' is not, then apply the
latter to the list of candidates as a whole, instead.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-all-candidates-alt-action]').

\(fn)" t nil)

(autoload 'icicle-all-candidates-list-action "icicles-mcmd" "\
Take action on the list of all completion candidates.
Apply `icicle-all-candidates-list-action-fn' to the list of saved
completion candidates or the list of candidates that match the current
input (a regular expression).

If there are saved completion candidates, then they are acted on; if
not, then all current matching candidates are acted on.

If `icicle-all-candidates-list-action-fn' is nil but
`icicle-candidate-action-fn' is not, then apply the latter to each
matching candidate in turn, and print the candidates that were not
successfully acted upon in buffer *Help*.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-all-candidates-list-action]').

\(fn)" t nil)

(autoload 'icicle-all-candidates-list-alt-action "icicles-mcmd" "\
Take alternative action on the list of all completion candidates.
Apply `icicle-all-candidates-list-alt-action-fn' to the list of saved
completion candidates or the list of completion candidates that match
the current input (a regular expression).

If there are saved completion candidates, then they are acted on;
if not, then all current matching candidates are acted on.

If `icicle-all-candidates-list-alt-action-fn' is nil but
`icicle-candidate-alt-action-fn' is not, then apply the latter to each
matching candidate in turn, and print the candidates that were not
successfully acted upon in buffer *Help*.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-all-candidates-list-alt-action]').

\(fn)" t nil)

(autoload 'icicle-candidate-action "icicles-mcmd" "\
Take action on the current minibuffer-completion candidate.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the current candidate, to perform the action.

If no action is available in the current context, help on the
candidate is shown - see `icicle-help-on-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-action]').

\(fn)" t nil)

(autoload 'icicle-candidate-alt-action "icicles-mcmd" "\
Take alternative action on the current completion candidate.
If `icicle-candidate-alt-action-fn' is non-nil, it is a
function to apply to the current candidate, to perform the action.

For many Icicles commands, if `icicle-candidate-alt-action-fn' is nil,
you are prompted to choose an alternative action, using completion.

In any case, any alternative action defined for the current context by
user option `icicle-alternative-actions-alist' always overrides
`icicle-candidate-alt-action'.  That is, if
`icicle-alternative-actions-alist' says to use function `foo', then
Icicles uses `foo' as the alternative action, regardless of the value
of `icicle-candidate-alt-action'.

If no alternative action is available in the current context, help on
the candidate is shown - see `icicle-help-on-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-alt-action]').

\(fn)" t nil)

(autoload 'icicle-mouse-candidate-action "icicles-mcmd" "\
Take action on the completion candidate clicked by `mouse-2'.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the clicked candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.

\(fn EVENT)" t nil)

(autoload 'icicle-mouse-candidate-alt-action "icicles-mcmd" "\
Take alternative action on the candidate clicked by `mouse-2'.
If `icicle-candidate-alt-action-fn' is non-nil, it is a
function to apply to the clicked candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.

\(fn EVENT)" t nil)

(autoload 'icicle-remove-candidate "icicles-mcmd" "\
Remove current completion candidate from the set of candidates.
This has no effect on the object, if any, represented by the
candidate; in particular, that object is not deleted.

Note: For Emacs versions prior to 22, this does not really remove a
file-name candidate as a possible candidate.  If you use \\<minibuffer-local-completion-map>\\[icicle-prefix-complete] or \\[icicle-apropos-complete],
it will reappear as a possible candidate.

You can use this command only from the minibuffer (`\\[icicle-remove-candidate]').

\(fn)" t nil)

(autoload 'icicle-mouse-remove-candidate "icicles-mcmd" "\
Remove clicked completion candidate from the set of candidates.
This has no effect on the object, if any, represented by the
candidate; in particular, that object is not deleted.

See `icicle-remove-candidate' for more information.

\(fn EVENT)" t nil)

(autoload 'icicle-delete-candidate-object "icicles-mcmd" "\
Delete the object named by the current completion candidate.
With a prefix argument, delete *ALL* objects named by the current set
of candidates, after confirmation.

Do nothing if `icicle-deletion-action-flag' is nil.

Otherwise:

* If the value of variable `icicle-delete-candidate-object' is a
  function, then apply it to the current completion candidate.  This
  should delete some object named by the completion candidate.

* If `icicle-delete-candidate-object' is not a function, then it
  should be a symbol bound to an alist.  In this case, invoke
  `icicle-delete-candidate-object' to delete the object named by the
  current completion candidate from that alist.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-delete-candidate-object]').

\(fn &optional ALLP)" t nil)

(autoload 'icicle-mouse-help-on-candidate "icicles-mcmd" "\
Display help on the minibuffer-completion candidate clicked by mouse.

\(fn EVENT)" t nil)

(autoload 'icicle-help-on-candidate "icicles-mcmd" "\
Display help on the current minibuffer-completion candidate.
The help displayed depends on the type of candidate, as follows:

 menu item - the corresponding command is described using
             `describe-function' (only if `lacarte.el' is loaded)
 command or other function - described using `describe-function'
 keymap variable - described using `describe-keymap'
                   (if available - see library `help-fns+.el')
 user option or other variable - described using `describe-variable'
 face - described using `describe-face'
 command abbreviation - described using `apropos-command' for matches
 property list - described using `apropos-describe-plist'
 buffer name - modes described using `describe-mode' (Emacs > 20)
 file name - file properties described

If the same candidate names a function, a variable, and a face, or any
two of these, then all such documentation is shown (Emacs 22+).

In the minibuffer, you can also use `C-M-down', `C-M-up',
`C-M-wheel-down', `C-M-wheel-up', `C-M-next', `C-M-prior', `C-M-end',
and `C-M-home', to display help on the candidate and then move to the
next or previous candidate.  See, for example,
`icicle-help-on-next-apropos-candidate'.

You can use this command only from the minibuffer or `*Completions*'
\(`\\[icicle-help-on-candidate]').

\(fn &optional CAND)" t nil)

(autoload 'icicle-candidate-read-fn-invoke "icicles-mcmd" "\
Read function name.  Invoke function on current completion candidate.
Set `icicle-candidate-action-fn' to the interned name.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-read-fn-invoke]').

\(fn)" t nil)

(autoload 'icicle-mouse-candidate-read-fn-invoke "icicles-mcmd" "\
Read function name.  Invoke function on candidate clicked by mouse.

\(fn EVENT)" t nil)

(autoload 'icicle-Completions-mouse-3-menu "icicles-mcmd" "\
Pop-up menu on `C-mouse-3' for the current candidate in `*Completions*'.

\(fn EVENT)" t nil)

(autoload 'icicle-widen-candidates "icicles-mcmd" "\
Complete, allowing also candidates that match an alternative regexp.
You are prompted for the alternative input pattern.  Use `RET' to
enter it.

To (apropos) complete using a wider set of candidates, you use this
command after you have completed (`TAB' or `S-TAB').  A shortcut is to
use `\\<minibuffer-local-completion-map>\\[icicle-apropos-complete-and-widen]' - it is the same as `S-TAB' followed by `\\[icicle-widen-candidates]'.

This command turns off `icicle-expand-input-to-common-match-flag', for
clarity.  You can use `\\[icicle-toggle-expand-to-common-match]' to toggle that option.

\(fn)" t nil)

(autoload 'icicle-narrow-candidates "icicles-mcmd" "\
Narrow the set of completion candidates using another input regexp.
This, in effect, performs a set intersection operation on 1) the set
of candidates in effect before the operation and 2) the set of
candidates that match the current input.  You can repeatedly use this
command to continue intersecting candidate sets, progressively
narrowing the set of matches.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-narrow-candidates]').

\(fn)" t nil)

(autoload 'icicle-apropos-complete-and-widen "icicles-mcmd" "\
Apropos complete, then `icicle-widen-candidates'.
You must enter the new, alternative input pattern using `RET'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-apropos-complete-and-widen]').

\(fn)" t nil)

(autoload 'icicle-apropos-complete-and-narrow "icicles-mcmd" "\
Apropos complete, then `icicle-narrow-candidates'.
You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-apropos-complete-and-narrow]').

\(fn)" t nil)

(autoload 'icicle-narrow-candidates-with-predicate "icicles-mcmd" "\
Narrow the set of completion candidates by applying a predicate.
You can repeatedly use this command to apply additional predicates,
progressively narrowing the set of candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-narrow-candidates-with-predicate]').

When called from Lisp with non-nil arg PREDICATE, use that to narrow.

\(fn &optional PREDICATE)" t nil)

(autoload 'icicle-save-predicate-to-variable "icicles-mcmd" "\
Save the current completion predicate to a variable.
By default, the variable is `icicle-input-string'.  If you use a
prefix argument, then you are prompted for the variable to use.

You can retrieve the saved predicate as a string using `\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-save-predicate-to-variable]').

\(fn ASKP)" t nil)

(autoload 'icicle-completing-read+insert "icicles-mcmd" "\
Read something with completion, and insert it.
Be sure to bind `icicle-completing-read+insert-candidates' to the set
of candidates.
Option `icicle-completing-read+insert-keys' controls which keys are
bound to this command.
Return the string that was inserted.

\(fn)" t nil)

(autoload 'icicle-read+insert-file-name "icicles-mcmd" "\
Read a file name and insert it, without its directory, by default.
With a prefix argument, insert its directory also.
Option `icicle-read+insert-file-name-keys' controls which keys are
 bound to this command.
Return the string that was inserted.

\(fn DIR-TOO-P)" t nil)

(autoload 'icicle-candidate-set-swap "icicles-mcmd" "\
Swap the saved set and current sets of completion candidates.
You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-swap]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-define "icicles-mcmd" "\
Define the set of current completion candidates by evaluating a sexp.
The Lisp sexp must evaluate to a list of strings, such as is returned
by `all-completions'.

You can use this command at top level or from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-define]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-difference "icicles-mcmd" "\
Take the set difference between the current and saved candidates.
The new set of candidates is the set of candidates prior to executing
this command minus the saved set of candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-difference]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-union "icicles-mcmd" "\
Take the set union between the current and saved candidates.
The new set of candidates is the union of the saved set of candidates
and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-union]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-intersection "icicles-mcmd" "\
Take the set intersection between the current and saved candidates.
The new set of candidates is the intersection of the saved set of
candidates and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-intersection]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-complement "icicles-mcmd" "\
Complement the set of current completion candidates.
The new set of candidates is the set of `all-completions' minus the
set of candidates prior to executing this command - that is, all
possible completions of the appropriate type, except for those that
are in the current set of completions.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-complement]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-retrieve "icicles-mcmd" "\
Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\<minibuffer-local-completion-map>\\[icicle-save/unsave-candidate]', `M-S-mouse-2',
`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save]', `\\[icicle-candidate-set-save-to-variable]', or `\\[icicle-candidate-set-save-persistently]'.

With no prefix arg, retrieve candidates from variable
 `icicle-saved-completion-candidates'.
With a numeric prefix arg, retrieve candidates from another variable.
With a plain prefix arg (`C-u'), retrieve candidates from a cache file
 or, if option `icicle-filesets-as-saved-completion-sets-flag' is
 non-nil, an Emacs fileset name (Emacs 22 or later).  To use filesets,
 you must also load library `filesets' and use `(filesets-init)'.

Completion is available when you are prompted for a cache file,
fileset, or variable name.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-retrieve-1 "icicles-mcmd" "\
Helper function for `icicle-candidate-set-retrieve(-more)'.
ARG is the same as the raw prefix arg for `icicle-candidate-set-retrieve'.
MOREP non-nil means add the saved candidates, don't replace existing.

\(fn ARG &optional MOREP)" nil nil)

(autoload 'icicle-candidate-set-retrieve-more "icicles-mcmd" "\
Retrieve a saved set of completion candidates, adding it current.
The saved candidates are added to those already current.
A prefix argument acts as for `icicle-candidate-set-retrieve'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-more]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-retrieve-from-variable "icicles-mcmd" "\
Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\<minibuffer-local-completion-map>\\[icicle-save/unsave-candidate]', `M-S-mouse-2', or
`\\[icicle-candidate-set-save-to-variable]' (or `\\[icicle-candidate-set-save]' with a numeric prefix arg).

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-from-variable]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-retrieve-persistent "icicles-mcmd" "\
Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-persistently]' or `C-u \\[icicle-candidate-set-save]'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-persistent]').

\(fn)" t nil)

(autoload 'icicle-save/unsave-candidate "icicles-mcmd" "\
Add/remove current candidate to/from `icicle-saved-completion-candidates'.
If the candidate is already saved, then unsave it; otherwise, save it.
You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-save/unsave-candidate]').

\(fn)" t nil)

(autoload 'icicle-mouse-save/unsave-candidate "icicles-mcmd" "\
Add/remove clicked candidate to/from `icicle-saved-completion-candidates'.
If the candidate is already saved, then unsave it; otherwise, save it.

\(fn EVENT)" t nil)

(autoload 'icicle-mouse-candidate-set-save "icicles-mcmd" "\
`icicle-candidate-set-save(-selected)'.
If the region is active in `*Completions*', then
`icicle-candidate-set-save-selected'.  Otherwise,
`icicle-candidate-set-save'.

\(fn IGNORE &optional ARG)" t nil)

(autoload 'icicle-mouse-candidate-set-save-more "icicles-mcmd" "\
`icicle-candidate-set-save-more(-selected)'.
If the region is active in `*Completions*', then
`icicle-candidate-set-save-more-selected'.  Otherwise,
`icicle-candidate-set-save-more'.

\(fn IGNORE &optional ARG)" t nil)

(autoload 'icicle-candidate-set-save "icicles-mcmd" "\
Save the set of current completion candidates, for later recall.
Saves candidates in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.  To
 subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of candidates with `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-save-more "icicles-mcmd" "\
Add current completion candidates to saved candidates set.
The current candidates are added to those already saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-more]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-save-selected "icicles-mcmd" "\
`icicle-candidate-set-save', but only for the selected candidates.
Candidates at least partially in the region are saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

As a special case, if no candidates are selected, then this empties
the current set of saved candidates.  That is, it UNsaves all saved
candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-selected]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-save-more-selected "icicles-mcmd" "\
`icicle-candidate-set-save-more', but only for the selected candidates.
Candidates at least partially in the region are added to those saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-more-selected]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-add/update-saved-completion-set "icicles-mcmd" "\
Add or update an entry in `icicle-saved-completion-sets'.
That is, create a new saved completion set or update an existing one.
You are prompted for the name of a set of completion candidates and
its cache file.  By default, the cache file name is the set name
without spaces, and with file extension `icy'.  List
`icicle-saved-completion-sets' is updated to have an entry with these
set and file names.  Return the cache-file name.

\(fn)" t nil)

(autoload 'icicle-add-file-to-fileset "icicles-mcmd" "\
Add FILE to the fileset called NAME.
If FILE is nil, use file of current buffer.
If NAME is nil, prompt for the fileset.

\(fn &optional FILE NAME)" t nil)

(autoload 'icicle-candidate-set-save-to-variable "icicles-mcmd" "\
Save the set of current completion candidates in a variable you choose.
You can retrieve the saved set of candidates with `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-from-variable]' (or `\\[icicle-candidate-set-retrieve]'
with a numeric prefix arg).
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-to-variable]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-save-persistently "icicles-mcmd" "\
Save the set of current completion candidates persistently.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of candidates with `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-persistent]' or `C-u \\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-persistently]').

\(fn FILESETP)" t nil)

(autoload 'icicle-keep-only-past-inputs "icicles-mcmd" "\
Narrow completion candidates to those that have been used previously.
This filters the set of current completion candidates, keeping only
those that have been used before.  (You must first use `TAB' or
`S-TAB' to establish an explicit candidate set.)

With a prefix arg, the previous inputs are sorted chronologically,
most recent first.

Note that whatever completion mode (prefix or apropos) was in effect
before you use `\\<minibuffer-local-completion-map>\\[icicle-keep-only-past-inputs]' remains in effect for
`icicle-keep-only-past-inputs'.  This command does not use a recursive
minibuffer; it simply co-opts the current completion, changing it to
completion against the history.

You can use this command only from the minibuffer (`\\[icicle-keep-only-past-inputs]').

See also `\\[icicle-history]' (`icicle-history').

\(fn &optional RECENT-FIRST)" t nil)

(autoload 'icicle-other-history "icicles-mcmd" "\
Choose a history, or complete against `icicle-interactive-history'.
For Emacs 23 or later, if no prefix arg and you are completing a
  command, abbrev, or keyboard macro name, then complete against
  (non-nil) `icicle-interactive-history'.
Otherwise, prompt with completion for a minibuffer history to use.
  The history choice lasts only for the current (main) completion.
  (To then complete against this history, use `M-h'.)

\(fn ARG)" t nil)

(autoload 'icicle-use-interactive-command-history "icicles-mcmd" "\
Complete input against `icicle-interactive-history'.
This is a history of all Emacs commands called interactively.
This history is available only for Emacs 23 and later, and only if
option `icicle-populate-interactive-history-flag' is not nil.

\(fn)" t nil)

(autoload 'icicle-change-history-variable "icicles-mcmd" "\
Choose a history variable to use now for `minibuffer-history-variable'.
Use completion to choose the history to use.
The choice lasts only for the current (main) completion.
Non-interactively, arg HIST-VAR is the (string) name of a history var.

\(fn HIST-VAR)" t nil)

(autoload 'icicle-scroll-forward "icicles-mcmd" "\
Scroll `icicle-other-window' forward.

\(fn &optional ARG)" t nil)

(autoload 'icicle-scroll-backward "icicles-mcmd" "\
Scroll `icicle-other-window' backward.

\(fn &optional ARG)" t nil)

(autoload 'icicle-scroll-Completions-forward "icicles-mcmd" "\
Scroll the `*Completions*' window forward.
With a prefix argument, or if `icicle-scroll-Completions-reverse-p' is
non-nil, scroll backward.

\(fn &optional REVERSE)" t nil)

(autoload 'icicle-scroll-Completions-backward "icicles-mcmd" "\
Scroll the `*Completions*' window backward.
If `icicle-scroll-Completions-reverse-p' is non-nil, scroll forward.

\(fn)" t nil)

(autoload 'icicle-history "icicles-mcmd" "\
Access the appropriate history list using completion or cycling.
Complete the current minibuffer input against items in the history
list that is in use for the current command.

NOTE:

1. If the required input is a file or directory name, then the entire
minibuffer input is what is matched against the history list.  The
reason for this is that file names in the history list are usually
absolute.  This is unlike the case for normal file-name completion,
which assumes the default directory.

Keep this in mind for apropos (regexp) completion; it means that to
match a file-name using a substring you must, in the minibuffer,
either not specify a directory or explicitly use \".*\" before the
file-name substring.

For example, `/foo/bar/lph' will not apropos-match the previously
input file name `/foo/bar/alphabet-soup.el'; you should use either
`/foo/bar/.*lph' or `lph' (no directory).

2. This also represents a difference in behavior compared to the
similar command `icicle-keep-only-past-inputs' (`\\<minibuffer-local-completion-map>\\[icicle-keep-only-past-inputs]' in the
minibuffer).  That command simply filters the current set of
completion candidates, which in the case of file-name completion is a
set of relative file names.

3. Whatever completion mode (prefix or apropos) was in effect before
you use `\\<minibuffer-local-completion-map>\\[icicle-history]' remains in effect for `icicle-history'.  This command
does not use a recursive minibuffer; it simply co-opts the current
completion, changing it to completion against the history.

You can use this command only from the minibuffer (`\\[icicle-history]').

See also `\\[icicle-keep-only-past-inputs]' (`icicle-keep-only-past-inputs').

\(fn)" t nil)

(autoload 'icicle-isearch-complete "icicles-mcmd" "\
Complete the search string using candidates from the search ring.

\(fn)" t nil)

(autoload 'icicle-doremi-candidate-width-factor+ "icicles-mcmd" "\
Change `icicle-candidate-width-factor' incrementally.
Use `right', `left' or mouse wheel to increase or decrease.  You can
use the `Meta' key (e.g. `M-right') to increment in larger steps.

Use `up', `down', or the mouse wheel to adjust
`icicle-inter-candidates-min-spaces'.

\(fn &optional INCREMENT)" t nil)

(autoload 'icicle-doremi-inter-candidates-min-spaces+ "icicles-mcmd" "\
Change `icicle-inter-candidates-min-spaces' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
 use the `Meta' key (e.g. `M-right') to increment in larger steps.
Use `left', `right', or the mouse wheel to adjust
`icicle-candidate-width-factor'.

\(fn &optional INCREMENT)" t nil)

(defalias 'toggle-icicle-WYSIWYG-Completions 'icicle-toggle-WYSIWYG-Completions)

(autoload 'icicle-toggle-WYSIWYG-Completions "icicles-mcmd" "\
Toggle the value of option `icicle-WYSIWYG-Completions-flag'.

\(fn)" t nil)

(defalias 'toggle-icicle-~-for-home-dir 'icicle-toggle-~-for-home-dir)

(autoload 'icicle-toggle-~-for-home-dir "icicles-mcmd" "\
Toggle the value of option `icicle-use-~-for-home-dir-flag'.
Bound to `M-~' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-C-for-actions 'icicle-toggle-C-for-actions)

(autoload 'icicle-toggle-C-for-actions "icicles-mcmd" "\
Toggle the value of option `icicle-use-C-for-actions-flag'.
Bound to `M-g' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-alternative-sorting 'icicle-toggle-alternative-sorting)

(autoload 'icicle-toggle-alternative-sorting "icicles-mcmd" "\
Toggle alternative sorting of minibuffer completion candidates.
This swaps `icicle-alternative-sort-comparer' and `icicle-sort-comparer'.
Bound to `C-M-,' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-sorting 'icicle-toggle-sorting)

(autoload 'icicle-toggle-sorting "icicles-mcmd" "\
Toggle sorting of minibuffer completion candidates.
When sorting is active, comparison is done by `icicle-sort-comparer'.

\(fn)" t nil)

(defalias 'toggle-icicle-angle-brackets 'icicle-toggle-angle-brackets)

(autoload 'icicle-toggle-angle-brackets "icicles-mcmd" "\
Toggle `icicle-key-descriptions-use-<>-flag'.

\(fn)" t nil)

(defalias 'toggle-icicle-proxy-candidates 'icicle-toggle-proxy-candidates)

(autoload 'icicle-toggle-proxy-candidates "icicles-mcmd" "\
Toggle `icicle-add-proxy-candidates-flag'.
Bound to `\\<minibuffer-local-completion-map>\\[icicle-toggle-proxy-candidates]' in the minibuffer.
With some commands, you must re-invoke the command for the new value
to take effect.  (This is for performance reasons.)

\(fn)" t nil)

(defalias 'toggle-icicle-transforming 'icicle-toggle-transforming)

(autoload 'icicle-toggle-transforming "icicles-mcmd" "\
Toggle transforming of minibuffer completion candidates.
When transforming is active, it is done by `icicle-transform-function'.

By default, transformation, if active, simply removes duplicate
candidates.  Icicles commands already \"do the right thing\" when it
comes to duplicate removal, so you might never need this command.

Bound to `C-$' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-incremental-completion 'icicle-toggle-incremental-completion)

(autoload 'icicle-toggle-incremental-completion "icicles-mcmd" "\
Toggle the value of option `icicle-incremental-completion-flag'.
If the current value is t or `always', then it is set to nil.
If the current value is nil, then it is set to t.
This command never sets the value to non-nil and non-t.

Bound to `C-#' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-expand-to-common-match 'icicle-toggle-expand-to-common-match)

(autoload 'icicle-toggle-expand-to-common-match "icicles-mcmd" "\
Toggle the value of `icicle-expand-input-to-common-match-flag'.
Bound to `C-;' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-dispatch-C-^ "icicles-mcmd" "\
Do the right thing for `C-^'
When Icicles searching, call `icicle-toggle-highlight-all-current'.
Otherwise, call `icicle-toggle-remote-file-testing'.
Bound to `C-^' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-remote-file-testing 'icicle-toggle-remote-file-testing)

(autoload 'icicle-toggle-remote-file-testing "icicles-mcmd" "\
Toggle `icicle-test-for-remote-files-flag'.
If you use Tramp for accessing remote files, then turning this off
also turns off Tramp file-name completion.  Therefore, if you use this
command to turn off testing of remote file names, then use it also to
turn testing back on (instead of just setting the option to non-nil).

Bound to `C-^' in the minibuffer, except during Icicles searching.

\(fn)" t nil)

(defalias 'toggle-icicle-highlight-all-current 'icicle-toggle-highlight-all-current)

(autoload 'icicle-toggle-highlight-all-current "icicles-mcmd" "\
Toggle `icicle-search-highlight-all-current-flag'.
Bound to `C-^' in the minibuffer during Icicles searching (only).

\(fn)" t nil)

(defalias 'toggle-icicle-hiding-common-match 'icicle-toggle-hiding-common-match)

(autoload 'icicle-toggle-hiding-common-match "icicles-mcmd" "\
Toggle `icicle-hide-common-match-in-Completions-flag'.
Bound to `C-M-.' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-show-multi-completion 'icicle-toggle-show-multi-completion)

(autoload 'icicle-toggle-show-multi-completion "icicles-mcmd" "\
Toggle `icicle-show-multi-completion-flag'.
Bound to `M-m' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-ignored-space-prefix 'icicle-toggle-ignored-space-prefix)

(autoload 'icicle-toggle-ignored-space-prefix "icicles-mcmd" "\
Toggle `icicle-ignore-space-prefix-flag'.
Bound to `M-_' in the minibuffer, except during Icicles searching.

Note: If the current command binds `icicle-ignore-space-prefix-flag'
locally, then it is the local, not the global, value that is changed.
For example, `icicle-buffer' binds it to the value of
`icicle-buffer-ignore-space-prefix-flag'.  If that is non-nil, then
\\<minibuffer-local-completion-map>`\\[icicle-toggle-ignored-space-prefix]' toggles `icicle-ignore-space-prefix-flag' to nil only for the
duration of `icicle-buffer'.

\(fn)" t nil)

(defalias 'toggle-icicle-highlight-historical-candidates 'icicle-toggle-highlight-historical-candidates)

(autoload 'icicle-toggle-highlight-historical-candidates "icicles-mcmd" "\
Toggle `icicle-highlight-historical-candidates-flag'.
Bound to `C-pause' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-highlight-saved-candidates 'icicle-toggle-highlight-saved-candidates)

(autoload 'icicle-toggle-highlight-saved-candidates "icicles-mcmd" "\
Toggle `icicle-highlight-saved-candidates-flag'.
Bound to `S-pause' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-dispatch-C-\. "icicles-mcmd" "\
Do the right thing for `C-.'.
When using Icicles search (`icicle-search' and similar commands), call
 `icicle-toggle-search-cleanup'.
Otherwise, call `icicle-toggle-ignored-extensions'.

Bound to `C-.' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-ignored-extensions 'icicle-toggle-ignored-extensions)

(autoload 'icicle-toggle-ignored-extensions "icicles-mcmd" "\
Toggle respect of `completion-ignored-extensions'.
Bound to `C-.' in minibuffer during file-name input.

\(fn)" t nil)

(defalias 'toggle-icicle-search-cleanup 'icicle-toggle-search-cleanup)

(autoload 'icicle-toggle-search-cleanup "icicles-mcmd" "\
Toggle removal of `icicle-search' highlighting after a search.
This toggles option `icicle-search-cleanup-flag'.
Bound to `C-.' in the minibuffer, except for file-name input.

\(fn)" t nil)

(defalias 'toggle-icicle-regexp-quote 'icicle-toggle-regexp-quote)

(autoload 'icicle-toggle-regexp-quote "icicles-mcmd" "\
Toggle escaping of regexp special chars (`icicle-regexp-quote-flag').
Bound to `C-`' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-regexp-quote-input "icicles-mcmd" "\
Regexp quote current input or its active region, then apropos-complete.
Use this if you want to literally match all of what is currently in
the minibuffer or selected text there, but you also want to use that
literal text as part of a regexp for apropos completion.

This turns off `icicle-expand-input-to-common-match-flag'.
You can toggle that option using `C-;'.

Bound to `M-%' in the minibuffer.

\(fn BEG END)" t nil)

(defalias 'toggle-icicle-literal-replacement 'icicle-toggle-literal-replacement)

(autoload 'icicle-toggle-literal-replacement "icicles-mcmd" "\
Toggle escaping of regexp special chars in replacement text.
This toggles option `icicle-search-replace-literally-flag'.

Bound to `C-M-`' in the minibuffer.

\(fn)" t nil)

(defalias 'toggle-icicle-case-sensitivity 'icicle-toggle-case-sensitivity)

(autoload 'icicle-toggle-case-sensitivity "icicles-mcmd" "\
Toggle case sensitivity.

This toggles `case-fold-search' and `completion-ignore-case'.  With a
prefix arg, it also toggles `read-file-name-completion-ignore-case'
\(Emacs 22 and later) and `read-buffer-completion-ignore-case' (Emacs
23 and later).

More precisely, this command first toggles the default value of
`case-fold-search', and then it sets the other variables to the value
of `case-fold-search'.

Note:
1. This toggles the default value of `case-fold-search'.  This means
that it does not matter which buffer is current when you call this
command - all buffers are affected henceforth.

2. Some Icicles commands bind one or more of these variables, so
invoking this command during command execution will not necessarily
toggle the global values of all of the variables.

Bound to `C-A' in the minibuffer, that is, `C-S-a'.

\(fn FILE+BUFF-P)" t nil)

(autoload 'icicle-remove-Completions-window "icicles-mcmd" "\
Remove the `*Completions*' window.
If not called interactively and `*Completions*' is the selected
window, then do not remove it unless optional arg FORCE is non-nil.

\(fn &optional FORCE)" t nil)

(autoload 'icicle-delete-windows-on "icicles-mcmd" "\
Delete all windows showing BUFFER.
If such a window is alone in its frame, then delete the frame - unless
it is the only frame or a standalone minibuffer frame.

\(fn BUFFER)" t nil)

;;;***

;;;### (autoloads (icicle-handle-switch-frame icicle-skip-this-command
;;;;;;  icicle-bind-isearch-keys icicle-mode-hook) "icicles-mode"
;;;;;;  "../icicles/icicles-mode.el" (20033 30043))
;;; Generated autoloads from ../icicles/icicles-mode.el
 (autoload 'icicle-mode "icicles" "Toggle Icicle mode." t nil)
 (autoload 'icy-mode    "icicles" "Toggle Icicle mode." t nil)

(defvar icicle-mode-hook nil "\
*Functions run after entering and exiting Icicle mode.")

(custom-autoload 'icicle-mode-hook "icicles-mode" t)

(defalias 'icy-mode 'icicle-mode)

(autoload 'icicle-bind-isearch-keys "icicles-mode" "\
Bind Icicles Isearch commands.

\(fn)" nil nil)

(autoload 'icicle-skip-this-command "icicles-mode" "\
Prevent `handle-switch-frame' from being added to `this-command'.

\(fn)" t nil)

(autoload 'icicle-handle-switch-frame "icicles-mode" "\
Call `handle-switch-frame', but don't add it to `this-command'.

\(fn EVENT)" t nil)

;;;***

;;;### (autoloads (icicle-WYSIWYG-Completions-flag icicle-word-completion-keys
;;;;;;  icicle-use-candidates-only-once-flag icicle-use-anything-candidates-flag
;;;;;;  icicle-use-C-for-actions-flag icicle-use-~-for-home-dir-flag
;;;;;;  icicle-update-input-hook icicle-unpropertize-completion-result-flag
;;;;;;  icicle-type-actions-alist icicle-transform-function icicle-touche-pas-aux-menus-flag
;;;;;;  icicle-top-level-when-sole-completion-flag icicle-top-level-when-sole-completion-delay
;;;;;;  icicle-top-level-key-bindings icicle-yank-function icicle-thing-at-point-functions
;;;;;;  icicle-test-for-remote-files-flag icicle-recenter icicle-TAB-shows-candidates-flag
;;;;;;  icicle-TAB-completion-methods-per-command icicle-TAB-completion-methods
;;;;;;  icicle-swank-timeout icicle-swank-prefix-length icicle-S-TAB-completion-methods-per-command
;;;;;;  icicle-S-TAB-completion-methods-alist icicle-special-candidate-regexp
;;;;;;  icicle-buffer-configs icicle-sort-comparer icicle-show-multi-completion-flag
;;;;;;  icicle-show-Completions-initially-flag icicle-shell-command-candidates-cache
;;;;;;  icicle-search-whole-word-flag icicle-search-ring-max icicle-search-replace-whole-candidate-flag
;;;;;;  icicle-search-replace-literally-flag icicle-search-replace-common-match-flag
;;;;;;  icicle-search-hook icicle-search-highlight-threshold icicle-search-highlight-context-levels-flag
;;;;;;  icicle-search-highlight-all-current-flag icicle-search-from-isearch-keys
;;;;;;  icicle-search-cleanup-flag icicle-saved-completion-sets icicle-require-match-flag
;;;;;;  icicle-region-background icicle-regexp-search-ring-max icicle-regexp-quote-flag
;;;;;;  icicle-read+insert-file-name-keys icicle-quote-shell-file-name-flag
;;;;;;  icicle-previous-candidate-keys icicle-prefix-cycle-previous-help-keys
;;;;;;  icicle-prefix-cycle-previous-alt-action-keys icicle-prefix-cycle-previous-action-keys
;;;;;;  icicle-prefix-cycle-previous-keys icicle-prefix-cycle-next-help-keys
;;;;;;  icicle-prefix-cycle-next-alt-action-keys icicle-prefix-cycle-next-action-keys
;;;;;;  icicle-prefix-cycle-next-keys icicle-prefix-complete-no-display-keys
;;;;;;  icicle-prefix-complete-keys icicle-pp-eval-expression-print-level
;;;;;;  icicle-pp-eval-expression-print-length icicle-option-type-prefix-arg-list
;;;;;;  icicle-no-match-hook icicle-modal-cycle-up-help-keys icicle-modal-cycle-up-alt-action-keys
;;;;;;  icicle-modal-cycle-up-action-keys icicle-modal-cycle-up-keys
;;;;;;  icicle-modal-cycle-down-help-keys icicle-modal-cycle-down-alt-action-keys
;;;;;;  icicle-modal-cycle-down-action-keys icicle-modal-cycle-down-keys
;;;;;;  icicle-minibuffer-setup-hook icicle-menu-items-to-history-flag
;;;;;;  icicle-max-candidates icicle-list-nth-parts-join-string icicle-list-join-string
;;;;;;  icicle-levenshtein-distance icicle-keymaps-for-key-completion
;;;;;;  icicle-key-descriptions-use-<>-flag icicle-key-complete-keys
;;;;;;  icicle-isearch-complete-keys icicle-inter-candidates-min-spaces
;;;;;;  icicle-input-string icicle-inhibit-ding-flag icicle-inhibit-advice-functions
;;;;;;  icicle-incremental-completion-threshold icicle-incremental-completion-flag
;;;;;;  icicle-incremental-completion-delay icicle-image-files-in-Completions
;;;;;;  icicle-ignore-space-prefix-flag icicle-ignored-directories
;;;;;;  icicle-ignore-comments-flag icicle-highlight-saved-candidates-flag
;;;;;;  icicle-highlight-lighter-flag icicle-highlight-input-initial-whitespace-flag
;;;;;;  icicle-highlight-input-completion-failure-threshold icicle-highlight-input-completion-failure-delay
;;;;;;  icicle-highlight-input-completion-failure icicle-highlight-historical-candidates-flag
;;;;;;  icicle-hide-common-match-in-Completions-flag icicle-help-in-mode-line-delay
;;;;;;  icicle-guess-commands-in-path icicle-functions-to-redefine
;;;;;;  icicle-filesets-as-saved-completion-sets-flag icicle-files-ido-like-flag
;;;;;;  icicle-file-sort icicle-file-require-match-flag icicle-file-predicate
;;;;;;  icicle-file-no-match-regexp icicle-file-match-regexp icicle-file-extras
;;;;;;  icicle-expand-input-to-common-match-flag icicle-dot-string
;;;;;;  icicle-dot-show-regexp-flag icicle-deletion-action-flag icicle-define-alias-commands-flag
;;;;;;  icicle-default-value icicle-default-thing-insertion icicle-default-cycling-mode
;;;;;;  icicle-cycle-into-subdirs-flag icicle-customize-save-variable-function
;;;;;;  icicle-customize-save-flag icicle-Completions-window-max-height
;;;;;;  icicle-Completions-mouse-3-menu-entries icicle-move-Completions-frame
;;;;;;  icicle-completions-format icicle-Completions-display-min-input-chars
;;;;;;  icicle-completion-history-max-length icicle-completing-read+insert-keys
;;;;;;  icicle-complete-keys-self-insert-flag icicle-complete-key-anyway-flag
;;;;;;  icicle-command-abbrev-priority-flag icicle-command-abbrev-match-all-parts-flag
;;;;;;  icicle-command-abbrev-alist icicle-comint-dynamic-complete-replacements
;;;;;;  icicle-color-themes icicle-C-l-uses-completion-flag icicle-change-sort-order-completion-flag
;;;;;;  icicle-change-region-background-flag icicle-point-position-in-candidate
;;;;;;  icicle-mark-position-in-candidate icicle-candidate-width-factor
;;;;;;  icicle-buffers-ido-like-flag icicle-buffer-sort icicle-buffer-require-match-flag
;;;;;;  icicle-buffer-predicate icicle-buffer-no-match-regexp icicle-buffer-match-regexp
;;;;;;  icicle-buffer-ignore-space-prefix-flag icicle-buffer-extras
;;;;;;  icicle-bookmark-refresh-cache-flag icicle-bookmark-name-length-max
;;;;;;  icicle-apropos-cycle-previous-help-keys icicle-apropos-cycle-previous-alt-action-keys
;;;;;;  icicle-apropos-cycle-previous-action-keys icicle-apropos-cycle-previous-keys
;;;;;;  icicle-apropos-cycle-next-help-keys icicle-apropos-cycle-next-alt-action-keys
;;;;;;  icicle-apropos-cycle-next-action-keys icicle-apropos-cycle-next-keys
;;;;;;  icicle-apropos-complete-no-display-keys icicle-apropos-complete-keys
;;;;;;  icicle-anything-transform-candidates-flag icicle-alternative-sort-comparer
;;;;;;  icicle-alternative-actions-alist icicle-add-proxy-candidates-flag
;;;;;;  icicle-act-before-cycle-flag) "icicles-opt" "../icicles/icicles-opt.el"
;;;;;;  (20033 30045))
;;; Generated autoloads from ../icicles/icicles-opt.el

(defconst icicle-Completions-misc-submenu '(misc-menu menu-item "Miscellaneous" (keymap (complete-for-past-completion menu-item "Complete for Past Completion Input" icicle-retrieve-previous-input :visible (or (and icicle-C-l-uses-completion-flag (not current-prefix-arg)) (and (not icicle-C-l-uses-completion-flag) current-prefix-arg))) (previous-completion-input menu-item "Previous Completion Input" icicle-retrieve-previous-input :visible (not (or (and icicle-C-l-uses-completion-flag (not current-prefix-arg)) (and (not icicle-C-l-uses-completion-flag) current-prefix-arg)))) (next-completion-input menu-item "Next Completion Input" icicle-retrieve-next-input) (one-off-eval menu-item "One-Off Eval..." icicle-pp-eval-expression-in-minibuffer) (sep-misc "--") (icicles-help menu-item "Icicles Help" icicle-minibuffer-help))) "\
Submenu for miscellaneous operations on completions.")

(defconst icicle-Completions-save/retrieve-submenu '(save-retrieve-menu menu-item "Save/Retrieve" (keymap (save-all menu-item "Save All" icicle-candidate-set-save) (save-all-var menu-item "             to Variable..." icicle-candidate-set-save-to-variable) (save-all-cache menu-item "             to Cache File..." icicle-candidate-set-save-persistently) (add-all-to-saved menu-item "Add All to Saved" icicle-candidate-set-save-more) (save-selected menu-item "Save Selected (Region) Candidates" icicle-candidate-set-save-selected :enable (and mark-active (> (region-end) (region-beginning)))) (clear-saved menu-item "Clear Saved Candidates" icicle-candidate-set-save-selected :enable (and (boundp 'icicle-saved-completion-candidates) icicle-saved-completion-candidates)) (add-selected-to-saved menu-item "Add Selected (Region) Candidates" icicle-candidate-set-save-more-selected :enable (and mark-active (> (region-end) (region-beginning)))) (sep-save/retrieve-2 "--") (retrieve-saved menu-item "Retrieve Saved" icicle-candidate-set-retrieve :enable (and (boundp 'icicle-saved-completion-candidates) icicle-saved-completion-candidates)) (retrieve-more-saved menu-item "Retrieve More Saved" icicle-candidate-set-retrieve-more :enable (and (boundp 'icicle-saved-completion-candidates) icicle-saved-completion-candidates)))) "\
Submenu for saving and retrieving completion candidates.")

(defconst icicle-Completions-sets-submenu '(sets-menu menu-item "Sets" (keymap (complement menu-item "Complement" icicle-candidate-set-complement) (widen menu-item "Or Match Alternative..." icicle-widen-candidates) (narrow menu-item "Match Also Regexp..." icicle-narrow-candidates) (save-pred-read-var menu-item "Save Predicate to Variable...  (`C-u')" icicle-save-predicate-to-variable :visible current-prefix-arg) (save-pred-std-var menu-item "Save Predicate to `icicle-input-string'" icicle-save-predicate-to-variable :visible (not current-prefix-arg)) (intersect menu-item "Intersect Saved" icicle-candidate-set-intersection :enable icicle-saved-completion-candidates) (difference menu-item "Subtract Saved" icicle-candidate-set-difference :enable icicle-saved-completion-candidates) (union menu-item "Add (Union) Saved" icicle-candidate-set-union :enable icicle-saved-completion-candidates) (keep-past-chrono menu-item "Only Previously Entered, By Time  (`C-u')" icicle-keep-only-past-inputs :visible current-prefix-arg) (keep-past-alpha menu-item "Only Previously Entered" icicle-keep-only-past-inputs :visible (not current-prefix-arg)))) "\
Submenu for set operations on completion candidates.")

(defconst icicle-Completions-sorting-submenu '(sorting-menu menu-item "Sorting" (keymap (change-sort-order menu-item "Change Sort Order" icicle-change-sort-order :visible (or (and icicle-change-sort-order-completion-flag (not current-prefix-arg)) (and (not icicle-change-sort-order-completion-flag) current-prefix-arg))) (next-sort-order menu-item "Next Sort Order" icicle-change-sort-order :visible (not (or (and icicle-change-sort-order-completion-flag (not current-prefix-arg)) (and (not icicle-change-sort-order-completion-flag) current-prefix-arg)))) (change-alt-sort menu-item "Change Alternative Sort Order  (`M-,')" icicle-change-alternative-sort-order :visible (or (and icicle-change-sort-order-completion-flag (not current-prefix-arg)) (and (not icicle-change-sort-order-completion-flag) current-prefix-arg))) (next-alt-sort menu-item "Next Alternative Sort Order  (`M-,')" icicle-change-alternative-sort-order :visible (not (or (and icicle-change-sort-order-completion-flag (not current-prefix-arg)) (and (not icicle-change-sort-order-completion-flag) current-prefix-arg)))) (swap-sort menu-item "Swap Alternative/Normal Sort" icicle-toggle-alternative-sorting))) "\
Submenu for sorting completion candidates.")

(defconst icicle-Completions-this-candidate-submenu '(this-candidate-menu menu-item "This Candidate" (keymap (help-on-cand menu-item "Help About" icicle-help-on-candidate) (sep-this-1 "--") (action menu-item "Act On  (`C-mouse-2')" icicle-candidate-action) (read-fn-invoke menu-item "Apply a Function To...  (`M-mouse-2')" icicle-candidate-read-fn-invoke) (insert-in-minibuffer menu-item "Insert in Minibuffer  (`C-insert')" (lambda nil (interactive) (select-window (active-minibuffer-window)) (goto-char (icicle-minibuffer-prompt-end)) (icicle-clear-minibuffer) (insert icicle-last-completion-candidate)) :help "Insert candidate in minibuffer") (sep-this-2 "--") (all-cands menu-item "Act on Each Individually" icicle-all-candidates-action) (all-list menu-item "Act on All as a List" icicle-all-candidates-list-action))) "\
Submenu for acting on candidate under the mouse.")

(defconst icicle-Completions-toggle-submenu '(toggle-menu menu-item "Toggle/Cycle/Change" (keymap (highlighting-past menu-item "Toggle Highlighting Saved Candidates" icicle-toggle-highlight-saved-candidates) (highlighting-past menu-item "Toggle Highlighting Past Inputs" icicle-toggle-highlight-historical-candidates) (removing-dups menu-item "Toggle Duplicate Removal" icicle-toggle-transforming) (case-sensitivity menu-item "Toggle Case Sensitivity  (`C-A')" icicle-toggle-case-sensitivity) (regexp-quote-input menu-item "Regexp-Quote Current Input" icicle-regexp-quote-input :visible (not (and mark-active (> (region-end) (region-beginning))))) (regexp-quote-region menu-item "Regexp-Quote Input Region" icicle-regexp-quote-input :visible (and mark-active (> (region-end) (region-beginning)))) (matching-of-newlines menu-item "Toggle `.' Matching of Newlines Too" icicle-toggle-dot) (literal-vs-regexp menu-item "Toggle Escaping Special Regexp Chars" icicle-toggle-regexp-quote) (incremental-completion menu-item "Toggle Incremental Completion" icicle-toggle-incremental-completion) (expanding-to-common menu-item "Toggle Common Match Expansion" icicle-toggle-expand-to-common-match) (hiding-common-match menu-item "Toggle Hiding Common Match" icicle-toggle-hiding-common-match) (oneoff-next-S-TAB menu-item "ONE-OFF Next S-TAB Completion Method (`C-u')" icicle-next-S-TAB-completion-method :visible current-prefix-arg) (next-S-TAB menu-item "Next S-TAB Completion Method" icicle-next-S-TAB-completion-method :visible (not current-prefix-arg)) (oneoff-next-TAB menu-item "ONE-OFF Next TAB Completion Method (`C-u')" icicle-next-TAB-completion-method :visible current-prefix-arg) (next-TAB menu-item "Next TAB Completion Method" icicle-next-TAB-completion-method :visible (not current-prefix-arg)) (next-thumbnail-setting menu-item "Next Image-File Thumbnail Setting" icicle-cycle-image-file-thumbnail) (proxy-candidates menu-item "Toggle Including Proxy Candidates" icicle-toggle-proxy-candidates) (WYSIWYG menu-item "Toggle WYSIWYG for `*Completions*'" icicle-toggle-WYSIWYG-Completions) (angle-brackets menu-item "Toggle Using Angle Brackets" icicle-toggle-angle-brackets) (ignored-files menu-item "Toggle Ignored File Extensions  (`C-.')" icicle-toggle-ignored-extensions) (using-C-for-actions menu-item "Toggle Using `C-' for Actions" icicle-toggle-C-for-actions) (using-~-for-home menu-item "Toggle Using `~' for $HOME" icicle-toggle-~-for-home-dir) (sep-toggle-1 "--") (search-highlight-all menu-item "Toggle All-Current Search Highlighting  (`C-^')" icicle-toggle-highlight-all-current) (search-whole-word menu-item "Toggle Whole-Word Searching  (`M-q')" icicle-toggle-search-whole-word) (search-cleanup menu-item "Toggle Removal of Search Highlighting  (`C-.')" icicle-toggle-search-cleanup) (search-replace-whole menu-item "Toggle Replacing Whole Search Hit  (`M-_')" icicle-toggle-search-replace-whole) (search-replace-common menu-item "Toggle Replacing Expanded Common Match" icicle-toggle-search-replace-common-match) (sep-toggle-2 "--") (option menu-item "+ Toggle Option..." icicle-toggle-option :visible (and current-prefix-arg (wholenump (prefix-numeric-value current-prefix-arg)))) (any-var menu-item "+ Toggle Any Variable..." icicle-toggle-option :visible (and current-prefix-arg (not (wholenump (prefix-numeric-value current-prefix-arg))))) (boolean menu-item "+ Toggle Boolean Option..." :visible (not current-prefix-arg)) (reset-var menu-item "+ Set Any Variable to `nil'..." icicle-reset-option-to-nil :visible current-prefix-arg) (reset-option menu-item "+ Set Option to `nil'..." icicle-reset-option-to-nil :visible (not current-prefix-arg)) (set-option-to-t menu-item "+ Set Option to `t'..." icicle-set-option-to-t :visible (and current-prefix-arg (wholenump (prefix-numeric-value current-prefix-arg)))) (set-var-to-t menu-item "+ Set Any Variable to `t'..." icicle-set-option-to-t :visible (and current-prefix-arg (not (wholenump (prefix-numeric-value current-prefix-arg))))) (set-boolean-to-t menu-item "+ Set Boolean Option to `t'..." icicle-set-option-to-t :visible (not current-prefix-arg)))) "\
Submenu for toggling, cycling or changing a variable or a behavior.")

(defvar icicle-act-before-cycle-flag nil "\
*Non-nil means act on current candidate, then cycle to next/previous.
Otherwise (nil), cycle to the next or previous candidate, and then act
on it.

This affects keys such as the following:

 `C-down',   `C-wheel-down',   `C-next',   `C-end',
 `C-M-down', `C-M-wheel-down', `C-M-next', `C-M-end',
 `C-S-down', `C-S-wheel-down', `C-S-next', `C-S-end'.

Note: A few Icicles commands ignore this setting, in order to \"do the
right thing\".")

(custom-autoload 'icicle-act-before-cycle-flag "icicles-opt" t)

(defvar icicle-add-proxy-candidates-flag nil "\
*Non-nil means to include proxy candidates whenever possible.
A proxy candidate is a special candidate (shown in `*Completions*'
using face `icicle-special-candidate') whose name is a placeholder for
the real candidate.  The proxy candidate typically stands for some
value obtained from the cursor position or by some action such as
clicking the mouse.  Example candidates include a color or file name,
named by proxy candidates such as `*copied foreground*' or `*file at
point*'.

You can toggle this option at any time from the minibuffer using
`\\<minibuffer-local-completion-map>\\[icicle-toggle-proxy-candidates]'.  However, for commands that provide many proxy candidates, if
the flag is off initially when input is read, then you must re-invoke
the completing command for the new value to take effect.  (This is for
performance reasons.)")

(custom-autoload 'icicle-add-proxy-candidates-flag "icicles-opt" t)

(defvar icicle-alternative-actions-alist nil "\
*Alist of Emacs commands and alternative action functions.
This always overrides any alternative action defined by
`icicle-candidate-alt-action-fn'.

Each alist element has the form (COMMAND . FUNCTION), where COMMAND is
a command (a symbol) that reads input and FUNCTION is the
alternative-action function it uses.  To disable alternative action
for a given command, use `ignore' as the FUNCTION.

This option has no effect on `icicle-all-candidates-list-alt-action',
that is, `M-|', but it does affect `C-|'.")

(custom-autoload 'icicle-alternative-actions-alist "icicles-opt" t)

(defvar icicle-alternative-sort-comparer 'icicle-historical-alphabetic-p "\
*An alternative sort function, in place of `icicle-sort-comparer'.
You can swap this with `icicle-sort-comparer' at any time by using
`icicle-toggle-alternative-sorting' (\\<minibuffer-local-completion-map>`\\[icicle-toggle-alternative-sorting]' in the minibuffer).")

(custom-autoload 'icicle-alternative-sort-comparer "icicles-opt" t)

(defconst icicle-anychar-regexp (let ((strg (copy-sequence "\\(.\\|[\n]\\)"))) (set-text-properties 0 (length strg) '(display "." face highlight) strg) strg) "\
Regexp that matches any single character, including newline.")

(defvar icicle-anything-transform-candidates-flag nil "\
*Non-nil means `icicle-anything' transforms completion candidates.
Function `anything-transform-candidates' is used for the transforming.

The advantage of a nil value is that `icicle-anything' then acts as a
multi-command: you can act on multiple candidates, or apply multiple
actions for the same candidate, within a single invocation of
`icicle-anything' (or related commands).

The advantage of a non-nil value is that some of the displayed
Anything candidates might be more readable.

This option has no effect if library `anything.el' cannot be loaded.")

(custom-autoload 'icicle-anything-transform-candidates-flag "icicles-opt" t)

(defvar icicle-apropos-complete-keys '([S-tab] [S-iso-lefttab]) "\
*Key sequences to use for `icicle-apropos-complete'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.")

(custom-autoload 'icicle-apropos-complete-keys "icicles-opt" t)

(defvar icicle-apropos-complete-no-display-keys '([C-M-S-tab] [C-M-S-iso-lefttab]) "\
*Key sequences to use for `icicle-apropos-complete-no-display'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `C-M-S-tab' and `C-M-S-iso-lefttab'.")

(custom-autoload 'icicle-apropos-complete-no-display-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-next-keys '([next]) "\
*Key sequences for apropos completion to cycle to the next candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-next-action-keys'.")

(custom-autoload 'icicle-apropos-cycle-next-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-next-action-keys '([C-next]) "\
*Keys for apropos completion to cycle next and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-next-keys'.")

(custom-autoload 'icicle-apropos-cycle-next-action-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-next-alt-action-keys '([C-S-next]) "\
*Keys for apropos completion to cycle next and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-apropos-cycle-next-alt-action-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-next-help-keys '([(control meta next)]) "\
*Keys for apropos completion to cycle next and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-apropos-cycle-next-help-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-previous-keys '([prior]) "\
*Key sequences for apropos completion to cycle to the previous candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-previous-action-keys'.")

(custom-autoload 'icicle-apropos-cycle-previous-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-previous-action-keys '([C-prior]) "\
*Keys for apropos completion to cycle previous and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-previous-keys'.")

(custom-autoload 'icicle-apropos-cycle-previous-action-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-previous-alt-action-keys '([C-S-prior]) "\
*Keys for apropos completion to cycle previous and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-apropos-cycle-previous-alt-action-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-previous-help-keys '([(control meta prior)]) "\
*Keys for apropos completion to cycle previous and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-apropos-cycle-previous-help-keys "icicles-opt" t)

(defvar icicle-bookmark-name-length-max 70 "\
*Maximum number of characters used to name a bookmark.
When `icicle-bookmark-cmd' is used with a non-negative numeric prefix
arg, the name of the bookmark that is set has at most this many chars.")

(custom-autoload 'icicle-bookmark-name-length-max "icicles-opt" t)

(defvar icicle-bookmark-refresh-cache-flag t "\
*t means `icicle-bookmark' refreshes the bookmark-list cache.
Use nil to speed up `icicle-bookmark(-other-window)' if you have a lot
of bookmarks, at the cost of having the bookmark list possibly not be
up to date.  Use t if you want to be sure the list is refreshed.

If nil, the list of bookmarks is updated only if you use `C-u'.
If t, the list is always updated unless you use `C-u'.

This affects only commands such as `icicle-bookmark' that use the full
bookmark list.  It does not affect more specific Icicles bookmark
commands such as `\\[icicle-bookmark-dired-other-window]' or the use
of a negative prefix arg with
`\\[icicle-bookmark-cmd]'.

Regardless of the option value, the cache is refreshed whenever you
use `S-delete' to delete a candidate bookmark.")

(custom-autoload 'icicle-bookmark-refresh-cache-flag "icicles-opt" t)

(defvar icicle-buffer-extras nil "\
*List of additional buffer-name candidates added to the normal list.
List elements are strings.")

(custom-autoload 'icicle-buffer-extras "icicles-opt" t)

(defvar icicle-buffer-ignore-space-prefix-flag t "\
*Override `icicle-ignore-space-prefix-flag' for `icicle-buffer*'.
Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.")

(custom-autoload 'icicle-buffer-ignore-space-prefix-flag "icicles-opt" t)

(defvar icicle-buffer-match-regexp nil "\
*nil or a regexp that buffer-name completion candidates must match.
If nil, then this does nothing.  If a regexp, then show only
candidates that match it (and match the user input).
See also `icicle-buffer-no-match-regexp'.")

(custom-autoload 'icicle-buffer-match-regexp "icicles-opt" t)

(defvar icicle-buffer-no-match-regexp nil "\
*nil or a regexp that buffer-name completion candidates must not match.
If nil, then this does nothing.  If a regexp, then show only
candidates that do not match it.
See also `icicle-buffer-match-regexp'.")

(custom-autoload 'icicle-buffer-no-match-regexp "icicles-opt" t)

(defvar icicle-buffer-predicate nil "\
*nil or a predicate that buffer-name candidates must satisfy.
If nil, then this does nothing.  Otherwise, this is a function of one
argument, a candidate, and only candidates that satisfy the predicate
are displayed.  For example, this value will show only buffers that
are associated with files:

  (lambda (bufname) (buffer-file-name (get-buffer bufname)))

This predicate is applied after matching against user input.  It thus
corresponds to `icicle-must-pass-after-match-predicate', not to
`icicle-must-pass-predicate'.")

(custom-autoload 'icicle-buffer-predicate "icicles-opt" t)

(defvar icicle-buffer-require-match-flag nil "\
*Override `icicle-require-match-flag' for `icicle-buffer*' commands.
Controls the REQUIRE-MATCH arg to `completing-read' and `read-file-name'.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.")

(custom-autoload 'icicle-buffer-require-match-flag "icicles-opt" t)

(defvar icicle-buffer-sort 'icicle-buffer-sort-*\.\.\.*-last "\
*A sort function for buffer names, or nil.
Examples of sort functions are `icicle-buffer-sort-*...*-last' and
`string<'.  If nil, then buffer names are not sorted.")

(custom-autoload 'icicle-buffer-sort "icicles-opt" t)

(defvar icicle-buffers-ido-like-flag nil "\
*t means `icicle-buffer' and similar commands act more Ido-like.
Specifically, those commands then bind these options to t:
 `icicle-show-Completions-initially-flag'
 `icicle-top-level-when-sole-completion-flag'
 `icicle-default-value'")

(custom-autoload 'icicle-buffers-ido-like-flag "icicles-opt" t)

(defvar icicle-candidate-width-factor 80 "\
*Percentage of widest candidate width to use for calculating columns.
The number of columns of candidates displayed in `*Completions*' is no
more than the window width divided by this percentage of the maximum
candidate width.

Increasing this toward 100 spreads columns out. Decreasing it
compresses columns together.  The higher the value, the more
candidates will form well-defined columns, but the likelier that
horizontal space will be wasted between them.  The lower the value,
the more candidates will not line up in columns, but the less
horizontal space will be wasted between them.

When most candidates are almost as wide as the widest candidate, a
high value works well.  When most candidates are much shorter than the
widest candidate, a low value works well.

If you use Do Re Mi (library `doremi.el'), then you can modify this
option incrementally during completion, seeing the effect as it
changes.  Use `C-x w' from the minibuffer, then use the `right' and
`left' arrow keys or the mouse wheel to increment and decrement the
value.  WYSIWYG.

See also option `icicle-inter-candidates-min-spaces' and (starting
with Emacs 23) option `icicle-Completions-text-scale-decrease'.")

(custom-autoload 'icicle-candidate-width-factor "icicles-opt" t)

(defvar icicle-mark-position-in-candidate 'input-end "\
*Position of mark when you cycle through completion candidates.
This is the mark position in the minibuffer.
Possible values are those for `icicle-point-position-in-candidate'.")

(custom-autoload 'icicle-mark-position-in-candidate "icicles-opt" t)

(defvar icicle-point-position-in-candidate 'root-end "\
*Position of cursor when you cycle through completion candidates.
This is the cursor position in the minibuffer.
Possible values are:
 `input-start': beginning of the minibuffer input
 `input-end':   end of the minibuffer input
 `root-start':  beginning of the completion root
 `root-end':    end of the completion root
When input is expected to be a file name, `input-start' is just after
the directory, which is added automatically during completion cycling.
See also `icicle-mark-position-in-candidate'.")

(custom-autoload 'icicle-point-position-in-candidate "icicles-opt" t)

(defvar icicle-change-region-background-flag (not (eq icicle-point-position-in-candidate icicle-mark-position-in-candidate)) "\
*Non-nil means use color `icicle-region-background' during input.
See `icicle-region-background'.  If you load library `hexrgb.el'
before Icicles, then `icicle-region-background' will be a slightly
different hue from your normal background color.  This makes
minibuffer input easier to read than if your normal `region' face were
used.  This has an effect only during minibuffer input.  A non-nil
value for this option is particularly useful if you use
delete-selection mode.")

(custom-autoload 'icicle-change-region-background-flag "icicles-opt" t)

(defvar icicle-change-sort-order-completion-flag nil "\
*Non-nil means `icicle-change-sort-order' uses completion, by default.
Otherwise, it cycles among the possible sort orders.  You can override
the behavior by using `C-u' with `icicle-change-sort-order'.")

(custom-autoload 'icicle-change-sort-order-completion-flag "icicles-opt" t)

(defvar icicle-C-l-uses-completion-flag nil "\
*Non-nil means \\<minibuffer-local-completion-map>`\\[icicle-retrieve-previous-input]' uses completion for choosing completion history
entries, by default.  Otherwise, it cycles among the possible previous
inputs.  You can override the behavior by using `C-u' with `\\[icicle-retrieve-previous-input]'.")

(custom-autoload 'icicle-C-l-uses-completion-flag "icicles-opt" t)

(defvar icicle-color-themes nil "\
*List of color themes to cycle through using `M-x icicle-color-theme'.
Note: Starting with Color Theme version 6.6.0, you will need to put
library `color-theme-library.el', as well as library `color-theme.el',
in your `load-path'.")

(custom-autoload 'icicle-color-themes "icicles-opt" t)

(defvar icicle-comint-dynamic-complete-replacements '((comint-dynamic-complete-filename 'icicle-comint-dynamic-complete-filename) (shell-dynamic-complete-command 'icicle-shell-dynamic-complete-command) (shell-dynamic-complete-environment-variable 'icicle-shell-dynamic-complete-environment-variable) (shell-dynamic-complete-filename 'icicle-shell-dynamic-complete-filename) (ess-complete-filename 'icicle-ess-complete-filename) (ess-complete-object-name 'icicle-ess-complete-object-name)) "\
*List of function replacements for `comint-dynamic-complete-functions'.
Instead of using `comint-dynamic-complete-functions' as is, command
`icicle-comint-dynamic-complete' replaces functions in that list
according to the value of this option.

Each option list element is itself a list of two elements.  The first
is a function to replace (a symbol), and the second is the replacement
function (a sexp that evaluates to a function).  For example, this
list element says to replace completion function `foo' by completion
function `my-foo': (foo 'my-foo).

You can use this option to provide Icicles completion for various
modes that inherit from Comint mode or otherwise use
`comint-dynamic-complete'.")

(custom-autoload 'icicle-comint-dynamic-complete-replacements "icicles-opt" t)

(defvar icicle-command-abbrev-alist nil "\
*Alist of command abbreviations and commands, with frequency of use.
Each element has the form (COMMAND ABBREV N), where ABBREV is an
abbreviation of COMMAND and N is the number of times COMMAND has been
invoked via ABBREV.  Both COMMAND and ABBREV are symbols.")

(custom-autoload 'icicle-command-abbrev-alist "icicles-opt" t)

(defvar icicle-command-abbrev-match-all-parts-flag nil "\
*Non-nil means `icicle-command-abbrev' matches each command-name part.
Otherwise, an abbrev need match only a prefix of the command name.")

(custom-autoload 'icicle-command-abbrev-match-all-parts-flag "icicles-opt" t)

(defvar icicle-command-abbrev-priority-flag nil "\
*nil means commands take precedence over abbreviations for `\\<icicle-mode-map>\\[icicle-command-abbrev]'.")

(custom-autoload 'icicle-command-abbrev-priority-flag "icicles-opt" t)

(defvar icicle-complete-key-anyway-flag nil "\
*Non-nil means bind `S-TAB' for key completion even if already
bound.  If nil, then each of the keys in `icicle-key-complete-keys' is
bound to `icicle-complete-keys' in each keymap of
`icicle-keymaps-for-key-completion' only if `S-TAB' is not already
bound in the keymap.

Note: the keys in `icicle-key-complete-keys' are always bound to
`icicle-complete-keys' in `icicle-mode-map'.  This option affects only
the binding of those keys in `icicle-keymaps-for-key-completion'.")

(custom-autoload 'icicle-complete-key-anyway-flag "icicles-opt" t)

(defvar icicle-complete-keys-self-insert-flag nil "\
*Non-nil means `icicle-complete-keys' includes self-inserting keys.
That means keys bound to `self-insert-command'.")

(custom-autoload 'icicle-complete-keys-self-insert-flag "icicles-opt" t)

(defvar icicle-completing-read+insert-keys '([(control meta shift 99)]) "\
*Key sequences to invoke `icicle-completing-read+insert'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Such a key has no effect unless
`icicle-completing-read+insert-candidates' is non-nil.")

(custom-autoload 'icicle-completing-read+insert-keys "icicles-opt" t)

(defvar icicle-completion-history-max-length (if icicle-C-l-uses-completion-flag 1000 100) "\
*Maximum number of inputs to save in the completion history.
This is the history that you access using \\<minibuffer-local-completion-map>`\\[icicle-retrieve-previous-input]' and `\\[icicle-retrieve-next-input]'.")

(custom-autoload 'icicle-completion-history-max-length "icicles-opt" t)

(defvar icicle-Completions-display-min-input-chars 0 "\
*`*Completions*' window is removed if fewer chars than this are input.
You might want to set this to, say 1 or 2, to avoid display of a large
set of candidates during incremental completion.  The default value of
0 causes this option to have no effect: `*Completions*' is never
removed based only on the number of input characters.")

(custom-autoload 'icicle-Completions-display-min-input-chars "icicles-opt" t)

(defvar icicle-completions-format (if (boundp 'completions-format) completions-format 'horizontal) "\
*Layout of completion candidates in buffer `*Completions*'.
`vertical' means display down columns first, then to the right.
`horizontal' or nil means display across rows first, then down.

Note that multi-line candidates are always displayed in a single
column, and in this case it makes no difference what the value of the
option is - the effect is the same.")

(custom-autoload 'icicle-completions-format "icicles-opt" t)

(defvar icicle-move-Completions-frame 'right "\
*Non-nil means move `*Completions*' frame to the edge of the display.
This is done by `icicle-candidate-action'.
It only happens if `*Completions*' is alone in its frame.
This can be useful to make `*Completions*' more visible.
Possible values are `right', `left', and nil (do not move).")

(custom-autoload 'icicle-move-Completions-frame "icicles-opt" t)

(defvar icicle-Completions-mouse-3-menu-entries `(,icicle-Completions-this-candidate-submenu ,icicle-Completions-sorting-submenu ,icicle-Completions-save/retrieve-submenu ,icicle-Completions-sets-submenu ,icicle-Completions-toggle-submenu ,icicle-Completions-misc-submenu) "\
*Entries for the `mouse-3' popup menu in `*Completions*'.
The menu is created by `icicle-Completions-mouse-3-menu'.

The option value is a list.  Each element defines a submenu or a menu
item.  A null element (`nil') is ignored.

Several alternative entry formats are available.  When customizing,
choose an alternative in the Customize `Value Menu'.

In this description:
 SYMBOL      is a symbol identifying the menu entry.
 `menu-item' is just that text, literally.
 NAME        is a string naming the menu item or submenu.
 COMMAND     is the command to be invoked by an item.
 MENU-KEYMAP is a menu keymap or a var whose value is a menu keymap.
 KEYWORDS    is a property list of menu keywords (`:enable',
             `:visible', `:filter', `:keys', etc.).

1. Single menu item.  For a selectable item, use
   (SYMBOL menu-item NAME COMMAND . KEYWORDS).  For a non-selectable
   item such as a separator, use (SYMBOL NAME) or
   (SYMBOL menu-item NAME nil . KEYWORDS).

2. Items taken from a menu-keymap variable, such as
   `menu-bar-edit-menu'.  Just use the name of the variable (a
   symbol).  The items appear at the top level of the popup menu, not
   in a submenu.

3. Submenu.  Use (SYMBOL menu-item NAME MENU-KEYMAP . KEYWORDS) or
   (SYMBOL NAME . MENU-KEYMAP).  Remember that MENU-KEYMAP can also be
   a variable (symbol) whose value is a menu keymap.

All of these are standard menu elements, with the exception of the use
of a keymap variable to represent its value.

See also:
 * (elisp) Format of Keymaps
 * (elisp) Classifying Events
 * (elisp) Extended Menu Items

Example submenu element:
 (toto menu-item \"Toto\" menu-bar-toto-menu)

Example selectable menu-item element:
 (foo menu-item \"Foo\"   foo-command
       :visible (not buffer-read-only))")

(custom-autoload 'icicle-Completions-mouse-3-menu-entries "icicles-opt" t)

(defvar icicle-Completions-window-max-height 30 "\
*Maximum height of `*Completions*' window, in lines.
The window is fit to the buffer size, with this as maximum height.
Not used if `*Completions*' is a special buffer with its own frame.
Not used in Emacs releases prior to 21.")

(custom-autoload 'icicle-Completions-window-max-height "icicles-opt" t)

(defvar icicle-customize-save-flag t "\
*Non-nil means save some updated Icicles options when you quit Emacs.
That is, add some functions to `kill-emacs-hook' that call
`customize-save-variable'.  Currently, this includes only function
`icicle-command-abbrev-save', which saves updated option
`icicle-command-abbrev-alist'.")

(custom-autoload 'icicle-customize-save-flag "icicles-opt" t)

(defvar icicle-customize-save-variable-function 'customize-save-variable "\
*Function used to save user option changes.
I RECOMMEND that you do NOT change this.

The option value is a function that has the same signature as
`customize-save-variable' (perhaps with additional arguments after VAR
and VAL, the variable to save and its new value.

If you do not want changes that Icicles commands make to certain user
options to be saved automatically, you can set this to the function
\(symbol) `ignore'.  If you want to use your own function to somehow
save the current value, you can set this to your function.")

(custom-autoload 'icicle-customize-save-variable-function "icicles-opt" t)

(defvar icicle-cycle-into-subdirs-flag nil "\
*Non-nil means minibuffer-input cycling explores subdirectories.
If this is non-nil, then you might want to use a function such as
`icicle-dirs-last-p' for option `icicle-sort-comparer', to prevent
cycling into subdirectories depth first.  Command
`icicle-sort-by-directories-last' does that.")

(custom-autoload 'icicle-cycle-into-subdirs-flag "icicles-opt" t)

(defvar icicle-default-cycling-mode 'prefix "\
*Default completion mode for per-mode cycling.
When you hit a completion key (`TAB' or `S-TAB'), it sets the current
completion mode (prefix or apropos, respectively).  That determines
the kind of completion to be used by the per-mode cycling keys.

This option controls which completion mode to use if you cycle using a
per-mode key (e.g. `down') *before* hitting a completion key.

 - `prefix'  means cycle prefix completions
 - `apropos' means cycle apropos completions
 - Any other non-nil value means cycle inputs from the input history
 - nil means do not cycle - you must first hit a completion key

The per-mode cycling keys are the values of
`icicle-modal-cycle-up-keys' (backward) and
`icicle-modal-cycle-down-keys' (forward).  By default, these are keys
`up' and `down' as well as the mouse wheel.

For example, if the value is `prefix' (the default) then you can
immediately cycle prefix completions using `up', `down', or the mouse
wheel, without first hitting `TAB'.

Once you have used `TAB' or `S-TAB', the only way to traverse the
history is using `M-p' and `M-n' (they always traverse the history).

This option affects only cycling with the per-mode keys.  You can
always use the mode-specific cycling keys instead to cycle according
to a particular mode.  The mode-specific keys are (by default):

 - `end'  and `home'  for prefix completion
 - `next' and `prior' for apropos completion

\(By default there is no conflict between the cycling keys that are
mode-specific and those that are per-mode.  But if you customize them
in such a way that you set a key to both, the mode-specific use takes
priority.)

After you change the value of this option, toggle Icicle mode off,
then on again, for the change to take effect in the same session.")

(custom-autoload 'icicle-default-cycling-mode "icicles-opt" t)

(defvar icicle-default-thing-insertion 'alternatives "\
*Behavior of successive `\\<minibuffer-local-map>\\[icicle-insert-string-at-point]'.
If `alternatives', then the next function in the `car' of
`icicle-thing-at-point-functions' is used to retrieve the text to be
inserted.
If `more-of-the-same', then the function that is the `cdr' of
`icicle-thing-at-point-functions' is used to retrieve the text to be
inserted.")

(custom-autoload 'icicle-default-thing-insertion "icicles-opt" t)

(defvar icicle-default-value t "\
*How to treat the default value when reading minibuffer input.

When the default value argument to functions such as
`completing-read', `read-file-name', `read-from-minibuffer', and
`read-string' is non-nil and the initial-input argument is nil or
\"\", the default value can be added to the prompt as a hint or
inserted into the minibuffer as the initial input.

Adding it to the prompt is the default behavior and corresponds to the
behavior of vanilla Emacs.

Inserting the default value in the minibuffer as the initial input has
the advantage of not requiring you to use `M-n' to retrieve it.  It
has the disadvantage of making you use `M-p' (or do something else) to
get rid of the default value in the minibuffer if you do not want to
use or edit it.  If you often want to use or edit the default value,
then set `icicle-default-value' to non-nil and non-t.  If you rarely
do so, then set it to nil or t.

If inserted in the minibuffer, the value of this option also
determines whether or not the inserted text is preselected and where
the cursor is left: at the beginning or end of the text.

These are the possible option values:

  nil               - Do not insert default value or add it to prompt.
  t                 - Add default value to prompt.  Do not insert it.
  `insert-start'    - Insert default value and leave cursor at start.
  `insert-end'      - Insert default value and leave cursor at end.
  `preselect-start' - Insert and preselect default value;
                      leave cursor at beginning.
  `preselect-end'   - Insert and preselect default value;
                      leave cursor at end.

My own preference is `insert-end'.

Preselection can be useful in Delete Selection mode or PC Selection
mode.  It makes it easy to replace the value by typing characters, or
delete it by hitting `C-d' or `DEL' (backspace).  However, all of the
initial input is lost if you type or hit `C-d' or `DEL'.  That is
inconvenient if you want to keep most of it and edit it only slightly.")

(custom-autoload 'icicle-default-value "icicles-opt" t)

(defvar icicle-define-alias-commands-flag t "\
*Non-nil means define some commands that do not begin with `icicle-'.
For convenience, a few top-level commands are defined, typically as
aliases for commands with longer names.  For example, command `toggle'
is defined as an alias for command `icicle-toggle-option'.  In any
case, no such command is ever defined by Icicles if a function with
the same name is already defined.")

(custom-autoload 'icicle-define-alias-commands-flag "icicles-opt" t)

(defvar icicle-deletion-action-flag t "\
*Non-nil means `S-delete' during completion deletes the current object.
More precisely, it deletes the object named by the current completion
candidate, if a deletion action is defined for the current command.
If no deletion action is defined, then the value of this option has no
effect.

If you are worried about inadvertently deleting an object by
accidentally hitting `S-delete', you can customize this to nil to
inhibit `S-delete' object deletion during completion.")

(custom-autoload 'icicle-deletion-action-flag "icicles-opt" t)

(defvar icicle-dot-show-regexp-flag nil "\
*Non-nil means show `icicle-anychar-regexp' explicitly for `.'.
Otherwise, display it as a highlighted `.' only.
This has no effect for Emacs versions prior to 21: acts as if non-nil.")

(custom-autoload 'icicle-dot-show-regexp-flag "icicles-opt" t)

(defvar icicle-dot-string "." "\
*String inserted by `icicle-insert-dot-command'.
It is either \".\" or the value of `icicle-anychar-regexp'.
You can toggle this at any time using command `icicle-toggle-dot',
bound to \\<minibuffer-local-completion-map>`\\[icicle-toggle-dot]' during completion.")

(custom-autoload 'icicle-dot-string "icicles-opt" nil)

(defvar icicle-expand-input-to-common-match-flag t "\
*Non-nil means `S-TAB' expands input, still matching all candidates.
The expansion replaces your input in the minibuffer.

Your expanded input is typically the longest substring common to all
completion candidates and that matches your (complete) input pattern.

If you want to edit your original input, use \\<minibuffer-local-completion-map>`\\[icicle-retrieve-previous-input]'.

For apropos completion, your input is, in general, a regexp.  Setting
this option to nil will let you always work with a regexp in the
minibuffer for apropos completion - your regexp is then never replaced
by the expanded common match.

You can toggle this option at any time from the minibuffer using
`C-;'.")

(custom-autoload 'icicle-expand-input-to-common-match-flag "icicles-opt" t)

(defvar icicle-file-extras nil "\
*List of additional file-name candidates added to the normal list.
List elements are strings.")

(custom-autoload 'icicle-file-extras "icicles-opt" t)

(defvar icicle-file-match-regexp nil "\
*nil or a regexp that file-name completion candidates must match.
If nil, then this does nothing.  If a regexp, then show only
candidates that match it (and match the user input).
See also `icicle-file-no-match-regexp'.")

(custom-autoload 'icicle-file-match-regexp "icicles-opt" t)

(defvar icicle-file-no-match-regexp nil "\
*nil or a regexp that file-name completion candidates must not match.
If nil, then this does nothing.  If a regexp, then show only
candidates that do not match it.
See also `icicle-file-match-regexp'.")

(custom-autoload 'icicle-file-no-match-regexp "icicles-opt" t)

(defvar icicle-file-predicate nil "\
*nil or a predicate that file-name candidates must satisfy.
If nil, then this does nothing.  Otherwise, this is a function of one
argument, a candidate, and only candidates that satisfy the predicate
are displayed.  For example, this value will show only names of files
with more than 5000 bytes:

  (lambda (fil) (> (nth 5 (file-attributes file)) 5000))

This predicate is applied after matching against user input.  It thus
corresponds to `icicle-must-pass-after-match-predicate', not to
`icicle-must-pass-predicate'.")

(custom-autoload 'icicle-file-predicate "icicles-opt" t)

(defvar icicle-file-require-match-flag nil "\
*Override `icicle-require-match-flag' for file-name completion.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.")

(custom-autoload 'icicle-file-require-match-flag "icicles-opt" t)

(defvar icicle-file-sort nil "\
*A sort function for file names, or nil.
Examples of sort functions are `icicle-dirs-last-p' and
`icicle-last-modified-first-p'.  If nil, then file names are not
sorted.")

(custom-autoload 'icicle-file-sort "icicles-opt" t)

(defvar icicle-files-ido-like-flag nil "\
*t means `icicle-file' and similar commands act more Ido-like.
Specifically, those commands then bind these options to t:
 `icicle-show-Completions-initially-flag'
 `icicle-top-level-when-sole-completion-flag'
 `icicle-default-value'")

(custom-autoload 'icicle-files-ido-like-flag "icicles-opt" t)

(defvar icicle-filesets-as-saved-completion-sets-flag t "\
*Non-nil means you can use filesets to save candidates persistently.
This means that you can save file-name candidates in a persistent
Icicles saved completion set (cache file) or in in an Emacs fileset.
It also means that an Icicles persistent completion set can contain
filesets, in addition to file names: any number of filesets, and
filesets of different type.  Available only for Emacs 22 and later,
and you must load library `filesets.el'.")

(custom-autoload 'icicle-filesets-as-saved-completion-sets-flag "icicles-opt" t)

(defvar icicle-functions-to-redefine '(bbdb-complete-name comint-dynamic-complete comint-dynamic-complete-filename comint-replace-by-expanded-filename customize-apropos customize-apropos-faces customize-apropos-groups customize-apropos-options customize-apropos-options-of-type customize-face customize-face-other-window dabbrev-completion ess-complete-object-name gud-gdb-complete-command lisp-complete-symbol lisp-completion-at-point minibuffer-default-add-completions read-color read-from-minibuffer read-string recentf-make-menu-items repeat-complex-command) "\
*List of symbols representing functions to be redefined in Icicle mode.
In Icicle mode, each such FUNCTION is aliased to Icicles function
`icicle-FUNCTION'.  The original functions are restored when you exit
Icicle mode, by aliasing each FUNCTION to `old-FUNCTION'.

Aliasing takes place only if `old-FUNCTION' is defined.  Icicles
predefines each `old-FUNCTION' found in the default value, as well as
each corresponding `icicle-FUNCTION' .  If you add additional
functions of your own choosing, then you will also need to define
`old-FUNCTION' and `icicle-FUNCTION' accordingly - see the Icicles
code for examples.

If you customize this option, then you must exit and re-enter Icicle
mode to ensure that the change takes effect.

For this option to have an effect upon startup, it must be set before
you enter Icicle mode.  This means that you must ensure that the code
that sets it is invoked before you enter Icicle mode.  If you use
Customize to change this option, then ensure that the code inserted by
Customize into your `user-init-file' or your `custom-file' is invoked
before you enter Icicle mode.")

(custom-autoload 'icicle-functions-to-redefine "icicles-opt" nil)

(defvar icicle-guess-commands-in-path nil "\
*Non-nil means all shell commands are available for completion.
This is used in Icicle mode whenever a shell-command is read.

If non-nil, then all executable files (or all files, if option
`shell-completion-execonly' is nil) in your search path are included
among the completion candidates, in addition to any commands that are
guessed as being appropriate for the target files (e.g. marked files
in Dired).

If non-nil and if option `icicle-shell-command-candidates-cache' is
nil, then the list of commands is computed once and cached as the
value of `icicle-shell-command-candidates-cache'.  The particular
non-nil value of `icicle-guess-commands-in-path' determines when the
cache is filled, as follows:

- If the value is `load', then the cache is filled when Icicles is
  first loaded, and it is saved persistently.

- If the value is `first-use', then the cache is filled when you first
  complete a shell command, and the computed list is not saved
  persistently.

If the value is not `load', then whenever you enter Icicle mode the
cache is emptied.

If your environment changes and you want to update the cached list,
you can use command `icicle-recompute-shell-command-candidates'.  With
a prefix argument, that command also saves the cache persistently.")

(custom-autoload 'icicle-guess-commands-in-path "icicles-opt" t)

(defvar icicle-help-in-mode-line-delay 5 "\
*Seconds to show help in the mode-line for individual completions.
If buffer `*Completions*' is displayed, then use its mode-line.
Otherwise, use the mode-line of the current buffer.

The help is shown when you cycle among completion candidates and when
your input is completed (entirely) to a candidate.

Face `icicle-mode-line-help' is used for the help.

A value of zero means do not show such help at all.  In any case, a
user event (e.g. a key press) always interrupts this display.

Note that `post-command-hook' actions do not take place until this
display is finished.")

(custom-autoload 'icicle-help-in-mode-line-delay "icicles-opt" t)

(defvar icicle-hide-common-match-in-Completions-flag nil "\
*Non-nil means hide the common match for your input, in `*Completions*'.
The common match is elided using ellipsis (`...').
You can use `C-M-.' during completion to toggle this option.

 The common match used here is governed by option
`icicle-expand-input-to-common-match-flag'.")

(custom-autoload 'icicle-hide-common-match-in-Completions-flag "icicles-opt" t)

(defvar icicle-highlight-historical-candidates-flag t "\
*Non-nil means highlight `*Completions*' candidates that have been used.
This is done using face `icicle-historical-candidate'.
Historical candidates are those that you have entered (using `RET' or
`S-RET') previously.  You can toggle this option from the minibuffer
at any time using `C-pause'.")

(custom-autoload 'icicle-highlight-historical-candidates-flag "icicles-opt" t)

(defvar icicle-highlight-input-completion-failure 'implicit-strict "\
*Non-nil means highlight the part of your input that does not complete.
This is done using face `icicle-input-completion-fail' or
`icicle-input-completion-fail-lax'.

You can use `\\<minibuffer-local-completion-map>\\[icicle-goto/kill-failed-input]' to go to the start of the highlighted part.
Repeat to kill it.

This highlighting can have a negative impact on performance, because
it can mean recomputing completion candidates multiple times, in order
to determine the longest part that completes.  For this reason, you
can fine tune when you want this highlighting to occur.  The values of
this option and options
`icicle-highlight-input-completion-failure-delay' and
`icicle-highlight-input-completion-failure-threshold' determine when
the highlighting can take place.

In particular, highlighting the non-matching part of remote file names
can be slow.  Two values of this option allow remote file name
highlighting: `always' and `explicit-remote'.  The other values do not
highlight remote file names.  You probably do not want to use a value
of `always'.

If the value is nil, then highlighting never occurs.  If the value is
`explicit-strict', `explicit', or `explicit-remote', then highlighting
occurs only upon demand: when you hit `TAB' or `S-TAB' to request
completion.  If the value is `implicit-strict', `implicit', or
`always', then highlighting occurs also when you update your input
during incremental completion.

If the value is `implicit-strict' or `implicit', then highlighting
occurs not only upon demand but also during incremental completion if
`icicle-incremental-completion-flag' is non-nil.  Remember that you
can toggle incremental completion, using `C-#' in the minibuffer.

I use a value of `implicit' myself, but the default value is
`implicit-strict' because, depending on your setup and use cases,
`implicit' can impact performance for file-name completion (which is
lax, not strict).  I suggest you try `implicit' to see - this feature
is especially useful for file names.

Summary of choices for when to highlight:

nil               Never
`explicit-strict' When you hit `TAB'/`S-TAB' for strict completion
`explicit'        When you hit `TAB'/`S-TAB'
`explicit-remote' When you hit `TAB'/`S-TAB', including remote files
`implicit-strict' During strict completion
`implicit'        During lax or strict completion
`always'          Always, even for names of remote files

After highlighting, you can use `C-M-l' to move the cursor to the
start of the mismatch, for editing there.  You can use a second
`C-M-l' to kill (delete) the mismatch up to the next input line (if
any).  You can repeat `C-M-l' to kill additional input lines.

See also:
* `icicle-highlight-input-completion-failure-delay'
* `icicle-highlight-input-completion-failure-threshold'")

(custom-autoload 'icicle-highlight-input-completion-failure "icicles-opt" t)

(defvar icicle-highlight-input-completion-failure-delay 0.7 "\
*Seconds to wait before highlighting non-completing part of your input.
Zero means there is no wait.")

(custom-autoload 'icicle-highlight-input-completion-failure-delay "icicles-opt" t)

(defvar icicle-highlight-input-completion-failure-threshold 1000 "\
*More candidates means do not highlight non-completing part of input.
See also `icicle-highlight-input-completion-failure'.")

(custom-autoload 'icicle-highlight-input-completion-failure-threshold "icicles-opt" t)

(defvar icicle-highlight-input-initial-whitespace-flag t "\
*Non-nil means highlight initial whitespace in your input.
This is done using face `icicle-whitespace-highlight'.
Purpose: Otherwise, you might not notice that you accidentally typed
some whitespace at the beginning of your input, so you might not
understand the set of matching candidates (or lack thereof).

Note: Highlighting input completion failure (see option
`icicle-highlight-input-completion-failure') subsumes
initial-whitespace highlighting.  This means that if no completion
candidate starts with whitespace, and if Icicles is highlighting input
completion failure, then only that highlighting is shown.")

(custom-autoload 'icicle-highlight-input-initial-whitespace-flag "icicles-opt" t)

(defvar icicle-highlight-lighter-flag t "\
*Non-nil means highlight the `Icy' mode-line lighter during completion.
See the Icicles doc, section `Nutshell View of Icicles', subsection
`Completion Status Indicators' for more information.")

(custom-autoload 'icicle-highlight-lighter-flag "icicles-opt" t)

(defvar icicle-highlight-saved-candidates-flag t "\
*Non-nil means highlight `*Completions*' candidates that have been saved.
This is done using face `icicle-saved-candidate'.
You save candidates using, for example, `C-M->'.  You can toggle this
option from the minibuffer at any time using `S-pause'.")

(custom-autoload 'icicle-highlight-saved-candidates-flag "icicles-opt" t)

(defvar icicle-ignore-comments-flag t "\
Non-nil means `icicle-with-comments-hidden' hides comments.
You can toggle this option using `C-M-;' in the minibuffer, but to see
the effect you might need to invoke the current command again.")

(custom-autoload 'icicle-ignore-comments-flag "icicles-opt" t)

(defvar icicle-ignored-directories (and (boundp 'vc-directory-exclusion-list) vc-directory-exclusion-list) "\
*Directories ignored by `icicle-locate-file'.")

(custom-autoload 'icicle-ignored-directories "icicles-opt" t)

(defvar icicle-ignore-space-prefix-flag nil "\
*Non-nil means ignore completion candidates that start with a space.
However, such candidates are not ignored for prefix completion when
the input also starts with a space.  You can toggle this option from
the minibuffer using `M-_'.
Note: Some Icicles functionalities ignore the value of this option.")

(custom-autoload 'icicle-ignore-space-prefix-flag "icicles-opt" t)

(defvar icicle-image-files-in-Completions (and (fboundp 'image-file-name-regexp) (if (fboundp 'display-graphic-p) (display-graphic-p) window-system) t) "\
*Non-nil means show thumbnail images for image files in `*Completions*'.
This has no effect if your Emacs version does not have image support.

 `nil'   means show only file names.
 `image' means show only thumbnail images.
 `t'     means show both file names and thumbnail images.

You can cycle the value during completion using `C-x t'.")

(custom-autoload 'icicle-image-files-in-Completions "icicles-opt" t)

(defvar icicle-incremental-completion-delay 0.7 "\
*Number of seconds to wait before updating `*Completions*' incrementally.
There is no wait if the number of completion candidates is less than
or equal to `icicle-incremental-completion-threshold'.
See also `icicle-incremental-completion-flag'.")

(custom-autoload 'icicle-incremental-completion-delay "icicles-opt" t)

(defvar icicle-incremental-completion-flag t "\
*Non-nil means update `*Completions*' buffer incrementally, as you type.
nil means do not update `*Completions*' incrementally, as you type.
t means do nothing if `*Completions*' is not already displayed.
Non-nil and non-t means display `*Completions*' and update it.
You can toggle this between t and nil from the minibuffer at any time
using `C-#'.

Note: Incremental completion is effectively turned off when a remote
file name is read, that is, whenever your file-name input matches a
remote-file syntax.

See also `icicle-incremental-completion-delay' and
`icicle-incremental-completion-threshold'.")

(custom-autoload 'icicle-incremental-completion-flag "icicles-opt" t)

(defvar icicle-incremental-completion-threshold 1000 "\
*More candidates means apply `icicle-incremental-completion-delay'.
See also `icicle-incremental-completion-flag' and
`icicle-incremental-completion-delay'.
This threshold is also used to decide when to display the message
 \"Displaying completion candidates...\".")

(custom-autoload 'icicle-incremental-completion-threshold "icicles-opt" t)

(defvar icicle-inhibit-advice-functions '(choose-completion choose-completion-string completing-read completion-setup-function dired-smart-shell-command display-completion-list exit-minibuffer face-valid-attribute-values minibuffer-complete-and-exit mouse-choose-completion next-history-element read-face-name read-file-name read-number shell-command shell-command-on-region switch-to-completions completing-read-multiple) "\
*Functions that Icicles redefines, and for which advice is deactivated.
Icicle mode deactivates all advice for such functions.  The advice is
reactivated when you leave Icicle mode.")

(custom-autoload 'icicle-inhibit-advice-functions "icicles-opt" t)

(defvar icicle-inhibit-ding-flag nil "\
*Non-nil means Icicles never uses an audible bell (ding).
If nil, Icicles sometimes signals you with a sound.")

(custom-autoload 'icicle-inhibit-ding-flag "icicles-opt" t)

(defvar icicle-input-string ".*" "\
*String to insert in minibuffer via `\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]'.
Typically, this is a regexp or a portion of a regexp.")

(custom-autoload 'icicle-input-string "icicles-opt" t)

(defvar icicle-inter-candidates-min-spaces 1 "\
*Min number of spaces between candidates displayed in `*Completions*'.
If you use Do Re Mi (library `doremi.el'), then you can modify this
option incrementally during completion, seeing the effect as it
changes.  Use `\\<minibuffer-local-completion-map>\\[icicle-doremi-inter-candidates-min-spaces+]' from the minibuffer, then use the `up' and
`down' arrow keys or the mouse wheel to increment and decrement the
value.  WYSIWYG.

See also option `icicle-candidate-width-factor' and (starting with
Emacs 23) option `icicle-Completions-text-scale-decrease'.")

(custom-autoload 'icicle-inter-candidates-min-spaces "icicles-opt" t)

(defvar icicle-isearch-complete-keys '([C-M-tab] [M-tab] "\211" [escape tab] "\357") "\
*Key sequences to use for `icicle-isearch-complete'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.

The default value includes `M-TAB', which replaces the vanilla binding
of `isearch-complete'.

It also includes `ESC TAB' and `C-M-TAB', because some operating
systems intercept `M-TAB' for their own use.  (Note: For MS Windows,
you can use (w32-register-hot-key [M-tab]) to allow Emacs to use
`M-TAB'.)

It also includes `M-o', in keeping with the Icicles use of `M-o'
during minibuffer completion.")

(custom-autoload 'icicle-isearch-complete-keys "icicles-opt" t)

(defvar icicle-key-complete-keys '([S-tab] [S-iso-lefttab]) "\
*Key sequences to use for `icicle-complete-key'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.")

(custom-autoload 'icicle-key-complete-keys "icicles-opt" t)

(defvar icicle-key-descriptions-use-<>-flag nil "\
*Non-nil means Icicles key descriptions should use angle brackets (<>).
For example, non-nil gives `<mode-line>'; nil gives `mode-line'.

This does not affect Emacs key descriptions outside of
Icicles (e.g. `C-h k' or `C-h w').

This has no effect for versions of Emacs prior to 21, because
they never use angle brackets.")

(custom-autoload 'icicle-key-descriptions-use-<>-flag "icicles-opt" t)

(defvar icicle-keymaps-for-key-completion '(bookmark-bmenu-mode-map bmkp-jump-map bmkp-jump-other-window-map calendar-mode-map dired-mode-map facemenu-keymap jde-mode-map jde-jdb-mode-map senator-mode-map srecode-mode-map synonyms-mode-map vc-dired-mode-map) "\
*List of keymaps in which to bind `S-TAB' to `icicle-complete-keys'.
List elements are symbols that are bound to keymaps.

Each keymap should have at least one prefix key.  `S-TAB' is bound in
each keymap, so that you can use it to complete the prefix keys.

If one of the keymaps is not defined when Icicle mode is entered, then
it is ignored.  If you later define it, then just exit and reenter
Icicle mode, to bind `S-TAB' in the newly defined map.  For example,
use `M-x icy-mode' twice after entering Calendar mode, to be able to
complete `calendar-mode' prefix keys such as `A'.

Do not add `global-map' or any keymaps, such as `ctl-x-map', that are
accessible from the global keymap to the list - they are already
treated, by default.

Do not add any of the translation keymaps, `function-key-map',
`key-translation-map', or `iso-transl-ctl-x-8-map' to the list - that
will not work.")

(custom-autoload 'icicle-keymaps-for-key-completion "icicles-opt" t)

(defvar icicle-levenshtein-distance 1 "\
*Levenshtein distance allowed for strings to be considered as matching.
Icicles matching function `icicle-levenshtein-match' considers a
string to match another if the first string is within this distance of
some substring of the second.
This option is used only if you have library `levenshtein.el'.")

(custom-autoload 'icicle-levenshtein-distance "icicles-opt" t)

(defvar icicle-list-join-string (let ((strg (copy-sequence "\n"))) (when (> emacs-major-version 21) (set-text-properties 0 1 '(display "") strg)) strg) "\
*String joining items in a completion that is a list of strings.
When a completion candidate is a list of strings, this string is used
to join the strings in the list, for display and matching purposes.
When completing input, you type regexps that match the strings,
separating them pairwise by the value of `icicle-list-join-string'.
Actually, what you enter is interpreted as a single regexp to be
matched against the joined strings.  Typically, the candidate list
contains two strings: a name and its doc string.

A good value for this option is a string that:
 1) does not normally occur in doc strings,
 2) visually separates the two strings it joins, and
 3) is not too difficult or too long to type.

The default value is \"^G
\", that is, control-g followed by
control-j (newline):
 1) ^G does not normally occur in doc strings
 2) a newline visually separates the multiple component strings, which
    helps readability in buffer `*Completions*'
 3) you can type the value using `C-q C-g C-q C-j'.

For readability (in Emacs 22 and later), the default value has a
`display' property that makes it appear as simply a newline in
`*Completions*' - the `^G' is hidden.  you can also make the default
value appear this way in your minibuffer input also, by using `\\<minibuffer-local-completion-map>\\[icicle-insert-list-join-string].'

If you like the default value of `^G^J', but you prefer that the `^G'
not be hidden, then just customize this option.  In Customize, use
`Show initial Lisp expression' after clicking the `State' button, to
be able to edit the default value.  Remove the `set-text-properties'
expression, which sets text property `display' to \"\".")

(custom-autoload 'icicle-list-join-string "icicles-opt" t)

(defvar icicle-list-nth-parts-join-string " " "\
*String joining candidate parts split by `icicle-list-use-nth-parts'.
This has an effect on multi-completion candidates only, and only if
the current command uses `icicle-list-use-nth-parts'.")

(custom-autoload 'icicle-list-nth-parts-join-string "icicles-opt" t)

(defvar icicle-max-candidates nil "\
*Non-nil means truncate completion candidates to at most this many.
If you use library `doremi.el' then you can use `C-x #' during
completion to increment or decrement the option value using the
vertical arrow keys or the mouse wheel.  A numeric prefix argument for
`C-x #' sets the increment size.  A plain prefix argument (`C-u')
resets `icicle-max-candidates' to nil, meaning no truncation.")

(custom-autoload 'icicle-max-candidates "icicles-opt" t)

(defvar icicle-menu-items-to-history-flag t "\
*Non-nil means to add menu-item commands to the command history.
This history is `extended-command-history'.

After you change the value of this option, toggle Icicle mode off,
then on again, for the change to take effect in the same session.")

(custom-autoload 'icicle-menu-items-to-history-flag "icicles-opt" t)

(defvar icicle-minibuffer-setup-hook nil "\
*Functions run at the end of minibuffer setup for Icicle mode.")

(custom-autoload 'icicle-minibuffer-setup-hook "icicles-opt" t)

(defvar icicle-modal-cycle-down-keys (if (boundp 'mouse-wheel-down-event) (list [down] (vector nil mouse-wheel-up-event) (vector mouse-wheel-up-event)) '([down])) "\
*Key sequences to use for modal cycling to the next candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-down-action-keys'.")

(custom-autoload 'icicle-modal-cycle-down-keys "icicles-opt" t)

(defvar icicle-modal-cycle-down-action-keys (if (boundp 'mouse-wheel-up-event) (list [C-down] (vector nil (list 'control mouse-wheel-up-event)) (vector (list 'control mouse-wheel-up-event))) '([C-down])) "\
*Keys for modal completion to cycle next and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-down-keys'.")

(custom-autoload 'icicle-modal-cycle-down-action-keys "icicles-opt" t)

(defvar icicle-modal-cycle-down-alt-action-keys (if (boundp 'mouse-wheel-up-event) (list [C-S-down] (vector nil (list 'control 'shift mouse-wheel-up-event)) (vector (list 'control 'shift mouse-wheel-up-event))) '([C-S-down])) "\
*Keys for modal completion to cycle next and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-modal-cycle-down-alt-action-keys "icicles-opt" t)

(defvar icicle-modal-cycle-down-help-keys (if (boundp 'mouse-wheel-up-event) (list [(control meta down)] (vector nil (list 'control 'meta mouse-wheel-up-event)) (vector (list 'control 'meta mouse-wheel-up-event))) '([(control meta down)])) "\
*Keys for modal completion to cycle next and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-modal-cycle-down-help-keys "icicles-opt" t)

(defvar icicle-modal-cycle-up-keys (if (boundp 'mouse-wheel-down-event) (list [up] (vector nil mouse-wheel-down-event) (vector mouse-wheel-down-event)) '([up])) "\
*Key sequences to use for modal cycling to the previous candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-up-action-keys'.")

(custom-autoload 'icicle-modal-cycle-up-keys "icicles-opt" t)

(defvar icicle-modal-cycle-up-action-keys (if (boundp 'mouse-wheel-down-event) (list [C-up] (vector nil (list 'control mouse-wheel-down-event)) (vector (list 'control mouse-wheel-down-event))) '([C-up])) "\
*Keys for modal completion to cycle previous and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-up-keys'.")

(custom-autoload 'icicle-modal-cycle-up-action-keys "icicles-opt" t)

(defvar icicle-modal-cycle-up-alt-action-keys (if (boundp 'mouse-wheel-down-event) (list [C-S-up] (vector nil (list 'control 'shift mouse-wheel-down-event)) (vector (list 'control 'shift mouse-wheel-down-event))) '([C-S-up])) "\
*Keys for modal completion to cycle previous and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-modal-cycle-up-alt-action-keys "icicles-opt" t)

(defvar icicle-modal-cycle-up-help-keys (if (boundp 'mouse-wheel-down-event) (list [(control meta up)] (vector nil (list 'control 'meta mouse-wheel-down-event)) (vector (list 'control 'meta mouse-wheel-down-event))) '([(control meta up)])) "\
*Keys for modal completion to cycle previous and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-modal-cycle-up-help-keys "icicles-opt" t)

(defvar icicle-no-match-hook nil "\
*List of hook functions run during completion when there are no matches.")

(custom-autoload 'icicle-no-match-hook "icicles-opt" t)

(defvar icicle-option-type-prefix-arg-list '(direct inherit inherit-or-value direct-or-value inherit-or-regexp direct-or-regexp) "\
*Symbols controlling prefix args for `icicle-describe-option-of-type'.
A list of six symbols taken from this list:

  direct            inherit             inherit-or-value
  direct-or-value   inherit-or-regexp   direct-or-regexp

Choose the order you like.  The list members map, in order left to
right, to these prefix argument keys:

 `C-u C-u'           `C-0'            `C-u'
 `C-9' (positive)    no prefix arg    `C--' (negative)

For the meanings of the symbols, see the doc string of
`icicle-describe-option-of-type', which describes the default
prefix-argument bindings for the command.")

(custom-autoload 'icicle-option-type-prefix-arg-list "icicles-opt" t)

(defvar icicle-pp-eval-expression-print-length nil "\
*Value for `print-length' while printing value in `pp-eval-expression'.
A value of nil means no limit.")

(custom-autoload 'icicle-pp-eval-expression-print-length "icicles-opt" t)

(defvar icicle-pp-eval-expression-print-level nil "\
*Value for `print-level' while printing value in `pp-eval-expression'.
A value of nil means no limit.")

(custom-autoload 'icicle-pp-eval-expression-print-level "icicles-opt" t)

(defvar icicle-prefix-complete-keys '([tab] [(control 105)]) "\
*Key sequences to use for `icicle-prefix-complete'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-complete-keys "icicles-opt" t)

(defvar icicle-prefix-complete-no-display-keys '([(control meta tab)]) "\
*Key sequences to use for `icicle-prefix-complete-no-display'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-complete-no-display-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-next-keys '([end]) "\
*Key sequences for prefix completion to cycle to the next candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-next-action-keys'.")

(custom-autoload 'icicle-prefix-cycle-next-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-next-action-keys '([C-end]) "\
*Keys for prefix completion to cycle next and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-next-keys'.")

(custom-autoload 'icicle-prefix-cycle-next-action-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-next-alt-action-keys '([C-S-end]) "\
*Keys for prefix completion to cycle next and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-cycle-next-alt-action-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-next-help-keys '([(control meta end)]) "\
*Keys for prefix completion to cycle next and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-cycle-next-help-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-previous-keys '([home]) "\
*Key sequences for prefix completion to cycle to the previous candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-previous-action-keys'.")

(custom-autoload 'icicle-prefix-cycle-previous-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-previous-action-keys '([C-home]) "\
*Keys for prefix completion to cycle previous and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-previous-keys'.")

(custom-autoload 'icicle-prefix-cycle-previous-action-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-previous-alt-action-keys '([C-S-home]) "\
*Keys for prefix completion to cycle previous and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-cycle-previous-alt-action-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-previous-help-keys '([(control meta home)]) "\
*Keys for prefix completion to cycle previous and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-cycle-previous-help-keys "icicles-opt" t)

(defvar icicle-previous-candidate-keys '([S-tab] [S-iso-lefttab]) "\
*Key sequences to use for `icicle-move-to-previous-completion'.
In buffer `*Completions*', this moves backward among candidates.

A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.")

(custom-autoload 'icicle-previous-candidate-keys "icicles-opt" t)

(defvar icicle-quote-shell-file-name-flag t "\
*Non-nil means to double-quote the file name that starts a shell command.
This is used by `icicle-read-shell-command-completing'.

If this is nil, then Emacs commands such as `M-!' will not quote a
shell-command file name such as `c:/Program Files/My Dir/mycmd.exe'.
In that case, a shell such as `bash' fails for a shell command such as
`c:/Program Files/My Dir/mycmd.exe arg1 arg2 &', because it interprets
only `c:/Program' as the shell command.  That is, it interprets the
space characters in the file name as separators.  If this is non-nil,
then input such as `c:/Program Files/My Dir/mycmd.exe arg1 arg2 &' is
passed to the shell as
`\"c:/Program Files/My Dir/mycmd.exe\" arg1 arg2 &'.

See the doc string of `icicle-quote-file-name-part-of-cmd' for
information about the characters that, like SPC, lead to quoting.")

(custom-autoload 'icicle-quote-shell-file-name-flag "icicles-opt" t)

(defvar icicle-read+insert-file-name-keys '([(control meta shift 102)]) "\
*Key sequences to invoke `icicle-read+insert-file-name'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-read+insert-file-name-keys "icicles-opt" t)

(defvar icicle-regexp-quote-flag nil "\
*Non-nil means special characters in regexps are escaped.
This means that no characters are recognized as special: they match
themselves.  This turns apropos completion into simple substring
completion.  It also turns Icicles searching into literal searching.
You can toggle this option from the minibuffer at any
time using `C-`'.")

(custom-autoload 'icicle-regexp-quote-flag "icicles-opt" t)

(defvar icicle-regexp-search-ring-max (if (boundp 'most-positive-fixnum) (/ most-positive-fixnum 10) 13421772) "\
*Icicles version of `regexp-search-ring-max'.")

(custom-autoload 'icicle-regexp-search-ring-max "icicles-opt" t)

(defvar icicle-region-background (if (featurep 'hexrgb) (let* ((bg (or (and (boundp '1on1-active-minibuffer-frame-background) 1on1-active-minibuffer-frame-background) (let ((frame-bg (cdr (assq 'background-color (frame-parameters))))) (when (member frame-bg '(nil unspecified "unspecified-bg")) (setq frame-bg (if (eq (frame-parameter nil 'background-mode) 'dark) "Black" "White"))) (and frame-bg (x-color-defined-p frame-bg) frame-bg)) (face-background 'region))) (sat (condition-case nil (hexrgb-saturation bg) (error nil)))) (if sat (if (hexrgb-approx-equal sat 0.0) (icicle-increment-color-value bg (if (eq (frame-parameter nil 'background-mode) 'dark) 20 -10)) (icicle-increment-color-hue bg 24)) (face-background 'region))) (face-background 'region)) "\
*Background color to use for the region during minibuffer cycling.
This has no effect if `icicle-change-region-background-flag' is nil.
If you do not define this explicitly, and if you have loaded library
`hexrgb.el' (recommended), then this color will be slightly
different from your frame background.  This still lets you notice the
region, but it makes the region less conspicuous, so you can more
easily read your minibuffer input.")

(custom-autoload 'icicle-region-background "icicles-opt" t)

(defvar icicle-require-match-flag nil "\
*Control REQUIRE-MATCH arg to `completing-read' and `read-file-name'.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.")

(custom-autoload 'icicle-require-match-flag "icicles-opt" t)

(defvar icicle-saved-completion-sets nil "\
*Completion sets available for `icicle-candidate-set-retrieve'.
The form is ((SET-NAME . CACHE-FILE-NAME)...), where SET-NAME is the
name of a set of completion candidates and CACHE-FILE-NAME is the
absolute name of the cache file that contains those candidates.
You normally do not customize this directly, statically.
Instead, you add or remove sets using commands
`icicle-add/update-saved-completion-set' and
`icicle-remove-saved-completion-set'.")

(custom-autoload 'icicle-saved-completion-sets "icicles-opt" t)

(defvar icicle-search-cleanup-flag t "\
*Controls whether to remove highlighting after a search.
If this is nil, highlighting can be removed manually with
`\\[icicle-search-highlight-cleanup]'.")

(custom-autoload 'icicle-search-cleanup-flag "icicles-opt" t)

(defvar icicle-search-from-isearch-keys '([S-tab] [S-iso-lefttab]) "\
*Key sequences to use to start `icicle-search' from Isearch.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.")

(custom-autoload 'icicle-search-from-isearch-keys "icicles-opt" t)

(defvar icicle-search-highlight-all-current-flag nil "\
*Non-nil means highlight input match in each context search hit.
Setting this to non-nil can impact performance negatively, because the
highlighting is updated with each input change.  You can toggle this
option from the minibuffer during `C-c`' search using `C-^'.")

(custom-autoload 'icicle-search-highlight-all-current-flag "icicles-opt" t)

(defvar icicle-search-highlight-context-levels-flag t "\
*Non-nil means highlight 1-8 context levels, within the search context.
Level highlighting is done only when this is non-nil and a subgroup is
not used as the search context, that is, the context corresponds to
the entire search regexp.")

(custom-autoload 'icicle-search-highlight-context-levels-flag "icicles-opt" t)

(defvar icicle-search-highlight-threshold 100000 "\
*Max number of context search hits to highlight at once.
This highlighting uses face `icicle-search-main-regexp-others'.")

(custom-autoload 'icicle-search-highlight-threshold "icicles-opt" t)

(defvar icicle-search-hook nil "\
*List of functions run by `icicle-search' after you visit a search hit.
See `run-hooks'.")

(custom-autoload 'icicle-search-hook "icicles-opt" t)

(defvar icicle-search-replace-common-match-flag t "\
*Non-nil means to replace the expanded common match of your input.
This has no effect if either
`icicle-search-highlight-all-current-flag' or
`icicle-expand-input-to-common-match-flag' is nil.
You can toggle those options from the minibuffer using `C-^' and
`C-|', respectively.  You can toggle
`icicle-search-replace-common-match-flag' using `M-;'.")

(custom-autoload 'icicle-search-replace-common-match-flag "icicles-opt" t)

(defvar icicle-search-replace-literally-flag nil "\
*Non-nil means to treat replacement text literally.
Otherwise (nil), interpret `\\' specially in replacement text, as in
the LITERAL argument to `replace-match'.

You can use `M-`' to toggle this at any time during Icicles search.")

(custom-autoload 'icicle-search-replace-literally-flag "icicles-opt" t)

(defvar icicle-search-replace-whole-candidate-flag t "\
*Non-nil means replacement during search replaces the entire search hit.
Otherwise (nil), replace only what matches your current input.

You can use `C-,' to toggle this at any time during Icicles search.")

(custom-autoload 'icicle-search-replace-whole-candidate-flag "icicles-opt" t)

(defvar icicle-search-ring-max (if (boundp 'most-positive-fixnum) (/ most-positive-fixnum 10) 13421772) "\
*Icicles version of `search-ring-max'.")

(custom-autoload 'icicle-search-ring-max "icicles-opt" t)

(defvar icicle-search-whole-word-flag nil "\
*Non-nil means that `icicle-search' looks for a whole word.
You can use `M-q' to toggle this at any time during Icicles search;
the new value takes effect for the next complete search.

Whole-word searching here means that matches can contain embedded
strings of non word-constituent chars (they are skipped over, when
matching, included in the match), and any leading or trailing
word-constituent chars in the search string are dropped (ignored for
matching, not included in the match).  This means, for instance, that
you can match `foo-bar' as a word, even in contexts (such as Emacs
Lisp) where `-' is not a word-constituent character.  Similarly, you
can include embedded whitespace in a \"word\", e.g., `foo bar'.")

(custom-autoload 'icicle-search-whole-word-flag "icicles-opt" t)

(defvar icicle-shell-command-candidates-cache (and (eq icicle-guess-commands-in-path 'load) (icicle-compute-shell-command-candidates)) "\
*Cache for shell command candidates.
You typically do not need to customize this option.
It is an option mainly to persist its value.
See `icicle-guess-commands-in-path'.")

(custom-autoload 'icicle-shell-command-candidates-cache "icicles-opt" t)

(defvar icicle-show-Completions-initially-flag nil "\
*Non-nil means to show buffer `*Completions*' even without user input.
nil means that `*Completions*' is shown upon demand, via `TAB' or
`S-TAB'.

For an alternative but similar behavior to using non-nil for
`icicle-show-Completions-initially-flag', you can set option
`icicle-incremental-completion-flag' to a value that is neither nil
nor t.  That displays buffer `*Completions*' as soon as you type or
delete input, but not initially.")

(custom-autoload 'icicle-show-Completions-initially-flag "icicles-opt" t)

(defvar icicle-show-multi-completion-flag t "\
*Non-nil means to show completion candidates as multi-completions.
This has an effect only where multi-completion is available.
Also, some commands, such as `icicle-locate-file', use a prefix arg to
determine whether to show multi-completions.  Such commands generally
ignore this option.

A typical example of showing multi-completions is adding buffer names
to candidates to show which buffer they are associated with.  Some
commands, such as `icicle-search', append the name of the associated
buffer, highlighted, to the normal completion candidate.  This lets
you easily see which buffer the candidate applies to.  Also, the
buffer name is part of the candidate, so you can match against it.

Note: Even when the option value is nil, you can use `C-M-mouse-2' and
so on to see information about a candidate.  This information
typically includes whatever a non-nil value of the option would have
shown.

You can toggle this option from the minibuffer using `M-m'.  The new
value takes effect after you exit the minibuffer (i.e., for the next
command).")

(custom-autoload 'icicle-show-multi-completion-flag "icicles-opt" t)

(defvar icicle-sort-comparer 'icicle-case-string-less-p "\
*Predicate or predicates for sorting (comparing) two items.
Used in particular to sort completion candidates.  In that case, this
determines the order of candidates when cycling and their order in
buffer `*Completions*'.

When `icicle-cycle-into-subdirs-flag' is non-nil, you might want to
use a function such as `icicle-dirs-last-p' for this option, to
prevent cycling into subdirectories depth first.  Command
`icicle-sort-by-directories-last' does that.

You can cycle completion sort orders at any time using `C-,' in the
minibuffer.

Although this is a user option, it may be changed by program
locally, for use in particular contexts.  In particular, you can bind
this to nil in an Emacs-Lisp function, to inhibit sorting in that
context.

Various sorting commands change the value of this option dynamically
\(but they do not save the changed value).

The value must be one of the following:

* nil, meaning do not sort

* a predicate that takes two items as args

* a list of the form ((PRED...) FINAL-PRED), where each PRED and
  FINAL-PRED are binary predicates

If the value is a non-empty list, then each PRED is tried in turn
until one returns a non-nil value.  In that case, the result is the
car of that value.  If no non-nil value is returned by any PRED, then
FINAL-PRED is used and its value is the result.

Each PRED should return `(t)' for true, `(nil)' for false, or nil for
undecided.  A nil value means that the next PRED decides (or
FINAL-PRED, if there is no next PRED).

Thus, a PRED is a special kind of predicate that indicates either a
boolean value (as a singleton list) or \"I cannot decide - let the
next guy else decide\".  (Essentially, each PRED is a hook function
that is run using `run-hook-with-args-until-success'.)

Examples:

 nil           - No sorting.

 string-lessp  - Single predicate that returns nil or non-nil.

 ((p1 p2))     - Two predicates `p1' and `p2', which each return
                 (t) for true, (nil) for false, or nil for undecided.

 ((p1 p2) string-lessp)
               - Same as previous, except if both `p1' and `p2' return
                 nil, then the return value of `string-lessp' is used.

Note that these two values are generally equivalent, in terms of their
effect (*):

 ((p1 p2))
 ((p1) p2-plain) where p2-plain is (icicle-make-plain-predicate p2)

Likewise, these three values generally act equivalently:

 ((p1))
 (() p1-plain)
 p1-plain        where p1-plain is (icicle-make-plain-predicate p1)

The PRED form lets you easily combine predicates: use `p1' unless it
cannot decide, in which case try `p2', and so on.  The value ((p2 p1))
tries the predicates in the opposite order: first `p2', then `p1' if
`p2' returns nil.

Using a single predicate or FINAL-PRED makes it easy to reuse an
existing predicate that returns nil or non-nil.

You can also convert a PRED-type predicate (which returns (t), (nil),
or nil) into an ordinary predicate, by using function
`icicle-make-plain-predicate'.  That lets you reuse elsewhere, as
ordinary predicates, any PRED-type predicates you define.

Note: As a convention, predefined Icicles PRED-type predicate names
have the suffix `-cp' (for \"component predicate\") instead of `-p'.")

(custom-autoload 'icicle-sort-comparer "icicles-opt" t)

(defvar icicle-buffer-configs `(("All" nil nil nil nil ,icicle-sort-comparer) ("Files" nil nil (lambda (bufname) (buffer-file-name (get-buffer bufname))) nil ,icicle-sort-comparer) ("Files and Scratch" nil nil (lambda (bufname) (buffer-file-name (get-buffer bufname))) ("*scratch*") ,icicle-sort-comparer) ("All, *...* Buffers Last" nil nil nil nil icicle-buffer-sort-*\.\.\.*-last)) "\
*List of option configurations available for `icicle-buffer-config'.
The form is (CONFIG...), where CONFIG is a list of these items:

 - Configuration name                    (string)
 - `icicle-buffer-match-regexp' value    (regexp string)
 - `icicle-buffer-no-match-regexp' value (regexp string)
 - `icicle-buffer-predicate' value       (function)
 - `icicle-buffer-extras' value          (list of strings)
 - `icicle-buffer-sort' value            (function)

A configuration describes which buffer names are displayed during
completion and their order.")

(custom-autoload 'icicle-buffer-configs "icicles-opt" t)

(defvar icicle-special-candidate-regexp nil "\
*Regexp to match special completion candidates, or nil to do nothing.
The candidates are highlighted in buffer `*Completions*' using face
`icicle-special-candidate'.")

(custom-autoload 'icicle-special-candidate-regexp "icicles-opt" t)

(defvar icicle-S-TAB-completion-methods-alist `(("apropos" . string-match) ("scatter" . icicle-scatter-match) ,@(and (require 'fuzzy nil t) '(("Jaro-Winkler" . fuzzy-match))) ,@(and (require 'levenshtein nil t) '(("Levenshtein" . icicle-levenshtein-match) ("Levenshtein strict" . icicle-levenshtein-strict-match)))) "\
*Alist of completion methods used by `S-TAB'.
Each element has the form (NAME . FUNCTION), where NAME is a string
name and FUNCTION is the completion match function.  NAME is used in
messages to indicate the type of completion matching.

By default, `S-TAB' is the key for this completion. The actual keys
used are the value of option `icicle-apropos-complete-keys'.

See also options `icicle-TAB-completion-methods' and
`icicle-S-TAB-completion-methods-per-command'.")

(custom-autoload 'icicle-S-TAB-completion-methods-alist "icicles-opt" t)

(defvar icicle-S-TAB-completion-methods-per-command nil "\
*Alist of commands and their available S-TAB completion methods.
Each command is advised so that when invoked only the specified S-TAB
completion methods are available for it when you use `M-('.  (This
makes sense only for commands that read input from the minibuffer.)

This option gives you greater control over which completion methods
are available.  See also option
`icicle-TAB-completion-methods-per-command', which does the same thing
for `TAB' completion.  The default behavior is provided by option
`icicle-S-TAB-completion-methods-alist' (and
`icicle-TAB-completion-methods' for `TAB').

NOTE: If you remove an entry from this list, that does NOT remove the
advice for that command.  To do that you will need to explicitly
invoke command `icicle-set-S-TAB-methods-for-command' using a negative
prefix argument (or else start a new Emacs session).")

(custom-autoload 'icicle-S-TAB-completion-methods-per-command "icicles-opt" nil)

(defvar icicle-swank-prefix-length 1 "\
*Length (chars) of symbol prefix that much match, for swank completion.")

(custom-autoload 'icicle-swank-prefix-length "icicles-opt" t)

(defvar icicle-swank-timeout 3000 "\
*Number of msec before swank (fuzzy symbol) completion gives up.")

(custom-autoload 'icicle-swank-timeout "icicles-opt" t)

(defvar icicle-TAB-completion-methods (let ((methods nil)) (when (require 'el-swank-fuzzy nil t) (push 'swank methods)) (when (require 'fuzzy-match nil t) (push 'fuzzy methods)) (when (boundp 'completion-styles) (push 'vanilla methods)) (push 'basic methods) methods) "\
*List of completion methods to use for `\\<minibuffer-local-completion-map>\\[icicle-prefix-complete]'.
The first method in the list is the default method.

The available methods can include these:

1. `basic'
2. `vanilla' (provided you have Emacs 23 or later)
3. `fuzzy'   (provided you have library `fuzzy-match.el')
4. `swank'   (provided you have library `el-swank-fuzzy.el')

1. Basic completion means ordinary prefix completion. It is the
`basic' completion style of Emacs 23 or later, and it is essentially
the completion style prior to Emacs 23 (Emacs 22 completion was
slightly different - see Emacs 23 option `custom-styles' for more
info).

2. Vanilla completion respects option `completion-styles' (new in
Emacs 23), so that `TAB' behaves similarly in Icicles to what it does
in vanilla Emacs.  The vanilla method also completes environment
variables during file-name completion and in shell commands.  The
non-vanilla methods do not complete environment variables, but the
variables are expanded to their values when you hit `RET'.

3. Fuzzy completion is a form of prefix completion in which matching
finds the candidates that have the most characters in common with your
input, in the same order, and with a minimum of non-matching
characters.  It can skip over non-matching characters, as long as the
number of characters skipped in the candidate is less that those
following them that match.  After the matching candidates are found,
they are sorted by skip length and then candidate length.

Fuzzy completion is described in detail in the commentary of library
`fuzzy-match.el'.  There is no fuzzy completion of file names - fuzzy
completion is the same as basic for file names.  Fuzzy completion is
always case-sensitive.

4. Swank completion in Icicles is the same as fuzzy completion, except
regarding symbols.  That is, swank completion per se applies only to
symbols.  Symbols are completed using the algorithm of library
`el-swank-fuzzy.el'.

Icicles options `icicle-swank-timeout' and
`icicle-swank-prefix-length' give you some control over the behavior.
When the `TAB' completion method is `swank', you can use `C-x 1'
\(`icicle-doremi-increment-swank-timeout+') and `C-x 2'
\(`icicle-doremi-increment-swank-prefix-length+') in the minibuffer to
increment these options on the fly using the arrow keys `up' and
`down'.

Swank symbol completion uses heuristics that relate to supposedly
typical patterns found in symbol names.  It also uses a timeout that
can limit the number of matches.  It is generally quite a bit slower
than fuzzy completion, and it sometimes does not provide all
candidates that you might think should match, even when all of your
input is a prefix (or even when it is already complete!).  If swank
completion produces no match when you think it should, remember that
you can use `\\[icicle-next-TAB-completion-method]' on the fly to change the completion method.


If you do not customize `icicle-TAB-completion-methods', then the
default value (that is, the available `TAB' completion methods) will
reflect your current Emacs version and whether you have loaded
libraries `fuzzy-match.el' and `el-swank-fuzzy.el'.

By default, `TAB' is the key for this completion. The actual keys
used are the value of option `icicle-prefix-complete-keys'.

See also options `icicle-TAB-completion-methods-per-command'
`icicle-S-TAB-completion-methods-alist'.")

(custom-autoload 'icicle-TAB-completion-methods "icicles-opt" t)

(defvar icicle-TAB-completion-methods-per-command nil "\
*Alist of commands and their available TAB completion methods.
Each command is advised so that when invoked only the specified TAB
completion methods are available for it when you use `C-('.  (This
makes sense only for commands that read input from the minibuffer.)

This option gives you greater control over which completion methods
are available.  See also option
`icicle-S-TAB-completion-methods-per-command', which does the same
thing for `S-TAB' completion.  The default behavior is provided by
option `icicle-TAB-completion-methods' (and
`icicle-S-TAB-completion-methods-alist' for `S-TAB').

NOTE: If you remove an entry from this list, that does NOT remove the
advice for that command.  To do that you will need to explicitly
invoke command `icicle-set-TAB-methods-for-command' using a negative
prefix argument (or else start a new Emacs session).")

(custom-autoload 'icicle-TAB-completion-methods-per-command "icicles-opt" nil)

(defvar icicle-TAB-shows-candidates-flag t "\
*Non-nil means that `TAB' always shows completion candidates.
Otherwise (nil), follow the standard Emacs behavior of completing to
the longest common prefix, and only displaying the candidates after a
second `TAB'.

Actually, the concerned keys are those defined by option
`icicle-prefix-complete-keys', not necessarily `TAB'.")

(custom-autoload 'icicle-TAB-shows-candidates-flag "icicles-opt" t)

(defvar icicle-recenter -4 "\
Argument passed to `recenter' to recenter point in the target window.
Used during functions such as `icicle-search' when the destination to
visit would otherwise be off-screen.")

(custom-autoload 'icicle-recenter "icicles-opt" t)

(defvar icicle-test-for-remote-files-flag t "\
*Non-nil means Icicles tests for remote file names.
A value of nil turns off all handling of remote file names by Tramp,
including file-name completion.

The testing due to a non-nil value takes a little time, but the test
result saves time with Tramp handling, and it is used to avoid some
other costly operations when a file is determined to be remote.  These
operations are (a) incremental completion and (b) highlighting of the
part of your current input that does not complete.

Use a nil value only when you are sure that the file names you are
completing are local.  The effect will be a slight speed increase for
operations (a) and (b) for local files.

In addition, a nil value has the effect of ignoring the restriction of
input mismatch highlighting to strict completion.  That is, it treats
an `icicle-highlight-input-completion-failure' value of
`explicit-strict' or `implicit-strict' as if it were `implicit'.  The
assumption here is that you use these highlighting values only to
avoid the cost of remote file name completion.

You can toggle this option from the minibuffer using `C-^' (except
during Icicles search).")

(custom-autoload 'icicle-test-for-remote-files-flag "icicles-opt" nil)

(defvar icicle-thing-at-point-functions (progn (or (require 'ffap- nil t) (require 'ffap nil t)) (cons `(,(if (fboundp 'symbol-name-nearest-point) 'symbol-name-nearest-point (lambda nil (symbol-name (symbol-at-point)))) ,(if (fboundp 'region-or-word-nearest-point) 'region-or-word-nearest-point (lambda nil (thing-at-point 'word))) ,@(and (fboundp 'list-nearest-point-as-string) '(list-nearest-point-as-string)) ,@(and (fboundp 'list-nearest-point-as-string) '((lambda nil (list-nearest-point-as-string 2)))) ,@(and (fboundp 'list-nearest-point-as-string) '((lambda nil (list-nearest-point-as-string 3)))) ,@(and (fboundp 'ffap-guesser) '(ffap-guesser)) thing-at-point-url-at-point) 'forward-word)) "\
*Functions that return a string at or near the cursor when you use `M-.'.
A cons cell whose car and cdr may each be empty.

The car of the cons cell is a list of functions that grab different
kinds of strings at or near point.  They are used in sequence by
command `icicle-insert-string-at-point' (bound to `M-.').  I recommend
that you also use library `thingatpt+.el', so that `M-.' can take
advantage of the string-grabbing functions it defines.

The cdr of the cons cell is nil or a function that advances point one
text thing.  Each time command `icicle-insert-string-at-point' is
called successively, this is called to grab more things of text (of
the same kind).  By default, successive words are grabbed.

If either the car or cdr is empty, then the other alone determines the
behavior of `icicle-insert-string-at-point'.  Otherwise, option
`icicle-default-thing-insertion' determines whether the car or cdr is
used by `icicle-insert-string-at-point'.  `C-u' with no number
reverses the meaning of `icicle-default-thing-insertion'.")

(custom-autoload 'icicle-thing-at-point-functions "icicles-opt" t)

(define-widget 'icicle-key-definition 'lazy "\
Key definition type for Icicle mode keys.
A list of three components: KEY, COMMAND, CONDITION, that represents
an `icicle-mode-map' binding of COMMAND according to KEY, if CONDITION
evaluates to non-nil.

KEY is either a key sequence (string or vector) or a command.
COMMAND is a command.
CONDITION is a sexp.

If KEY is a command, then the binding represented is its remapping to
COMMAND." :indent 1 :offset 0 :tag "" :type (quote (list (choice (key-sequence :tag "Key" :value [ignore]) (restricted-sexp :tag "Command to remap" :match-alternatives (symbolp) :value ignore)) (restricted-sexp :tag "Command" :match-alternatives (symbolp) :value ignore) (sexp :tag "Condition"))))

(defvar icicle-yank-function 'yank "\
*Yank function.  A function that takes a prefix argument.  This
should be a command that is bound to whatever key you use to yank
text, whether in Icicle mode or not.  In Icicle mode, command
`icicle-yank-maybe-completing' calls this function, except when
`icicle-yank-maybe-completing' is called from the minibuffer or called
with a negative prefix argument.  `icicle-yank-maybe-completing'
passes the raw prefix argument to `icicle-yank-function'.

By default (see option `icicle-top-level-key-bindings'), the command
that is the value of this option is remapped to
`icicle-yank-maybe-completing' the first time you enter Icicle mode.
If you customize `icicle-yank-function', then, to take advantage of
this default remapping behavior, you will need to save your
customization and then restart Emacs.

Alternatively, you can customize both `icicle-yank-function' and the
corresponding entry in `icicle-top-level-key-bindings', and then
toggle Icicle mode off and then back on.")

(custom-autoload 'icicle-yank-function "icicles-opt" t)

(defvar icicle-top-level-key-bindings `((,(kbd "<pause>") icicle-switch-to/from-minibuffer t) (,(kbd "C-c `") icicle-search-generic t) (,(kbd "C-c $") icicle-search-word t) (,(kbd "C-c ^") icicle-search-keywords t) (,(kbd "C-c '") icicle-occur t) (,(kbd "C-c =") icicle-imenu t) (,(kbd "C-c \"") icicle-search-text-property t) (,(kbd "C-c /") icicle-complete-thesaurus-entry t) (,(kbd "C-x M-e") icicle-execute-named-keyboard-macro t) (,(kbd "C-x SPC") icicle-command-abbrev t) (,(kbd "C-x 5 o") icicle-select-frame t) (,(kbd "C-h C-o") icicle-describe-option-of-type t) ,@(and (require 'kmacro nil t) `((,(kbd "S-<f4>") icicle-kmacro t))) (abort-recursive-edit icicle-abort-recursive-edit t) (bookmark-jump icicle-bookmark t) (bookmark-jump-other-window icicle-bookmark-other-window t) (bookmark-set icicle-bookmark-cmd t) (minibuffer-keyboard-quit icicle-abort-recursive-edit (fboundp 'minibuffer-keyboard-quit)) (delete-window icicle-delete-window t) (delete-windows-for icicle-delete-window t) (dired icicle-dired t) (dired-other-window icicle-dired-other-window t) (exchange-point-and-mark icicle-exchange-point-and-mark t) (execute-extended-command icicle-execute-extended-command t) (find-file icicle-file t) (find-file-other-window icicle-file-other-window t) (find-file-read-only icicle-find-file-read-only t) (find-file-read-only-other-window icicle-find-file-read-only-other-window t) (insert-buffer icicle-insert-buffer t) (kill-buffer icicle-kill-buffer t) (kill-buffer-and-its-windows icicle-kill-buffer t) (other-window icicle-other-window-or-frame t) (other-window-or-frame icicle-other-window-or-frame t) (pop-global-mark icicle-goto-global-marker-or-pop-global-mark t) (set-mark-command icicle-goto-marker-or-set-mark-command t) (switch-to-buffer icicle-buffer t) (switch-to-buffer-other-window icicle-buffer-other-window t) (where-is icicle-where-is t) (,icicle-yank-function icicle-yank-maybe-completing t) (,(kbd "C-x j t a a") icicle-find-file-tagged (featurep 'bookmark+)) (,(kbd "C-x 4 j t a a") icicle-find-file-tagged-other-window (featurep 'bookmark+)) (bmkp-tag-a-file icicle-tag-a-file (fboundp 'bmkp-tag-a-file)) (bmkp-untag-a-file icicle-untag-a-file (fboundp 'bmkp-untag-a-file)) (bmkp-find-file-all-tags icicle-find-file-all-tags (fboundp 'bmkp-find-file-all-tags)) (bmkp-find-file-all-tags-other-window icicle-find-file-all-tags-other-window (fboundp 'bmkp-find-file-all-tags)) (bmkp-find-file-all-tags-regexp icicle-find-file-all-tags-regexp (fboundp 'bmkp-find-file-all-tags-regexp)) (bmkp-find-file-all-tags-regexp-other-window icicle-find-file-all-tags-regexp-other-window (fboundp 'bmkp-find-file-all-tags-regexp-other-window)) (bmkp-find-file-some-tags icicle-find-file-some-tags (fboundp 'bmkp-find-file-some-tags)) (bmkp-find-file-some-tags-other-window icicle-find-file-some-tags-other-window (fboundp 'bmkp-find-file-some-tags-other-window)) (bmkp-find-file-some-tags-regexp icicle-find-file-some-tags-regexp (fboundp 'bmkp-find-file-some-tags-regexp)) (bmkp-find-file-some-tags-regexp-other-window icicle-find-file-some-tags-regexp-other-window (fboundp 'bmkp-find-file-some-tags-regexp-other-window)) (bmkp-bookmark-list-jump icicle-bookmark-bookmark-list (fboundp 'bmkp-bookmark-list-jump)) (bmkp-desktop-jump icicle-bookmark-desktop (fboundp 'bmkp-desktop-jump)) (bmkp-dired-jump icicle-bookmark-dired (fboundp 'bmkp-dired-jump)) (bmkp-dired-jump-other-window icicle-bookmark-dired-other-window (fboundp 'bmkp-dired-jump)) (bmkp-file-jump icicle-bookmark-file (fboundp 'bmkp-file-jump)) (bmkp-file-jump-other-window icicle-bookmark-file-other-window (fboundp 'bmkp-file-jump)) (bmkp-file-this-dir-jump icicle-bookmark-file-this-dir (fboundp 'bmkp-file-this-dir-jump)) (bmkp-file-this-dir-jump-other-window icicle-bookmark-file-this-dir-other-window (fboundp 'bmkp-file-this-dir-jump)) (bmkp-gnus-jump icicle-bookmark-gnus (fboundp 'bmkp-gnus-jump)) (bmkp-gnus-jump-other-window icicle-bookmark-gnus-other-window (fboundp 'bmkp-gnus-jump)) (bmkp-info-jump icicle-bookmark-info (fboundp 'bmkp-info-jump)) (bmkp-info-jump-other-window icicle-bookmark-info-other-window (fboundp 'bmkp-info-jump)) (bmkp-local-file-jump icicle-bookmark-local-file (fboundp 'bmkp-local-file-jump)) (bmkp-local-file-jump-other-window icicle-bookmark-local-file-other-window (fboundp 'bmkp-local-file-jump)) (bmkp-man-jump icicle-bookmark-man (fboundp 'bmkp-man-jump)) (bmkp-man-jump-other-window icicle-bookmark-man-other-window (fboundp 'bmkp-man-jump)) (bmkp-non-file-jump icicle-bookmark-non-file (fboundp 'bmkp-non-file-jump)) (bmkp-non-file-jump-other-window icicle-bookmark-non-file-other-window (fboundp 'bmkp-non-file-jump)) (bmkp-region-jump icicle-bookmark-region (fboundp 'bmkp-region-jump)) (bmkp-region-jump-other-window icicle-bookmark-region-other-window (fboundp 'bmkp-region-jump)) (bmkp-remote-file-jump icicle-bookmark-remote-file (fboundp 'bmkp-remote-file-jump)) (bmkp-remote-file-jump-other-window icicle-bookmark-remote-file-other-window (fboundp 'bmkp-remote-file-jump)) (bmkp-specific-buffers-jump icicle-bookmark-specific-buffers (fboundp 'bmkp-specific-buffers-jump)) (bmkp-specific-buffers-jump-other-window icicle-bookmark-specific-buffers-other-window (fboundp 'bmkp-specific-buffers-jump)) (bmkp-specific-files-jump icicle-bookmark-specific-files (fboundp 'bmkp-specific-files-jump)) (bmkp-specific-files-jump-other-window icicle-bookmark-specific-files-other-window (fboundp 'bmkp-specific-files-jump)) (bmkp-this-buffer-jump icicle-bookmark-this-buffer (fboundp 'bmkp-this-buffer-jump)) (bmkp-this-buffer-jump-other-window icicle-bookmark-this-buffer-other-window (fboundp 'bmkp-this-buffer-jump)) (bmkp-all-tags-jump icicle-bookmark-all-tags (fboundp 'bmkp-all-tags-jump)) (bmkp-all-tags-jump-other-window icicle-bookmark-all-tags-other-window (fboundp 'bmkp-all-tags-jump)) (bmkp-all-tags-regexp-jump icicle-bookmark-all-tags-regexp (fboundp 'bmkp-all-tags-regexp-jump)) (bmkp-all-tags-regexp-jump-other-window icicle-bookmark-all-tags-regexp-other-window (fboundp 'bmkp-all-tags-regexp-jump)) (bmkp-some-tags-jump icicle-bookmark-some-tags (fboundp 'bmkp-some-tags-jump)) (bmkp-some-tags-jump-other-window icicle-bookmark-some-tags-other-window (fboundp 'bmkp-some-tags-jump)) (bmkp-some-tags-regexp-jump icicle-bookmark-some-tags-regexp (fboundp 'bmkp-some-tags-regexp-jump)) (bmkp-some-tags-regexp-jump-other-window icicle-bookmark-some-tags-regexp-other-window (fboundp 'bmkp-some-tags-regexp-jump)) (bmkp-file-all-tags-jump icicle-bookmark-file-all-tags (fboundp 'bmkp-file-all-tags-jump)) (bmkp-file-all-tags-jump-other-window icicle-bookmark-file-all-tags-other-window (fboundp 'bmkp-file-all-tags-jump)) (bmkp-file-all-tags-regexp-jump icicle-bookmark-file-all-tags-regexp (fboundp 'bmkp-file-all-tags-regexp-jump)) (bmkp-file-all-tags-regexp-jump-other-window icicle-bookmark-file-all-tags-regexp-other-window (fboundp 'bmkp-file-all-tags-regexp-jump)) (bmkp-file-some-tags-jump icicle-bookmark-file-some-tags (fboundp 'bmkp-file-some-tags-jump)) (bmkp-file-some-tags-jump-other-window icicle-bookmark-file-some-tags-other-window (fboundp 'bmkp-file-some-tags-jump)) (bmkp-file-some-tags-regexp-jump icicle-bookmark-file-some-tags-regexp (fboundp 'bmkp-file-some-tags-regexp-jump)) (bmkp-file-some-tags-regexp-jump-other-window icicle-bookmark-file-some-tags-regexp-other-window (fboundp 'bmkp-file-some-tags-regexp-jump)) (bmkp-file-this-dir-all-tags-jump icicle-bookmark-file-this-dir-all-tags (fboundp 'bmkp-file-this-dir-all-tags-jump)) (bmkp-file-this-dir-all-tags-jump-other-window icicle-bookmark-file-this-dir-all-tags-other-window (fboundp 'bmkp-file-this-dir-all-tags-jump)) (bmkp-file-this-dir-all-tags-regexp-jump icicle-bookmark-file-this-dir-all-tags-regexp (fboundp 'bmkp-file-this-dir-all-tags-regexp-jump)) (bmkp-file-this-dir-all-tags-regexp-jump-other-window icicle-bookmark-file-this-dir-all-tags-regexp-other-window (fboundp 'bmkp-file-this-dir-all-tags-regexp-jump)) (bmkp-file-this-dir-some-tags-jump icicle-bookmark-file-this-dir-some-tags (fboundp 'bmkp-file-this-dir-some-tags-jump)) (bmkp-file-this-dir-some-tags-jump-other-window icicle-bookmark-file-this-dir-some-tags-other-window (fboundp 'bmkp-file-this-dir-some-tags-jump)) (bmkp-file-this-dir-some-tags-regexp-jump icicle-bookmark-file-this-dir-some-tags-regexp (fboundp 'bmkp-file-this-dir-some-tags-regexp-jump)) (bmkp-file-this-dir-some-tags-regexp-jump-other-window icicle-bookmark-file-this-dir-some-tags-regexp-other-window (fboundp 'bmkp-file-this-dir-some-tags-regexp-jump)) (bmkp-url-jump icicle-bookmark-url (fboundp 'bmkp-url-jump)) (bmkp-url-jump-other-window icicle-bookmark-url-other-window (fboundp 'bmkp-url-jump)) (bmkp-w3m-jump icicle-bookmark-w3m (fboundp 'bmkp-w3m-jump)) (bmkp-w3m-jump-other-window icicle-bookmark-w3m-other-window (fboundp 'bmkp-w3m-jump)) (find-tag icicle-find-tag (fboundp 'command-remapping)) (find-tag-other-window icicle-find-first-tag-other-window t) (pop-tag-mark icicle-pop-tag-mark (fboundp 'command-remapping)) (eval-expression icicle-pp-eval-expression (fboundp 'command-remapping)) (pp-eval-expression icicle-pp-eval-expression (fboundp 'command-remapping)) (,(kbd "ESC M-x") lacarte-execute-command (fboundp 'lacarte-execute-command)) (,(kbd "M-`") lacarte-execute-menu-command (fboundp 'lacarte-execute-menu-command)) (,(kbd "<f10>") lacarte-execute-menu-command (fboundp 'lacarte-execute-menu-command))) "\
*List of top-level commands to bind in Icicle mode.
Each list element is of custom type `icicle-key-definition' and has
the form (KEY COMMAND CONDITION).

KEY is either a key sequence (string or vector) to bind COMMAND to or
a command to remap to COMMAND.
COMMAND is bound according to the value of KEY, unless the result of
evaluating CONDITION is nil.

In Customize, to specify a key sequence, choose `Key' in the `Value
Menu', then enter a key description such as that returned by `C-h k'.
For convenience, you can use insert each key in the key description by
hitting `C-q' then the key.  For example, to enter the key description
`C-c M-k' you can use `C-q C-c C-q M-k'.

If you customize this option, then you must exit and re-enter Icicle
mode to ensure that the change takes effect.  This is really necessary
only if your changes would undefine a key.

For this option to have an effect upon startup, it must be set before
you enter Icicle mode.  This means that you must ensure that the code
that sets it is invoked before you enter Icicle mode.  If you use
Customize to change this option, then ensure that the code inserted by
Customize into your `user-init-file' or your `custom-file' is invoked
before you enter Icicle mode.")

(custom-autoload 'icicle-top-level-key-bindings "icicles-opt" nil)

(defvar icicle-top-level-when-sole-completion-delay 0.7 "\
*Number of secs to wait to return to top level if only one completion.
This has no effect if `icicle-top-level-when-sole-completion-flag' is
nil.  Editing the completion (typing or deleting a character) before
the delay expires prevents its automatic acceptance.

Do not set this to 0.0.  Set it to slightly more than zero if you want
instant action.")

(custom-autoload 'icicle-top-level-when-sole-completion-delay "icicles-opt" t)

(defvar icicle-top-level-when-sole-completion-flag nil "\
*Non-nil means to return to top level if only one matching completion.
The sole completion is accepted.")

(custom-autoload 'icicle-top-level-when-sole-completion-flag "icicles-opt" t)

(defvar icicle-touche-pas-aux-menus-flag nil "\
*Non-nil means do not add items to menus except Minibuf and Icicles.
This value is used only when Icicles mode is initially established, so
changing this has no effect after Icicles has been loaded.  However,
you can change it and save the new value so it will be used next time.

For this option to have an effect upon startup, it must be set before
you enter Icicle mode.  This means that you must ensure that the code
that sets it is invoked before you enter Icicle mode.  If you use
Customize to change this option, then ensure that the code inserted by
Customize into your `user-init-file' or your `custom-file' is invoked
before you enter Icicle mode.")

(custom-autoload 'icicle-touche-pas-aux-menus-flag "icicles-opt" t)

(defvar icicle-transform-function nil "\
*Function used to transform the list of completion candidates.
This is applied to the list of initial candidates.
If this is nil, then no transformation takes place.

You can toggle this option at any time from the minibuffer using
`C-$,'.

NOTE: Although this is a user option, you probably do *NOT* want to
customize it.  Icicles commands already \"do the right thing\" when it
comes to candidate transformation.  The value of this option may be
changed by program locally, for use in particular contexts.  For
example, when you use `C-c C-`' (`icicle-search-generic') in a
*shell* buffer, Icicles uses this variable with a value of
`icicle-remove-duplicates', to remove duplicate shell commands from
your input history list.

Emacs-Lisp programmers can use this variable to transform the list of
candidates in any way they like.  A typical use is to remove
duplicates, by binding it to `icicle-remove-duplicates' or
`icicle-remove-dups-if-extras'.")

(custom-autoload 'icicle-transform-function "icicles-opt" t)

(defvar icicle-type-actions-alist '(("buffer" (lambda (b) (with-current-buffer b (ps-print-buffer))) 1-window-frames-on another-buffer browse-url-of-buffer buffer-disable-undo buffer-enable-undo buffer-file-name buffer-local-variables buffer-modified-p buffer-name buffer-size bury-buffer choose-grep-buffer current-line-string delete-1-window-frames-on delete-windows-for delete-windows-on delete/iconify-windows-on describe-buffer-bindings diff-buffer-with-file display-buffer display-buffer-other-frame echo-in-buffer eval-buffer fontify-buffer generate-new-buffer get-buffer get-buffer-process get-buffer-window get-buffer-window-list grepp-choose-grep-buffer ibuffer-jump-to-buffer icicle-char-properties-in-buffer icicle-delete-window icicle-delete-windows-on icicle-help-line-buffer icicle-kill-a-buffer insert-buffer insert-buffer-substring insert-buffer-substring-as-yank insert-buffer-substring-no-properties kill-buffer kill-buffer-and-its-windows kill-buffer-if-not-modified last-buffer multi-window-frames-on other-buffer pop-to-buffer pr-interface remove-windows-on replace-buffer-in-windows smiley-buffer switch-to-buffer switch-to-buffer-other-frame switch-to-buffer-other-window view-buffer view-buffer-other-frame view-buffer-other-window) ("color" color-defined-p color-gray-p color-supported-p color-values colors doremi-set-background-color doremi-set-foreground-color eyedrop-color-message facemenu-set-background facemenu-set-foreground hexrgb-blue hexrgb-color-name-to-hex hexrgb-complement hexrgb-green hexrgb-hex-to-color-values hexrgb-hue hexrgb-red hexrgb-saturation hexrgb-value icicle-color-help icicle-color-name-w-bg palette-brightness-scale palette-color-message palette-complement-or-alternative palette-hex-info palette-hsv-info palette-rgb-info palette-swatch ps-e-color-values ps-e-x-color-values set-background-color set-border-color set-cursor-color set-foreground-color set-mouse-color tty-color-canonicalize tty-color-desc tty-color-standard-values tty-color-translate tty-color-values x-color-defined-p x-color-values) ("command" command-remapping define-prefix-command describe-command disable-command doremi-push-frame-config-for-command enable-command Info-find-emacs-command-nodes Info-goto-emacs-command-node) ("face" color-theme-spec custom-facep customize-face customize-face-other-window custom-theme-recalc-face describe-face face-all-attributes face-attr-construct face-background face-background-20+ face-background-pixmap face-bold-p face-default-spec face-differs-from-default-p face-doc-string face-documentation face-font face-foreground face-foreground-20+ face-id face-inverse-video-p face-italic-p face-nontrivial-p face-spec-reset-face face-stipple face-underline-p face-user-default-spec facemenu-add-face facemenu-add-new-face facemenu-set-face find-face-definition hlt-choose-default-face hlt-show-default-face hlt-unhighlight-region-for-face icicle-customize-face icicle-customize-face-other-window invert-face make-face make-face-bold make-face-bold-italic make-face-italic make-face-unbold make-face-unitalic moccur-face-check modify-face ps-face-attributes read-all-face-attributes read-face-font) ("file" abbreviate-file-name ange-ftp-chase-symlinks ange-ftp-file-modtime apropos-library auto-coding-alist-lookup bookmark-file-or-variation-thereof bookmark-load browse-url-of-file byte-compile-file check-declare-file comint-append-output-to-file comint-quote-filename comint-substitute-in-file-name comint-unquote-filename comint-write-output compilation-get-file-structure cookie-insert create-file-buffer delete-file describe-file dired-delete-file diredp-mouse-diff dired-show-file-type dir-locals-find-file dir-locals-read-from-file do-after-load-evaluation ebnf-eps-file ebnf-print-file ebnf-spool-file ebnf-syntax-file ediff-backup epa-decrypt-file epa-import-keys epa-verify-file eval-next-after-load ffap-file-remote-p ffap-locate-file file-attributes file-cache-add-file file-chase-links file-dependents file-directory-p file-executable-p file-exists-p file-loadhist-lookup file-local-copy file-modes file-name-nondirectory file-newest-backup file-nlinks file-ownership-preserved-p file-provides file-readable-p file-regular-p file-relative-name file-remote-p file-requires file-symlink-p file-system-info file-truename file-writable-p find-alternate-file find-alternate-file-other-window find-buffer-visiting finder-commentary find-file find-file-at-point find-file-binary find-file-literally find-file-noselect find-file-other-frame find-file-other-window find-file-read-only find-file-read-only-other-frame find-file-read-only-other-window find-file-text get-file-buffer gnus-audio-play gnus-convert-png-to-face hexl-find-file highlight-compare-with-file icicle-add-file-to-fileset icicle-delete-file-or-directory icicle-describe-file icicle-file-remote-p icicle-help-line-file icicle-search-file icicle-shell-command-on-file image-type-from-file-header image-type-from-file-name Info-find-file Info-index-nodes info-lookup-file Info-toc-nodes info-xref-check insert-file insert-file-literally insert-image-file list-tags lm-commentary lm-creation-date lm-keywords lm-keywords-list lm-last-modified-date lm-summary lm-synopsis lm-verify lm-version load load-file load-history-regexp make-backup-file-name move-file-to-trash open-dribble-file open-termscript play-sound-file pr-ps-file-preview pr-ps-file-print pr-ps-file-ps-print pr-ps-file-using-ghostscript recentf-add-file recentf-push recentf-remove-if-non-kept recover-file rmail-input rmail-output set-file-times set-visited-file-name substitute-in-file-name system-move-file-to-trash untranslated-canonical-name untranslated-file-p url-basepath vc-backend vc-delete-automatic-version-backups vc-file-clearprops vc-insert-file vc-make-version-backup vc-name vc-state vc-working-revision view-file view-file-other-frame view-file-other-window visit-tags-table w32-browser w32-long-file-name w32-short-file-name w32explore woman-find-file write-file xml-parse-file) ("frame" current-window-configuration delete-frame delete-other-frames thumfr-dethumbify-frame doremi-undo-last-frame-color-change thumfr-fisheye fit-frame fit-frame-maximize-frame fit-frame-minimize-frame fit-frame-restore-frame frame-char-height frame-char-width frame-current-scroll-bars frame-extra-pixels-height frame-extra-pixels-width frame-face-alist frame-first-window frame-focus frame-height frame-iconified-p frame-parameters frame-pixel-height frame-pixel-width frame-root-window frame-selected-window frame-set-background-mode frame-terminal frame-visible-p frame-width get-a-frame get-frame-name hide-frame icicle-select-frame-by-name iconify-frame lower-frame make-frame-invisible make-frame-visible maximize-frame maximize-frame-horizontally maximize-frame-vertically menu-bar-open minimize-frame next-frame thumfr-only-raise-frame previous-frame raise-frame really-iconify-frame redirect-frame-focus redraw-frame restore-frame restore-frame-horizontally restore-frame-vertically select-frame select-frame-set-input-focus set-frame-name show-frame thumfr-thumbify-frame thumfr-thumbify-other-frames thumfr-thumbnail-frame-p thumfr-toggle-thumbnail-frame toggle-max-frame toggle-max-frame-horizontally toggle-max-frame-vertically toggle-zoom-frame tty-color-alist tty-color-clear w32-focus-frame window-list window-system window-tree x-focus-frame zoom-frm-in zoom-frm-out zoom-frm-unzoom) ("function" cancel-function-timers describe-function elp-instrument-function find-function find-function-other-frame find-function-other-window symbol-function trace-function trace-function-background) ("option" custom-note-var-changed customize-option customize-option-other-window describe-option icicle-binary-option-p tell-customize-var-has-changed) ("process" accept-process-output anything-kill-async-process clone-process continue-process delete-process get-process interrupt-process kill-process process-buffer process-coding-system process-command process-contact process-exit-status process-filter process-filter-multibyte-p process-id process-inherit-coding-system-flag process-kill-without-query process-mark process-name process-plist process-query-on-exit-flag process-running-child-p process-send-eof process-sentinel process-status process-tty-name process-type quit-process set-process-coding-system stop-process tooltip-process-prompt-regexp tq-create) ("symbol" apropos-describe-plist apropos-macrop apropos-score-symbol byte-compile-const-symbol-p custom-guess-type custom-unlispify-tag-name custom-variable-type default-boundp default-value describe-minor-mode-from-symbol fmakunbound icicle-help-on-candidate-symbol info-lookup-symbol makunbound symbol-file symbol-function symbol-plist symbol-value) ("variable" custom-type custom-variable-documentation custom-variable-p custom-variable-type describe-variable find-variable find-variable-noselect find-variable-other-frame find-variable-other-window help-custom-type icicle-custom-type kill-local-variable local-variable-if-set-p local-variable-p make-local-variable make-variable-buffer-local make-variable-frame-local symbol-value user-variable-p variable-binding-locus) ("window" balance-windows browse-kill-ring-fit-window compilation-set-window-height delete-other-windows delete-other-windows-vertically delete-window delete/iconify-window fit-frame-max-window-size fit-window-to-buffer mouse-drag-vertical-line-rightward-window mouse-drag-window-above next-window previous-window remove-window select-window shrink-window-if-larger-than-buffer split-window truncated-partial-width-window-p window--display-buffer-1 window--even-window-heights window--try-to-split-window window-body-height window-buffer window-buffer-height window-current-scroll-bars window-dedicated-p window-display-table window-edges window-end window-fixed-size-p window-frame window-fringes window-full-width-p window-height window-hscroll window-inside-edges window-inside-pixel-edges window-margins window-minibuffer-p window-parameters window-pixel-edges window-point window-safely-shrinkable-p window-scroll-bars window-start window-text-height window-vscroll window-width)) "\
*Alist of Emacs object types and associated actions.
Each element has the form (TYPE FUNCTION...), where TYPE names an
object type, and each FUNCTION accepts an object of type TYPE as its
only required argument

A FUNCTION here can be a symbol or a lambda form.  You can use a
symbol that is not yet `fboundp', that is, one that does not yet have
a function definition.  Any symbols that do not have function
definitions when this option is used are simply filtered out.

However, just because a function is defined at runtime does not mean
that it will work.  For example, function `buffer-size' is included in
the default value for type `buffer', but in Emacs 20 `buffer-size'
accepts no arguments, so applying it to a buffer name raises an error.

\[Note: If you have suggestions or corrections for the default value,
send them in, using `\\[icicle-send-bug-report]'.  The initial list
was drawn up quickly by looking at functions with the type in their
name and that accept a value of that type as only required argument.
There is no doubt that the default value could be improved.]")

(custom-autoload 'icicle-type-actions-alist "icicles-opt" t)

(defvar icicle-unpropertize-completion-result-flag nil "\
*Non-nil means strip text properties from the completion result.
Set this option to non-nil only if you need to ensure, for some other
library, that the string returned by `completing-read' and (starting
with Emacs 23) `read-file-name' has no text properties.

Typically, you will not use a non-nil value.  Internal text properties
added by Icicles are always removed anyway.  A non-nil value lets you
also remove properties such as `face'.")

(custom-autoload 'icicle-unpropertize-completion-result-flag "icicles-opt" t)

(defvar icicle-update-input-hook nil "\
*Functions run when minibuffer input is updated (typing or deleting).")

(custom-autoload 'icicle-update-input-hook "icicles-opt" t)

(defvar icicle-use-~-for-home-dir-flag t "\
*Non-nil means abbreviate your home directory using `~'.
You can toggle this option from the minibuffer at any time using
`M-~'.")

(custom-autoload 'icicle-use-~-for-home-dir-flag "icicles-opt" t)

(defvar icicle-use-C-for-actions-flag t "\
*Non-nil means use modifier `C-' (Control) for multi-command actions.
If nil, then you need no `C-' modifier for actions, and, instead, you
need a `C-' modifier for ordinary candidate cycling.

It is not strictly correct to speak in terms of the `C-' modifier -
that is only the default behavior.  The actual keys concerned are
those defined by these options:

 `icicle-modal-cycle-down-action-keys'
 `icicle-modal-cycle-up-action-keys'
 `icicle-apropos-cycle-next-action-keys'
 `icicle-apropos-cycle-previous-action-keys'
 `icicle-prefix-cycle-next-action-keys'
 `icicle-prefix-cycle-previous-action-keys'

You can toggle this option from the minibuffer at any time using
`M-g'.")

(custom-autoload 'icicle-use-C-for-actions-flag "icicles-opt" t)

(defvar icicle-use-anything-candidates-flag t "\
*Non-nil means Icicles can include Anything candidates for completion.
When non-nil, Anything actions are used for candidate alternate
actions in some Icicles commands, and Anything types and actions are
used by command `icicle-object-action' (aka `a' and `what-which-how').

This option has no effect if library `anything.el' cannot be loaded.")

(custom-autoload 'icicle-use-anything-candidates-flag "icicles-opt" t)

(defvar icicle-use-candidates-only-once-flag nil "\
*Non-nil means remove each candidate from the set after using it.
When you use a multi-command and act on a candidate (for example, with
`C-RET'), the candidate is removed from those available if this is
non-nil.  If this is nil, then the candidate is not removed, so you
can act on it again.

You can customize this option if you prefer the non-nil behavior all
of the time.  However, most users will not want to do that.

If you write Emacs-Lisp code, you can bind this to non-nil during
completion in contexts where it makes little sense for users to act on
the same candidate more than once.  That way, users cannot choose it
again, and they are not distracted seeing it as a candidate.

See also non-option variable `icicle-use-candidates-only-once-alt-p'.")

(custom-autoload 'icicle-use-candidates-only-once-flag "icicles-opt" t)

(defvar icicle-word-completion-keys '([(meta 32)]) "\
*Key sequences to use for minibuffer prefix word completion.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Because file names, in particular, can contain spaces, some people
prefer such a key sequence to be non-printable, such as `M-SPC'.  This
is the default value in Icicles.

But because the spacebar is such a convenient key to hit, other people
prefer to use `SPC' for word completion, and to insert a space some
other way.  The usual way to do that is via `C-q SPC', but command
`icicle-insert-a-space' is provided for convenience.  You can bind
this to `M-SPC', for instance, in `minibuffer-local-completion-map',
`minibuffer-local-completion-map', and
`minibuffer-local-must-match-map'.")

(custom-autoload 'icicle-word-completion-keys "icicles-opt" t)

(defvar icicle-WYSIWYG-Completions-flag "MMMM" "\
*Non-nil means show candidates in `*Completions*' using WYSIWYG.
This has an effect only for completion of faces and colors.

The particular non-nil value determines the appearance:
* If t, the candidate is shown with its text properties.
* If a string, the string is propertized and then appended to the
  candidate,  to serve as a color swatch.

Some commands might override a string value with different text.  This
is the case for `icicle-read-color', for instance: the color swatch
text is always the color's RGB code.

Note that, starting with Emacs 22, if this option is non-nil, then
command `describe-face' does not use `completing-read-multiple', since
that (non-Icicles) function does not support WYSIWYG candidates.")

(custom-autoload 'icicle-WYSIWYG-Completions-flag "icicles-opt" t)

;;;***

;;;### (autoloads (Icomplete-Plus) "icomplete+" "../icicles/icomplete+.el"
;;;;;;  (20033 30046))
;;; Generated autoloads from ../icicles/icomplete+.el

(let ((loads (get 'Icomplete-Plus 'custom-loads))) (if (member '"icomplete+" loads) nil (put 'Icomplete-Plus 'custom-loads (cons '"icomplete+" loads))))

(defface icompletep-choices '((((background dark)) (:foreground "Snow4")) (t (:foreground "DarkBlue"))) "\
*Face for minibuffer reminder of possible completion suffixes." :group (quote Icomplete-Plus))

(defface icompletep-determined '((t (:foreground "SeaGreen"))) "\
*Face for minibuffer reminder of possible completion prefix." :group (quote Icomplete-Plus))

(defface icompletep-nb-candidates '((((background dark)) (:foreground "SpringGreen")) (t (:foreground "DarkMagenta"))) "\
*Face for minibuffer reminder of number of completion candidates.
This has no effect unless library `icicles.el' is being used." :group (quote Icomplete-Plus))

(defface icompletep-keys '((t (:foreground "Red"))) "\
*Face for minibuffer reminder of possible completion key bindings." :group (quote Icomplete-Plus))

;;;***

;;;### (autoloads (iedit-mode) "iedit" "../iedit.el" (20071 40128))
;;; Generated autoloads from ../iedit.el

(autoload 'iedit-mode "iedit" "\
Toggle iedit mode.
If iedit mode is off, turn iedit mode on, off otherwise.

In Transient Mark mode, when iedit mode is turned on, all the
occurrences of the current region are highlighted. If one
occurrence is modified, the change are propagated to all other
occurrences simultaneously.

If Transient Mark mode is disabled or the region is not active,
the `current-word' is used as occurrence. All the occurrences of
the `current-word' are highlighted.

You can also switch to iedit mode from isearch mode directly. The
current search string is used as occurrence.  All occurrences of
the current search string are highlighted.

With a prefix argument, the occurrence when iedit is turned off
last time is used as occurrence.  This is intended to recover
last iedit which is turned off by mistake.

Commands:
\\{iedit-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (hello) "joseph-animate" "../joseph/joseph-animate.el"
;;;;;;  (20058 25304))
;;; Generated autoloads from ../joseph/joseph-animate.el

(autoload 'hello "joseph-animate" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (joseph-update-directory-autoloads-recursively)
;;;;;;  "joseph-autoload" "../joseph/joseph-autoload.el" (20033 19868))
;;; Generated autoloads from ../joseph/joseph-autoload.el

(autoload 'joseph-update-directory-autoloads-recursively "joseph-autoload" "\
update autoload cookies .scanning all directories under
~/.emacs.d/site-lisp/ recursively. to
` ~/.emacs.d/site-lisp/lisp/joseph-loaddefs.el'

\(fn)" t nil)

;;;***

;;;### (autoloads (byte-compile-all-my-el-files joseph_compile_current_el_without_output
;;;;;;  joseph-byte-compile-files-outside) "joseph-byte-compile"
;;;;;;  "../joseph/joseph-byte-compile.el" (20033 19868))
;;; Generated autoloads from ../joseph/joseph-byte-compile.el

(autoload 'joseph-byte-compile-files-outside "joseph-byte-compile" "\
调用外部的emacs byte compile 所有files 中指定的文件.
输出的结果呈现在当前emacs 中的一个buffer中, `files' can be a list of file ,
or a simple file ,前提是emacs.exe emacs 在$PATH路径下

\(fn FILES)" nil nil)

(autoload 'joseph_compile_current_el_without_output "joseph-byte-compile" "\
Not documented

\(fn)" nil nil)

(autoload 'byte-compile-all-my-el-files "joseph-byte-compile" "\
byte compile all by el files under ~/.emacs.d/site-lisp/ except cedet .

\(fn)" t nil)

;;;***

;;;### (autoloads (date joseph-goto-line-by-percent joseph-comment-dwim-line
;;;;;;  joseph-backward-4-line joseph-forward-4-line scroll-other-window-down-or-next-buffer
;;;;;;  scroll-other-window-up-or-previous-buffer joseph-hide-frame
;;;;;;  joseph-append-semicolon-at-eol try-joseph-dabbrev-substring
;;;;;;  kill-buffer-or-server-edit joseph-untabify-hook joseph-trailing-whitespace-hook
;;;;;;  joseph-kill-region-or-line just-one-space-or-delete-horizontal-space
;;;;;;  sdcv-to-buffer query-stardict move-forward-paren move-backward-paren
;;;;;;  switch-to-scratch-buffer joseph-jump-to-space-forward kill-syntax-backward
;;;;;;  kill-syntax-forward org-mode-smart-end-of-line smart-end-of-line
;;;;;;  org-mode-smart-beginning-of-line smart-beginning-of-line
;;;;;;  open-line-or-new-line-dep-pos joseph-join-lines goto-match-paren)
;;;;;;  "joseph-command" "../joseph/joseph-command.el" (20077 39357))
;;; Generated autoloads from ../joseph/joseph-command.el

(autoload 'goto-match-paren "joseph-command" "\
Go to the matching paren if on a paren; otherwise insert %.

\(fn ARG)" t nil)

(autoload 'joseph-join-lines "joseph-command" "\
Not documented

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
Not documented

\(fn)" t nil)

(autoload 'switch-to-scratch-buffer "joseph-command" "\
Toggle between *scratch* buffer and the current buffer.
     If the *scratch* buffer does not exist, create it.

\(fn)" t nil)

(autoload 'move-backward-paren "joseph-command" "\
Not documented

\(fn)" t nil)

(autoload 'move-forward-paren "joseph-command" "\
Not documented

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
Not documented

\(fn)" nil nil)

(autoload 'joseph-untabify-hook "joseph-command" "\
Not documented

\(fn)" nil nil)

(autoload 'kill-buffer-or-server-edit "joseph-command" "\
Not documented

\(fn)" t nil)

(autoload 'try-joseph-dabbrev-substring "joseph-command" "\
Not documented

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
Not documented

\(fn)" t nil)

(autoload 'joseph-backward-4-line "joseph-command" "\
Not documented

\(fn)" t nil)

(autoload 'joseph-comment-dwim-line "joseph-command" "\
Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line.

\(fn &optional ARG)" t nil)

(autoload 'joseph-goto-line-by-percent "joseph-command" "\
Not documented

\(fn)" t nil)

(autoload 'date "joseph-command" "\
Insert a nicely formated date string.

\(fn)" t nil)

;;;***

;;;### (autoloads (csharp-db-2-seter-getter csharp-setter-getter)
;;;;;;  "joseph-csharp" "../joseph/joseph-csharp.el" (20083 23236))
;;; Generated autoloads from ../joseph/joseph-csharp.el

(autoload 'csharp-setter-getter "joseph-csharp" "\
generate sets and gets for c#.

\(fn BEG END)" t nil)

(autoload 'csharp-db-2-seter-getter "joseph-csharp" "\
generate setter getter depends on db

\(fn BEG END)" t nil)

;;;***

;;;### (autoloads (apply-args-to-fun apply-args-list-to-fun) "joseph-faces"
;;;;;;  "../joseph/joseph-faces.el" (20033 19868))
;;; Generated autoloads from ../joseph/joseph-faces.el

(autoload 'apply-args-list-to-fun "joseph-faces" "\
Apply args list to function FUN-LIST.
FUN-LIST can be a symbol, also can be a list whose element is a symbol.

\(fn FUN-LIST ARGS-LIST)" nil nil)

(autoload 'apply-args-to-fun "joseph-faces" "\
Apply args to function FUN.

\(fn FUN ARGS)" nil nil)

;;;***

;;;### (autoloads (joseph-delete-matched-files joseph-all-subdirs-under-dir-without-borring-dirs
;;;;;;  joseph-all-subdirs-under-dir-recursively joseph-all-files-under-dir-recursively)
;;;;;;  "joseph-file-util" "../joseph-file-util/joseph-file-util.el"
;;;;;;  (20033 22338))
;;; Generated autoloads from ../joseph-file-util/joseph-file-util.el

(autoload 'joseph-all-files-under-dir-recursively "joseph-file-util" "\
return all files matched `include-regexp' under directory `dir' recursively.
if `include-regexp' is nil ,return all.

\(fn DIR &optional INCLUDE-REGEXP)" nil nil)

(autoload 'joseph-all-subdirs-under-dir-recursively "joseph-file-util" "\
return all sub directorys under `dir', exclude those name match `exclude-regex'

\(fn DIR &optional EXCLUDE-REGEX)" nil nil)

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

;;;***

;;;### (autoloads (icicle-file-after-icy-mode-enabled) "joseph-icicle"
;;;;;;  "../joseph/joseph-icicle.el" (20071 25327))
;;; Generated autoloads from ../joseph/joseph-icicle.el

(autoload 'icicle-file-after-icy-mode-enabled "joseph-icicle" "\
make sure icicle-mode is enabled when call `icicle-file'

\(fn)" t nil)

;;;***

;;;### (autoloads (mysql-mode) "joseph-mysql" "../joseph/joseph-mysql.el"
;;;;;;  (20057 6518))
;;; Generated autoloads from ../joseph/joseph-mysql.el

(autoload 'mysql-mode "joseph-mysql" "\
mode for editing mysql script

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (oracle-mode) "joseph-oracle" "../joseph/joseph-oracle.el"
;;;;;;  (20088 29421))
;;; Generated autoloads from ../joseph/joseph-oracle.el

(autoload 'oracle-mode "joseph-oracle" "\
start oracle in sqlplus-mode

\(fn)" t nil)

;;;***

;;;### (autoloads (publish-my-note-src publish-my-note-html publish-my-note
;;;;;;  publish-my-note-force) "joseph-org-publish" "../joseph/joseph-org-publish.el"
;;;;;;  (20087 23165))
;;; Generated autoloads from ../joseph/joseph-org-publish.el

(autoload 'publish-my-note-force "joseph-org-publish" "\
Not documented

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

;;;***

;;;### (autoloads nil "joseph-scroll-screen" "../joseph-scroll-screen/joseph-scroll-screen.el"
;;;;;;  (20033 22357))
;;; Generated autoloads from ../joseph-scroll-screen/joseph-scroll-screen.el
'

;;;***

;;;### (autoloads (bash eshell/clear) "joseph-shell" "../joseph/joseph-shell.el"
;;;;;;  (20085 65509))
;;; Generated autoloads from ../joseph/joseph-shell.el

(autoload 'eshell/clear "joseph-shell" "\
04Dec2001 - sailor, to clear the eshell buffer.

\(fn)" t nil)

(autoload 'bash "joseph-shell" "\
Start `bash' shell.

\(fn)" t nil)

;;;***

;;;### (autoloads (dired-mouse-find-alternate-file) "joseph-single-dired"
;;;;;;  "../joseph-single-dired/joseph-single-dired.el" (20033 22374))
;;; Generated autoloads from ../joseph-single-dired/joseph-single-dired.el

(autoload 'dired-mouse-find-alternate-file "joseph-single-dired" "\
In dired, visit the file or directory you click on instead of the dired buffer.

\(fn EVENT)" t nil)

;;;***

;;;### (autoloads (sqlserver-create-table) "joseph-sql" "../joseph/joseph-sql.el"
;;;;;;  (20083 23404))
;;; Generated autoloads from ../joseph/joseph-sql.el

(autoload 'sqlserver-create-table "joseph-sql" "\
做项目的时候用到的自动将excel表格格式的，创建成建表语句。region的格式如上面注释，注意顶格写

\(fn REGION-BEGIN REGION-END)" t nil)

;;;***

;;;### (autoloads (define-key-lazy add-hooks add-auto-mode) "joseph-util"
;;;;;;  "../joseph/joseph-util.el" (20079 27982))
;;; Generated autoloads from ../joseph/joseph-util.el

(autoload 'add-auto-mode "joseph-util" "\
Not documented

\(fn MODE &rest PATTERNS)" nil nil)

(autoload 'add-hooks "joseph-util" "\
Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.
HOOKS can be one list or just a hook.
将function绑到一个或多个hook上

\(fn HOOKS FUNCTION &optional APPEND LOCAL)" nil nil)

(autoload 'define-key-lazy "joseph-util" "\
define-key in `eval-after-load' block. `feature' is the file name where defined `mode-map'

\(fn MODE-MAP KEY CMD &optional FEATURE)" nil (quote macro))

;;;***

;;;### (autoloads (insertlost) "joseph_common" "../joseph/joseph_common.el"
;;;;;;  (20088 29421))
;;; Generated autoloads from ../joseph/joseph_common.el

(autoload 'insertlost "joseph_common" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (wl-sudo-find-file toggle-read-only-file-with-sudo)
;;;;;;  "joseph_sudo" "../joseph/joseph_sudo.el" (20059 31608))
;;; Generated autoloads from ../joseph/joseph_sudo.el

(autoload 'toggle-read-only-file-with-sudo "joseph_sudo" "\
Not documented

\(fn)" t nil)

(autoload 'wl-sudo-find-file "joseph_sudo" "\
Not documented

\(fn FILE &optional DIR)" t nil)

;;;***

;;;### (autoloads (js2-mode) "js2" "../js2/js2.el" (20050 17837))
;;; Generated autoloads from ../js2/js2.el
 (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'js2-mode "js2" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

;;;***

;;;### (autoloads (keep-buffers-query) "keep-buffers" "../keep-buffers.el"
;;;;;;  (20088 31035))
;;; Generated autoloads from ../keep-buffers.el

(autoload 'keep-buffers-query "keep-buffers" "\
The query function that disable deletion of buffers we protect.

\(fn)" nil nil)

;;;***

;;;### (autoloads (key-chord-define key-chord-define-global key-chord-mode)
;;;;;;  "key-chord" "../key-chord.el" (20033 28067))
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

;;;### (autoloads (lacarte-execute-menu-command lacarte-execute-command
;;;;;;  lacarte-convert-menu-item-function lacarte) "lacarte" "../icicles/lacarte.el"
;;;;;;  (20033 19868))
;;; Generated autoloads from ../icicles/lacarte.el

(let ((loads (get 'lacarte 'custom-loads))) (if (member '"lacarte" loads) nil (put 'lacarte 'custom-loads (cons '"lacarte" loads))))

(defvar lacarte-convert-menu-item-function nil "\
*Function to call to convert a menu item.
Used by `lacarte-execute-menu-command'.  A typical use would be to
remove the `&' characters used in MS Windows menus to define keyboard
accelerators.  See `lacarte-remove-w32-keybd-accelerators'.")

(custom-autoload 'lacarte-convert-menu-item-function "lacarte" t)

(autoload 'lacarte-execute-command "lacarte" "\
Execute a menu-bar menu command or an ordinary command.
Type a menu item or a command name.  Completion is available.
With a prefix arg, only menu items are available.
Completion is not case-sensitive.  However, if you use Icicles, then
you can use `C-A' in the minibuffer to toggle case-sensitivity.

If you use Icicles, then you can also sort the completion candidates
in different ways, using `C-,'.  With Icicles, by default menu items
are sorted before non-menu commands, and menu items are highlighted
using face `icicle-special-candidate'.

\(fn &optional NO-COMMANDS-P)" t nil)

(autoload 'lacarte-execute-menu-command "lacarte" "\
Execute a menu-bar menu command.
Type a menu item.  Completion is available.
Completion is not case-sensitive.  However, if you use Icicles, then
you can use `C-A' in the minibuffer to toggle case-sensitivity.
If you use Icicles, then you can also sort the completion candidates
in different ways, using `C-,'.

\(fn)" t nil)

;;;***

;;;### (autoloads (linkd-wiki-find-page linkd-latex-export linkd-export-default
;;;;;;  linkd-edit-link-at-point linkd-insert-link linkd-insert-lisp
;;;;;;  linkd-insert-wiki linkd-insert-star linkd-insert-tag linkd-insert-single-arg-link
;;;;;;  linkd-previous-link linkd-next-link linkd-follow-at-point
;;;;;;  linkd-back linkd-version) "linkd" "../linkd.el" (20033 28075))
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

;;;### (autoloads (linum-update-window linum+-generate-linum-format
;;;;;;  linum+-smart-format linum+-dynamic-format linum-format) "linum+"
;;;;;;  "../linum+.el" (20033 28079))
;;; Generated autoloads from ../linum+.el

(defvar linum-format 'smart "\
Format used to display line numbers.

+ Either a format string like \"%7d\",
+ or `smart' to smart adapt the width by current max visible line number.
+ or `dynamic' to adapt the width as needed,
+ or a vector with one string element which uesed to generate
  line number format by `format' with argument max visible line number
  of current buffer, see example `linum+-smart-format'
+ or a list with one string element which uesed to generate
  line number format by `format' with argument max line number of current buffer,
  see example `linum+-dynamic-format'
+ or a function that is called with a line number as its
  argument and should evaluate to a string to be shown on that line.

See also `linum-before-numbering-hook'.")

(custom-autoload 'linum-format "linum+" t)

(defvar linum+-dynamic-format "%%%dd|" "\
Format used to generate line number format when `linum-format' is `dynamic'.")

(custom-autoload 'linum+-dynamic-format "linum+" t)

(defvar linum+-smart-format "%%%dd|" "\
Format used to generate line number format when `linum-format' is `smart'.")

(custom-autoload 'linum+-smart-format "linum+" t)

(autoload 'linum+-generate-linum-format "linum+" "\
Generate line number format by FORMAT-TYPE, LIMIT is `window-end' of win.

\(fn FORMAT-TYPE LIMIT)" nil nil)

(autoload 'linum-update-window "linum+" "\
Update line numbers for the portion visible in window WIN.

\(fn WIN)" nil nil)

;;;***

;;;### (autoloads (magit-status) "magit" "../magit-1.0.0/magit.el"
;;;;;;  (20033 19868))
;;; Generated autoloads from ../magit-1.0.0/magit.el

(autoload 'magit-status "magit" "\
Not documented

\(fn DIR)" t nil)

;;;***

;;;### (autoloads (mwe:open-command-log-buffer mwe:log-keyboard-commands)
;;;;;;  "mwe-log-commands" "../mwe-log-commands.el" (20033 29398))
;;; Generated autoloads from ../mwe-log-commands.el

(autoload 'mwe:log-keyboard-commands "mwe-log-commands" "\
Enables keyboard command logging for the current buffer.
If optional ARG is nil, logging is turned off.

\(fn &optional ARG)" t nil)

(autoload 'mwe:open-command-log-buffer "mwe-log-commands" "\
Opens (and creates, if non-existant) a buffer used for logging keyboard commands.
If ARG is Non-nil, the existing command log buffer is cleared.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (org-babel-mark-block org-babel-previous-src-block
;;;;;;  org-babel-next-src-block org-babel-goto-named-result org-babel-goto-named-src-block
;;;;;;  org-babel-goto-src-block-head org-babel-hide-result-toggle-maybe
;;;;;;  org-babel-sha1-hash org-babel-execute-subtree org-babel-execute-buffer
;;;;;;  org-babel-map-inline-src-blocks org-babel-map-src-blocks
;;;;;;  org-babel-open-src-block-result org-babel-switch-to-session-with-code
;;;;;;  org-babel-switch-to-session org-babel-initiate-session org-babel-load-in-session
;;;;;;  org-babel-check-src-block org-babel-expand-src-block org-babel-execute-src-block
;;;;;;  org-babel-pop-to-session-maybe org-babel-load-in-session-maybe
;;;;;;  org-babel-expand-src-block-maybe org-babel-view-src-block-info
;;;;;;  org-babel-execute-maybe org-babel-execute-safely-maybe) "ob"
;;;;;;  "../org-mode-git/lisp/ob.el" (20033 32141))
;;; Generated autoloads from ../org-mode-git/lisp/ob.el

(autoload 'org-babel-execute-safely-maybe "ob" "\
Not documented

\(fn)" nil nil)

(autoload 'org-babel-execute-maybe "ob" "\
Not documented

\(fn)" t nil)

(autoload 'org-babel-view-src-block-info "ob" "\
Display information on the current source block.
This includes header arguments, language and name, and is largely
a window into the `org-babel-get-src-block-info' function.

\(fn)" t nil)

(autoload 'org-babel-expand-src-block-maybe "ob" "\
Conditionally expand a source block.
Detect if this is context for a org-babel src-block and if so
then run `org-babel-expand-src-block'.

\(fn)" t nil)

(autoload 'org-babel-load-in-session-maybe "ob" "\
Conditionally load a source block in a session.
Detect if this is context for a org-babel src-block and if so
then run `org-babel-load-in-session'.

\(fn)" t nil)

(autoload 'org-babel-pop-to-session-maybe "ob" "\
Conditionally pop to a session.
Detect if this is context for a org-babel src-block and if so
then run `org-babel-pop-to-session'.

\(fn)" t nil)

(autoload 'org-babel-execute-src-block "ob" "\
Execute the current source code block.
Insert the results of execution into the buffer.  Source code
execution and the collection and formatting of results can be
controlled through a variety of header arguments.

With prefix argument ARG, force re-execution even if a an
existing result cached in the buffer would otherwise have been
returned.

Optionally supply a value for INFO in the form returned by
`org-babel-get-src-block-info'.

Optionally supply a value for PARAMS which will be merged with
the header arguments specified at the front of the source code
block.

\(fn &optional ARG INFO PARAMS)" t nil)

(autoload 'org-babel-expand-src-block "ob" "\
Expand the current source code block.
Expand according to the source code block's header
arguments and pop open the results in a preview buffer.

\(fn &optional ARG INFO PARAMS)" t nil)

(autoload 'org-babel-check-src-block "ob" "\
Check for misspelled header arguments in the current code block.

\(fn)" t nil)

(autoload 'org-babel-load-in-session "ob" "\
Load the body of the current source-code block.
Evaluate the header arguments for the source block before
entering the session.  After loading the body this pops open the
session.

\(fn &optional ARG INFO)" t nil)

(autoload 'org-babel-initiate-session "ob" "\
Initiate session for current code block.
If called with a prefix argument then resolve any variable
references in the header arguments and assign these variables in
the session. Copy the body of the code block to the kill ring.

\(fn &optional ARG INFO)" t nil)

(autoload 'org-babel-switch-to-session "ob" "\
Switch to the session of the current code block.
Uses `org-babel-initiate-session' to start the session. If called
with a prefix argument then this is passed on to
`org-babel-initiate-session'.

\(fn &optional ARG INFO)" t nil)

(autoload 'org-babel-switch-to-session-with-code "ob" "\
Switch to code buffer and display session.

\(fn &optional ARG INFO)" t nil)

(autoload 'org-babel-open-src-block-result "ob" "\
If `point' is on a src block then open the results of the
source code block, otherwise return nil.  With optional prefix
argument RE-RUN the source-code block is evaluated even if
results already exist.

\(fn &optional RE-RUN)" t nil)

(autoload 'org-babel-map-src-blocks "ob" "\
Evaluate BODY forms on each source-block in FILE.
If FILE is nil evaluate BODY forms on source blocks in current
buffer.  During evaluation of BODY the following local variables
are set relative to the currently matched code block.

full-block ------- string holding the entirety of the code block
beg-block -------- point at the beginning of the code block
end-block -------- point at the end of the matched code block
lang ------------- string holding the language of the code block
beg-lang --------- point at the beginning of the lang
end-lang --------- point at the end of the lang
switches --------- string holding the switches
beg-switches ----- point at the beginning of the switches
end-switches ----- point at the end of the switches
header-args ------ string holding the header-args
beg-header-args -- point at the beginning of the header-args
end-header-args -- point at the end of the header-args
body ------------- string holding the body of the code block
beg-body --------- point at the beginning of the body
end-body --------- point at the end of the body

\(fn FILE &rest BODY)" nil (quote macro))

(autoload 'org-babel-map-inline-src-blocks "ob" "\
Evaluate BODY forms on each inline source-block in FILE.
If FILE is nil evaluate BODY forms on source blocks in current
buffer.

\(fn FILE &rest BODY)" nil (quote macro))

(autoload 'org-babel-execute-buffer "ob" "\
Execute source code blocks in a buffer.
Call `org-babel-execute-src-block' on every source block in
the current buffer.

\(fn &optional ARG)" t nil)

(autoload 'org-babel-execute-subtree "ob" "\
Execute source code blocks in a subtree.
Call `org-babel-execute-src-block' on every source block in
the current subtree.

\(fn &optional ARG)" t nil)

(autoload 'org-babel-sha1-hash "ob" "\
Generate an sha1 hash based on the value of info.

\(fn &optional INFO)" t nil)

(autoload 'org-babel-hide-result-toggle-maybe "ob" "\
Toggle visibility of result at point.

\(fn)" t nil)

(autoload 'org-babel-goto-src-block-head "ob" "\
Go to the beginning of the current code block.

\(fn)" t nil)

(autoload 'org-babel-goto-named-src-block "ob" "\
Go to a named source-code block.

\(fn NAME)" t nil)

(autoload 'org-babel-goto-named-result "ob" "\
Go to a named result.

\(fn NAME)" t nil)

(autoload 'org-babel-next-src-block "ob" "\
Jump to the next source block.
With optional prefix argument ARG, jump forward ARG many source blocks.

\(fn &optional ARG)" t nil)

(autoload 'org-babel-previous-src-block "ob" "\
Jump to the previous source block.
With optional prefix argument ARG, jump backward ARG many source blocks.

\(fn &optional ARG)" t nil)

(autoload 'org-babel-mark-block "ob" "\
Mark current src block

\(fn)" t nil)

;;;***

;;;### (autoloads (org-babel-describe-bindings) "ob-keys" "../org-mode-git/lisp/ob-keys.el"
;;;;;;  (20026 45997))
;;; Generated autoloads from ../org-mode-git/lisp/ob-keys.el

(autoload 'org-babel-describe-bindings "ob-keys" "\
Describe all keybindings behind `org-babel-key-prefix'.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-babel-lob-get-info org-babel-lob-execute-maybe
;;;;;;  org-babel-lob-ingest) "ob-lob" "../org-mode-git/lisp/ob-lob.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/ob-lob.el

(autoload 'org-babel-lob-ingest "ob-lob" "\
Add all named source-blocks defined in FILE to
`org-babel-library-of-babel'.

\(fn &optional FILE)" t nil)

(autoload 'org-babel-lob-execute-maybe "ob-lob" "\
Execute a Library of Babel source block, if appropriate.
Detect if this is context for a Library Of Babel source block and
if so then run the appropriate source block from the Library.

\(fn)" t nil)

(autoload 'org-babel-lob-get-info "ob-lob" "\
Return a Library of Babel function call as a string.

\(fn)" nil nil)

;;;***

;;;### (autoloads (org-babel-tangle org-babel-tangle-file org-babel-load-file
;;;;;;  org-babel-tangle-lang-exts) "ob-tangle" "../org-mode-git/lisp/ob-tangle.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/ob-tangle.el

(defvar org-babel-tangle-lang-exts '(("emacs-lisp" . "el")) "\
Alist mapping languages to their file extensions.
The key is the language name, the value is the string that should
be inserted as the extension commonly used to identify files
written in this language.  If no entry is found in this list,
then the name of the language is used.")

(custom-autoload 'org-babel-tangle-lang-exts "ob-tangle" t)

(autoload 'org-babel-load-file "ob-tangle" "\
Load Emacs Lisp source code blocks in the Org-mode FILE.
This function exports the source code using
`org-babel-tangle' and then loads the resulting file using
`load-file'.

\(fn FILE)" t nil)

(autoload 'org-babel-tangle-file "ob-tangle" "\
Extract the bodies of source code blocks in FILE.
Source code blocks are extracted with `org-babel-tangle'.
Optional argument TARGET-FILE can be used to specify a default
export file for all source blocks.  Optional argument LANG can be
used to limit the exported source code blocks by language.

\(fn FILE &optional TARGET-FILE LANG)" t nil)

(autoload 'org-babel-tangle "ob-tangle" "\
Write code blocks to source-specific files.
Extract the bodies of all source code blocks from the current
file into their own source-specific files.  Optional argument
TARGET-FILE can be used to specify a default export file for all
source blocks.  Optional argument LANG can be used to limit the
exported source code blocks by language.

\(fn &optional ONLY-THIS-BLOCK TARGET-FILE LANG)" t nil)

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
;;;;;;  "oracle-query" "../sqlparse/oracle-query.el" (20086 189))
;;; Generated autoloads from ../sqlparse/oracle-query.el

(autoload 'oracle-query-create-connection "oracle-query" "\
create a connection to oracle using sqlplus ,and return the
created process

\(fn CONNECT-STRING)" t nil)

(autoload 'oracle-query-close-connection "oracle-query" "\
close connection.kill sqlplus process and buffer .

\(fn SQLPLUS-CONNECTION)" nil nil)

(autoload 'oracle-query "oracle-query" "\
execute sql using `sqlplus' ,and return the result of it.

\(fn SQL &optional ORACLE-QUERY-CONNECTION)" nil nil)

;;;***

;;;### (autoloads (oracle-table2entity-4csharp-interactively otec-generate-all-classes)
;;;;;;  "oracle-table2entity-4csharp" "../sqlparse/oracle-table2entity-4csharp.el"
;;;;;;  (20086 5821))
;;; Generated autoloads from ../sqlparse/oracle-table2entity-4csharp.el

(autoload 'otec-generate-all-classes "oracle-table2entity-4csharp" "\
Not documented

\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'oracle-table2entity-4csharp-interactively "oracle-table2entity-4csharp" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (org-customize org-reload org-require-autoloaded-modules
;;;;;;  org-submit-bug-report org-cycle-agenda-files org-switchb
;;;;;;  org-map-entries org-open-link-from-string org-open-at-point-global
;;;;;;  org-insert-link-global org-store-link org-run-like-in-org-mode
;;;;;;  turn-on-orgstruct++ turn-on-orgstruct orgstruct-mode org-global-cycle
;;;;;;  org-mode org-babel-do-load-languages) "org" "../org-mode-git/lisp/org.el"
;;;;;;  (20033 32141))
;;; Generated autoloads from ../org-mode-git/lisp/org.el

(autoload 'org-babel-do-load-languages "org" "\
Load the languages defined in `org-babel-load-languages'.

\(fn SYM VALUE)" nil nil)

(autoload 'org-mode "org" "\
Outline-based notes management and organizer, alias
\"Carsten's outline-mode for keeping track of everything.\"

Org-mode develops organizational tasks around a NOTES file which
contains information about projects as plain text.  Org-mode is
implemented on top of outline-mode, which is ideal to keep the content
of large files well structured.  It supports ToDo items, deadlines and
time stamps, which magically appear in the diary listing of the Emacs
calendar.  Tables are easily created with a built-in table editor.
Plain text URL-like links connect to websites, emails (VM), Usenet
messages (Gnus), BBDB entries, and any files related to the project.
For printing and sharing of notes, an Org-mode file (or a part of it)
can be exported as a structured ASCII or HTML file.

The following commands are available:

\\{org-mode-map}

\(fn)" t nil)

(defvar org-inlinetask-min-level)

(autoload 'org-global-cycle "org" "\
Cycle the global visibility.  For details see `org-cycle'.
With \\[universal-argument] prefix arg, switch to startup visibility.
With a numeric prefix, show all headlines up to that level.

\(fn &optional ARG)" t nil)

(autoload 'orgstruct-mode "org" "\
Toggle the minor mode `orgstruct-mode'.
This mode is for using Org-mode structure commands in other
modes.  The following keys behave as if Org-mode were active, if
the cursor is on a headline, or on a plain list item (both as
defined by Org-mode).

M-up        Move entry/item up
M-down	    Move entry/item down
M-left	    Promote
M-right	    Demote
M-S-up	    Move entry/item up
M-S-down    Move entry/item down
M-S-left    Promote subtree
M-S-right   Demote subtree
M-q	    Fill paragraph and items like in Org-mode
C-c ^	    Sort entries
C-c -	    Cycle list bullet
TAB         Cycle item visibility
M-RET       Insert new heading/item
S-M-RET     Insert new TODO heading / Checkbox item
C-c C-c     Set tags / toggle checkbox

\(fn &optional ARG)" t nil)

(autoload 'turn-on-orgstruct "org" "\
Unconditionally turn on `orgstruct-mode'.

\(fn)" nil nil)

(autoload 'turn-on-orgstruct++ "org" "\
Unconditionally turn on `orgstruct++-mode'.

\(fn)" nil nil)

(autoload 'org-run-like-in-org-mode "org" "\
Run a command, pretending that the current buffer is in Org-mode.
This will temporarily bind local variables that are typically bound in
Org-mode to the values they have in Org-mode, and then interactively
call CMD.

\(fn CMD)" nil nil)

(autoload 'org-store-link "org" "\
\\<org-mode-map>Store an org-link to the current location.
This link is added to `org-stored-links' and can later be inserted
into an org-buffer with \\[org-insert-link].

For some link types, a prefix arg is interpreted:
For links to usenet articles, arg negates `org-gnus-prefer-web-links'.
For file links, arg negates `org-context-in-file-links'.

\(fn ARG)" t nil)

(autoload 'org-insert-link-global "org" "\
Insert a link like Org-mode does.
This command can be called in any mode to insert a link in Org-mode syntax.

\(fn)" t nil)

(autoload 'org-open-at-point-global "org" "\
Follow a link like Org-mode does.
This command can be called in any mode to follow a link that has
Org-mode syntax.

\(fn)" t nil)

(autoload 'org-open-link-from-string "org" "\
Open a link in the string S, as if it was in Org-mode.

\(fn S &optional ARG REFERENCE-BUFFER)" t nil)

(autoload 'org-map-entries "org" "\
Call FUNC at each headline selected by MATCH in SCOPE.

FUNC is a function or a lisp form.  The function will be called without
arguments, with the cursor positioned at the beginning of the headline.
The return values of all calls to the function will be collected and
returned as a list.

The call to FUNC will be wrapped into a save-excursion form, so FUNC
does not need to preserve point.  After evaluation, the cursor will be
moved to the end of the line (presumably of the headline of the
processed entry) and search continues from there.  Under some
circumstances, this may not produce the wanted results.  For example,
if you have removed (e.g. archived) the current (sub)tree it could
mean that the next entry will be skipped entirely.  In such cases, you
can specify the position from where search should continue by making
FUNC set the variable `org-map-continue-from' to the desired buffer
position.

MATCH is a tags/property/todo match as it is used in the agenda tags view.
Only headlines that are matched by this query will be considered during
the iteration.  When MATCH is nil or t, all headlines will be
visited by the iteration.

SCOPE determines the scope of this command.  It can be any of:

nil     The current buffer, respecting the restriction if any
tree    The subtree started with the entry at point
region  The entries within the active region, if any
file    The current buffer, without restriction
file-with-archives
        The current buffer, and any archives associated with it
agenda  All agenda files
agenda-with-archives
        All agenda files with any archive files associated with them
\(file1 file2 ...)
        If this is a list, all files in the list will be scanned

The remaining args are treated as settings for the skipping facilities of
the scanner.  The following items can be given here:

  archive    skip trees with the archive tag.
  comment    skip trees with the COMMENT keyword
  function or Emacs Lisp form:
             will be used as value for `org-agenda-skip-function', so whenever
             the function returns t, FUNC will not be called for that
             entry and search will continue from the point where the
             function leaves it.

If your function needs to retrieve the tags including inherited tags
at the *current* entry, you can use the value of the variable
`org-scanner-tags' which will be much faster than getting the value
with `org-get-tags-at'.  If your function gets properties with
`org-entry-properties' at the *current* entry, bind `org-trust-scanner-tags'
to t around the call to `org-entry-properties' to get the same speedup.
Note that if your function moves around to retrieve tags and properties at
a *different* entry, you cannot use these techniques.

\(fn FUNC &optional MATCH SCOPE &rest SKIP)" nil nil)

(autoload 'org-switchb "org" "\
Switch between Org buffers.
With a prefix argument, restrict available to files.
With two prefix arguments, restrict available buffers to agenda files.

Defaults to `iswitchb' for buffer name completion.
Set `org-completion-use-ido' to make it use ido instead.

\(fn &optional ARG)" t nil)

(defalias 'org-ido-switchb 'org-switchb)

(defalias 'org-iswitchb 'org-switchb)

(autoload 'org-cycle-agenda-files "org" "\
Cycle through the files in `org-agenda-files'.
If the current buffer visits an agenda file, find the next one in the list.
If the current buffer does not, find the first agenda file.

\(fn)" t nil)

(autoload 'org-submit-bug-report "org" "\
Submit a bug report on Org-mode via mail.

Don't hesitate to report any problems or inaccurate documentation.

If you don't have setup sending mail from (X)Emacs, please copy the
output buffer into your mail program, as it gives us important
information about your Org-mode version and configuration.

\(fn)" t nil)

(autoload 'org-require-autoloaded-modules "org" "\
Not documented

\(fn)" t nil)

(autoload 'org-reload "org" "\
Reload all org lisp files.
With prefix arg UNCOMPILED, load the uncompiled versions.

\(fn &optional UNCOMPILED)" t nil)

(autoload 'org-customize "org" "\
Call the customize function with org as argument.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-agenda-to-appt org-calendar-goto-agenda org-agenda-check-for-timestamp-as-reason-to-ignore-todo-item
;;;;;;  org-diary org-agenda-list-stuck-projects org-tags-view org-todo-list
;;;;;;  org-search-view org-agenda-list org-batch-store-agenda-views
;;;;;;  org-store-agenda-views org-batch-agenda-csv org-batch-agenda
;;;;;;  org-agenda) "org-agenda" "../org-mode-git/lisp/org-agenda.el"
;;;;;;  (20026 45996))
;;; Generated autoloads from ../org-mode-git/lisp/org-agenda.el

(autoload 'org-agenda "org-agenda" "\
Dispatch agenda commands to collect entries to the agenda buffer.
Prompts for a command to execute.  Any prefix arg will be passed
on to the selected command.  The default selections are:

a     Call `org-agenda-list' to display the agenda for current day or week.
t     Call `org-todo-list' to display the global todo list.
T     Call `org-todo-list' to display the global todo list, select only
      entries with a specific TODO keyword (the user gets a prompt).
m     Call `org-tags-view' to display headlines with tags matching
      a condition  (the user is prompted for the condition).
M     Like `m', but select only TODO entries, no ordinary headlines.
L     Create a timeline for the current buffer.
e     Export views to associated files.
s     Search entries for keywords.
/     Multi occur across all agenda files and also files listed
      in `org-agenda-text-search-extra-files'.
<     Restrict agenda commands to buffer, subtree, or region.
      Press several times to get the desired effect.
>     Remove a previous restriction.
#     List \"stuck\" projects.
!     Configure what \"stuck\" means.
C     Configure custom agenda commands.

More commands can be added by configuring the variable
`org-agenda-custom-commands'.  In particular, specific tags and TODO keyword
searches can be pre-defined in this way.

If the current buffer is in Org-mode and visiting a file, you can also
first press `<' once to indicate that the agenda should be temporarily
\(until the next use of \\[org-agenda]) restricted to the current file.
Pressing `<' twice means to restrict to the current subtree or region
\(if active).

\(fn &optional ARG KEYS RESTRICTION)" t nil)

(autoload 'org-batch-agenda "org-agenda" "\
Run an agenda command in batch mode and send the result to STDOUT.
If CMD-KEY is a string of length 1, it is used as a key in
`org-agenda-custom-commands' and triggers this command.  If it is a
longer string it is used as a tags/todo match string.
Parameters are alternating variable names and values that will be bound
before running the agenda command.

\(fn CMD-KEY &rest PARAMETERS)" nil (quote macro))

(autoload 'org-batch-agenda-csv "org-agenda" "\
Run an agenda command in batch mode and send the result to STDOUT.
If CMD-KEY is a string of length 1, it is used as a key in
`org-agenda-custom-commands' and triggers this command.  If it is a
longer string it is used as a tags/todo match string.
Parameters are alternating variable names and values that will be bound
before running the agenda command.

The output gives a line for each selected agenda item.  Each
item is a list of comma-separated values, like this:

category,head,type,todo,tags,date,time,extra,priority-l,priority-n

category     The category of the item
head         The headline, without TODO kwd, TAGS and PRIORITY
type         The type of the agenda entry, can be
                todo               selected in TODO match
                tagsmatch          selected in tags match
                diary              imported from diary
                deadline           a deadline on given date
                scheduled          scheduled on given date
                timestamp          entry has timestamp on given date
                closed             entry was closed on given date
                upcoming-deadline  warning about deadline
                past-scheduled     forwarded scheduled item
                block              entry has date block including g. date
todo         The todo keyword, if any
tags         All tags including inherited ones, separated by colons
date         The relevant date, like 2007-2-14
time         The time, like 15:00-16:50
extra        Sting with extra planning info
priority-l   The priority letter if any was given
priority-n   The computed numerical priority
agenda-day   The day in the agenda where this is listed

\(fn CMD-KEY &rest PARAMETERS)" nil (quote macro))

(autoload 'org-store-agenda-views "org-agenda" "\
Not documented

\(fn &rest PARAMETERS)" t nil)

(autoload 'org-batch-store-agenda-views "org-agenda" "\
Run all custom agenda commands that have a file argument.

\(fn &rest PARAMETERS)" nil (quote macro))

(autoload 'org-agenda-list "org-agenda" "\
Produce a daily/weekly view from all files in variable `org-agenda-files'.
The view will be for the current day or week, but from the overview buffer
you will be able to go to other days/weeks.

With a numeric prefix argument in an interactive call, the agenda will
span INCLUDE-ALL days.  Lisp programs should instead specify SPAN to change
the number of days.  SPAN defaults to `org-agenda-span'.

START-DAY defaults to TODAY, or to the most recent match for the weekday
given in `org-agenda-start-on-weekday'.

\(fn &optional INCLUDE-ALL START-DAY SPAN)" t nil)

(autoload 'org-search-view "org-agenda" "\
Show all entries that contain a phrase or words or regular expressions.

With optional prefix argument TODO-ONLY, only consider entries that are
TODO entries.  The argument STRING can be used to pass a default search
string into this function.  If EDIT-AT is non-nil, it means that the
user should get a chance to edit this string, with cursor at position
EDIT-AT.

The search string can be viewed either as a phrase that should be found as
is, or it can be broken into a number of snippets, each of which must match
in a Boolean way to select an entry.  The default depends on the variable
`org-agenda-search-view-always-boolean'.
Even if this is turned off (the default) you can always switch to
Boolean search dynamically by preceding the first word with  \"+\" or \"-\".

The default is a direct search of the whole phrase, where each space in
the search string can expand to an arbitrary amount of whitespace,
including newlines.

If using a Boolean search, the search string is split on whitespace and
each snippet is searched separately, with logical AND to select an entry.
Words prefixed with a minus must *not* occur in the entry.  Words without
a prefix or prefixed with a plus must occur in the entry.  Matching is
case-insensitive.  Words are enclosed by word delimiters (i.e. they must
match whole words, not parts of a word) if
`org-agenda-search-view-force-full-words' is set (default is nil).

Boolean search snippets enclosed by curly braces are interpreted as
regular expressions that must or (when preceded with \"-\") must not
match in the entry.  Snippets enclosed into double quotes will be taken
as a whole, to include whitespace.

- If the search string starts with an asterisk, search only in headlines.
- If (possibly after the leading star) the search string starts with an
  exclamation mark, this also means to look at TODO entries only, an effect
  that can also be achieved with a prefix argument.
- If (possibly after star and exclamation mark) the search string starts
  with a colon, this will mean that the (non-regexp) snippets of the
  Boolean search must match as full words.

This command searches the agenda files, and in addition the files listed
in `org-agenda-text-search-extra-files'.

\(fn &optional TODO-ONLY STRING EDIT-AT)" t nil)

(autoload 'org-todo-list "org-agenda" "\
Show all (not done) TODO entries from all agenda file in a single list.
The prefix arg can be used to select a specific TODO keyword and limit
the list to these.  When using \\[universal-argument], you will be prompted
for a keyword.  A numeric prefix directly selects the Nth keyword in
`org-todo-keywords-1'.

\(fn ARG)" t nil)

(autoload 'org-tags-view "org-agenda" "\
Show all headlines for all `org-agenda-files' matching a TAGS criterion.
The prefix arg TODO-ONLY limits the search to TODO entries.

\(fn &optional TODO-ONLY MATCH)" t nil)

(autoload 'org-agenda-list-stuck-projects "org-agenda" "\
Create agenda view for projects that are stuck.
Stuck projects are project that have no next actions.  For the definitions
of what a project is and how to check if it stuck, customize the variable
`org-stuck-projects'.

\(fn &rest IGNORE)" t nil)

(autoload 'org-diary "org-agenda" "\
Return diary information from org-files.
This function can be used in a \"sexp\" diary entry in the Emacs calendar.
It accesses org files and extracts information from those files to be
listed in the diary.  The function accepts arguments specifying what
items should be listed.  For a list of arguments allowed here, see the
variable `org-agenda-entry-types'.

The call in the diary file should look like this:

   &%%(org-diary) ~/path/to/some/orgfile.org

Use a separate line for each org file to check.  Or, if you omit the file name,
all files listed in `org-agenda-files' will be checked automatically:

   &%%(org-diary)

If you don't give any arguments (as in the example above), the default
arguments (:deadline :scheduled :timestamp :sexp) are used.
So the example above may also be written as

   &%%(org-diary :deadline :timestamp :sexp :scheduled)

The function expects the lisp variables `entry' and `date' to be provided
by the caller, because this is how the calendar works.  Don't use this
function from a program - use `org-agenda-get-day-entries' instead.

\(fn &rest ARGS)" nil nil)

(autoload 'org-agenda-check-for-timestamp-as-reason-to-ignore-todo-item "org-agenda" "\
Do we have a reason to ignore this TODO entry because it has a time stamp?

\(fn &optional END)" nil nil)

(autoload 'org-calendar-goto-agenda "org-agenda" "\
Compute the Org-mode agenda for the calendar date displayed at the cursor.
This is a command that has to be installed in `calendar-mode-map'.

\(fn)" t nil)

(autoload 'org-agenda-to-appt "org-agenda" "\
Activate appointments found in `org-agenda-files'.
With a \\[universal-argument] prefix, refresh the list of
appointments.

If FILTER is t, interactively prompt the user for a regular
expression, and filter out entries that don't match it.

If FILTER is a string, use this string as a regular expression
for filtering entries out.

FILTER can also be an alist with the car of each cell being
either 'headline or 'category.  For example:

  '((headline \"IMPORTANT\")
    (category \"Work\"))

will only add headlines containing IMPORTANT or headlines
belonging to the \"Work\" category.

\(fn &optional REFRESH FILTER)" t nil)

;;;***

;;;### (autoloads (org-archive-subtree-default-with-confirmation
;;;;;;  org-archive-subtree-default) "org-archive" "../org-mode-git/lisp/org-archive.el"
;;;;;;  (20026 45996))
;;; Generated autoloads from ../org-mode-git/lisp/org-archive.el

(autoload 'org-archive-subtree-default "org-archive" "\
Archive the current subtree with the default command.
This command is set with the variable `org-archive-default-command'.

\(fn)" t nil)

(autoload 'org-archive-subtree-default-with-confirmation "org-archive" "\
Archive the current subtree with the default command.
This command is set with the variable `org-archive-default-command'.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-export-as-ascii org-export-region-as-ascii
;;;;;;  org-replace-region-by-ascii org-export-as-ascii-to-buffer
;;;;;;  org-export-as-utf8-to-buffer org-export-as-utf8 org-export-as-latin1-to-buffer
;;;;;;  org-export-as-latin1) "org-ascii" "../org-mode-git/lisp/org-ascii.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-ascii.el

(autoload 'org-export-as-latin1 "org-ascii" "\
Like `org-export-as-ascii', use latin1 encoding for special symbols.

\(fn &rest ARGS)" t nil)

(autoload 'org-export-as-latin1-to-buffer "org-ascii" "\
Like `org-export-as-ascii-to-buffer', use latin1 encoding for symbols.

\(fn &rest ARGS)" t nil)

(autoload 'org-export-as-utf8 "org-ascii" "\
Like `org-export-as-ascii', use encoding for special symbols.

\(fn &rest ARGS)" t nil)

(autoload 'org-export-as-utf8-to-buffer "org-ascii" "\
Like `org-export-as-ascii-to-buffer', use utf8 encoding for symbols.

\(fn &rest ARGS)" t nil)

(autoload 'org-export-as-ascii-to-buffer "org-ascii" "\
Call `org-export-as-ascii` with output to a temporary buffer.
No file is created.  The prefix ARG is passed through to `org-export-as-ascii'.

\(fn ARG)" t nil)

(autoload 'org-replace-region-by-ascii "org-ascii" "\
Assume the current region has org-mode syntax, and convert it to plain ASCII.
This can be used in any buffer.  For example, you could write an
itemized list in org-mode syntax in a Mail buffer and then use this
command to convert it.

\(fn BEG END)" t nil)

(autoload 'org-export-region-as-ascii "org-ascii" "\
Convert region from BEG to END in org-mode buffer to plain ASCII.
If prefix arg BODY-ONLY is set, omit file header, footer, and table of
contents, and only produce the region of converted text, useful for
cut-and-paste operations.
If BUFFER is a buffer or a string, use/create that buffer as a target
of the converted ASCII.  If BUFFER is the symbol `string', return the
produced ASCII as a string and leave not buffer behind.  For example,
a Lisp program could call this function in the following way:

  (setq ascii (org-export-region-as-ascii beg end t 'string))

When called interactively, the output buffer is selected, and shown
in a window.  A non-interactive call will only return the buffer.

\(fn BEG END &optional BODY-ONLY BUFFER)" t nil)

(autoload 'org-export-as-ascii "org-ascii" "\
Export the outline as a pretty ASCII file.
If there is an active region, export only the region.
The prefix ARG specifies how many levels of the outline should become
underlined headlines, default is 3.    Lower levels will become bulleted
lists.  When HIDDEN is non-nil, don't display the ASCII buffer.
EXT-PLIST is a property list with external parameters overriding
org-mode's default settings, but still inferior to file-local
settings.  When TO-BUFFER is non-nil, create a buffer with that
name and export to that buffer.  If TO-BUFFER is the symbol
`string', don't leave any buffer behind but just return the
resulting ASCII as a string.  When BODY-ONLY is set, don't produce
the file header and footer.  When PUB-DIR is set, use this as the
publishing directory.

\(fn ARG &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

;;;***

;;;### (autoloads (org-attach) "org-attach" "../org-mode-git/lisp/org-attach.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-attach.el

(autoload 'org-attach "org-attach" "\
The dispatcher for attachment commands.
Shows a list of commands and prompts for another key to execute a command.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-bbdb-anniversaries) "org-bbdb" "../org-mode-git/lisp/org-bbdb.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-bbdb.el

(autoload 'org-bbdb-anniversaries "org-bbdb" "\
Extract anniversaries from BBDB for display in the agenda.

\(fn)" nil nil)

;;;***

;;;### (autoloads (org-capture-import-remember-templates org-capture-insert-template-here
;;;;;;  org-capture) "org-capture" "../org-mode-git/lisp/org-capture.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-capture.el

(autoload 'org-capture "org-capture" "\
Capture something.
\\<org-capture-mode-map>
This will let you select a template from `org-capture-templates', and then
file the newly captured information.  The text is immediately inserted
at the target location, and an indirect buffer is shown where you can
edit it.  Pressing \\[org-capture-finalize] brings you back to the previous state
of Emacs, so that you can continue your work.

When called interactively with a \\[universal-argument] prefix argument GOTO, don't capture
anything, just go to the file/headline where the selected template
stores its notes.  With a double prefix argument \\[universal-argument] \\[universal-argument], go to the last note
stored.

When called with a `C-0' (zero) prefix, insert a template at point.

Lisp programs can set KEYS to a string associated with a template in
`org-capture-templates'.  In this case, interactive selection will be
bypassed.

\(fn &optional GOTO KEYS)" t nil)

(autoload 'org-capture-insert-template-here "org-capture" "\
Not documented

\(fn)" nil nil)

(autoload 'org-capture-import-remember-templates "org-capture" "\
Set org-capture-templates to be similar to `org-remember-templates'.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-clock-persistence-insinuate org-get-clocktable)
;;;;;;  "org-clock" "../org-mode-git/lisp/org-clock.el" (20026 45996))
;;; Generated autoloads from ../org-mode-git/lisp/org-clock.el

(autoload 'org-get-clocktable "org-clock" "\
Get a formatted clocktable with parameters according to PROPS.
The table is created in a temporary buffer, fully formatted and
fontified, and then returned.

\(fn &rest PROPS)" nil nil)

(autoload 'org-clock-persistence-insinuate "org-clock" "\
Set up hooks for clock persistence.

\(fn)" nil nil)

;;;***

;;;### (autoloads (org-contacts) "org-contacts" "../org-mode-git/contrib/lisp/org-contacts.el"
;;;;;;  (20033 32141))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-contacts.el

(autoload 'org-contacts "org-contacts" "\
Create agenda view for contacts matching NAME.

\(fn NAME)" t nil)

;;;***

;;;### (autoloads (org-datetree-find-date-create) "org-datetree"
;;;;;;  "../org-mode-git/lisp/org-datetree.el" (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-datetree.el

(autoload 'org-datetree-find-date-create "org-datetree" "\
Find or create an entry for DATE.
If KEEP-RESTRICTION is non-nil, do not widen the buffer.
When it is nil, the buffer will be widened to make sure an existing date
tree can be found.

\(fn DATE &optional KEEP-RESTRICTION)" nil nil)

;;;***

;;;### (autoloads (org-export-as-docbook org-export-as-docbook-pdf-and-open
;;;;;;  org-export-as-docbook-pdf org-export-region-as-docbook org-replace-region-by-docbook
;;;;;;  org-export-as-docbook-to-buffer org-export-as-docbook-batch)
;;;;;;  "org-docbook" "../org-mode-git/lisp/org-docbook.el" (20026
;;;;;;  45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-docbook.el

(autoload 'org-export-as-docbook-batch "org-docbook" "\
Call `org-export-as-docbook' in batch style.
This function can be used in batch processing.

For example:

$ emacs --batch
        --load=$HOME/lib/emacs/org.el
        --visit=MyOrgFile.org --funcall org-export-as-docbook-batch

\(fn)" nil nil)

(autoload 'org-export-as-docbook-to-buffer "org-docbook" "\
Call `org-export-as-docbook' with output to a temporary buffer.
No file is created.

\(fn)" t nil)

(autoload 'org-replace-region-by-docbook "org-docbook" "\
Replace the region from BEG to END with its DocBook export.
It assumes the region has `org-mode' syntax, and then convert it to
DocBook.  This can be used in any buffer.  For example, you could
write an itemized list in `org-mode' syntax in an DocBook buffer and
then use this command to convert it.

\(fn BEG END)" t nil)

(autoload 'org-export-region-as-docbook "org-docbook" "\
Convert region from BEG to END in `org-mode' buffer to DocBook.
If prefix arg BODY-ONLY is set, omit file header and footer and
only produce the region of converted text, useful for
cut-and-paste operations.  If BUFFER is a buffer or a string,
use/create that buffer as a target of the converted DocBook.  If
BUFFER is the symbol `string', return the produced DocBook as a
string and leave not buffer behind.  For example, a Lisp program
could call this function in the following way:

  (setq docbook (org-export-region-as-docbook beg end t 'string))

When called interactively, the output buffer is selected, and shown
in a window.  A non-interactive call will only return the buffer.

\(fn BEG END &optional BODY-ONLY BUFFER)" t nil)

(autoload 'org-export-as-docbook-pdf "org-docbook" "\
Export as DocBook XML file, and generate PDF file.

\(fn &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

(autoload 'org-export-as-docbook-pdf-and-open "org-docbook" "\
Export as DocBook XML file, generate PDF file, and open it.

\(fn)" t nil)

(autoload 'org-export-as-docbook "org-docbook" "\
Export the current buffer as a DocBook file.
If there is an active region, export only the region.  When
HIDDEN is obsolete and does nothing.  EXT-PLIST is a
property list with external parameters overriding org-mode's
default settings, but still inferior to file-local settings.
When TO-BUFFER is non-nil, create a buffer with that name and
export to that buffer.  If TO-BUFFER is the symbol `string',
don't leave any buffer behind but just return the resulting HTML
as a string.  When BODY-ONLY is set, don't produce the file
header and footer, simply return the content of the document (all
top-level sections).  When PUB-DIR is set, use this as the
publishing directory.

\(fn &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

;;;***

;;;### (autoloads (org-insert-export-options-template org-export-as-org
;;;;;;  org-export-visible org-export) "org-exp" "../org-mode-git/lisp/org-exp.el"
;;;;;;  (20026 45996))
;;; Generated autoloads from ../org-mode-git/lisp/org-exp.el

(autoload 'org-export "org-exp" "\
Export dispatcher for Org-mode.
When `org-export-run-in-background' is non-nil, try to run the command
in the background.  This will be done only for commands that write
to a file.  For details see the docstring of `org-export-run-in-background'.

The prefix argument ARG will be passed to the exporter.  However, if
ARG is a double universal prefix \\[universal-argument] \\[universal-argument], that means to inverse the
value of `org-export-run-in-background'.

If `org-export-initial-scope' is set to 'subtree, try to export
the current subtree, otherwise try to export the whole buffer.
Pressing `1' will switch between these two options.

\(fn &optional ARG)" t nil)

(autoload 'org-export-visible "org-exp" "\
Create a copy of the visible part of the current buffer, and export it.
The copy is created in a temporary buffer and removed after use.
TYPE is the final key (as a string) that also selects the export command in
the \\<org-mode-map>\\[org-export] export dispatcher.
As a special case, if the you type SPC at the prompt, the temporary
org-mode file will not be removed but presented to you so that you can
continue to use it.  The prefix arg ARG is passed through to the exporting
command.

\(fn TYPE ARG)" t nil)

(autoload 'org-export-as-org "org-exp" "\
Make a copy with not-exporting stuff removed.
The purpose of this function is to provide a way to export the source
Org file of a webpage in Org format, but with sensitive and/or irrelevant
stuff removed.  This command will remove the following:

- archived trees (if the variable `org-export-with-archived-trees' is nil)
- comment blocks and trees starting with the COMMENT keyword
- only trees that are consistent with `org-export-select-tags'
  and `org-export-exclude-tags'.

The only arguments that will be used are EXT-PLIST and PUB-DIR,
all the others will be ignored (but are present so that the general
mechanism to call publishing functions will work).

EXT-PLIST is a property list with external parameters overriding
org-mode's default settings, but still inferior to file-local
settings.  When PUB-DIR is set, use this as the publishing
directory.

\(fn ARG &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

(autoload 'org-insert-export-options-template "org-exp" "\
Insert into the buffer a template with information for exporting.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-export-generic org-set-generic-type) "org-export-generic"
;;;;;;  "../org-mode-git/contrib/lisp/org-export-generic.el" (20026
;;;;;;  45997))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-export-generic.el

(autoload 'org-set-generic-type "org-export-generic" "\
Adds a TYPE and DEFINITION to the existing list of defined generic
export definitions.

\(fn TYPE DEFINITION)" nil nil)

(autoload 'org-export-generic "org-export-generic" "\
Export the outline as generic output.
If there is an active region, export only the region.
The prefix ARG specifies how many levels of the outline should become
underlined headlines.  The default is 3.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads (org-feed-show-raw-feed org-feed-goto-inbox org-feed-update
;;;;;;  org-feed-update-all) "org-feed" "../org-mode-git/lisp/org-feed.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-feed.el

(autoload 'org-feed-update-all "org-feed" "\
Get inbox items from all feeds in `org-feed-alist'.

\(fn)" t nil)

(autoload 'org-feed-update "org-feed" "\
Get inbox items from FEED.
FEED can be a string with an association in `org-feed-alist', or
it can be a list structured like an entry in `org-feed-alist'.

\(fn FEED &optional RETRIEVE-ONLY)" t nil)

(autoload 'org-feed-goto-inbox "org-feed" "\
Go to the inbox that captures the feed named FEED.

\(fn FEED)" t nil)

(autoload 'org-feed-show-raw-feed "org-feed" "\
Show the raw feed buffer of a feed.

\(fn FEED)" t nil)

;;;***

;;;### (autoloads (org-footnote-normalize org-footnote-action) "org-footnote"
;;;;;;  "../org-mode-git/lisp/org-footnote.el" (20033 32141))
;;; Generated autoloads from ../org-mode-git/lisp/org-footnote.el

(autoload 'org-footnote-action "org-footnote" "\
Do the right thing for footnotes.

When at a footnote reference, jump to the definition.

When at a definition, jump to the references if they exist, offer
to create them otherwise.

When neither at definition or reference, create a new footnote,
interactively.

With prefix arg SPECIAL, offer additional commands in a menu.

\(fn &optional SPECIAL)" t nil)

(autoload 'org-footnote-normalize "org-footnote" "\
Collect the footnotes in various formats and normalize them.

This finds the different sorts of footnotes allowed in Org, and
normalizes them to the usual [N] format that is understood by the
Org-mode exporters.

When SORT-ONLY is set, only sort the footnote definitions into the
referenced sequence.

If Org is amidst an export process, EXPORT-PROPS will hold the
export properties of the buffer.

When EXPORT-PROPS is non-nil, the default action is to insert
normalized footnotes towards the end of the pre-processing buffer.
Some exporters like docbook, odt, etc. expect that footnote
definitions be available before any references to them.  Such
exporters can let bind `org-footnote-insert-pos-for-preprocessor' to
symbol 'point-min to achieve the desired behaviour.

Additional note on `org-footnote-insert-pos-for-preprocessor':
1. This variable has not effect when FOR-PREPROCESSOR is nil.
2. This variable (potentially) obviates the need for extra scan
   of pre-processor buffer as witnessed in
   `org-export-docbook-get-footnotes'.

\(fn &optional SORT-ONLY EXPORT-PROPS)" nil nil)

;;;***

;;;### (autoloads (org-freemind-to-org-mode org-freemind-from-org-sparse-tree
;;;;;;  org-freemind-from-org-mode org-freemind-from-org-mode-node
;;;;;;  org-freemind-show org-export-as-freemind) "org-freemind"
;;;;;;  "../org-mode-git/lisp/org-freemind.el" (20026 45997))
;;; Generated autoloads from ../org-mode-git/lisp/org-freemind.el

(autoload 'org-export-as-freemind "org-freemind" "\
Export the current buffer as a Freemind file.
If there is an active region, export only the region.  HIDDEN is
obsolete and does nothing.  EXT-PLIST is a property list with
external parameters overriding org-mode's default settings, but
still inferior to file-local settings.  When TO-BUFFER is
non-nil, create a buffer with that name and export to that
buffer.  If TO-BUFFER is the symbol `string', don't leave any
buffer behind but just return the resulting HTML as a string.
When BODY-ONLY is set, don't produce the file header and footer,
simply return the content of the document (all top level
sections).  When PUB-DIR is set, use this as the publishing
directory.

See `org-freemind-from-org-mode' for more information.

\(fn &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

(autoload 'org-freemind-show "org-freemind" "\
Show file MM-FILE in Freemind.

\(fn MM-FILE)" t nil)

(autoload 'org-freemind-from-org-mode-node "org-freemind" "\
Convert node at line NODE-LINE to the FreeMind file MM-FILE.
See `org-freemind-from-org-mode' for more information.

\(fn NODE-LINE MM-FILE)" t nil)

(autoload 'org-freemind-from-org-mode "org-freemind" "\
Convert the `org-mode' file ORG-FILE to the FreeMind file MM-FILE.
All the nodes will be opened or closed in Freemind just as you
have them in `org-mode'.

Note that exporting to Freemind also gives you an alternative way
to export from `org-mode' to html.  You can create a dynamic html
version of the your org file, by first exporting to Freemind and
then exporting from Freemind to html.  The 'As
XHTML (JavaScript)' version in Freemind works very well (and you
can use a CSS stylesheet to style it).

\(fn ORG-FILE MM-FILE)" t nil)

(autoload 'org-freemind-from-org-sparse-tree "org-freemind" "\
Convert visible part of buffer ORG-BUFFER to FreeMind file MM-FILE.

\(fn ORG-BUFFER MM-FILE)" t nil)

(autoload 'org-freemind-to-org-mode "org-freemind" "\
Convert FreeMind file MM-FILE to `org-mode' file ORG-FILE.

\(fn MM-FILE ORG-FILE)" t nil)

;;;***

;;;### (autoloads (org-export-htmlize-generate-css org-export-as-html
;;;;;;  org-export-region-as-html org-replace-region-by-html org-export-as-html-to-buffer
;;;;;;  org-export-as-html-batch org-export-as-html-and-open) "org-html"
;;;;;;  "../org-mode-git/lisp/org-html.el" (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-html.el

(put 'org-export-html-style-include-default 'safe-local-variable 'booleanp)

(put 'org-export-html-style 'safe-local-variable 'stringp)

(put 'org-export-html-style-extra 'safe-local-variable 'stringp)

(autoload 'org-export-as-html-and-open "org-html" "\
Export the outline as HTML and immediately open it with a browser.
If there is an active region, export only the region.
The prefix ARG specifies how many levels of the outline should become
headlines.  The default is 3.  Lower levels will become bulleted lists.

\(fn ARG)" t nil)

(autoload 'org-export-as-html-batch "org-html" "\
Call the function `org-export-as-html'.
This function can be used in batch processing as:
emacs   --batch
        --load=$HOME/lib/emacs/org.el
        --eval \"(setq org-export-headline-levels 2)\"
        --visit=MyFile --funcall org-export-as-html-batch

\(fn)" nil nil)

(autoload 'org-export-as-html-to-buffer "org-html" "\
Call `org-export-as-html` with output to a temporary buffer.
No file is created.  The prefix ARG is passed through to `org-export-as-html'.

\(fn ARG)" t nil)

(autoload 'org-replace-region-by-html "org-html" "\
Assume the current region has org-mode syntax, and convert it to HTML.
This can be used in any buffer.  For example, you could write an
itemized list in org-mode syntax in an HTML buffer and then use this
command to convert it.

\(fn BEG END)" t nil)

(autoload 'org-export-region-as-html "org-html" "\
Convert region from BEG to END in org-mode buffer to HTML.
If prefix arg BODY-ONLY is set, omit file header, footer, and table of
contents, and only produce the region of converted text, useful for
cut-and-paste operations.
If BUFFER is a buffer or a string, use/create that buffer as a target
of the converted HTML.  If BUFFER is the symbol `string', return the
produced HTML as a string and leave not buffer behind.  For example,
a Lisp program could call this function in the following way:

  (setq html (org-export-region-as-html beg end t 'string))

When called interactively, the output buffer is selected, and shown
in a window.  A non-interactive call will only return the buffer.

\(fn BEG END &optional BODY-ONLY BUFFER)" t nil)

(autoload 'org-export-as-html "org-html" "\
Export the outline as a pretty HTML file.
If there is an active region, export only the region.  The prefix
ARG specifies how many levels of the outline should become
headlines.  The default is 3.  Lower levels will become bulleted
lists.  HIDDEN is obsolete and does nothing.
EXT-PLIST is a property list with external parameters overriding
org-mode's default settings, but still inferior to file-local
settings.  When TO-BUFFER is non-nil, create a buffer with that
name and export to that buffer.  If TO-BUFFER is the symbol
`string', don't leave any buffer behind but just return the
resulting HTML as a string.  When BODY-ONLY is set, don't produce
the file header and footer, simply return the content of
<body>...</body>, without even the body tags themselves.  When
PUB-DIR is set, use this as the publishing directory.

\(fn ARG &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

(autoload 'org-export-htmlize-generate-css "org-html" "\
Create the CSS for all font definitions in the current Emacs session.
Use this to create face definitions in your CSS style file that can then
be used by code snippets transformed by htmlize.
This command just produces a buffer that contains class definitions for all
faces used in the current Emacs session.  You can copy and paste the ones you
need into your CSS file.

If you then set `org-export-htmlize-output-type' to `css', calls to
the function `org-export-htmlize-region-for-paste' will produce code
that uses these same face definitions.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-export-icalendar-combine-agenda-files org-export-icalendar-all-agenda-files
;;;;;;  org-export-icalendar-this-file) "org-icalendar" "../org-mode-git/lisp/org-icalendar.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-icalendar.el

(autoload 'org-export-icalendar-this-file "org-icalendar" "\
Export current file as an iCalendar file.
The iCalendar file will be located in the same directory as the Org-mode
file, but with extension `.ics'.

\(fn)" t nil)

(autoload 'org-export-icalendar-all-agenda-files "org-icalendar" "\
Export all files in the variable `org-agenda-files' to iCalendar .ics files.
Each iCalendar file will be located in the same directory as the Org-mode
file, but with extension `.ics'.

\(fn)" t nil)

(autoload 'org-export-icalendar-combine-agenda-files "org-icalendar" "\
Export all files in `org-agenda-files' to a single combined iCalendar file.
The file is stored under the name `org-combined-agenda-icalendar-file'.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-id-store-link org-id-find-id-file org-id-find
;;;;;;  org-id-goto org-id-get-with-outline-drilling org-id-get-with-outline-path-completion
;;;;;;  org-id-get org-id-copy org-id-get-create) "org-id" "../org-mode-git/lisp/org-id.el"
;;;;;;  (20026 45996))
;;; Generated autoloads from ../org-mode-git/lisp/org-id.el

(autoload 'org-id-get-create "org-id" "\
Create an ID for the current entry and return it.
If the entry already has an ID, just return it.
With optional argument FORCE, force the creation of a new ID.

\(fn &optional FORCE)" t nil)

(autoload 'org-id-copy "org-id" "\
Copy the ID of the entry at point to the kill ring.
Create an ID if necessary.

\(fn)" t nil)

(autoload 'org-id-get "org-id" "\
Get the ID property of the entry at point-or-marker POM.
If POM is nil, refer to the entry at point.
If the entry does not have an ID, the function returns nil.
However, when CREATE is non nil, create an ID if none is present already.
PREFIX will be passed through to `org-id-new'.
In any case, the ID of the entry is returned.

\(fn &optional POM CREATE PREFIX)" nil nil)

(autoload 'org-id-get-with-outline-path-completion "org-id" "\
Use outline-path-completion to retrieve the ID of an entry.
TARGETS may be a setting for `org-refile-targets' to define the eligible
headlines.  When omitted, all headlines in all agenda files are
eligible.
It returns the ID of the entry.  If necessary, the ID is created.

\(fn &optional TARGETS)" nil nil)

(autoload 'org-id-get-with-outline-drilling "org-id" "\
Use an outline-cycling interface to retrieve the ID of an entry.
This only finds entries in the current buffer, using `org-get-location'.
It returns the ID of the entry.  If necessary, the ID is created.

\(fn &optional TARGETS)" nil nil)

(autoload 'org-id-goto "org-id" "\
Switch to the buffer containing the entry with id ID.
Move the cursor to that entry in that buffer.

\(fn ID)" t nil)

(autoload 'org-id-find "org-id" "\
Return the location of the entry with the id ID.
The return value is a cons cell (file-name . position), or nil
if there is no entry with that ID.
With optional argument MARKERP, return the position as a new marker.

\(fn ID &optional MARKERP)" nil nil)

(autoload 'org-id-find-id-file "org-id" "\
Query the id database for the file in which this ID is located.

\(fn ID)" nil nil)

(autoload 'org-id-store-link "org-id" "\
Store a link to the current entry, using its ID.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-indent-mode) "org-indent" "../org-mode-git/lisp/org-indent.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-indent.el

(autoload 'org-indent-mode "org-indent" "\
When active, indent text according to outline structure.

Internally this works by adding `line-prefix' properties to all non-headlines.
These properties are updated locally in idle time.
FIXME:  How to update when broken?

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (org-irc-store-link) "org-irc" "../org-mode-git/lisp/org-irc.el"
;;;;;;  (20026 45996))
;;; Generated autoloads from ../org-mode-git/lisp/org-irc.el

(autoload 'org-irc-store-link "org-irc" "\
Dispatch to the appropriate function to store a link to an IRC session.

\(fn)" nil nil)

;;;***

;;;### (autoloads (org-export-as-pdf-and-open org-export-as-pdf org-export-as-latex
;;;;;;  org-export-region-as-latex org-replace-region-by-latex org-export-as-latex-to-buffer
;;;;;;  org-export-as-latex-batch) "org-latex" "../org-mode-git/lisp/org-latex.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-latex.el

(autoload 'org-export-as-latex-batch "org-latex" "\
Call `org-export-as-latex', may be used in batch processing.
For example:

emacs   --batch
        --load=$HOME/lib/emacs/org.el
        --eval \"(setq org-export-headline-levels 2)\"
        --visit=MyFile --funcall org-export-as-latex-batch

\(fn)" nil nil)

(autoload 'org-export-as-latex-to-buffer "org-latex" "\
Call `org-export-as-latex` with output to a temporary buffer.
No file is created.  The prefix ARG is passed through to `org-export-as-latex'.

\(fn ARG)" t nil)

(autoload 'org-replace-region-by-latex "org-latex" "\
Replace the region from BEG to END with its LaTeX export.
It assumes the region has `org-mode' syntax, and then convert it to
LaTeX.  This can be used in any buffer.  For example, you could
write an itemized list in `org-mode' syntax in an LaTeX buffer and
then use this command to convert it.

\(fn BEG END)" t nil)

(autoload 'org-export-region-as-latex "org-latex" "\
Convert region from BEG to END in `org-mode' buffer to LaTeX.
If prefix arg BODY-ONLY is set, omit file header, footer, and table of
contents, and only produce the region of converted text, useful for
cut-and-paste operations.
If BUFFER is a buffer or a string, use/create that buffer as a target
of the converted LaTeX.  If BUFFER is the symbol `string', return the
produced LaTeX as a string and leave no buffer behind.  For example,
a Lisp program could call this function in the following way:

  (setq latex (org-export-region-as-latex beg end t 'string))

When called interactively, the output buffer is selected, and shown
in a window.  A non-interactive call will only return the buffer.

\(fn BEG END &optional BODY-ONLY BUFFER)" t nil)

(autoload 'org-export-as-latex "org-latex" "\
Export current buffer to a LaTeX file.
If there is an active region, export only the region.  The prefix
ARG specifies how many levels of the outline should become
headlines.  The default is 3.  Lower levels will be exported
depending on `org-export-latex-low-levels'.  The default is to
convert them as description lists.
HIDDEN is obsolete and does nothing.
EXT-PLIST is a property list with
external parameters overriding org-mode's default settings, but
still inferior to file-local settings.  When TO-BUFFER is
non-nil, create a buffer with that name and export to that
buffer.  If TO-BUFFER is the symbol `string', don't leave any
buffer behind but just return the resulting LaTeX as a string.
When BODY-ONLY is set, don't produce the file header and footer,
simply return the content of \\begin{document}...\\end{document},
without even the \\begin{document} and \\end{document} commands.
when PUB-DIR is set, use this as the publishing directory.

\(fn ARG &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

(autoload 'org-export-as-pdf "org-latex" "\
Export as LaTeX, then process through to PDF.

\(fn ARG &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

(autoload 'org-export-as-pdf-and-open "org-latex" "\
Export as LaTeX, then process through to PDF, and open.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads (org-lparse-region org-replace-region-by org-lparse-to-buffer
;;;;;;  org-lparse-batch org-lparse-and-open) "org-lparse" "../org-mode-git/contrib/lisp/org-lparse.el"
;;;;;;  (20033 32141))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-lparse.el

(autoload 'org-lparse-and-open "org-lparse" "\
Export outline to TARGET-BACKEND via NATIVE-BACKEND and open exported file.
If there is an active region, export only the region.  The prefix
ARG specifies how many levels of the outline should become
headlines.  The default is 3.  Lower levels will become bulleted
lists.

\(fn TARGET-BACKEND NATIVE-BACKEND ARG)" t nil)

(autoload 'org-lparse-batch "org-lparse" "\
Call the function `org-lparse'.
This function can be used in batch processing as:
emacs   --batch
        --load=$HOME/lib/emacs/org.el
        --eval \"(setq org-export-headline-levels 2)\"
        --visit=MyFile --funcall org-lparse-batch

\(fn TARGET-BACKEND &optional NATIVE-BACKEND)" nil nil)

(autoload 'org-lparse-to-buffer "org-lparse" "\
Call `org-lparse' with output to a temporary buffer.
No file is created.  The prefix ARG is passed through to
`org-lparse'.

\(fn BACKEND ARG)" t nil)

(autoload 'org-replace-region-by "org-lparse" "\
Assume the current region has org-mode syntax, and convert it to HTML.
This can be used in any buffer.  For example, you could write an
itemized list in org-mode syntax in an HTML buffer and then use this
command to convert it.

\(fn BACKEND BEG END)" t nil)

(autoload 'org-lparse-region "org-lparse" "\
Convert region from BEG to END in org-mode buffer to HTML.
If prefix arg BODY-ONLY is set, omit file header, footer, and table of
contents, and only produce the region of converted text, useful for
cut-and-paste operations.
If BUFFER is a buffer or a string, use/create that buffer as a target
of the converted HTML.  If BUFFER is the symbol `string', return the
produced HTML as a string and leave not buffer behind.  For example,
a Lisp program could call this function in the following way:

  (setq html (org-lparse-region \"html\" beg end t 'string))

When called interactively, the output buffer is selected, and shown
in a window.  A non-interactive call will only return the buffer.

\(fn BACKEND BEG END &optional BODY-ONLY BUFFER)" t nil)

;;;***

;;;### (autoloads (org-mobile-create-sumo-agenda org-mobile-pull
;;;;;;  org-mobile-push) "org-mobile" "../org-mode-git/lisp/org-mobile.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-mobile.el

(autoload 'org-mobile-push "org-mobile" "\
Push the current state of Org affairs to the WebDAV directory.
This will create the index file, copy all agenda files there, and also
create all custom agenda views, for upload to the mobile phone.

\(fn)" t nil)

(autoload 'org-mobile-pull "org-mobile" "\
Pull the contents of `org-mobile-capture-file' and integrate them.
Apply all flagged actions, flag entries to be flagged and then call an
agenda view showing the flagged items.

\(fn)" t nil)

(autoload 'org-mobile-create-sumo-agenda "org-mobile" "\
Create a file that contains all custom agenda views.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-export-as-odt org-export-region-as-odt org-replace-region-by-odt
;;;;;;  org-export-as-odt-to-buffer org-export-as-odt-batch org-export-as-odt-and-open)
;;;;;;  "org-odt" "../org-mode-git/contrib/lisp/org-odt.el" (20033
;;;;;;  32141))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-odt.el

(autoload 'org-export-as-odt-and-open "org-odt" "\
Export the outline as ODT and immediately open it with a browser.
If there is an active region, export only the region.
The prefix ARG specifies how many levels of the outline should become
headlines.  The default is 3.  Lower levels will become bulleted lists.

\(fn ARG)" t nil)

(autoload 'org-export-as-odt-batch "org-odt" "\
Call the function `org-lparse-batch'.
This function can be used in batch processing as:
emacs   --batch
        --load=$HOME/lib/emacs/org.el
        --eval \"(setq org-export-headline-levels 2)\"
        --visit=MyFile --funcall org-export-as-odt-batch

\(fn)" nil nil)

(autoload 'org-export-as-odt-to-buffer "org-odt" "\
Call `org-lparse-odt` with output to a temporary buffer.
No file is created.  The prefix ARG is passed through to `org-lparse-to-buffer'.

\(fn ARG)" t nil)

(autoload 'org-replace-region-by-odt "org-odt" "\
Assume the current region has org-mode syntax, and convert it to ODT.
This can be used in any buffer.  For example, you could write an
itemized list in org-mode syntax in an ODT buffer and then use this
command to convert it.

\(fn BEG END)" t nil)

(autoload 'org-export-region-as-odt "org-odt" "\
Convert region from BEG to END in org-mode buffer to ODT.
If prefix arg BODY-ONLY is set, omit file header, footer, and table of
contents, and only produce the region of converted text, useful for
cut-and-paste operations.
If BUFFER is a buffer or a string, use/create that buffer as a target
of the converted ODT.  If BUFFER is the symbol `string', return the
produced ODT as a string and leave not buffer behind.  For example,
a Lisp program could call this function in the following way:

  (setq odt (org-export-region-as-odt beg end t 'string))

When called interactively, the output buffer is selected, and shown
in a window.  A non-interactive call will only return the buffer.

\(fn BEG END &optional BODY-ONLY BUFFER)" t nil)

(autoload 'org-export-as-odt "org-odt" "\
Export the outline as a OpenDocumentText file.
If there is an active region, export only the region.  The prefix
ARG specifies how many levels of the outline should become
headlines.  The default is 3.  Lower levels will become bulleted
lists.  HIDDEN is obsolete and does nothing.
EXT-PLIST is a property list with external parameters overriding
org-mode's default settings, but still inferior to file-local
settings.  When TO-BUFFER is non-nil, create a buffer with that
name and export to that buffer.  If TO-BUFFER is the symbol
`string', don't leave any buffer behind but just return the
resulting XML as a string.  When BODY-ONLY is set, don't produce
the file header and footer, simply return the content of
<body>...</body>, without even the body tags themselves.  When
PUB-DIR is set, use this as the publishing directory.

\(fn ARG &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

;;;***

;;;### (autoloads (org-plot/gnuplot) "org-plot" "../org-mode-git/lisp/org-plot.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-plot.el

(autoload 'org-plot/gnuplot "org-plot" "\
Plot table using gnuplot.  Gnuplot options can be specified with PARAMS.
If not given options will be taken from the +PLOT
line directly before or after the table.

\(fn &optional PARAMS)" t nil)

;;;***

;;;### (autoloads (org-publish-current-project org-publish-current-file
;;;;;;  org-publish-all org-publish) "org-publish" "../org-mode-git/lisp/org-publish.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-publish.el

(defalias 'org-publish-project 'org-publish)

(autoload 'org-publish "org-publish" "\
Publish PROJECT.

\(fn PROJECT &optional FORCE)" t nil)

(autoload 'org-publish-all "org-publish" "\
Publish all projects.
With prefix argument, remove all files in the timestamp
directory and force publishing all files.

\(fn &optional FORCE)" t nil)

(autoload 'org-publish-current-file "org-publish" "\
Publish the current file.
With prefix argument, force publish the file.

\(fn &optional FORCE)" t nil)

(autoload 'org-publish-current-project "org-publish" "\
Publish the project associated with the current file.
With a prefix argument, force publishing of all files in
the project.

\(fn &optional FORCE)" t nil)

;;;***

;;;### (autoloads (org-registry-update org-registry-insinuate org-registry-initialize
;;;;;;  org-registry-visit org-registry-show) "org-registry" "../org-mode-git/contrib/lisp/org-registry.el"
;;;;;;  (20026 45997))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-registry.el

(autoload 'org-registry-show "org-registry" "\
Show Org files where there are links pointing to the current
buffer.

\(fn &optional VISIT)" t nil)

(autoload 'org-registry-visit "org-registry" "\
If an Org file contains a link to the current location, visit
this file.

\(fn)" t nil)

(autoload 'org-registry-initialize "org-registry" "\
Initialize `org-registry-alist'.
If FROM-SCRATCH is non-nil or the registry does not exist yet,
create a new registry from scratch and eval it. If the registry
exists, eval `org-registry-file' and make it the new value for
`org-registry-alist'.

\(fn &optional FROM-SCRATCH)" t nil)

(autoload 'org-registry-insinuate "org-registry" "\
Call `org-registry-update' after saving in Org-mode.
Use with caution.  This could slow down things a bit.

\(fn)" t nil)

(autoload 'org-registry-update "org-registry" "\
Update the registry for the current Org file.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-remember-handler org-remember org-remember-apply-template
;;;;;;  org-remember-annotation org-remember-insinuate) "org-remember"
;;;;;;  "../org-mode-git/lisp/org-remember.el" (20026 45997))
;;; Generated autoloads from ../org-mode-git/lisp/org-remember.el

(autoload 'org-remember-insinuate "org-remember" "\
Setup remember.el for use with Org-mode.

\(fn)" nil nil)

(autoload 'org-remember-annotation "org-remember" "\
Return a link to the current location as an annotation for remember.el.
If you are using Org-mode files as target for data storage with
remember.el, then the annotations should include a link compatible with the
conventions in Org-mode.  This function returns such a link.

\(fn)" nil nil)

(autoload 'org-remember-apply-template "org-remember" "\
Initialize *remember* buffer with template, invoke `org-mode'.
This function should be placed into `remember-mode-hook' and in fact requires
to be run from that hook to function properly.

\(fn &optional USE-CHAR SKIP-INTERACTIVE)" nil nil)

(autoload 'org-remember "org-remember" "\
Call `remember'.  If this is already a remember buffer, re-apply template.
If there is an active region, make sure remember uses it as initial content
of the remember buffer.

When called interactively with a \\[universal-argument] prefix argument GOTO, don't remember
anything, just go to the file/headline where the selected template usually
stores its notes.  With a double prefix argument \\[universal-argument] \\[universal-argument], go to the last
note stored by remember.

Lisp programs can set ORG-FORCE-REMEMBER-TEMPLATE-CHAR to a character
associated with a template in `org-remember-templates'.

\(fn &optional GOTO ORG-FORCE-REMEMBER-TEMPLATE-CHAR)" t nil)

(autoload 'org-remember-handler "org-remember" "\
Store stuff from remember.el into an org file.
When the template has specified a file and a headline, the entry is filed
there, or in the location defined by `org-default-notes-file' and
`org-remember-default-headline'.
\\<org-remember-mode-map>
If no defaults have been defined, or if the current prefix argument
is 1 (using C-1 \\[org-remember-finalize] to exit remember), an interactive
process is used to select the target location.

When the prefix is 0 (i.e. when remember is exited with C-0 \\[org-remember-finalize]),
the entry is filed to the same location as the previous note.

When the prefix is 2 (i.e. when remember is exited with C-2 \\[org-remember-finalize]),
the entry is filed as a subentry of the entry where the clock is
currently running.

When \\[universal-argument] has been used as prefix argument, the
note is stored and Emacs moves point to the new location of the
note, so that editing can be continued there (similar to
inserting \"%&\" into the template).

Before storing the note, the function ensures that the text has an
org-mode-style headline, i.e. a first line that starts with
a \"*\".  If not, a headline is constructed from the current date and
some additional data.

If the variable `org-adapt-indentation' is non-nil, the entire text is
also indented so that it starts in the same column as the headline
\(i.e. after the stars).

See also the variable `org-reverse-note-order'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (org-table-to-lisp orgtbl-mode turn-on-orgtbl)
;;;;;;  "org-table" "../org-mode-git/lisp/org-table.el" (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-table.el

(autoload 'turn-on-orgtbl "org-table" "\
Unconditionally turn on `orgtbl-mode'.

\(fn)" nil nil)

(autoload 'orgtbl-mode "org-table" "\
The `org-mode' table editor as a minor mode for use in other modes.

\(fn &optional ARG)" t nil)

(autoload 'org-table-to-lisp "org-table" "\
Convert the table at point to a Lisp structure.
The structure will be a list.  Each item is either the symbol `hline'
for a horizontal separator line, or a list of field values as strings.
The table is taken from the parameter TXT, or from the buffer at point.

\(fn &optional TXT)" nil nil)

;;;***

;;;### (autoloads (org-export-as-taskjuggler-and-open org-export-as-taskjuggler)
;;;;;;  "org-taskjuggler" "../org-mode-git/lisp/org-taskjuggler.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-taskjuggler.el

(autoload 'org-export-as-taskjuggler "org-taskjuggler" "\
Export parts of the current buffer as a TaskJuggler file.
The exporter looks for a tree with tag, property or todo that
matches `org-export-taskjuggler-project-tag' and takes this as
the tasks for this project. The first node of this tree defines
the project properties such as project name and project period.
If there is a tree with tag, property or todo that matches
`org-export-taskjuggler-resource-tag' this three is taken as
resources for the project. If no resources are specified, a
default resource is created and allocated to the project. Also
the taskjuggler project will be created with default reports as
defined in `org-export-taskjuggler-default-reports'.

\(fn)" t nil)

(autoload 'org-export-as-taskjuggler-and-open "org-taskjuggler" "\
Export the current buffer as a TaskJuggler file and open it
with the TaskJuggler GUI.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-timer-set-timer org-timer-item org-timer-change-times-in-region
;;;;;;  org-timer org-timer-start) "org-timer" "../org-mode-git/lisp/org-timer.el"
;;;;;;  (20026 45996))
;;; Generated autoloads from ../org-mode-git/lisp/org-timer.el

(autoload 'org-timer-start "org-timer" "\
Set the starting time for the relative timer to now.
When called with prefix argument OFFSET, prompt the user for an offset time,
with the default taken from a timer stamp at point, if any.
If OFFSET is a string or an integer, it is directly taken to be the offset
without user interaction.
When called with a double prefix arg, all timer strings in the active
region will be shifted by a specific amount.  You will be prompted for
the amount, with the default to make the first timer string in
the region 0:00:00.

\(fn &optional OFFSET)" t nil)

(autoload 'org-timer "org-timer" "\
Insert a H:MM:SS string from the timer into the buffer.
The first time this command is used, the timer is started.  When used with
a \\[universal-argument] prefix, force restarting the timer.
When used with a double prefix argument \\[universal-argument], change all the timer string
in the region by a fixed amount.  This can be used to recalibrate a timer
that was not started at the correct moment.

If NO-INSERT-P is non-nil, return the string instead of inserting
it in the buffer.

\(fn &optional RESTART NO-INSERT-P)" t nil)

(autoload 'org-timer-change-times-in-region "org-timer" "\
Change all h:mm:ss time in region by a DELTA.

\(fn BEG END DELTA)" t nil)

(autoload 'org-timer-item "org-timer" "\
Insert a description-type item with the current timer value.

\(fn &optional ARG)" t nil)

(autoload 'org-timer-set-timer "org-timer" "\
Prompt for a duration and set a timer.

If `org-timer-default-timer' is not zero, suggest this value as
the default duration for the timer.  If a timer is already set,
prompt the user if she wants to replace it.

Called with a numeric prefix argument, use this numeric value as
the duration of the timer.

Called with a `C-u' prefix arguments, use `org-timer-default-timer'
without prompting the user for a duration.

With two `C-u' prefix arguments, use `org-timer-default-timer'
without prompting the user for a duration and automatically
replace any running timer.

\(fn &optional OPT)" t nil)

;;;***

;;;### (autoloads (org-toc-show) "org-toc" "../org-mode-git/contrib/lisp/org-toc.el"
;;;;;;  (20026 45997))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-toc.el

(autoload 'org-toc-show "org-toc" "\
Show the table of contents of the current Org-mode buffer.

\(fn &optional DEPTH POSITION)" t nil)

;;;***

;;;### (autoloads (org-track-compile-org org-track-fetch-package)
;;;;;;  "org-track" "../org-mode-git/contrib/lisp/org-track.el" (20026
;;;;;;  45997))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-track.el

(autoload 'org-track-fetch-package "org-track" "\
Fetch Org package depending on `org-track-fetch-package-extension'.
If DIRECTORY is defined, unpack the package there, i.e. add the
subdirectory org-mode/ to DIRECTORY.

\(fn &optional DIRECTORY)" t nil)

(autoload 'org-track-compile-org "org-track" "\
Compile all *.el files that come with org-mode.
Generate the autoloads file `org-install.el'.

DIRECTORY is where the directory org-mode/ lives (i.e. the
          parent directory of your local repo.

\(fn &optional DIRECTORY)" t nil)

;;;***

;;;### (autoloads (org-export-as-xhtml org-export-region-as-xhtml
;;;;;;  org-replace-region-by-xhtml org-export-as-xhtml-to-buffer
;;;;;;  org-export-as-xhtml-batch org-export-as-xhtml-and-open org-export-xhtmlize-generate-css)
;;;;;;  "org-xhtml" "../org-mode-git/contrib/lisp/org-xhtml.el" (20033
;;;;;;  32141))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-xhtml.el

(put 'org-export-xhtml-style-include-default 'safe-local-variable 'booleanp)

(put 'org-export-xhtml-style 'safe-local-variable 'stringp)

(put 'org-export-xhtml-style-extra 'safe-local-variable 'stringp)

(autoload 'org-export-xhtmlize-generate-css "org-xhtml" "\
Create the CSS for all font definitions in the current Emacs session.
Use this to create face definitions in your CSS style file that can then
be used by code snippets transformed by htmlize.
This command just produces a buffer that contains class definitions for all
faces used in the current Emacs session.  You can copy and paste the ones you
need into your CSS file.

If you then set `org-export-xhtmlize-output-type' to `css', calls to
the function `org-export-xhtmlize-region-for-paste' will produce code
that uses these same face definitions.

\(fn)" t nil)

(autoload 'org-export-as-xhtml-and-open "org-xhtml" "\
Export the outline as HTML and immediately open it with a browser.
If there is an active region, export only the region.
The prefix ARG specifies how many levels of the outline should become
headlines.  The default is 3.  Lower levels will become bulleted lists.

\(fn ARG)" t nil)

(autoload 'org-export-as-xhtml-batch "org-xhtml" "\
Call the function `org-lparse-batch'.
This function can be used in batch processing as:
emacs   --batch
        --load=$HOME/lib/emacs/org.el
        --eval \"(setq org-export-headline-levels 2)\"
        --visit=MyFile --funcall org-export-as-html-batch

\(fn)" nil nil)

(autoload 'org-export-as-xhtml-to-buffer "org-xhtml" "\
Call `org-lparse-to-buffer` with output to a temporary buffer.
No file is created.  The prefix ARG is passed through to `org-lparse-to-buffer'.

\(fn ARG)" t nil)

(autoload 'org-replace-region-by-xhtml "org-xhtml" "\
Assume the current region has org-mode syntax, and convert it to HTML.
This can be used in any buffer.  For example, you could write an
itemized list in org-mode syntax in an HTML buffer and then use this
command to convert it.

\(fn BEG END)" t nil)

(autoload 'org-export-region-as-xhtml "org-xhtml" "\
Convert region from BEG to END in `org-mode' buffer to HTML.
If prefix arg BODY-ONLY is set, omit file header, footer, and table of
contents, and only produce the region of converted text, useful for
cut-and-paste operations.
If BUFFER is a buffer or a string, use/create that buffer as a target
of the converted HTML.  If BUFFER is the symbol `string', return the
produced HTML as a string and leave not buffer behind.  For example,
a Lisp program could call this function in the following way:

  (setq html (org-export-region-as-html beg end t 'string))

When called interactively, the output buffer is selected, and shown
in a window.  A non-interactive call will only return the buffer.

\(fn BEG END &optional BODY-ONLY BUFFER)" t nil)

(autoload 'org-export-as-xhtml "org-xhtml" "\
Export the outline as a pretty HTML file.
Use `org-lparse' internally to perform the actual export. This
routine merely binds the TARGET-BACKEND and NATIVE-BACKEND args
of `org-lparse' to \"html\".

\(fn ARG &optional HIDDEN EXT-PLIST TO-BUFFER BODY-ONLY PUB-DIR)" t nil)

;;;***

;;;### (autoloads (org-export-as-xoxo) "org-xoxo" "../org-mode-git/lisp/org-xoxo.el"
;;;;;;  (20026 45995))
;;; Generated autoloads from ../org-mode-git/lisp/org-xoxo.el

(autoload 'org-export-as-xoxo "org-xoxo" "\
Export the org buffer as XOXO.
The XOXO buffer is named *xoxo-<source buffer name>*

\(fn &optional BUFFER)" t nil)

;;;***

;;;### (autoloads (org2rem-combine-agenda-files org2rem-all-agenda-files
;;;;;;  org2rem-this-file) "org2rem" "../org-mode-git/contrib/lisp/org2rem.el"
;;;;;;  (20026 45997))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org2rem.el

(autoload 'org2rem-this-file "org2rem" "\
Export current file as an Remind file.
The Remind file will be located in the same directory as the Org-mode
file, but with extension `.rem'.

\(fn)" t nil)

(autoload 'org2rem-all-agenda-files "org2rem" "\
Export all files in `org-agenda-files' to Remind .rem files.
Each Remind file will be located in the same directory as the Org-mode
file, but with extension `.rem'.

\(fn)" t nil)

(autoload 'org2rem-combine-agenda-files "org2rem" "\
Export all files in `org-agenda-files' to a single combined Remind file.
The file is stored under the name `org-combined-agenda-remind-file'.

\(fn)" t nil)

;;;***

;;;### (autoloads (svn-status svn-checkout) "psvn" "../psvn.el" (20033
;;;;;;  29573))
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

;;;### (autoloads (rm-mouse-drag-region rm-kill-ring-save rm-kill-region
;;;;;;  rm-exchange-point-and-mark rm-set-mark rm-example-picture-mode-bindings)
;;;;;;  "rect-mark" "../rect-mark.el" (20033 28106))
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

;;;### (autoloads (sqlparser-mysql-complete sqlparser-mysql-setup-interactive)
;;;;;;  "sqlparser-mysql-complete" "../sqlparse/sqlparser-mysql-complete.el"
;;;;;;  (20071 38624))
;;; Generated autoloads from ../sqlparse/sqlparser-mysql-complete.el

(autoload 'sqlparser-mysql-setup-interactive "sqlparser-mysql-complete" "\
populate some usful variables ,like user ,passwd,db.

\(fn)" t nil)

(autoload 'sqlparser-mysql-complete "sqlparser-mysql-complete" "\
complete tablename or column name depending on current point
position .

\(fn)" t nil)

;;;***

;;;### (autoloads (sqlparser-oracle-complete oracle-complete-minor-mode)
;;;;;;  "sqlparser-oracle-complete" "../sqlparse/sqlparser-oracle-complete.el"
;;;;;;  (20088 29108))
;;; Generated autoloads from ../sqlparse/sqlparser-oracle-complete.el

(autoload 'oracle-complete-minor-mode "sqlparser-oracle-complete" "\
mode for editing oracle script

\(fn &optional ARG)" t nil)

(autoload 'sqlparser-oracle-complete "sqlparser-oracle-complete" "\
complete tablename or column name depending on current point
position .

\(fn)" t nil)

;;;***

;;;### (autoloads (sqlparser-sqlserver-complete sqlserver-complete-minor-mode)
;;;;;;  "sqlparser-sqlserver-complete" "../sqlparse/sqlparser-sqlserver-complete.el"
;;;;;;  (20088 29108))
;;; Generated autoloads from ../sqlparse/sqlparser-sqlserver-complete.el

(autoload 'sqlserver-complete-minor-mode "sqlparser-sqlserver-complete" "\
mode for editing sqlserver script

\(fn &optional ARG)" t nil)

(autoload 'sqlparser-sqlserver-complete "sqlparser-sqlserver-complete" "\
complete tablename or column name depending on current point
position .

\(fn)" t nil)

;;;***

;;;### (autoloads (sqlserver-query sqlserver-query-close-connection)
;;;;;;  "sqlserver-query" "../sqlparse/sqlserver-query.el" (20088
;;;;;;  29108))
;;; Generated autoloads from ../sqlparse/sqlserver-query.el

(autoload 'sqlserver-query-close-connection "sqlserver-query" "\
close connection.kill sqlplus process and buffer .

\(fn CONNECTION)" nil nil)

(autoload 'sqlserver-query "sqlserver-query" "\
execute sql using `sqlcmd' or `osql' ,and return the result of it.

\(fn SQL &optional SQLSERVER-QUERY-CONNECTION)" nil nil)

;;;***

;;;### (autoloads (sqlserver-table2entity-4csharp-interactively sstec-generate-all-classes)
;;;;;;  "sqlserver-table2entity-4csharp" "../sqlparse/sqlserver-table2entity-4csharp.el"
;;;;;;  (20086 4876))
;;; Generated autoloads from ../sqlparse/sqlserver-table2entity-4csharp.el

(autoload 'sstec-generate-all-classes "sqlserver-table2entity-4csharp" "\
Not documented

\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'sqlserver-table2entity-4csharp-interactively "sqlserver-table2entity-4csharp" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (synonyms-definition-mouse synonyms-definition-no-read
;;;;;;  synonyms-definition synonyms-history-forward synonyms-history-backward
;;;;;;  synonyms-mouse-match-more+append-result synonyms-mouse-append-result
;;;;;;  synonyms-mouse-match-more synonyms-mouse synonyms-match-more+append-result-no-read
;;;;;;  synonyms-match-more+append-result synonyms-append-result-no-read
;;;;;;  synonyms-append-result synonyms-match-more-no-read synonyms-match-more
;;;;;;  synonyms-no-read synonyms-write-synonyms-to-cache synonyms-make-obarray
;;;;;;  synonyms-ensure-synonyms-read-from-cache synonyms-mode synonyms-dictionary-alternate-url
;;;;;;  synonyms-dictionary-url synonyms-use-cygwin-flag synonyms-mode-hook
;;;;;;  synonyms-match-more-flag synonyms-fill-column synonyms-file
;;;;;;  synonyms-cache-file synonyms-append-result-flag Synonyms)
;;;;;;  "synonyms" "../icicles/synonyms.el" (20033 30047))
;;; Generated autoloads from ../icicles/synonyms.el

(let ((loads (get 'Synonyms 'custom-loads))) (if (member '"synonyms" loads) nil (put 'Synonyms 'custom-loads (cons '"synonyms" loads))))

(defface synonyms-heading '((((background dark)) (:foreground "Yellow")) (t (:foreground "Blue"))) "\
*Face for different synonym types." :group (quote Synonyms) :group (quote faces))

(defface synonyms-search-text '((t (:foreground "Red"))) "\
*Face for the term whose synonyms were sought." :group (quote Synonyms) :group (quote faces))

(defface synonyms-link '((((background dark)) (:foreground "Yellow" :underline t)) (t (:foreground "Blue" :underline t))) "\
*Face for history links." :group (quote Synonyms) :group (quote faces))

(defface synonyms-mouse-face '((((background dark)) (:background "DarkCyan")) (t (:background "Cyan"))) "\
*Mouse face for the term whose synonyms were sought." :group (quote Synonyms) :group (quote faces))

(defvar synonyms-append-result-flag nil "\
*t means that `synonyms' appends search result to previous results.
No other value, besides t, has this effect.

This can be overridden by using a negative prefix argument,
for example, `M--'.  If you use `C-u C-u', then both this and
`synonyms-match-more-flag' are overridden.")

(custom-autoload 'synonyms-append-result-flag "synonyms" t)

(defvar synonyms-cache-file "" "\
*Location to write cache file containing synonyms.
Written to save the list of synonyms used for completion.
This is an absolute (complete-path) location, including the file name.")

(custom-autoload 'synonyms-cache-file "synonyms" t)

(defvar synonyms-file "" "\
*Location of thesaurus file `mthesaur.txt'.
This is an absolute (complete-path) location, including the file name.")

(custom-autoload 'synonyms-file "synonyms" t)

(defvar synonyms-fill-column 80 "\
*Synonyms* buffer text is wrapped (filled) to this many columns.")

(custom-autoload 'synonyms-fill-column "synonyms" t)

(defvar synonyms-match-more-flag nil "\
*t means additional thesaurus entries can be matched by `synonyms'.
No other value, besides t, has this effect.

A value of t means two things:
 1) Input can match parts of synonyms, in addition to whole synonyms.
 2) All synonyms are shown, even if input matches a thesaurus entry.

This can be overridden by using a positive prefix argument,
  for example, `C-u'.  If you use `C-u C-u', then both this and
`synonyms-append-result-flag' are overridden.")

(custom-autoload 'synonyms-match-more-flag "synonyms" t)

(defvar synonyms-mode-hook nil "\
*Normal hook run when entering Thesaurus mode.")

(custom-autoload 'synonyms-mode-hook "synonyms" t)

(defvar synonyms-use-cygwin-flag nil "\
*Non-nil means to double backslashes in arguments to `call-process'.
There is apparently a bug in the Emacs (at least versions 20-22) C
code that implements function `call-process' on MS Windows.  When
using native Windows Emacs with Cygwin commands, such as `grep', the C
code removes a level of backslashes, so string arguments supplied to
`call-process' need to have twice as many backslashes as they should
need.  If you are using Emacs on Windows and Cygwin `grep', then you
probably will want to use a non-nil value for
`synonyms-use-cygwin-flag'.")

(custom-autoload 'synonyms-use-cygwin-flag "synonyms" t)

(defvar synonyms-dictionary-url "http://dictionary.reference.com/search?q=" "\
*URL of a Web dictionary lookup.  Text to look up is appended to this.
See also `synonyms-dictionaries-url'.")

(custom-autoload 'synonyms-dictionary-url "synonyms" t)

(defvar synonyms-dictionary-alternate-url "http://www.onelook.com/?ls=b&w=" "\
*URL of a Web dictionary lookup.  Text to look up is appended to this.
The default value, \"http://www.onelook.com/?ls=b&w=\" lets you use `?'
and `*' as wildcards in the terms you look up.  These are not used as
regexp wildcards, however.  `?' stands for any single character, and
`*' stands for any sequence of characters.  In terms of regexp syntax,
`?' here is equivalent to the regexp `.', and `*' is equivalent to the
regexp `.*'.  See http://www.onelook.com/?c=faq#patterns for more
information on the allowed wildcard patterns.
See also `synonyms-dictionary-url'.")

(custom-autoload 'synonyms-dictionary-alternate-url "synonyms" t)

(autoload 'synonyms-mode "synonyms" "\
Major mode for browsing thesaurus entries (synonyms).
Like Text mode but with these additional key bindings:

 \\<synonyms-mode-map>\\[synonyms-mouse],     \\[synonyms-no-read],     \\[synonyms] - Look up synonyms for a word or phrase
 \\[synonyms-mouse-match-more],   \\[synonyms-match-more]   - Like \\[synonyms-no-read], but try to match more terms
 \\[synonyms-mouse-append-result],   \\[synonyms-append-result]   - Like \\[synonyms-no-read], but add result to previous result
 \\[synonyms-mouse-match-more+append-result], \\[synonyms-match-more+append-result] - Like \\[synonyms-match-more] and \\[synonyms-append-result] combined

 \\[scroll-up] - Scroll down through the buffer of synonyms
 \\[scroll-down] - Scroll up through the buffer of synonyms
 \\[describe-mode]   - Display this help
 \\[quit-window]   - Quit Synonyms mode

Of the various key bindings that look up synonyms, the most flexible
is \\[synonyms] - it prompts you for the search string to match.  This
can be a regular expression (regexp).  The other lookup bindings are
for convenience - just click.

In Synonyms mode, Transient Mark mode is enabled.

Options `synonyms-match-more-flag' and `synonyms-append-result-flag'
affect synonym matching and the results.  For convenience, \\[synonyms-mouse-match-more],
\\[synonyms-mouse-append-result], and \\[synonyms-mouse-match-more+append-result] toggle the effect of those options for the
duration of the command.

Note that even though Synonyms mode is similar to Text mode, buffer
`*Synonyms*' is read-only, by default - use `C-x C-q' to toggle.

Turning on Synonyms mode runs the normal hooks `text-mode-hook' and
`synonyms-mode-hook' (in that order).

\(fn)" t nil)

(autoload 'synonyms-ensure-synonyms-read-from-cache "synonyms" "\
Ensure synonyms are in `synonyms-obarray', from `synonyms-cache-file'.
If this file does not yet exist, then it and the obarray are created.
Creating the obarray for the first time takes 2-3 minutes.
This does nothing if the obarray is already complete.

\(fn)" t nil)

(autoload 'synonyms-make-obarray "synonyms" "\
Fill `synonyms-obarray' with the available synonyms.

\(fn)" t nil)

(autoload 'synonyms-write-synonyms-to-cache "synonyms" "\
Write synonyms in `synonyms-obarray' to file `synonyms-cache-file'.

\(fn)" t nil)

(autoload 'synonyms-no-read "synonyms" "\
Same as command `synonyms', but uses the default input text (regexp).

\(fn ARG)" t nil)

(autoload 'synonyms-match-more "synonyms" "\
Same as using `synonyms' with `synonyms-match-more-flag' = t.

\(fn)" t nil)

(autoload 'synonyms-match-more-no-read "synonyms" "\
Same as using `synonyms' with `synonyms-match-more-flag' = t.

\(fn ARG)" t nil)

(autoload 'synonyms-append-result "synonyms" "\
Same as using `synonyms' with `synonyms-append-result-flag' = t.

\(fn)" t nil)

(autoload 'synonyms-append-result-no-read "synonyms" "\
Same as using `synonyms' with `synonyms-append-result-flag' = t.

\(fn ARG)" t nil)

(autoload 'synonyms-match-more+append-result "synonyms" "\
Like `synonyms-match-more-flag' = `synonyms-append-result-flag' = t.

\(fn)" t nil)

(autoload 'synonyms-match-more+append-result-no-read "synonyms" "\
Like `synonyms-match-more-flag' = `synonyms-append-result-flag' = t.

\(fn ARG)" t nil)

(autoload 'synonyms-mouse "synonyms" "\
Show synonyms that match a regular expression (e.g. a word or phrase).
The regexp to match is the synonym or region clicked with mouse-2.  If
the region is active, but a synonym elsewhere is clicked, that synonym
is used, not the selected text.

You can either click a listed synonym, to see its synonyms, or select
one or more words and click the selection, to see matching synonyms.
To quickly select a series of words: double-click mouse-1 to select
the first word, then click mouse-3 to extend the selection to the last
word.

Selection is useful when you want to see synonyms of a similar term.
For example, instead of clicking the listed synonym `bleeding heart', you
might select `heart' and click that.

The prefix argument acts the same as for command `synonyms'.

If you click a history link with mouse-2, previously retrieved search
results are revisited.

\(fn EVENT ARG)" t nil)

(autoload 'synonyms-mouse-match-more "synonyms" "\
Same as `synonyms-mouse' with `synonyms-match-more-flag' = t.

\(fn EVENT ARG)" t nil)

(autoload 'synonyms-mouse-append-result "synonyms" "\
Same as `synonyms-mouse' with `synonyms-append-result-flag' = t.

\(fn EVENT ARG)" t nil)

(autoload 'synonyms-mouse-match-more+append-result "synonyms" "\
Like `synonyms-match-more-flag' = `synonyms-append-result-flag' = t.

\(fn EVENT ARG)" t nil)

(autoload 'synonyms-history-backward "synonyms" "\
Run `synonyms' on a previous argument, moving backward in the history.
A prefix argument has the same meaning as for command `synonyms'.

\(fn ARG)" t nil)

(autoload 'synonyms-history-forward "synonyms" "\
Run `synonyms' on a previous argument, moving forward in the history.
A prefix argument has the same meaning as for command `synonyms'.

\(fn ARG)" t nil)

(defalias 'dictionary-definition 'synonyms-definition)

(autoload 'synonyms-definition "synonyms" "\
Look up the definition of a word or phrase using online dictionaries.
The dictionary used is `synonyms-dictionary-url'.
With prefix arg, look up the definition in the alternate dictionary,
`synonyms-dictionary-alternate-url'.

\(fn SEARCH-TEXT ALTERNATE-P)" t nil)

(autoload 'synonyms-definition-no-read "synonyms" "\
Look up the definition of a word or phrase using online dictionaries.
The dictionary used is `synonyms-dictionary-url'.
With prefix arg, look up the definition in the alternate dictionary,
`synonyms-dictionary-alternate-url'.

\(fn ALTERNATE-P)" t nil)

(autoload 'synonyms-definition-mouse "synonyms" "\
Look up the definition of a word or phrase using online dictionaries.
The dictionary used is `synonyms-dictionary-url'.
With prefix arg, look up the definition in the alternate dictionary,
`synonyms-dictionary-alternate-url'.

\(fn EVENT ALTERNATE-P)" t nil)

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

;;;### (autoloads (vline-global-mode vline-mode) "vline" "../icicles/vline.el"
;;;;;;  (20033 19868))
;;; Generated autoloads from ../icicles/vline.el

(autoload 'vline-mode "vline" "\
Display vertical line mode.

\(fn &optional ARG)" t nil)

(defvar vline-global-mode nil "\
Non-nil if Vline-Global mode is enabled.
See the command `vline-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vline-global-mode'.")

(custom-autoload 'vline-global-mode "vline" nil)

(autoload 'vline-global-mode "vline" "\
Toggle Vline mode in every possible buffer.
With prefix ARG, turn Vline-Global mode on if and only if
ARG is positive.
Vline mode is enabled in all buffers where
`(lambda nil (unless (minibufferp) (vline-mode 1)))' would do it.
See `vline-mode' for more information on Vline mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (yas/minor-mode yas/snippet-dirs) "yasnippet" "../yasnippet-0.6.1c/yasnippet.el"
;;;;;;  (20049 15134))
;;; Generated autoloads from ../yasnippet-0.6.1c/yasnippet.el

(defvar yas/snippet-dirs nil "\
Directory or list of snippet dirs for each major mode.

The directory where user-created snippets are to be stored. Can
also be a list of directories. In that case, when used for
bulk (re)loading of snippets (at startup or via
`yas/reload-all'), directories appearing earlier in the list
shadow other dir's snippets. Also, the first directory is taken
as the default for storing the user's new snippets.")

(custom-autoload 'yas/snippet-dirs "yasnippet" nil)

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

;;;***

;;;### (autoloads nil nil ("../icicles/frm-fns.el" "../icicles/icicles-chg.el"
;;;;;;  "../icicles/icicles-doc1.el" "../icicles/icicles-doc2.el"
;;;;;;  "../icicles/icicles-var.el" "../icicles/icicles.el" "../icicles/ring+.el"
;;;;;;  "../joseph/joseph-sqlserver.el") (20088 31719 775384))

;;;***

(provide 'joseph-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; joseph-loaddefs.el ends here
