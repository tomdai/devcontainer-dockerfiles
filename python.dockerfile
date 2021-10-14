FROM python:3.10-slim
COPY customize.sh .
RUN scriptPath=./customize.sh && chmod +x $scriptPath && $scriptPath
RUN rm customize.sh

RUN apt -y install make g++
RUN pip install -U pip && pip install -U --force-reinstall ipykernel pandas matplotlib
