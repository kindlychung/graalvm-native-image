FROM oracle/graalvm-ce:latest as graalvm
RUN gu install native-image
