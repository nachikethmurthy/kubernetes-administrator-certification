FROM --platform=linux/amd64 python:3.10-alpine

# set a directory for the app
WORKDIR /usr/src/app

# copy all the files to the container
COPY . .

# install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# tell the port number the container should expose
EXPOSE 5000

#!/bin/python3
CMD ["python", "./app.py"]