#!/bin/bash
set -e #fail fast

#H Sends text messages using Telegram to alert admin of banning.
#H 
#H Usage:
#H 
#H %FILE% -h | %FILE% --help
#H
#H   prints this help and exits
#H
#H %FILE% <start|stop> 
#H
#H   send start / stop messages via Telegram.
#H
#H %FILE% <ban|unban> <IP> <jail>
#H   
#H   send ban / unban messages via Telegram.
#H
#H REQUIRED Environment variables:
#H   - TELEGRAM_API_KEY
#H       Telegram API Token for the specific bot
#H   - TELEGRAM_CHAT_ID
#H       The id of the specific chat where the messages will be sent
#H   - SERVER
#H       The name of the current server
# Arguments:
#   $1: exit code
function helpAndExit() {
  grep "^#H" "$0" | cut -c4- | sed -e "s/%FILE%/$(basename "$0")/g"
  exit "$1"
}

# Send telegram message
# Arguments:
#   $1: the message body
function send_msg() {
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_API_KEY/sendMessage" -d chat_id=$TELEGRAM_CHAT_ID -d text="$1"
}

function main() {
  [[ $# -eq 0 || "$1" == '-h' || "$1" == '--help' ]] && helpAndExit 0
  [[ -z "$TELEGRAM_API_KEY" || -z "$TELEGRAM_CHAT_ID" || -z "$SERVER" ]] && helpAndExit 1
  local msgPrefix="Fail2ban on server '$SERVER' just" 
  case "$1" in 
    start)
      msg="$msgPrefix started."
      ;;
    stop)
      msg="$msgPrefix stoped."
      ;;
    ban)
      [[ -z "$2" || -z "$3" ]] && helpAndExit 1
      msg="$msgPrefix banned ip '$2' for jail '$3'"
      ;;
    unban)
      [[ -z "$2" || -z "$3" ]] && helpAndExit 1
      msg="$msgPrefix unbanned ip '$2' for jail '$3'"
      ;;
    *)
      helpAndExit 1
  esac

  send_msg "$msg"
}

main "$@"
