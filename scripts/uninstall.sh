#!/bin/bash

i=ilementary
d=~/.icons

_uninstall () {
    echo "Setting the default icon theme ..."
    gsettings set org.gnome.desktop.interface icon-theme elementary
    echo "Uninstalling the $i icon theme ..."
    rm -rf $d/$i
    if [ -d $d ] && [ -z `ls -A $d` ] ; then
        echo "Removing everything that is no longer needed ..."
        rm -rf $d
    fi
}




_uninstall