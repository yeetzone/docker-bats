#!/usr/bin/env bash

# Exit immediately on non-zero return codes.
set -e

# Use the `bats` command.
set -- bats "$@"

# Execute the command.
exec "$@"
