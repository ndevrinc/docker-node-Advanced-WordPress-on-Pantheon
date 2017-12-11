FROM debian:jessie

# Set environment variables
ENV \
	GULP_VERSION=3.9.1 \
	GRUNT_VERSION=1.0.1 \
	WEBPACK_VERSION=3.8.1 \
	YARN_VERSION=1.3.2 \
	LIGHTHOUSE_VERSION=2.6.0

# Run updates
RUN \
	echo -e "\nRunning apt-get update..." && \
	apt-get update

# Install curl
RUN \
	echo -e "\nInstalling curl..." && \
	apt-get install -y curl

# Install Node 8
RUN \
	echo -e "\nInstalling Node 8..." && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs

# Install wget
RUN \
	echo -e "\nInstalling wget..." && \
	apt-get install -y wget

# Install git
RUN \
	echo -e "\nInstalling git..." && \
	apt-get install -y git

# Install ssh
RUN \
	echo -e "\nInstalling ssh..." && \
	apt-get install -y ssh

# Install rsync
RUN \
	echo -e "\nInstalling rsync..." && \
	apt-get install -y rsync

# Install Google Chrome
RUN \
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt-get update && \
	apt-get install google-chrome-stable

# Install gulp globally
RUN \
	echo -e "\nInstalling gulp v${GULP_VERSION}..." && \
	npm install -g gulp@${GULP_VERSION}

# Install grunt globally
RUN \
	echo -e "\nInstalling grunt v${GRUNT_VERSION}..." && \
	npm install -g grunt@${GRUNT_VERSION}

# Install webpack globally
RUN \
	echo -e "\nInstalling webpack v${WEBPACK_VERSION}..." && \
	npm install -g webpack@${WEBPACK_VERSION}

# Install yarn globally
RUN \
	echo "Installing yarn v${YARN_VERSION}..." && \
	npm install -g yarn@${YARN_VERSION}

# Install lighthouse globally
RUN \
	echo -e "\nInstalling lighthouse v${LIGHTHOUSE_VERSION}..." && \
	npm install -g lighthouse@${LIGHTHOUSE_VERSION}