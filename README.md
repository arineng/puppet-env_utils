# env_utils
[![Build Status](https://travis-ci.org/jolshevski/puppet-env_utils.svg?branch=master)](https://travis-ci.org/jolshevski/puppet-env_utils)

This Puppet module contains a handful of parser functions that allow reflection of Puppet environment internals from the DSL.

## Environments
```puppet
environments() # => ["production", ...]
```

## Classes
```puppet
# Get all classes in the node's environment
environment_classes() # => ["puppet_enterprise", "apache" ...]

# Get all classes in a specific environment
environment_classes("foo") # => ["puppet_enterprise", ...]
```

## Modules
```puppet
# Get all modules in the node's environment
environment_modules() # => ["nginx", "ntp", ...]

# Get all modules in a specified environment
environment_modules("foo") # => ["nginx", ...]
```

## Development
This module is a work in progress, and has not yet been released on the forge. Feel free to contribute suggestions (in GH issues) or PRs.
