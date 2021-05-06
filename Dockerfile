FROM python:3-alpine3.12

# Grab Flask, the most extremely awesome Python module ever!
RUN pip3 install Flask

# Dev tools (can be removed for production)
# RUN apt update && apt install -y vim curl jq

# Copy in the source file
COPY ./web-hello.py /

WORKDIR /
CMD python3 web-hello.py


