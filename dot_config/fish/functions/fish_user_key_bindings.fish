function fish_user_key_bindings
    # Default to vi key bindings
    fish_vi_key_bindings

    # Use <C-c> as <Esc> substitute
    # insert mode
    bind --mode insert \cc "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"
    # replace_one mode
    bind --mode replace_one --sets-mode default \cc cancel repaint-mode
    # replace mode
    bind --mode replace --sets-mode default \cc cancel repaint-mode
    # visual mode
    bind --mode visual --sets-mode default \cc end-selection repaint-mode

    # Custom <C-j> and <C-k> key bindings
    bind --mode default \cj down-or-search
    bind --mode default \ck up-or-search
    bind --mode insert \cj down-or-search
    bind --mode insert \ck up-or-search
    bind --mode visual \cj down-or-search
    bind --mode visual \ck up-or-search

    # Custom <C-h> and <C-l>
    bind --mode insert \ch backward-char
    bind --mode insert \cl forward-char

    # Custom <M-h> and <M-l>
    bind --mode default \eh prevd-or-backward-word
    bind --mode default \el nextd-or-forward-word
    bind --mode insert \eh prevd-or-backward-word
    bind --mode insert \el nextd-or-forward-word
    bind --mode visual \eh prevd-or-backward-word
    bind --mode visual \el nextd-or-forward-word

    # Custom <M-C-h> and <M-C-l>
    bind --mode insert \e\ch backward-bigword kill-bigword
    bind --mode insert \e\cl forward-bigword

    # Better undo
    bind --mode default U redo
    bind --mode default --erase \cr

    # Quit
    bind --mode default qq exit

    # Transpose
    bind --mode default \ct transpose-chars
    bind --mode default \et transpose-words
    bind --mode insert \ct transpose-chars
    bind --mode insert \et transpose-words
end
