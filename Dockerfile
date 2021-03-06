from ubuntu:14.04

# Install dependencies
run apt-get update && \
    apt-get install -y curl git && \
    apt-get build-dep -y emacs24

# Build emacs
arg EMACS_REPOSITORY="git://git.sv.gnu.org/emacs.git"
arg EMACS_BRANCH
run git clone --depth 1 --branch $EMACS_BRANCH $EMACS_REPOSITORY /tmp/emacs && \
    cd /tmp/emacs && \
    ./autogen.sh && \
    ./configure && \
    make -j 8 install && \
    rm -rf /tmp/emacs

workdir /rootfs
entrypoint ["emacs"]
