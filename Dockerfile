# Base Image
FROM alpine:3.1

# Maintainer
MAINTAINER namalhot

# Update Python
RUN apk add --update python py-pip

# Install app dependencies
RUN pip install -r requirements.txt

# Bundle app source
COPY simpleapp.py /src/simpleapp.py

# Port Setup
EXPOSE  8080

RUN chown -R root:root /src &&\
    chmod -R g+rw /src

# Main Command
CMD ["python", "/src/simpleapp.py", "-p 8080"]
