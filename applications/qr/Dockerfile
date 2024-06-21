FROM python:3.8-alpine

WORKDIR /

COPY requirements.txt ./

RUN apk add --no-cache \
    build-base \
    zlib-dev \
    jpeg-dev \
    gcc \
    musl-dev \
    freetype-dev \
    lcms2-dev \
    openjpeg-dev \
    tiff-dev \
    tk-dev \
    tcl-dev \
    harfbuzz-dev \
    fribidi-dev \
    libimagequant-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libxcb-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev

RUN pip install --no-cache-dir -r requirements.txt
# RUN pip install httptools==0.1.0  
RUN pip install uvloop

COPY . .

EXPOSE 8420

CMD ["uvicorn", "app:atom", "--host", "0.0.0.0", "--port", "8420"]