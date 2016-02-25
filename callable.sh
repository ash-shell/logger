#!/bin/bash

#################################################
# This is an alias for the help callable function
#################################################
Logger__callable_main() {
    Logger__callable_help
}

##################################################
# Displays relavant information on how to use
# this module
##################################################
Logger__callable_help() {
    more "$Ash__ACTIVE_MODULE_DIRECTORY/HELP.txt"
}

##################################################
# Clears the debug log file of all contents
##################################################
Logger__callable_clear() {
    > $(Logger_get_debug_file)
}

##################################################
# Watches the debug log file for any changes,
# and outputs them to stdout
##################################################
Logger__callable_watch() {
    tail -f $(Logger_get_debug_file)
}
