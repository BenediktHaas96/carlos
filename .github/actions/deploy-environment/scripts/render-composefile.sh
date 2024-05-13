#!/bin/bash

set -eo pipefail

main() {
  local compose_basefile="$1" 
  local compose_mergefile="$2"
  local compose_outfile="${RENDERCOMPOSE_OUTFILE:-"$compose_basefile"}"
    
  local compose_fileflags="-f $compose_basefile"
  if [[ ! -z "$compose_mergefile" ]]; then
    compose_fileflags+=" -f $compose_mergefile"
  fi

  docker compose $compose_fileflags config -o "$compose_outfile"
}

main "$@"
