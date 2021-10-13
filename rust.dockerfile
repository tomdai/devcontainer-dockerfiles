FROM rust:1.55-slim
COPY customize.sh .
RUN scriptPath=./customize.sh && chmod +x $scriptPath && $scriptPath
RUN rm customize.sh