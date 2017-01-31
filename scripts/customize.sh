#!/bin/sh
set -uxe

CUSTOMIZE_DIR="/var/customize"
SCRIPT_TO_RUN="run.sh"

# Do we have a copy of customize resources ?
if [ -d "${CUSTOMIZE_DIR}" ] && [ -f "${CUSTOMIZE_DIR}/${SCRIPT_TO_RUN}" ]
then
    (
        # Yes ? Make it executable and run it !
        cd "${CUSTOMIZE_DIR}"
        chmod a+x "./${SCRIPT_TO_RUN}"
        ./${SCRIPT_TO_RUN}
    )
fi

exit 0
