FROM gcc:11.2
COPY customize.sh .
RUN scriptPath=./customize.sh && chmod +x $scriptPath && $scriptPath
RUN rm customize.sh

RUN apt -y install gdb