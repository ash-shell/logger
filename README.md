# Logger

Logger is an [Ash](https://github.com/ash-shell/ash) module that offers sensible logging in Bash.

## Getting started

Ash-Logger is part of the Ash core, so you can just start using it in your Ash modules.

## Example Usage

Here's some example usage:

```sh
# Logs + Alerts
Logger__log "Standard logs"
Logger__alert "Alerts"

# Custom Prefix
Logger__set_prefix "Custom Prefix"

# Errors + Warnings
Logger__error "Errors"
Logger__warning "Warnings"

# Prompts
Logger__prompt "Prompts: "; read variable

# Success
Logger__success "Success: $variable"

# Prefix Switch
Logger__disable_prefix
Logger__warning "No Prefix"
Logger__enable_prefix
Logger__success "Prefix"
```

Outputs:

![Imgur](http://i.imgur.com/lGBwpaa.png?1)

## Logging to a file

Logger supports logging to a file by using `Logger__debug`.

> `Logger__debug` is particularly useful testing things out when in subshells, as you can't normally capture the output in your terminal.

There's already a default file set up for you so you can immediately start using `Logger__debug`, but you can specify the file to log to in your [~/.ashrc file](https://github.com/ash-shell/ash#the-ashrc-file) with the variable `LOGGER_DEBUG_FILE`.

#### logger:watch

To watch the logger file:

```
ash logger:watch
```

#### logger:clear

To clear the logger file of its contents:

```
ash logger:clear
```

## License

[MIT](license.txt)
