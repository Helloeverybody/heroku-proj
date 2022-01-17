FROM python
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean && \
    apt-get install poppler-utils -y && \
    apt-get install tesseract-ocr -y
RUN mkdir analysis-processing
WORKDIR ./analysis-processing
COPY . .
RUN pip install -r ./requirements.txt
WORKDIR ./restapi
RUN python manage.py migrate
RUN python manage.py collectstatic
EXPOSE 8000
