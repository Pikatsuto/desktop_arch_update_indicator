#!/bin/bash
path=$HOME/.desktop_arch_update_indicator

function start {
    while [ true ]
    do
        count_update
        sleep 600
    done
}

function packet_install {
    if [ -e powerpill_present ]
    then
        sudo powerpill $*
    else
        sudo pacman $*
    fi
}

function fix_karnel {
    if [ -e karnel_c ]
    then
        echo "Réinstallation du karnel linux"
        packet_install -Rsucn linux linux-headers
        packet_install -S linux linux-headers
    elif [ -e karnel_l ]
    then
        echo "Réinstallation du karnel linux-lts"
        packet_install -Rsucn linux-lts linux-lts-headers
        packet_install -S linux-lts linux-lts-headers
    elif [ -e karnel_z ]
    then
        echo "Réinstallation du karnel linux-zen"
        packet_install -Rsucn linux-zen linux-zen-headers
        spacket_install -S linux-zen linux-zen-headers
    elif [ -e karnel_t ]
    then
        echo "Réinstallation du karnel linux-tkg-pds"
        packet_install -Rsucn linux-tkg-pds linux-tkg-pds-headers
        packet_install -S linux-tkg-pds linux-tkg-pds-headers
    fi
}

function count_update {
    time_name=$(date +%k:%M:%S)
    nb_update=$(checkupdates | wc -l)

    rm -Rf "$path/image_compile"
    mkdir "$path/image_compile"

    convert update_img.png -gravity North -pointsize 500 -fill white -annotate +0+290 $nb_update arch_update_img_edited.png
    mv "$path/arch_update_img_edited.png" "$path/image_compile/$time_name.png"

    rm "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
    touch "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"

    echo "[Desktop Entry]" >> "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
    echo "" >> "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
    echo "Version=1.0" >> "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
    echo "Type=Application" >> "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
    echo "Terminal=true" >> "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
    echo "Exec=$path/main.sh --update" >> "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
    echo "Name=Update Arch" >> "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
    echo "Icon=$path/image_compile/$time_name.png" >> "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
    desktop-file-validate "$HOME/.local/share/applications/desktop_arch_update_indicator.desktop"
}

function update {
    if [ -e powerpill_present ]
    then
        sudo pacman -Syy && sudo powerpill -Su
    else
        sudo pacman -Syyu
    fi

    if [ -e aur_present ]
    then
        yay -Syyu
    fi

    echo ""
    read -p "Avez vous besoin de fixer le karnel [o/N]: " if_fix_karnel
    if [ $if_fix_karnel == "o" ]
    then
        fix_karnel
    fi
    echo ""
    read -s -n 1 -p "Faite entré pour sortire . . ."
    echo ""
    count_update
}

cd $path

if [ -z "$1" ]
then
    start
else
    if [ $1 == "--start" ]
    then
        start
    elif [ $1 == "--count_update" ]
    then
        count_update
    elif [ $1 == "--update" ]
    then
        update
    fi
fi

exit