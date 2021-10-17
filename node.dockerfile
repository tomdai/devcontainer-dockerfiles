FROM node:16.11-slim
ARG SCRIPT_FILE=customize.sh
COPY $SCRIPT_FILE .
RUN chmod +x ./$SCRIPT_FILE && ./$SCRIPT_FILE && rm ./$SCRIPT_FILE