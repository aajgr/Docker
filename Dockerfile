FROM ubuntu:latest AS awskeyrotate

RUN \
sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
apt-get -y upgrade && \
apt-get install software-properties-common -y && \
add-apt-repository ppa:rhyeal/aws-rotate-iam-keys && \
apt-get install python3-pip aws-rotate-iam-keys -y && \
pip3 install --upgrade awscli

RUN aws --version >> /root/awsfirstrun.log

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
