# Includes BackstopJS 3.x, PhantomJS, SlimerJS (with Firefox ESR), CasperJS, Chromium
FROM backstopjs/backstopjs:latest

# Set environment variables
ENV \
	GULP_VERSION=4.0.0

ENV \
	GULP_CLI_VERSION=2.0.1

ENV \
	GRUNT_VERSION=1.0.1

ENV \
	WEBPACK_VERSION=3.8.1

ENV \
	BACKSTOP_CRAWL_VERSION=2.3.1

# Run updates
RUN \
	echo -e "\nRunning apt-get update..." && \
	apt-get update

# Install jq
RUN \
	echo -e "\nInstalling jq..." && \
	apt-get -y install jq

# Install wget
RUN \
	echo -e "\nInstalling wget..." && \
	apt-get -y install wget


# Install openssl
RUN \
	echo -e "\nInstalling openssl..." && \
	apt-get -y install openssl

# Install git
RUN \
	echo -e "\nInstalling git..." && \
	apt-get -y install git

# Install ssh
RUN \
	echo -e "\nInstalling ssh..." && \
	apt-get -y install ssh

# Install rsync
RUN \
	echo -e "\nInstalling rsync..." && \
	apt-get -y install rsync

# Install gulp globally
RUN \
	echo -e "\nInstalling gulp v${GULP_VERSION}..." && \
	npm install -g gulp@${GULP_VERSION}

# Install gulp-cli globally
RUN \
	echo -e "\nInstalling gulp-cli v${GULP_CLI_VERSION}..." && \
	npm install -g gulp-cli@${GULP_CLI_VERSION}

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
