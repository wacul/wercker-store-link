#!/bin/bash

PREFIX=.
if [ -n "${WERCKER_STORE_LINK_PREFIX}" ]; then
  PREFIX=${WERCKER_STORE_LINK_PREFIX}
fi

if [ "${WERCKER_STORE_LINK_TYPE}" = "store" ]; then
  sh ./store-link -s ${PREFIX}
fi

if [ "${WERCKER_STORE_LINK_TYPE}" = "restore" ]; then
  sh ./store-link -r ${PREFIX}
fi
