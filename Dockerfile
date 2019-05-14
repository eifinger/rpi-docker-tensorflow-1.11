FROM balenalib/raspberrypi3-python
RUN [ "cross-build-start" ]
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3-pip python3-setuptools libhdf5-dev libc-ares-dev libeigen3-dev
RUN pip3 install keras_applications==1.0.7 --no-deps && \
    pip3 install keras_preprocessing==1.0.9 --no-deps && \
    pip3 install h5py==2.9.0 wheel
RUN apt-get install -y openmpi-bin libopenmpi-dev
RUN pip3 uninstall tensorflow
RUN wget -O tensorflow-1.11.0-cp35-cp35m-linux_armv7l.whl https://github.com/PINTO0309/Tensorflow-bin/raw/master/tensorflow-1.11.0-cp35-cp35m-linux_armv7l_jemalloc_multithread.whl
RUN pip3 install tensorflow-1.11.0-cp35-cp35m-linux_armv7l.whl
RUN [ "cross-build-end" ]
ENTRYPOINT ["/bin/bash"]
