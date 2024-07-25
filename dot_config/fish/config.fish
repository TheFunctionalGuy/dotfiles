if status is-interactive
    # Commands to run in interactive sessions can go here
    # Variables
    # Custom settings for "tide" theme
    set --global fish_greeting

    # Set terminal
    set --global --export TERMINAL alacritty

    # Set editor to neovim
    if type --query nvim
        set --global --export EDITOR nvim
    end

    # Custom settings for fzf.fish
    if type --query fzf_configure_bindings
        set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &>/dev/tty)"
        set --export fzf_preview_dir_cmd eza --all --color=always
        fzf_configure_bindings --git_log=\e\cg
    end

    # Cursor settings
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore

    # zf settings
    if type --query zf
        set --export ZF_VI_MODE 1
    end

    # Abbreviations
    # Editor
    if type --query nvim
        abbr --add n nvim
    end
    abbr --add se sudoedit

    # Updating
    if type --query pacman
        abbr --add up sudo pacman -Syu
        abbr --add PACMAN --position anywhere p pacman
    end
    if type --query paru
        abbr --add up paru
        abbr --add p paru

        if type --query eos-update
            abbr --add up eos-update --paru
        end
    end

    # Misc
    if type --query just
        abbr --add j just
    end

    if type --query wl-copy
        abbr --add ccwd "pwd | wl-copy --trim-newline"
    end

    # Multicd parameter
    function _multicd_parameter
        echo (string join "" (string repeat -n (math (string length -- $argv[1]) - 1) ../) "%")
    end
    abbr --add multicd_parameter --set-cursor --position anywhere --regex '^\.\.+$' --function _multicd_parameter

    # Multicd
    function _multicd
        echo (string join "" "cd " (string repeat -n (math (string length -- $argv[1]) - 1) ../) "%")
    end
    abbr --add multicd --set-cursor --position command --regex '^\.\.+$' --function _multicd

    # Replace !! by last history (for easier sudo repeat)
    function _last_history_item
        echo $history[1]
    end
    abbr -a !! --position anywhere --function _last_history_item
end

if type --query zoxide
    zoxide init fish | source
end
