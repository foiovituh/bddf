#!/bin/bash
readonly EXECUTION_PATH="$(dirname "$0")";
readonly HELP_MESSAGE="$(< "${EXECUTION_PATH}/documentation/HELP.txt")";

show_help_message() {
  printf "%s\n" "$HELP_MESSAGE";
  exit;
}

print_broken_dynamic_dependencies() {
  local default_message="\"has no broken dependencies\"";
  local dynamic_dependencies="$(ldd "$(which "$1")")";
  local broken_dependencies="$(cut -d ' ' -f 1 \
    <<< "$(grep 'not found' <<< "${dynamic_dependencies}")")";

  printf "%s:\n" "$1";
  printf "  - %s\n" ${broken_dependencies:-"$default_message"};
}

[[ $# -ne 2 ]] && show_help_message;

case "$1" in
  "-u")
    print_broken_dynamic_dependencies "$2";
    ;;
  "-d")
    dependencies="$(< "$2")";
    for dependencie in $dependencies; do
      print_broken_dynamic_dependencies "$dependencie";
    done
    ;;
  *)
    show_help_message;
    ;;
esac
