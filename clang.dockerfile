FROM debian:11.4-slim

ARG SCRIPT_FILE=customize.sh
COPY $SCRIPT_FILE .
RUN chmod +x ./$SCRIPT_FILE && ./$SCRIPT_FILE && rm ./$SCRIPT_FILE

RUN apt update && apt -y install --no-install-recommends g++ gdb