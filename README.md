# DOT-SUCKLESS (Suckless Programs Setup Script)

This repository contains configurations for dwm (dynamic window manager) and slstatus (status bar) customized for personal use. Below are instructions on how to clone the repository, set up the configurations, and run the installer.

## Cloning the Repository

To clone the repository to your local machine:

```bash
git clone https://github.com/cargopip/dot-suckless.git
cd dot-suckless
```

## Installation Steps

### 1. Verify Dependencies

Ensure that the following dependencies are installed on your system:

- **dwm**: A dynamic window manager for X11.
- **slstatus**: A status bar for dwm.
- **make**: A build automation tool.

### 2. Customize Configuration Files (Optional)

You may customize the following configuration files according to your preferences:

- **slstatus Configuration**:

  - Modify `slstatus/config.h` to adjust which system metrics are displayed in the status bar.

- **dwm Configuration**:
  - Modify `dwm/config.h` to adjust appearance settings, keybindings, and default applications.

### 3. Run the Installer

Navigate to the cloned repository directory and execute the following commands:

```bash
# Assuming your script is named install.sh
chmod +x install.sh  # Make the script executable if not already
./install.sh
```

The `install.sh` script automates the following tasks:

- Creates necessary directories and checks if they already exist.
- Clones dwm, dmenu, and slstatus repositories if they are not already present.
- Copies custom configuration files (`config.h`) to their respective directories.
- Builds and installs dwm, dmenu, and slstatus using `make`.

### 4. Modify Xinitrc (Optional)

If you want to start dwm automatically when starting X, add the following lines to your `~/.xinitrc` file:

```bash
echo "exec dwm" >> ~/.xinitrc
echo "exec slstatus" >> ~/.xinitrc
```

## Contributing

Contributions to enhance or modify the configurations are welcome. To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-enhancement`).
3. Make your changes.
4. Test thoroughly.
5. Commit your changes (`git commit -am 'Add new feature'`).
6. Push to the branch (`git push origin feature-enhancement`).
7. Create a new Pull Request.

## Notes

- Ensure all scripts and commands are executed with appropriate permissions.
- Customizations to keybindings, colors, and layouts can be made in the dwm and slstatus configuration files (`config.h`).
- For issues or questions, please refer to the repository's issue tracker.
