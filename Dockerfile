FROM python:3.8-buster as base

RUN --mount=type=cache,target=/root/.cache/pip,id=cache-pip \
    pip install nuitka numba

WORKDIR /app

COPY mymodule mymodule

### comment these lines to se the code working without nuitka copilation

# compile nuitka
RUN python -m nuitka --module mymodule --include-package mymodule --no-pyi-file
# only keep .so
RUN rm -rf mymodule mymodule.build

###

COPY main.py .

ENTRYPOINT ["python"]
