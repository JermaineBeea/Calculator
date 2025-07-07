#!/bin/bash
version="$1"
echo "Building release version $version..."
sed -i -E "0,/<version>[0-9]+\.[0-9]+\.[0-9]+(-SNAPSHOT)?<\/version>/s//<version>${version}<\/version>/" pom.xml
mvn clean package
echo "Release build complete."