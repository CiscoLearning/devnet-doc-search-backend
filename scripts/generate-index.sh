#!/usr/bin/env bash

BASE=$(realpath $(dirname $0)/..)

if [ $# != 2 ]; then
    echo "usage: $0 <source directory> <directory to store index>"
    exit 1
fi

SOURCE=$(realpath $1)
INDEX=$(realpath $2)/index

TARFILE=$(realpath $2)/index.tar.gz

mkdir -p $INDEX

if [ ! -f ${BASE}/com/example/ppm/IndexFiles.class ]; then
    echo "ERROR: Compile the classes first by running compile-classes.sh"
    exit 1
fi

export CLASSPATH=${BASE}/jars/lucene-core-9.1.0.jar:${BASE}/jars/lucene-demo-9.1.0.jar:${BASE}/jars/lucene-queryparser-9.1.0.jar:${BASE}/jars/lucene-analysis-common-9.1.0.jar:${BASE}

if [ -z "${JAVA}" ]; then
    if [ -x /opt/homebrew/Cellar/openjdk/18/bin/java ]; then
        JAVA=/opt/homebrew/Cellar/openjdk/18/bin/java
    else
        JAVA=$(which java)
        if [ $? != 0 ]; then
            echo "ERROR: Unable to locate the java command.  Set environment variable, JAVA to the path to the JRE."
            exit 1
        fi
    fi
fi

cd ${BASE}
${JAVA} com.example.ppm.IndexFiles -index ${INDEX} -docs ${SOURCE} -knn_dict dict/glove.6B.300d.txt

if [ -f $TARFILE ]; then
	rm -f $TARFILE 
fi

tar -zcvf $TARFILE -C $INDEX .

