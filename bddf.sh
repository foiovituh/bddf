#!/bin/bash
readonly VERSION='1.0.0'
readonly TRY_HELP_COMMAND="try 'bddf -h' for more information."

echo_and_exit() {
  echo -e "$1"
  exit "$2"
}

warn() {
  echo_and_exit "${1}!\n$TRY_HELP_COMMAND" 1
}

show_help() {
  cat <<EOF
bddf [type of search] [binary name or dependencies file path]

DESCRIPTION:
  checks if system commands have missing shared libraries (.so files).
  useful to detect broken dynamic dependencies via ldd.

TYPE_OF_SEARCH:
  -b <binary_name>          binary name to check
  -d <dependencies_file>    file that contains a list of binaries to check

EXAMPLES:
  bddf -b compton
  bddf -d /home/user/project/dependencies.txt

  DEPENDENCIES_TXT_CONTENT:
    jq
    figlet
    compton

AUTHOR:
  vituh                     <foiovituh@outlook.com>
  gitHub:                   https://github.com/foiovituh
EOF
  exit 0 
}

check() {
  local binary_path="$(which "$1" 2>/dev/null)"

  if [[ -z "$binary_path" ]]; then
    warn "${1}: command not found"
  fi

  if [[ ! -f "$binary_path" ]]; then
    warn "${1}: '$binary_path' is not a regular file"
  fi
  
  local dynamic_dependencies="$(ldd "$binary_path" 2>/dev/null)";
  local broken_dependencies="$(cut -d ' ' -f 1 \
    <<< "$(grep 'not found' <<< "$dynamic_dependencies")")"

  echo "${1}:"

  if [ -z "$broken_dependencies" ]; then
    echo '  - no broken dependencies found'
  else
    for dep in $broken_dependencies; do
      echo "  - ${dep}"
    done
  fi
}

if [[ $# -eq 0 ]]; then
  echo_and_exit "$TRY_HELP_COMMAND" 0
fi

while getopts ":b:d:vh" opt; do
  case "$opt" in
    u) check "$OPTARG" ;;
    d)
      dependencies="$(< "$OPTARG")";

      for dependencie in $dependencies; do
        check "$dependencie";
      done
      ;;
    v) echo_and_exit "bddf version ${VERSION}" 0 ;;
    h) show_help ;;
    \?) warn "invalid option: -${OPTARG}" ;;
    :) warn "the (-${OPTARG}) option requires argument" ;;
  esac
done
