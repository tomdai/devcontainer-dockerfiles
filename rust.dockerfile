FROM rust:1.55-slim
ARG SCRIPT_FILE=customize.sh
COPY $SCRIPT_FILE .
RUN chmod +x ./$SCRIPT_FILE && ./$SCRIPT_FILE && rm ./$SCRIPT_FILE