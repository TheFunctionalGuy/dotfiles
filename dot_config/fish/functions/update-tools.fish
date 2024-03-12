function update-tools --description "Updates all tools that need to get updated regulary"
    argparse skip-zig h/help -- $argv
    or set argparse_failed 1

    if set --query _flag_h || set --query argparse_failed
        echo ""
        echo "Updates all tools that need to get updated regulary"
        echo ""
        echo "Usage: update-tools"
        echo ""
        echo "Options:"
        echo "  --skip-zig  Skip updating Zig and all related tools"
        echo "  -h, --help  Print help message"
        return
    end

    # Fish
    if type --query fisher
        echo -e "\e[33mNow updating fish-related tools\e[0m"
        fisher update
    end

    # Rust
    if type --query rustup
        echo -e "\e[33mNow updating Rust-related tools\e[0m"
        rustup update
        rustup completions fish >~/.config/fish/completions/rustup.fish

        # cargo-update for self-compiled Rust binaries
        if type --query cargo-install-update
            cargo install-update -a
        end
    end

    # Zig
    if not set --query _flag_skip_zig && type --query zvm
        # Use https repo instead of version inside ~/git directory
        set ZLS_PATH ~/.zls
        set ZVM_MASTER_PATH ~/.zvm/master
        set ZVM_CURRENT_PATH ~/.zvm/bin

        echo -e "\e[33mNow updating Zig-related tools\e[0m"
        # Get currently activated zig version prior to upgrading master
        set CURRENT_VERSION (path basename (path resolve $ZVM_CURRENT_PATH))

        zvm upgrade
        zvm install master

        # Restore version used prior to upgrading
        zvm use $CURRENT_VERSION

        # Also update zls when present
        if test -d $ZLS_PATH
            pushd $ZLS_PATH
            git pull &&
                $ZVM_MASTER_PATH/zig build --prefix-exe-dir $ZVM_MASTER_PATH -Doptimize=ReleaseSafe
            popd
        end
    end
end
