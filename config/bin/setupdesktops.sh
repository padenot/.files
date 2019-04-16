 #!/bin/bash

number_of_workspaces=3

for i in {1..$number_of_workspaces}; do gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]"; done

echo "Disabling dynamic workspaces"
gsettings set org.gnome.shell.overrides dynamic-workspaces false

echo "Setting $number_of_workspaces fixed workspaces"
gsettings set org.gnome.desktop.wm.preferences num-workspaces $number_of_workspaces

for x in `seq 1 $number_of_workspaces` ; do
    echo "Setting hotkeys for workspace $x"
    gsettings set org.gnome.desktop.wm.keybindings \
        switch-to-workspace-$x "[\"<Super>$x\"]"
    gsettings set org.gnome.desktop.wm.keybindings \
        move-to-workspace-$x "[\"<Super><Shift>$x\"]"
done

echo "Done"
echo "~~~~"
echo "Verify Settings:"
gsettings list-recursively org.gnome.shell.overrides | grep dynamic-workspaces
gsettings list-recursively org.gnome.desktop.wm.preferences | grep num-workspaces
gsettings list-recursively org.gnome.desktop.wm.keybindings | grep to-workspace


# disable the super key
gsettings set org.gnome.mutter overlay-key ''
