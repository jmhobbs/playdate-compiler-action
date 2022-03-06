#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

echo "::set-output name=version::$(/opt/playdate/bin/pdc --version)"

pdc_args=()

if [ "$3" == "true" ]; then
  pdc_args+=("s")
fi

if [ "$4" == "false" ]; then
  pdc_args+=("u")
fi

echo "Compiling..."
/opt/playdate/bin/pdc -sdkpath /opt/playdate "${pdc_args[@]/#/-}" "$1" "$2"

if [ "$5" == "true" ]; then
  echo "Compressing..."
  tar -c "$2" | gzip > "${2}.tar.gz"
fi

echo "Done!"
