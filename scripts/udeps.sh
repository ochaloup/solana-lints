#! /bin/bash

# set -x
set -euo pipefail

if [[ $# -ne 0 ]]; then
    echo "$0: expect no arguments" >&2
    exit 1
fi

SCRIPTS="$(dirname "$(realpath "$0")")"
WORKSPACE="$(realpath "$SCRIPTS"/..)"

cd "$WORKSPACE"

for X in $(find . -name Cargo.toml); do
    pushd "$(dirname "$X")"
    cargo udeps --all-targets
    popd
done
