#!/bin/bash

function apps_setings {
    cp -Rf ./.desktop_arch_update_indicator ./.desktop_arch_update_indicator_conf
    echo "Paramétrage du programe"
    echo ""

    read -p "Utilisez vous powerpill [o/N]: " if_powerpill
    if [ $if_powerpill == "o" ]
    then
        touch .desktop_arch_update_indicator_conf/powerpill_present
    fi

    read -p "Utilisez vous aur [O/n]: " if_aur
    if [ $if_powerpill != "n" ]
    then
        touch .desktop_arch_update_indicator_conf/aur_present
    fi

    read -p "Utilisez vous le karnel Clasique (linux)[C], Zen[z], LTS[l] ou TKG-PDS (Gaming)[t]: " karnel
    if [ $karnel == "z" ]
    then
        touch .desktop_arch_update_indicator_conf/karnel_z
    elif [ $karnel == "l" ]
    then
        touch .desktop_arch_update_indicator_conf/karnel_l
    elif [ $karnel == "t" ]
    then
        touch .desktop_arch_update_indicator_conf/karnel_t
    else
        touch .desktop_arch_update_indicator_conf/karnel_c
    fi
    echo ""
}

function programe_install {
    echo "Installation du programe"
    rm -Rf $HOME/.desktop_arch_update_indicator
    cp -Rf ./.desktop_arch_update_indicator_conf $HOME/.desktop_arch_update_indicator
    sudo chown $USER $HOME/.desktop_arch_update_indicator
    rm -Rf ./.desktop_arch_update_indicator_conf
    chmod +x $HOME/.desktop_arch_update_indicator/main.sh
}

function servie_install {
    echo "Installation du service"

    sudo rm -Rf "/usr/lib/systemd/user/desktop_arch_update_indicator.service"
    rm -Rf "service/desktop_arch_update_indicator.service"
    touch "service/desktop_arch_update_indicator.service"

    echo "[Unit]" >> "service/desktop_arch_update_indicator.service"
    echo "Description=Arch Update" >> "service/desktop_arch_update_indicator.service"
    echo "" >> "service/desktop_arch_update_indicator.service"
    echo "[Service]" >> "service/desktop_arch_update_indicator.service"
    echo "ExecStart=$HOME/.desktop_arch_update_indicator/main.sh" >> "service/desktop_arch_update_indicator.service"
    echo "" >> "service/desktop_arch_update_indicator.service"
    echo "[Install]" >> "service/desktop_arch_update_indicator.service"
    echo "WantedBy=default.target" >> "service/desktop_arch_update_indicator.service"

    sudo cp -Rf service/desktop_arch_update_indicator.service /usr/lib/systemd/user/desktop_arch_update_indicator.service
    systemctl --user daemon-reload
    systemctl --user enable --now desktop_arch_update_indicator.service
    systemctl --user restart desktop_arch_update_indicator.service
}

apps_setings
programe_install
servie_install
echo ""
echo "Installation fini"