# Includes BackstopJS 3.x, PhantomJS, SlimerJS (with Firefox ESR), CasperJS, Chromium
FROM backstopjs/backstopjs:latest

# Set environment variables
ENV \
	GULP_VERSION=3.9.1

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

# Install shh
RUN \
	echo -e "\nInstalling shh..." && \
	apk add openssh

# Install gulp globally
RUN \
	echo -e "\nInstalling gulp v${GULP_VERSION}..." && \
	npm install -g gulp@${GULP_VERSION}
