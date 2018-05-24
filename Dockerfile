# Includes BackstopJS 3.x, PhantomJS, SlimerJS (with Firefox ESR), CasperJS, Chromium
FROM backstopjs/backstopjs:latest

# Set environment variables
ENV \
	BACKSTOP_CRAWL_VERSION=2.3.1

# Run updates
RUN \
	echo -e "\nRunning apt-get update..." && \
	 apt-get update

# Install jq
RUN \
	echo -e "\nInstalling jq..." && \
	apt-get install -y jq

# Install wget
RUN \
	echo -e "\nInstalling wget..." && \
	apt-get install -y wget


# Install openssl
RUN \
	echo -e "\nInstalling openssl..." && \
	apt-get install -y openssl

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

# Install backstop-crawl globally
RUN \
	echo -e "\nInstalling backstop-crawl v${BACKSTOP_CRAWL_VERSION}..." && \
	npm install -g backstop-crawl@${BACKSTOP_CRAWL_VERSION}
