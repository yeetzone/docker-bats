FROM yeetzone/gosu
MAINTAINER YEET Zone <support@yeet.zone>

# Set build arguments.
ARG BATS_USER
ENV BATS_USER ${BATS_USER:-"bats"}
ARG BATS_HOME
ENV BATS_HOME ${BATS_HOME:-"/opt/bats"}
ARG BATS_VERSION
ENV BATS_VERSION ${BATS_VERSION:-1.3.0}

# Add our user/group first to ensure their IDs get set consistently.
RUN set -ex \
	&& groupadd -g 1000 -r $BATS_USER \
	&& useradd -u 1000 -rm -d $BATS_HOME -g $BATS_USER $BATS_USER

# Install everything.
RUN set -ex \
	# Install dependencies.
	&& apt-get update \
	&& apt-get install --yes --no-install-recommends wget ca-certificates gnupg2 dirmngr git \
	# Install bats.
	&& git clone --depth 1 --branch v$BATS_VERSION https://github.com/bats-core/bats-core.git \
	&& cd bats-core \
	&& gosu $BATS_USER ./install.sh $BATS_HOME

# Copy scripts.
COPY /script/bats /usr/local/bin/bats

# Copy entrypoint script.
COPY /entrypoint.sh /

# Set permissions.
RUN set -ex \
	&& chmod +x /entrypoint.sh \
	&& chmod +x /usr/local/bin/bats

# Set entrypoint.
ENTRYPOINT ["/entrypoint.sh"]

# Set command.
CMD ["bats"]
