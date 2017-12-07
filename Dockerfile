# Includes BackstopJS 3.x, PhantomJS, SlimerJS (with Firefox ESR), CasperJS, Chromium
FROM backstopjs/backstopjs:latest

# Set environment variables
ENV \
	BACKSTOP_CRAWL_VERSION=2.3.1

# Run updates
RUN \
	echo -e "\nRunning apk update..." && \
	apk update

# Install jq
RUN \
	echo -e "\nInstalling jq..." && \
	apk add jq

# Install wget
RUN \
	echo -e "\nInstalling wget..." && \
	apk add wget

# Install git
RUN \
	echo -e "\nInstalling git..." && \
	apk add git

# Install ssh
RUN \
	echo -e "\nInstalling shh..." && \
	apk add openssh

# Install rsync
RUN \
	echo -e "\nInstalling rsync..." && \
	apk add rsync

# Install backstop-crawl globally
RUN \
	echo -e "\nInstalling backstop-crawl v${BACKSTOP_CRAWL_VERSION}..." && \
	npm install -g backstop-crawl@${BACKSTOP_CRAWL_VERSION}