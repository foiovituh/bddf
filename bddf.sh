#!/bin/bash
readonly EXECUTION_PATH="$(dirname "$0")";

print_broken_dynamic_dependencies() {
    dynamic_dependencies="$(ldd "$(which "$1")")";
    broken_dependencies="$(echo "$dynamic_dependencies" \
      | grep "not found" \
      | cut -d ' ' -f 1)";
    
    if [[ ! -z "$broken_dependencies" ]]; then
      printf "%s:\n" "$1";
      printf "  - %s\n" ${broken_dependencies##* };
    fi
}

case "$1" in
  "-u")
    print_broken_dynamic_dependencies "$2";
    ;;
  "-d")
    for dependencie in $(cat "$2"); do
      print_broken_dynamic_dependencies "$dependencie";
    done
    ;;
  *)
    printf "%s\n" "$(cat "${EXECUTION_PATH}/documentation/HELP.txt")";
    ;;
esac
