FROM python:3.10
COPY customize.sh .
RUN scriptPath=./customize.sh && chmod +x $scriptPath && $scriptPath
RUN rm customize.sh

RUN pip install -U pip && pip install pandas matplotlib