#!/bin/bash
USERS=$@
if [ $# -gt 0 ]; then
    for USERNAME in $USERS; do
        if [[ $USERNAME =~ ^[a-zA-Z+$] ]]; then
            EXUSER=$(cat /etc/passwd | grep -iw $USERNAME | cut -d ":" -f1)
            if [ "$USERNAME" = "$EXUSER" ]; then
                echo "user aready exists , please use ad different name"
            else
                SPEC=$(echo '!@#$%^&*()' | fold -w1 | shuf | head -1)
                PASSWORD=India@${RANDOM}${SPEC}
                echo "creating user:"$USERNAME
                useradd -m $USERNAME
                echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
                passwd -e ${USERNAME}
                echo " Username:${USERNAME} and Password:${PASSWORD}"
            fi
        else
            echo "Input is invalid"
        fi
    done
else
    echo "you have entered $# params , please enter a input"
fi
 