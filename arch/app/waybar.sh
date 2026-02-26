APP_NAME=waybar
if command -v $APP_NAME &> /dev/null; then
    echo "$APP_NAME is already installed. Skipping installation."
else
    echo "$APP_NAME not found. Starting installation..."
    sudo pacman -S $APP_NAME --noconfirm
    echo "$APP_NAME installation completed"
fi
