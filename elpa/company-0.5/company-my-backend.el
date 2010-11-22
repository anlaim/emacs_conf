(defun company-my-backend (command &optional arg &rest ignored)
  (case command
    ('prefix (when (looking-back "foo\\>")
               (match-string 0)))
    ('candidates (when (equal arg "foo")
                   (list "foobar" "foobaz" "foobarbaz")))
    ('meta (format "This value is named %s" arg))))