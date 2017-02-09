# Description

The package `delete-back` replicates the backward delete behavior of modern text editors like oXygen XML or Sublime Text.

# Available commands

# `(delete-back-all)`
Backward deletes either (i) all empty lines, or (ii) one whole word, or (iii) a single non-word character. (This replicates the behaviour of `Ctrl-Backspace` in oxYgen XML Editor.)

# `(delete-back)`
Backward-deletes either (i) all spaces, (ii) one whole word, or (iii) a single non-word/non-space character. (This replicates the behaviour of `Ctrl-Backspace` in Sublime Text.)

# `(delete-word)`
Backward-deletes either (i) one whole word, or (ii) a single non-word char.

# Suggested bindings (requires `bind-key`)

```lisp
(bind-key "C-<backspace>" 'delete-back-all)
(bind-key "M-<backspace>" 'delete-back)
```