

# build the test docker
build:
	docker build -t numba-test:latest .

# run the test docker
run: build
	docker run numba-test:latest main.py

# open a shell in the test docker for analysis
check: build
	docker run -it --entrypoint /bin/bash \
		numba-test:latest
