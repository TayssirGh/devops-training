#!bin/bash

/user/bin/expect << EOD
spawn docker login -u xqliza
send "$1\n"
expect eof
EOD
