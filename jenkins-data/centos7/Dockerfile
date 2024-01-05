FROM centos:7

# Install openssh-server and Python 3
RUN yum -y update && \
    yum -y install openssh-server python3 && \
    yum clean all

# Install MySQL
RUN yum -y install mysql && \
    yum clean all

# Create a remote user for SSH access
RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh && \
    chown remote_user:remote_user -R /home/remote_user/.ssh

# Copy SSH public key for the remote user
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

# Set permissions for SSH public key
RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

# Generate SSH host keys
RUN ssh-keygen -A

# Install pip and upgrade AWS CLI
RUN curl -O https://bootstrap.pypa.io/pip/3.6/get-pip.py && \
    python3.6 get-pip.py --user && \
    pip3.6 install awscli --upgrade

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D"]

