function ssh()
{
    ssh-combine; /usr/bin/ssh $@
}

function rsync()
{
    ssh-combine; /usr/bin/rsync $@
}

function scp()
{
    ssh-combine; /usr/bin/scp "$@"
}

function ssh-combine()
{
    cat $HOME/.ssh/config.d/* > $HOME/.ssh/config
}

function o()
{
    xdg-open "$1"
}

CIVICRM_LOCALES=en_US
