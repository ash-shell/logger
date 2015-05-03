#!/bin/bash

# Constant
Logger_standard_color='\033[1;0m'
Logger_error_color='\033[1;31m'
Logger_success_color='\033[0;32m'
Logger_alert_color='\033[1;34m'
Logger_warning_color='\033[1;35m'

# Configurable
Logger__prefix='Logger'
Logger_has_prefix=1

#################################################
# Logs a message
#
# @param $1: The message to log
# @param $2: The color to log
# @param $3: Any flags to add to the main echo
#################################################
Logger_log() {
    local flags=''

    # Checking for any flags
    if [ ! -z "$3" ]; then
        flags="$3 "
    fi

    # Setting color (if param is passed)
    if [ ! -z "$2" ]; then
        echo -ne "$2"
    fi

    # Logging
    if [ $Logger_has_prefix -eq 1 ]; then
        echo $flags"<< $Logger__prefix >>: $1"
    else
        echo $flags"$1"
    fi

    # Disabling color (if param is passed)
    if [ ! -z "$2" ]; then
        echo -ne "$Logger_standard_color"
    fi
}

#################################################
# Logs a message in the standard color
#
# @param $1: The message to log
# @param $2: Any echo flags
#################################################
Logger__log() {
    Logger_log "$1" "$Logger_standard_color" "$2"
}

#################################################
# Logs a message in the warning color
#
# @param $1: The message to log
# @param $2: Any echo flags
#################################################
Logger__warning() {
    Logger_log "$1" "$Logger_warning_color" "$2"
}

#################################################
# Logs a message in the error color
#
# @param $1: The message to log
# @param $2: Any echo flags
#################################################
Logger__error() {
    Logger_log "$1" "$Logger_error_color" "$2"
}

#################################################
# Logs a message in the success color
#
# @param $1: The message to log
# @param $2: Any echo flags
#################################################
Logger__success() {
    Logger_log "$1" "$Logger_success_color" "$2"
}

#################################################
# Logs a message in the alert color
#
# @param $1: The message to log
# @param $2: Any echo flags
#################################################
Logger__alert() {
    Logger_log "$1" "$Logger_alert_color" "$2"
}

#################################################
# Calls Logger__alert with no new line
#
# @param $1: The message to log
#################################################
Logger__prompt() {
    Logger__alert "$1" -n
}

#################################################
# Enables the prefix before all logs
#################################################
Logger__enable_prefix() {
    Logger_has_prefix=1
}

#################################################
# Disables the prefix before all logs
#################################################
Logger__disable_prefix() {
    Logger_has_prefix=0
}
