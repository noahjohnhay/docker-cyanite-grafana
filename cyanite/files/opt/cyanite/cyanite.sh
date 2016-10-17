#!/bin/bash

if [ -f /etc/default/cyanite ]; then
    . /etc/default/cyanite
fi

cat /opt/cyanite/schema.cql | cqlsh us-east-1-dev-dse.cxengagelabs.net

CYANITE_VERSION="0.5.1"

JAR="$EXTRA_CLASSPATH:/opt/cyanite/cyanite-${CYANITE_VERSION}-standalone.jar"
CONFIG="/etc/cyanite.yaml"

EXTRA_JAVA_OPTS="-Xmx1024m -Xms1024m"

exec java $EXTRA_JAVA_OPTS $OPTS -cp "$JAR" io.cyanite "$CONFIG"
