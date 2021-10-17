FROM debian:11.0-slim
ARG SCRIPT_FILE=customize.sh
COPY $SCRIPT_FILE .
RUN chmod +x ./$SCRIPT_FILE && ./$SCRIPT_FILE && rm ./$SCRIPT_FILE

RUN apt -y install --no-install-recommends g++ gdb
