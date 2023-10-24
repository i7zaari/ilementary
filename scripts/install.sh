#!/bin/bash

i=ilementary
d=~/.icons

_download () {
    echo "Getting the latest version of the $i icon theme ..."
    wget -q https://github.com/i7zaari/$i/archive/refs/heads/master.zip -O $i.zip
}

_unzip () {
    if [ -f $i.zip ] ; then
        echo "Unzipping the $i icon theme ..."
        unzip -qq $i.zip
        mv $i-master $i
    fi
}

_install () {
    if [ -d $i ] ; then
        echo "Installing the $i icon theme ..."
        if [ -d $d ] ; then
            cp -rT $i/src $d/$i
        else
            mkdir $d
            cp -rT $i/src $d/$i
        fi
    fi
}

_set () {
    if [ -d $d/$i ] ; then
        echo "Setting the $i icon theme ..."
        gsettings set org.gnome.desktop.interface icon-theme $i
    fi
}

_clean () {
    echo "Removing everything that is no longer needed ..."
    rm -rf $i*
}




_download
_unzip
_install
_set
_clean