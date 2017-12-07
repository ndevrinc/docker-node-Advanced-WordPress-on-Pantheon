FROM debian:jessie

# Set environment variables
ENV \
	GULP_VERSION=3.9.1

ENV \
	GRUNT_VERSION=1.0.1

ENV \
	WEBPACK_VERSION=3.8.1

ENV \
	BACKSTOP_CRAWL_VERSION=2.3.1

ENV \
	LIGHTHOUSE_VERSION=2.6.0

ENV \
	BACKSTOPJS_VERSION=3.0.36

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
	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
	apt-get install -y nodejs

# Install Chrome Browser
RUN \
	echo -e "\nInstalling Chrome.." && \
	apt-get install -y chromium-browser

# Install xvfb
RUN \
	echo -e "\nInstalling xvfb..." && \
	apt-get install -y xvfb

# Install jq
RUN \
	echo -e "\nInstalling jq..." && \
	apt-get install -y jq

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
	echo -e "\nInstalling shh..." && \
	apt-get install -y openssh

# Install rsync
RUN \
	echo -e "\nInstalling rsync..." && \
	apt-get install -y rsync

# Install gulp globally
RUN \
	echo -e "\nInstalling gulp v${GULP_VERSION}..." && \
	npm install -g gulp@${GULP_VERSION}

# Install grunt globally
RUN \
	echo -e "\nInstalling grunt v${GRUNT_VERSION}..." && \
	npm install -g grunt@${GRUNT_VERSION}

# Install backstop-crawl globally
RUN \
	echo -e "\nInstalling backstop-crawl v${BACKSTOP_CRAWL_VERSION}..." && \
	npm install -g backstop-crawl@${BACKSTOP_CRAWL_VERSION}

# Install webpack globally
RUN \
	echo -e "\nInstalling webpack v${WEBPACK_VERSION}..." && \
	npm install -g webpack@${WEBPACK_VERSION}

# Install Lighthouse globally
RUN \
	echo -e "\nInstalling Lighthouse v${LIGHTHOUSE_VERSION}..." && \
	npm install -g lighthouse@${LIGHTHOUSE_VERSION}

RUN \
# Install BackstopJS globally
echo "Installing BackstopJS v${BACKSTOPJS_VERSION}..." && \
npm install -g backstopjs@${BACKSTOPJS_VERSION}