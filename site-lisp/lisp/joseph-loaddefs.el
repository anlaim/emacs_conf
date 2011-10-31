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
;;;;;;  (20138 19493))
;;; Generated autoloads from ../ajc-java-complete/ajc-java-complete.el

(autoload 'ajc-reload "ajc-java-complete" "\
restart Auto Java Complete ,when your tag file changed,
you can use this function restart AutoJavaComplete

\(fn)" t nil)

(defalias 'auto-java-complete-reload 'ajc-reload)

;;;***

;;;### (autoloads (ajc-4-jsp-find-file-hook ajc-java-complete-mode)
;;;;;;  "ajc-java-complete-config" "../ajc-java-complete/ajc-java-complete-config.el"
;;;;;;  (20138 19471))
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
;;;;;;  "anything" "../anything-config/anything.el" (20138 25396))
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

- :default

 A default argument that will be inserted in minibuffer with  \\<minibuffer-local-map>\\[next-history-element].
 When nil of not present `thing-at-point' will be used instead.

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
;;;;;;  anything-ucs anything-ratpoison-commands anything-c-run-external-command
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
;;;;;;  anything-grep-help anything-generic-file-help anything-read-file-name-help
;;;;;;  anything-ff-help anything-c-buffer-help anything-configuration)
;;;;;;  "anything-config" "../anything-config/anything-config.el"
;;;;;;  (20141 62600))
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

(autoload 'anything-read-file-name-help "anything-config" "\
Not documented

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

(autoload 'anything-ucs "anything-config" "\
Preconfigured anything for `ucs-names' math symbols.

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
However you can modify this behavior for functions of your choice
with `anything-completing-read-handlers-alist'.

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

;;;### (autoloads (anything-dired-history-view anything-dired-history-update)
;;;;;;  "anything-dired-history" "../anything-dired-history/anything-dired-history.el"
;;;;;;  (20096 39321))
;;; Generated autoloads from ../anything-dired-history/anything-dired-history.el

(autoload 'anything-dired-history-update "anything-dired-history" "\
update variable `anything-dired-history-variable'.

\(fn)" nil nil)

(add-hook 'dired-after-readin-hook 'anything-dired-history-update)

(autoload 'anything-dired-history-view "anything-dired-history" "\
call `anything' to show dired history.

\(fn)" t nil)

;;;***

;;;### (autoloads (anything-etags+-history anything-etags+-history-go-forward
;;;;;;  anything-etags+-history-go-back anything-etags+-select-one-key
;;;;;;  anything-etags+-select-at-point anything-etags+-select) "anything-etags+"
;;;;;;  "../anything-etags-plus/anything-etags+.el" (20138 19724))
;;; Generated autoloads from ../anything-etags-plus/anything-etags+.el

(autoload 'anything-etags+-select "anything-etags+" "\
Tag jump using etags and `anything'.
If SYMBOL-NAME is non-nil, jump tag position with SYMBOL-NAME.

\(fn)" t nil)

(autoload 'anything-etags+-select-at-point "anything-etags+" "\
Tag jump with current symbol using etags and `anything'.

\(fn)" t nil)

(autoload 'anything-etags+-select-one-key "anything-etags+" "\
you can bind this to `M-.'

\(fn &optional ARGS)" t nil)

(defvar anything-c-source-etags+-select '((name . "Etags+") (init . anything-etags+-get-available-tag-table-buffers) (candidates . anything-etags+-get-candidates-with-cache-support) (volatile) (pattern-transformer (lambda (anything-pattern) (setq anything-etags+-untransformed-anything-pattern anything-pattern) (replace-regexp-in-string "\\\\_<\\|\\\\_>" "" anything-pattern))) (requires-pattern . 3) (delayed) (action ("Goto the location" . anything-c-etags+-goto-location))))

(autoload 'anything-etags+-history-go-back "anything-etags+" "\
Go Back.

\(fn)" t nil)

(autoload 'anything-etags+-history-go-forward "anything-etags+" "\
Go Forward.

\(fn)" t nil)

(autoload 'anything-etags+-history "anything-etags+" "\
show all tag historys using `anything'

\(fn)" t nil)

;;;***

;;;### (autoloads (anything-replace-string anything-replace-string-push-history)
;;;;;;  "anything-replace-string" "../anything-replace-string/anything-replace-string.el"
;;;;;;  (20078 45283))
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
;;;;;;  "../anything-config/developer-tools/autodoc.el" (20138 25396))
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
;;;;;;  "../dired-filetype-face/dired-filetype-face.el" (20097 56732))
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

;;;### (autoloads (highlight-parentheses-mode) "highlight-parentheses"
;;;;;;  "../highlight-parentheses.el" (20033 28702))
;;; Generated autoloads from ../highlight-parentheses.el

(autoload 'highlight-parentheses-mode "highlight-parentheses" "\
Minor mode to highlight the surrounding parentheses.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (htmlize-many-files-dired htmlize-many-files htmlize-file
;;;;;;  htmlize-region htmlize-buffer) "htmlize" "../org-mode-git/contrib/lisp/htmlize.el"
;;;;;;  (20095 54931))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/htmlize.el

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

;;;### (autoloads (iedit-mode) "iedit" "../iedit.el" (20073 31169))
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
;;;;;;  (20142 16594))
;;; Generated autoloads from ../joseph/joseph-animate.el

(autoload 'hello "joseph-animate" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (joseph-update-directory-autoloads-recursively)
;;;;;;  "joseph-autoload" "../joseph/joseph-autoload.el" (20138 2744))
;;; Generated autoloads from ../joseph/joseph-autoload.el

(autoload 'joseph-update-directory-autoloads-recursively "joseph-autoload" "\
update autoload cookies .scanning all directories under
~/.emacs.d/site-lisp/ recursively. to
` ~/.emacs.d/site-lisp/lisp/joseph-loaddefs.el'

\(fn)" t nil)

;;;***

;;;### (autoloads (byte-compile-all-my-el-files joseph_compile_current_el_without_output
;;;;;;  joseph-byte-compile-files-outside) "joseph-byte-compile"
;;;;;;  "../joseph/joseph-byte-compile.el" (20142 20880))
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
;;;;;;  "joseph-command" "../joseph/joseph-command.el" (20142 5870))
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
;;;;;;  "joseph-csharp" "../joseph/joseph-csharp.el" (20098 29344))
;;; Generated autoloads from ../joseph/joseph-csharp.el

(autoload 'csharp-setter-getter "joseph-csharp" "\
generate sets and gets for c#.

\(fn BEG END)" t nil)

(autoload 'csharp-db-2-seter-getter "joseph-csharp" "\
generate setter getter depends on db

\(fn BEG END)" t nil)

;;;***

;;;### (autoloads (dired-add-to-load-path-or-load-it dired-end-of-buffer
;;;;;;  dired-begining-of-buffer anything-dired dired-name-filter-only-show-matched-lines)
;;;;;;  "joseph-dired-lazy" "../joseph/joseph-dired-lazy.el" (20098
;;;;;;  29377))
;;; Generated autoloads from ../joseph/joseph-dired-lazy.el

(autoload 'dired-name-filter-only-show-matched-lines "joseph-dired-lazy" "\
Not documented

\(fn FILTER-REGEXP)" t nil)

(autoload 'anything-dired "joseph-dired-lazy" "\
call `anything' to show dired history and files in current buffers.

\(fn)" t nil)

(autoload 'dired-begining-of-buffer "joseph-dired-lazy" "\
Not documented

\(fn)" t nil)

(autoload 'dired-end-of-buffer "joseph-dired-lazy" "\
Not documented

\(fn)" t nil)

(autoload 'dired-add-to-load-path-or-load-it "joseph-dired-lazy" "\
on `dired-mode',if thing under point is directory add it to `load-path'
if it is a el-file ,then `load' it

\(fn)" t nil)

;;;***

;;;### (autoloads (apply-args-to-fun apply-args-list-to-fun) "joseph-faces"
;;;;;;  "../joseph/joseph-faces.el" (20098 29344))
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
;;;;;;  (20142 23102))
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

;;;### (autoloads (joseph-backward-symbol-or-isearch-regexp-backward
;;;;;;  joseph-forward-symbol-or-isearch-regexp-forward joseph-backward-symbol
;;;;;;  joseph-forward-symbol) "joseph-isearch" "../joseph/joseph-isearch.el"
;;;;;;  (20142 23479))
;;; Generated autoloads from ../joseph/joseph-isearch.el

(autoload 'joseph-forward-symbol "joseph-isearch" "\
直接搜索当前`symbol',并跳到相应位置

\(fn &optional SYMBOL)" t nil)

(autoload 'joseph-backward-symbol "joseph-isearch" "\
直接搜索当前`symbol',并跳到相应位置(反向)

\(fn &optional SYMBOL)" t nil)

(autoload 'joseph-forward-symbol-or-isearch-regexp-forward "joseph-isearch" "\
`C-s' call `isearch-forward-regexp'
`C-uC-s' call `joseph-forward-symbol'
when `mark-active' then use selected text as keyword
`C-s' call `joseph-forward-symbol'
`C-uC-s' call `isearch-forward-regexp'

\(fn &optional PARAM)" t nil)

(autoload 'joseph-backward-symbol-or-isearch-regexp-backward "joseph-isearch" "\
`C-s' call `joseph-backward-symbol'
`C-uC-s' call `isearch-backward-regexp'
when `mark-active' then use selected text as keyword
`C-s' call `isearch-backward-regexp'
`C-uC-s' call  `joseph-backward-symbol'

\(fn &optional PARAM)" t nil)

;;;***

;;;### (autoloads (mysql-mode) "joseph-mysql" "../joseph/joseph-mysql.el"
;;;;;;  (20098 29344))
;;; Generated autoloads from ../joseph/joseph-mysql.el

(autoload 'mysql-mode "joseph-mysql" "\
mode for editing mysql script

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (oracle-mode) "joseph-oracle" "../joseph/joseph-oracle.el"
;;;;;;  (20098 29344))
;;; Generated autoloads from ../joseph/joseph-oracle.el

(autoload 'oracle-mode "joseph-oracle" "\
start oracle in sqlplus-mode

\(fn)" t nil)

;;;***

;;;### (autoloads (publish-my-note-src publish-my-note-html publish-my-note
;;;;;;  publish-my-note-force) "joseph-org-publish" "../joseph/joseph-org-publish.el"
;;;;;;  (20098 29344))
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
;;;;;;  (20142 3275))
;;; Generated autoloads from ../joseph-scroll-screen/joseph-scroll-screen.el
'

;;;***

;;;### (autoloads (set-shell-cmdproxy set-shell-bash bash eshell/clear)
;;;;;;  "joseph-shell" "../joseph/joseph-shell.el" (20141 2970))
;;; Generated autoloads from ../joseph/joseph-shell.el

(autoload 'eshell/clear "joseph-shell" "\
04Dec2001 - sailor, to clear the eshell buffer.

\(fn)" t nil)

(autoload 'bash "joseph-shell" "\
Start `bash' shell.

\(fn)" t nil)

(autoload 'set-shell-bash "joseph-shell" "\
Enable on-the-fly switching between the bash shell and DOS.

\(fn)" t nil)

(autoload 'set-shell-cmdproxy "joseph-shell" "\
Set shell to `cmdproxy'.

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
;;;;;;  (20142 16805))
;;; Generated autoloads from ../joseph/joseph-sql.el

(autoload 'sqlserver-create-table "joseph-sql" "\
做项目的时候用到的自动将excel表格格式的，创建成建表语句。region的格式如上面注释，注意顶格写

\(fn REGION-BEGIN REGION-END)" t nil)

;;;***

;;;### (autoloads (define-key-lazy add-hooks add-auto-mode) "joseph-util"
;;;;;;  "../joseph/joseph-util.el" (20127 29404))
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

;;;### (autoloads (wl-sudo-find-file toggle-read-only-file-with-sudo)
;;;;;;  "joseph_sudo" "../joseph/joseph_sudo.el" (20098 29344))
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
;;;;;;  (20094 45502))
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
;;;;;;  "../org-mode-git/lisp/ob.el" (20095 54932))
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
;;;;;;  (20095 54932))
;;; Generated autoloads from ../org-mode-git/lisp/ob-keys.el

(autoload 'org-babel-describe-bindings "ob-keys" "\
Describe all keybindings behind `org-babel-key-prefix'.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-babel-lob-get-info org-babel-lob-execute-maybe
;;;;;;  org-babel-lob-ingest) "ob-lob" "../org-mode-git/lisp/ob-lob.el"
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54932))
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
;;;;;;  "oracle-query" "../sqlparse/oracle-query.el" (20139 42141))
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
;;;;;;  (20139 42141))
;;; Generated autoloads from ../sqlparse/oracle-table2entity-4csharp.el

(autoload 'otec-generate-all-classes "oracle-table2entity-4csharp" "\
Not documented

\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'oracle-table2entity-4csharp-interactively "oracle-table2entity-4csharp" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (oracle-table2entity-4java-interactively otej-generate-all-classes)
;;;;;;  "oracle-table2entity-4java" "../sqlparse/oracle-table2entity-4java.el"
;;;;;;  (20139 42141))
;;; Generated autoloads from ../sqlparse/oracle-table2entity-4java.el

(autoload 'otej-generate-all-classes "oracle-table2entity-4java" "\
Not documented

\(fn PACKAGE SAVEPATH)" nil nil)

(autoload 'oracle-table2entity-4java-interactively "oracle-table2entity-4java" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (org-customize org-reload org-require-autoloaded-modules
;;;;;;  org-submit-bug-report org-cycle-agenda-files org-switchb
;;;;;;  org-map-entries org-open-link-from-string org-open-at-point-global
;;;;;;  org-insert-link-global org-store-link org-run-like-in-org-mode
;;;;;;  turn-on-orgstruct++ turn-on-orgstruct orgstruct-mode org-global-cycle
;;;;;;  org-mode org-babel-do-load-languages) "org" "../org-mode-git/lisp/org.el"
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54932))
;;; Generated autoloads from ../org-mode-git/lisp/org-attach.el

(autoload 'org-attach "org-attach" "\
The dispatcher for attachment commands.
Shows a list of commands and prompts for another key to execute a command.

\(fn)" t nil)

;;;***

;;;### (autoloads (org-bbdb-anniversaries) "org-bbdb" "../org-mode-git/lisp/org-bbdb.el"
;;;;;;  (20095 54932))
;;; Generated autoloads from ../org-mode-git/lisp/org-bbdb.el

(autoload 'org-bbdb-anniversaries "org-bbdb" "\
Extract anniversaries from BBDB for display in the agenda.

\(fn)" nil nil)

;;;***

;;;### (autoloads (org-capture-import-remember-templates org-capture-insert-template-here
;;;;;;  org-capture) "org-capture" "../org-mode-git/lisp/org-capture.el"
;;;;;;  (20095 54932))
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
;;;;;;  "org-clock" "../org-mode-git/lisp/org-clock.el" (20095 54932))
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
;;;;;;  (20095 54931))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-contacts.el

(autoload 'org-contacts "org-contacts" "\
Create agenda view for contacts matching NAME.

\(fn NAME)" t nil)

;;;***

;;;### (autoloads (org-datetree-find-date-create) "org-datetree"
;;;;;;  "../org-mode-git/lisp/org-datetree.el" (20095 54932))
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
;;;;;;  "org-docbook" "../org-mode-git/lisp/org-docbook.el" (20095
;;;;;;  54932))
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
;;;;;;  (20095 54932))
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
;;;;;;  "../org-mode-git/contrib/lisp/org-export-generic.el" (20095
;;;;;;  54931))
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
;;;;;;  (20095 54932))
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
;;;;;;  "../org-mode-git/lisp/org-footnote.el" (20095 54932))
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
;;;;;;  "../org-mode-git/lisp/org-freemind.el" (20095 54932))
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
;;;;;;  "../org-mode-git/lisp/org-html.el" (20095 54932))
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
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54932))
;;; Generated autoloads from ../org-mode-git/lisp/org-indent.el

(autoload 'org-indent-mode "org-indent" "\
When active, indent text according to outline structure.

Internally this works by adding `line-prefix' properties to all non-headlines.
These properties are updated locally in idle time.
FIXME:  How to update when broken?

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (org-irc-store-link) "org-irc" "../org-mode-git/lisp/org-irc.el"
;;;;;;  (20095 54932))
;;; Generated autoloads from ../org-mode-git/lisp/org-irc.el

(autoload 'org-irc-store-link "org-irc" "\
Dispatch to the appropriate function to store a link to an IRC session.

\(fn)" nil nil)

;;;***

;;;### (autoloads (org-export-as-pdf-and-open org-export-as-pdf org-export-as-latex
;;;;;;  org-export-region-as-latex org-replace-region-by-latex org-export-as-latex-to-buffer
;;;;;;  org-export-as-latex-batch) "org-latex" "../org-mode-git/lisp/org-latex.el"
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54931))
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
;;;;;;  (20095 54932))
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
;;;;;;  "org-odt" "../org-mode-git/contrib/lisp/org-odt.el" (20095
;;;;;;  54931))
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
;;;;;;  (20095 54932))
;;; Generated autoloads from ../org-mode-git/lisp/org-plot.el

(autoload 'org-plot/gnuplot "org-plot" "\
Plot table using gnuplot.  Gnuplot options can be specified with PARAMS.
If not given options will be taken from the +PLOT
line directly before or after the table.

\(fn &optional PARAMS)" t nil)

;;;***

;;;### (autoloads (org-publish-current-project org-publish-current-file
;;;;;;  org-publish-all org-publish) "org-publish" "../org-mode-git/lisp/org-publish.el"
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54931))
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
;;;;;;  "../org-mode-git/lisp/org-remember.el" (20095 54932))
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
;;;;;;  "org-table" "../org-mode-git/lisp/org-table.el" (20095 54932))
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
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54932))
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
;;;;;;  (20095 54931))
;;; Generated autoloads from ../org-mode-git/contrib/lisp/org-toc.el

(autoload 'org-toc-show "org-toc" "\
Show the table of contents of the current Org-mode buffer.

\(fn &optional DEPTH POSITION)" t nil)

;;;***

;;;### (autoloads (org-track-compile-org org-track-fetch-package)
;;;;;;  "org-track" "../org-mode-git/contrib/lisp/org-track.el" (20095
;;;;;;  54931))
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
;;;;;;  "org-xhtml" "../org-mode-git/contrib/lisp/org-xhtml.el" (20095
;;;;;;  54931))
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
;;;;;;  (20095 54932))
;;; Generated autoloads from ../org-mode-git/lisp/org-xoxo.el

(autoload 'org-export-as-xoxo "org-xoxo" "\
Export the org buffer as XOXO.
The XOXO buffer is named *xoxo-<source buffer name>*

\(fn &optional BUFFER)" t nil)

;;;***

;;;### (autoloads (org2rem-combine-agenda-files org2rem-all-agenda-files
;;;;;;  org2rem-this-file) "org2rem" "../org-mode-git/contrib/lisp/org2rem.el"
;;;;;;  (20095 54931))
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
;;;;;;  (20139 42141))
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
;;;;;;  (20141 5867))
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
;;;;;;  (20141 5867))
;;; Generated autoloads from ../sqlparse/sqlparser-sqlserver-complete.el

(autoload 'sqlserver-complete-minor-mode "sqlparser-sqlserver-complete" "\
mode for editing sqlserver script

\(fn &optional ARG)" t nil)

(autoload 'sqlparser-sqlserver-complete "sqlparser-sqlserver-complete" "\
complete tablename or column name depending on current point
position .

\(fn)" t nil)

;;;***

;;;### (autoloads (sqlserver-query sqlserver-query-with-heading sqlserver-query-close-connection)
;;;;;;  "sqlserver-query" "../sqlparse/sqlserver-query.el" (20141
;;;;;;  5867))
;;; Generated autoloads from ../sqlparse/sqlserver-query.el

(autoload 'sqlserver-query-close-connection "sqlserver-query" "\
close connection.kill sqlplus process and buffer .

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
;;;;;;  (20139 42141))
;;; Generated autoloads from ../sqlparse/sqlserver-table2entity-4csharp.el

(autoload 'sstec-generate-all-classes "sqlserver-table2entity-4csharp" "\
Not documented

\(fn NAMESPACE SAVEPATH)" nil nil)

(autoload 'sqlserver-table2entity-4csharp-interactively "sqlserver-table2entity-4csharp" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (sqlserver-table2entity-4java-interactively stej-generate-all-classes)
;;;;;;  "sqlserver-table2entity-4java" "../sqlparse/sqlserver-table2entity-4java.el"
;;;;;;  (20139 42141))
;;; Generated autoloads from ../sqlparse/sqlserver-table2entity-4java.el

(autoload 'stej-generate-all-classes "sqlserver-table2entity-4java" "\
Not documented

\(fn PACKAGE SAVEPATH)" nil nil)

(autoload 'sqlserver-table2entity-4java-interactively "sqlserver-table2entity-4java" "\
Not documented

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
;;;;;;  (20138 6100))
;;; Generated autoloads from ../thingopt-el/thingopt.el

(autoload 'kill-thing "thingopt" "\
Not documented

\(fn THING)" t nil)

(autoload 'copy-thing "thingopt" "\
Not documented

\(fn THING)" t nil)

(autoload 'mark-thing "thingopt" "\
Not documented

\(fn THING)" t nil)

(autoload 'upward-mark-thing "thingopt" "\
Not documented

\(fn)" t nil)

(autoload 'kill-region-dwim "thingopt" "\
Not documented

\(fn)" t nil)

(autoload 'kill-ring-save-dwim "thingopt" "\
Not documented

\(fn)" t nil)

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

(provide 'joseph-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; joseph-loaddefs.el ends here
