FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends poppler-utils && \
    apt-get -y clean && \
    rm -r /var/lib/apt/lists/*

CMD ["pdfunite"]
