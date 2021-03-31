#Password must be at least 10 chracter, both alphabet and number, both the small and capital case letters.
error=""

if ((${#1}<10))
then echo -e "\033[1;31mPassword must be at least 10 characters"
exit 0
fi

if [[ !($1 =~ (^(.*[a-z].*)$)) ]]
        then
        error="Weak Password, must include a lower case letter"
fi

if [[ !($1 =~ (^(.*[A-Z].*)$)) ]]
        then
        if [[ -z $error ]]
        then
                error="Weak Password, Should include a capital letter"
        else
                error="$error and capital letter"
        fi
fi

if [[ !($1 =~ (^(.*[0-9].*)$)) ]]
        then
        if [[ -z $error ]]
        then
                error="Weak Password, Should include a number"
        else
                error="$error and number"
        fi
fi

if [[ -z $error ]]
then
        echo -e "\\033[1;32mThis is an awesome password!"
        exit 1
else
        echo -e "\033[1;31m$error."
        exit 0
fi