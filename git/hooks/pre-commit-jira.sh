#!/bin/bash

commit_msg_file=$1
commit_msg=$(cat $commit_msg_file)

ticket_id=$(git rev-parse --abbrev-ref HEAD | grep -Eo '^(\w+/)?\w+\-[0-9]+' | grep -Eo '\w+\-[0-9]+' | tr "[:lower:]" "[:upper:]")

if [[ -z $ticket_id ]]; then
    exit 0;
fi

case $commit_msg in
"fixup!"*)
    ;&
"amend!"*)
    ;&
"squash!"*)
    ;&
"$ticket_id"*)
    exit 0;
    ;;
esac

echo "$ticket_id $commit_msg" > $commit_msg_file