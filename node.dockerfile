FROM node:18.11.0-slim

ARG SCRIPT_FILE=customize.sh
COPY $SCRIPT_FILE .
RUN chmod +x ./$SCRIPT_FILE && ./$SCRIPT_FILE && rm ./$SCRIPT_FILE

RUN ls -d ~/.gnupg/* | grep -v S.gpg-agent | xargs rm -rf