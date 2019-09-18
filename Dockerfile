FROM oracle/graalvm-ce:19.2.0.1 as graalvm
RUN gu install native-image
