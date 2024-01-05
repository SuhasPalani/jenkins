FROM jenkins/jenkins

USER root

# Install necessary tools
RUN apt-get update && \
    apt-get install -y python3 python3-pip ansible && \
    apt-get clean && \
    apt-get install -y iputils-ping && \
    rm -rf /var/lib/apt/lists/*

USER jenkins

