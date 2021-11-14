To create the custom jre
jlink --output my-minimal-runtime --add-modules java.base,java.instrument,java.security.jgss,java.desktop,java.management.rmi,java.sql

To run locally:
In intellij, edit run configuration, point jdk to the custom jre folder

Resources used:
JLink guide:
https://dzone.com/articles/dockerizing-with-a-custom-jre
https://www.baeldung.com/jlink
https://www.devdungeon.com/content/how-create-java-runtime-images-jlink

build docker image with jlink:
https://blog.adoptium.net/2021/08/using-jlink-in-dockerfiles/