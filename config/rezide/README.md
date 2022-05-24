# reZIDE Configuration
We look for configuration files in this order of priority:
<!-- 1. command line flag specified directory -->
<!-- 1. $REZIDE_CONFIG_DIR -->
1. `$XDG_CONFIG_HOME/rezide/`
1. `$HOME/.rezide/`

## directory structure
The directory structure should look just like the examples directory:
```
config_dir
├── python
│   ├── config.toml
│   └── ...
├── rezide-ide
│   ├── config.toml
│   └── ...
├── rezide-documentation
│   ├── config.toml
│   └── ...
└── ...
```

A directory is considered a `layout` if it contains a `config.toml` file.
