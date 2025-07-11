#!/bin/bash

mvn clean package -DskipTests
cp ./target/Clinica-0.0.1-SNAPSHOT.jar ./src/main/java/br/ufscar/dc/dsw/
