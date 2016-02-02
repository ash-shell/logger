#!/bin/bash

# Constant
Logger_standard_color='\033[1;0m'
Logger_error_color='\033[1;31m'
Logger_success_color='\033[0;32m'
Logger_alert_color='\033[1;34m'
Logger_warning_color='\033[1;35m'

# Vars
Logger_prefix='Logger'
Logger_has_prefix="$Ash__true"

#################################################
# Logs a message
#
# @param $1: The message to log
# @param $2: The color to log
# @param $3: Any flags to add to the main echo
#################################################
Logger_log() {
    # Params
    local message="$1"
    local color="$2"
    local flags="$3"

    # Setting color (if param is passed)
    if [ ! -z "$color" ]; then
        echo -ne "$color"
    fi

    # Logging
    if [ "$Logger_has_prefix" = "$Ash__true" ]; then
        echo $flags "<< $Logger_prefix >>: $message"
    else
        echo $flags "$message"
    fi

    # Disabling color (if param is passed)
    if [ ! -z "$color" ]; then
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
    # Params
    local message="$1"
    local flags="$2"

    # Logging
    Logger_log "$message" "$Logger_standard_color" "$flags"
}

#################################################
# Logs a message in the warning color
#
# @param $1: The message to log
# @param $2: Any echo flags
#################################################
Logger__warning() {
    # Params
    local message="$1"
    local flags="$2"

    # Logging
    Logger_log "$message" "$Logger_warning_color" "$flags"
}

#################################################
# Logs a message in the error color
#
# @param $1: The message to log
# @param $2: Any echo flags
#################################################
Logger__error() {
    # Params
    local message="$1"
    local flags="$2"

    # Logging
    Logger_log "$message" "$Logger_error_color" "$flags"
}

#################################################
# Logs a message in the success color
#
# @param $1: The message to log
# @param $2: Any echo flags
#################################################
Logger__success() {
    # Params
    local message="$1"
    local flags="$2"

    # Logging
    Logger_log "$message" "$Logger_success_color" "$flags"
}

#################################################
# Logs a message in the alert color
#
# @param $1: The message to log
# @param $2: Any echo flags
#################################################
Logger__alert() {
    # Params
    local message="$1"
    local flags="$2"

    # Logging
    Logger_log "$message" "$Logger_alert_color" "$flags"
}

#################################################
# Calls Logger__alert with no new line
#
# @param $1: The message to log
#################################################
Logger__prompt() {
    # Params
    local message="$1"

    # Logging
    Logger__alert "$message" -n
}

#################################################
# Sets the logger prefix
#
# @param $1: The new prefix
#################################################
Logger__set_prefix() {
    # Params
    local prefix="$1"

    # Logging
    Logger_prefix="$prefix"
}

#################################################
# Enables the prefix before all logs
#################################################
Logger__enable_prefix() {
    Logger_has_prefix="$Ash__true"
}

#################################################
# Disables the prefix before all logs
#################################################
Logger__disable_prefix() {
    Logger_has_prefix="$Ash__false"
}
