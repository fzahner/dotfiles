function timew --description 'Wrapper to add yT shortcut to Timewarrior'
    set -l parsed_args

    # NOTE: Use this GNU date command if you are on Linux
    set -l ydate (date -d "yesterday" +%Y-%m-%d)

    # NOTE: If you are on macOS (BSD date), use this instead:
    # set -l ydate (date -v-1d +%Y-%m-%d)

    # Loop through all arguments passed to the command
    for arg in $argv
        # If an argument starts with "yesterdayT", replace it with the real date
        if string match -q "yT*" $arg
            set arg (string replace "yT" "$ydate"T $arg)
        end

        # Add the argument to our new list
        set -a parsed_args $arg
    end

    # Run the actual timew command with the newly parsed arguments
    command timew $parsed_args
end
