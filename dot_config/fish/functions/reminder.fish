function reminder --description "A simple reminder with custom message"
    argparse --min-args 2 m h/help -- $argv
    or set argparse_failed 1

    if set --query _flag_h || set --query argparse_failed
        echo ""
        echo "A simple reminder with custom message"
        echo ""
        echo "Usage: reminder [TIME] [MESSAGE]"
        echo ""
        echo "Options:"
        echo "  -m          Take time in minutes instead of seconds"
        echo "  -h, --help  Print help message"
        return
    end

    set time $argv[1]
    set message $argv[2]

    if set --query _flag_m
        set time (math "$time * 60")
    end

    echo "Now setting timer for $time seconds..."

    fish -c (string join ' ' 'sleep' $time '&& notify-send -t 0 Reminder' $message) &
    disown
end
