# Includes BackstopJS 3.x, PhantomJS, SlimerJS (with Firefox ESR), CasperJS, Chromium
FROM backstopjs/backstopjs:latest

# Set environment variables
ENV \
	GULP_VERSION=3.9.1

ENV \
	GRUNT_VERSION=1.0.1

ENV \
	WEBPACK_VERSION=3.8.1

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
