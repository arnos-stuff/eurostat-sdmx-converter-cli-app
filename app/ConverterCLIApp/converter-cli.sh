#!/bin/bash
if type -p java; then
    echo found java executable in PATH
    _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo found java executable in JAVA_HOME     
    _java="$JAVA_HOME/bin/java"
else
    echo "Java does not exist."
    echo "You need Java installation in order to launch Converter application."
    exit 1	
fi

CLASSPATH='./converter-cli.jar;./config/'
$_java -Xmx1024m -cp ${CLASSPATH} com.intrasoft.converterCLI.ConverterCLI ${*}
