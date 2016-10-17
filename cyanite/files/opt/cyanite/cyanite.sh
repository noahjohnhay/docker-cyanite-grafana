#!/bin/bash

if [ -f /etc/default/cyanite ]; then
    . /etc/default/cyanite
fi

cat /opt/cyanite/schema.cql | cqlsh us-east-1-dev-dse.cxengagelabs.net

JAR="/opt/cyanite/cyanite-0.5.1-standalone.jar"
CONFIG="/etc/cyanite.yaml"

EXTRA_JAVA_OPTS="-Xmx1024m -Xms1024m"

exec java $EXTRA_JAVA_OPTS $OPTS -jar "$JAR" -f "$CONFIG"
