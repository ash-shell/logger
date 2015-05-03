# Ash-Logger

Ash-Logger is an [Ash](https://github.com/BrandonRomano/ash) module that offers sensible logging in Bash.

## Getting started

### Ash Users

Ash-Logger is part of the Ash core, so you can just start using it in your Ash modules.

### Non Ash Users

Add in `. {path_to_logger.sh}/logger.sh` to the top of your script and you should be good to go.

## Example Usage

Here's some example usage

```sh
# Importing
. lib/logger.sh

# Logs + Alerts
Logger__log "Standard logs"
Logger__alert "Alerts"

# Custom Prefix
Logger__prefix="Custom Prefix"

# Errors + Warnings
Logger__error "Errors"
Logger__warning "Warnings"

# Or no prefix at all!
Logger__has_prefix=0

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

## License

[MIT](license.txt)
