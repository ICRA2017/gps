FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
	build-essential git python-pip libprotobuf-dev protobuf-compiler libboost-all-dev \
	&& rm -rf /var/lib/apt/lists

RUN pip install --upgrade pip

RUN pip install --ignore-installed protobuf numpy matplotlib scipy

RUN git clone -b reproducible https://github.com/ICRA2017/gps.git

RUN cd gps && ./compile_proto.sh
