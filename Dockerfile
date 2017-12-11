# Includes BackstopJS 3.x, PhantomJS, SlimerJS (with Firefox ESR), CasperJS, Chromium
FROM node:8.5.0-alpine

# Set environment variables
ENV \
	GULP_VERSION=3.9.1 \
	GRUNT_VERSION=1.0.1 \
	WEBPACK_VERSION=3.8.1 \
	BACKSTOP_CRAWL_VERSION=2.3.1 \
	LIGHTHOUSE_VERSION=2.6.0 \
	# From docksal/backstopjs
	CHROMIUM_VERSION=63.0 \
	CHROME_PATH=/usr/bin/chromium-browser

# From docksal/backstopjs
# Base packages
RUN apk add --no-cache \
	bash \
	curl \
	python \
	# Use GNU grep to avoid compatibility issues (busybox grep uses -r vs -R)
	grep

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

# From docksal/backstopjs
# Chrome (from edge)
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
	"chromium>${CHROMIUM_VERSION}"

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

# Install lighthouse globally
RUN \
	echo -e "\nInstalling lighthouse v${LIGHTHOUSE_VERSION}..." && \
	npm install -g lighthouse@${LIGHTHOUSE_VERSION}
