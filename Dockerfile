# Includes BackstopJS 3.x, PhantomJS, SlimerJS (with Firefox ESR), CasperJS, Chromium
FROM docksal/backstopjs:3

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

# Install gulp globally
RUN \
	echo -e "\nInstalling gulp v${GULP_VERSION}..." && \
	npm install -g gulp@${GULP_VERSION}