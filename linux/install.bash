set -e

pushd "$(dirname "${0}")/.." > /dev/null
  SYSTEM_ROOT="$(pwd)"
popd > /dev/null

source $SYSTEM_ROOT/universal/install.bash

_install "linux"
