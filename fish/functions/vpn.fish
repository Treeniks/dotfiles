function vpn
    set arg $argv[1]

    if test "$arg" = "enable"
        sudo wg-quick up proton-XXX

        sleep 1

        sudo ufw enable

        # == RUN ONCE ==
        # sudo ufw default deny outgoing
        # sudo ufw default deny incoming
        # sudo ufw allow out on proton-XXX from any to any
        # sudo ufw allow in on proton-XXX from any to any
        # ==============

        sudo ufw status numbered

        while true
            date
            if natpmpc -a 1 0 udp 60 -g 10.2.0.1 && natpmpc -a 1 0 tcp 60 -g 10.2.0.1
                sleep 45
            else
                echo -e "ERROR with natpmpc command \a"
                break
            end
        end
    else if test "$arg" = "disable"
        sudo ufw disable
        sudo wg-quick down proton-XXX
    else
        echo "Invalid argument."
    end
end
