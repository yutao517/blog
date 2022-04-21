FROM python:2.7-slim
WORKDIR /app
ADD . /app
VOLUME ["/data_flask"]
RUN pip install --trusted-host pypi.python.org -r requirements.txt
EXPOSE 80
ENV NAME World
ENV AUTHOR wyt
CMD ["python","app.py"]

