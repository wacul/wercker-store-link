#!/bin/sh

error() {
  echo $1 >&2
  exit 1
}

PREFIX=.
if [ -n "${WERCKER_STORE_LINK_PREFIX}" ]; then
  PREFIX=${WERCKER_STORE_LINK_PREFIX}
fi

if [ "${WERCKER_STORE_LINK_TYPE}" = "store" ]; then
  MODE=-s
elif [ "${WERCKER_STORE_LINK_TYPE}" = "restore" ]; then
  MODE=-r
else
  error "type should be 'store' or 'restore'"
fi

/bin/sh ${WERCKER_STEP_ROOT}/store-link ${MODE} ${PREFIX}
