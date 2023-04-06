FROM python:3.11.3-slim

ARG SCRIPT_FILE=customize.sh
COPY $SCRIPT_FILE .
RUN chmod +x ./$SCRIPT_FILE && ./$SCRIPT_FILE && rm ./$SCRIPT_FILE

RUN ls -d ~/.gnupg/* | grep -v S.gpg-agent | xargs rm -rf
RUN apt update && apt -y install --no-install-recommends make g++
RUN pip install -U --no-cache-dir pip && pip install --no-cache-dir ipykernel pandas matplotlib bs4 requests
RUN apt update && apt -y remove make g++ && apt -y autoremove --purge && apt -y clean
