#!/bin/sh
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['<Super>F8']";
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Super>Left']";
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Super>Right']";
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up', '<Control><Super>Up']";
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down', '<Control><Super>Down']";
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift>Page_Down', '<Control><Shift><Super>Down']";
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift>Page_Up', '<Control><Shift><Super>Up']";
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "[ '<Super>T']";
