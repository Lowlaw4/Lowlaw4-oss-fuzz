FROM gcr.io/oss-fuzz-base/base-builder

# Install build dependencies
RUN apt-get update && apt-get install -y \
    make autoconf automake libtool pkg-config

# Clone your project
RUN git clone https://github.com/lowlaw4/arepo01.git $SRC/arepo1
WORKDIR $SRC/arepo1

# Copy the build script
COPY build.sh $SRC/
COPY harness.c $SRC/
