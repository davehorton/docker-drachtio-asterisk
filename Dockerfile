FROM debian:jessie

RUN apt-get update && apt-get -y --quiet --force-yes upgrade \
    && apt-get install -y --quiet --no-install-recommends wget automake autoconf libtool libtool-bin build-essential pkg-config \
    node-ws libedit-dev uuid-dev libxml2-dev libsqlite3-dev ca-certificates \
    libspeex-dev libspeexdsp-dev libogg-dev libvorbis-dev libasound2-dev portaudio19-dev libcurl4-openssl-dev xmlstarlet bison flex \
    libpq-dev unixodbc-dev libneon27-dev libgmime-2.6-dev liblua5.2-dev liburiparser-dev libxslt1-dev libssl-dev \
    libmysqlclient-dev libbluetooth-dev freetds-dev \
    libsnmp-dev libiksemel-dev libcpg-dev libcfg-dev libnewt-dev libpopt-dev libical-dev libspandsp-dev \
    libresample1-dev libc-client2007e-dev binutils-dev libsrtp0-dev libgsm1-dev doxygen graphviz zlib1g-dev libldap2-dev \
    libfftw3-dev libsndfile1-dev libunbound-dev libnewt-dev \
    bzip2 patch python-dev \
    && apt-get update \
    && cd /usr/local/src \
    && wget -q https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16.2.0-rc1.tar.gz \
    && tar xvfz asterisk-16.2.0-rc1.tar.gz \
    && cd asterisk-16.2.0-rc1 \
    && ./configure --with-jansson-bundled --with-resample  --with-pjproject-bundled \
    && make menuselect.makeopts \
    && menuselect/menuselect --disable-category MENUSELECT_ADDONS menuselect.makeopts \
    && menuselect/menuselect --disable-category MENUSELECT_CEL menuselect.makeopts \
    && menuselect/menuselect --disable-category MENUSELECT_CDR menuselect.makeopts \
    && menuselect/menuselect --disable-category MENUSELECT_OPTS_app_voicemail menuselect.makeopts \
    && menuselect/menuselect --disable chan_mobile menuselect.makeopts \
    && menuselect/menuselect --disable chan_ooh323 menuselect.makeopts \
    && menuselect/menuselect --disable res_config_mysql menuselect.makeopts \
    && menuselect/menuselect --disable app_mysql menuselect.makeopts \
    && menuselect/menuselect --disable cdr_mysql menuselect.makeopts \
    && menuselect/menuselect --disable app_agent_pool  menuselect.makeopts \
    && menuselect/menuselect --disable app_cdr  menuselect.makeopts \
    && menuselect/menuselect --disable app_celgenuserevent  menuselect.makeopts \
    && menuselect/menuselect --disable app_directed_pickup  menuselect.makeopts \
    && menuselect/menuselect --disable app_followme  menuselect.makeopts \
    && menuselect/menuselect --disable app_forkcdr  menuselect.makeopts \
    && menuselect/menuselect --disable app_page  menuselect.makeopts \
    && menuselect/menuselect --disable app_queue  menuselect.makeopts \
    && menuselect/menuselect --disable app_voicemail  menuselect.makeopts \
    && menuselect/menuselect --disable app_dictate  menuselect.makeopts \
    && menuselect/menuselect --disable app_ivrdemo  menuselect.makeopts \
    && menuselect/menuselect --disable app_jack  menuselect.makeopts \
    && menuselect/menuselect --disable app_meetme  menuselect.makeopts \
    && menuselect/menuselect --disable app_minivm  menuselect.makeopts \
    && menuselect/menuselect --disable app_morsecode  menuselect.makeopts \
    && menuselect/menuselect --disable app_osplookup  menuselect.makeopts \
    && menuselect/menuselect --disable app_zapateller  menuselect.makeopts \
    && menuselect/menuselect --disable app_adsiprog  menuselect.makeopts \
    && menuselect/menuselect --disable app_dahdiras  menuselect.makeopts \
    && menuselect/menuselect --disable app_getcpeid  menuselect.makeopts \
    && menuselect/menuselect --disable app_disa  menuselect.makeopts \
    && menuselect/menuselect --disable chan_dahdi  menuselect.makeopts \
    && menuselect/menuselect --disable chan_iax2  menuselect.makeopts \
    && menuselect/menuselect --disable chan_motif  menuselect.makeopts \
    && menuselect/menuselect --disable chan_mgcp  menuselect.makeopts \
    && menuselect/menuselect --disable chan_sip  menuselect.makeopts \
    && menuselect/menuselect --disable chan_skinny  menuselect.makeopts \
    && menuselect/menuselect --disable chan_unistim  menuselect.makeopts \
    && menuselect/menuselect --disable chan_oss  menuselect.makeopts \
    && menuselect/menuselect --disable chan_phone  menuselect.makeopts \
    && menuselect/menuselect --disable res_calendar  menuselect.makeopts \
    && menuselect/menuselect --disable res_calendar_caldav  menuselect.makeopts \
    && menuselect/menuselect --disable res_calendar_ews  menuselect.makeopts \
    && menuselect/menuselect --disable res_calendar_exchange  menuselect.makeopts \
    && menuselect/menuselect --disable res_calendar_icalendar  menuselect.makeopts \
    && menuselect/menuselect --disable res_phoneprov  menuselect.makeopts \
    && menuselect/menuselect --disable res_pjsip_phoneprov_provider  menuselect.makeopts \
    && menuselect/menuselect --disable res_xmpp  menuselect.makeopts \
    && make && make config install \
    && rm -Rf /usr/local/src/asterisk-16.2.0-rc1* \ 
    && apt-get purge -y --quiet --force-yes  --auto-remove wget automake autoconf libtool libtool-bin build-essential pkg-config node-ws cpp cpp-4.9 \
    libasound2-dev portaudio19-dev libcurl4-openssl-dev xmlstarlet bison flex \
    libpq-dev unixodbc-dev libneon27-dev libgmime-2.6-dev liblua5.2-dev libssl-dev \
    libmysqlclient-dev libbluetooth-dev freetds-dev  \
    libsnmp-dev libiksemel-dev libcpg-dev libcfg-dev libnewt-dev libpopt-dev libical-dev libspandsp-dev \
    libresample1-dev libc-client2007e-dev binutils-dev libsrtp0-dev libgsm1-dev doxygen graphviz zlib1g-dev libldap2-dev \
    libfftw3-dev libsndfile1-dev libunbound-dev libnewt-dev \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ \
    && rm -Rf /var/log/* \
    && rm -Rf /var/lib/apt/lists/* 

ADD conf /etc/asterisk

COPY ./entrypoint.sh /

VOLUME /var/lib/asterisk/sounds /var/lib/asterisk/keys /var/spool/asterisk /var/log/asterisk

ENTRYPOINT ["/entrypoint.sh"]

CMD ["asterisk"]

