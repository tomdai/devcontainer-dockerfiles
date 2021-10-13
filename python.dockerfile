FROM debian:stable-slim
COPY customize.sh .
RUN scriptPath=./customize.sh && chmod +x $scriptPath && $scriptPath
RUN rm customize.sh

RUN apt -y install python3-pip && pip install pandas matplotlib