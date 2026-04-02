FROM gcr.io/oss-fuzz-base/base-builder

# Install build dependencies
RUN apt-get update && apt-get install -y \
    make autoconf automake libtool pkg-config

# Clone your project
RUN git clone https://github.com/Lowlaw4/aRepo01.git $SRC/aRepo1
WORKDIR $SRC/aRepo1

# Copy the build script
COPY build.sh $SRC/
COPY harness.c $SRC/
