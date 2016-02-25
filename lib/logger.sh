#!/bin/bash

# ===== Constants =====
# Colors
Logger_STANDARD_COLOR='\033[1;0m'
Logger_ERROR_COLOR='\033[1;31m'
Logger_SUCCESS_COLOR='\033[0;32m'
Logger_ALERT_COLOR='\033[1;34m'
Logger_WARNING_COLOR='\033[1;35m'

# Files
Logger_PACKAGE="github.com/ash-shell/logger"
Logger_DEFAULT_DEBUG_FILE="$Ash__SOURCE_DIRECTORY/$Ash__CORE_MODULES_DIRECTORY/$Logger_PACKAGE/extras/logger.log"

# ===== Vars =====
Logger_prefix='Logger'
Logger_has_prefix="$Ash__TRUE"

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
    if [ "$Logger_has_prefix" = "$Ash__TRUE" ]; then
        echo $flags "<< $Logger_prefix >>: $message"
    else
        echo $flags "$message"
    fi

    # Disabling color (if param is passed)
    if [ ! -z "$color" ]; then
        echo -ne "$Logger_STANDARD_COLOR"
    fi
}

#################################################
# Returns the appropriate location of our debug
# file.  To set a custom location, set
# LOGGER_DEBUG_FILE in your ~/.ashrc file
#################################################
Logger_get_debug_file() {
    if [[ ! -z "$LOGGER_DEBUG_FILE" ]]; then
        echo "$LOGGER_DEBUG_FILE"
    else
        echo "$Logger_DEFAULT_DEBUG_FILE"
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
    Logger_log "$message" "$Logger_STANDARD_COLOR" "$flags"
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
    Logger_log "$message" "$Logger_WARNING_COLOR" "$flags"
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
    Logger_log "$message" "$Logger_ERROR_COLOR" "$flags"
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
    Logger_log "$message" "$Logger_SUCCESS_COLOR" "$flags"
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
    Logger_log "$message" "$Logger_ALERT_COLOR" "$flags"
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
# Logs to a file, as determined by the
# Logger_get_debug_file function
#
# @param $1: The message to log
#################################################
Logger__debug() {
    # Params
    local message="$1"

    # Determining debug file
    local debug_file=$(Logger_get_debug_file)

    # Logging to file
    local err=""
    if [ "$Logger_has_prefix" = "$Ash__TRUE" ]; then
        err=$({ echo "<< $Logger_prefix >>: $message" >> "$debug_file"; } 2>&1)
    else
        err=$({ echo "$message" >> "$debug_file"; } 2>&1)
    fi

    # Checking for errors
    if [[ "$err" != "" ]]; then
        Logger__error "Unable to log to $debug_file: Permission denied"
    fi
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
    Logger_has_prefix="$Ash__TRUE"
}

#################################################
# Disables the prefix before all logs
#################################################
Logger__disable_prefix() {
    Logger_has_prefix="$Ash__FALSE"
}
