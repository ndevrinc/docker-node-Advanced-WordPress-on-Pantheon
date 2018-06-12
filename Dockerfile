FROM node:8-slim

# Set environment variables
ENV \
	JEST_VERSION=23.1.0 \
	GULP_VERSION=4.0.0 \
	GULP_CLI_VERSION=2.0.1 \
	GRUNT_VERSION=1.0.1 \
	WEBPACK_VERSION=3.8.1

# Run updates
RUN \
	echo -e "\nRunning apt-get update..." && \
	apt-get update

# Base packages
RUN \
	echo -e "\nInstalling base packages..." && \
	apt-get install -y git sudo software-properties-common python-software-properties

# See https://crbug.com/795759
RUN apt-get update && apt-get install -yq libgconf-2-4

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y curl \
    && rm -rf /src/*.deb

# It's a good idea to use dumb-init to help prevent zombie chrome processes.
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

# Upgrade NPM
RUN \
	echo -e "\nUpgrading NPM to the latest..." && \
	npm install -g npm@latest

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
	echo -e "\nInstalling gulp $GULP_VERSION..." && \
	npm install -g gulp@${GULP_VERSION}

# Install gulp-cli globally
RUN \
	echo -e "\nInstalling gulp-cli $GULP_CLI_VERSION..." && \
	npm install -g gulp-cli@${GULP_CLI_VERSION}

# Install grunt globally
RUN \
	echo -e "\nInstalling grunt $GRUNT_VERSION..." && \
	npm install -g grunt@${GRUNT_VERSION}

# Install webpack globally
RUN \
	echo -e "\nInstalling webpack $WEBPACK_VERSION..." && \
	npm install -g webpack@${WEBPACK_VERSION}

# Install jest globally
RUN \
	echo -e "\nInstalling jest $JEST_VERSION..." && \
	npm install -g jest@${JEST_VERSION}

# Add user so we don't need --no-sandbox.
RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /node_modules

# Run everything after as non-privileged user.
USER pptruser

ENTRYPOINT ["dumb-init", "--"]