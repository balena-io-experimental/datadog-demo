#!/bin/bash

EXAMPLE_FILE=/etc/datadog-agent/datadog.yaml.example
DEST_FILE=/etc/datadog-agent/datadog.yaml

sed -e "s/api_key:.*/api_key: ${DD_API_KEY}/; s/\# hostname:.*/hostname: ${BALENA_DEVICE_UUID}/" $EXAMPLE_FILE > $DEST_FILE

# FIXME: Hack to get tags in while developing
(echo tags: ; env |grep BALENA | sed -e's/=/:/;s/^/  - /') >> $DEST_FILE

/opt/datadog-agent/bin/agent/agent run
