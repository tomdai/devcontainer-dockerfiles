FROM debian:11-slim
COPY customize.sh .
RUN scriptPath=./customize.sh && chmod +x $scriptPath && $scriptPath
RUN rm customize.sh

RUN apt -y install gcc gdb