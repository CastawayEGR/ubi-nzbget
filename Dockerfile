FROM registry.access.redhat.com/ubi9/ubi-minimal

ENV APP_DIR=/opt/nzbget

WORKDIR ${APP_DIR}

ADD requirements.txt start.sh .

RUN microdnf install tar gzip python3.9 python-pip -y &&\
	pip3 install --no-cache-dir -r requirements.txt &&\
	rm requirements.txt &&\
	mkdir -p ${APP_DIR}/{downloads,config} &&\
	#curl -sL https://nzbget.net/download/nzbget-latest-bin-linux.run -o nzbget-latest-bin-linux.run &&\
 	curl -sL https://nzbget.com/download/nzbget-latest-bin-linux.run -o nzbget-latest-bin-linux.run &&\
	sh nzbget-latest-bin-linux.run --destdir ${APP_DIR} &&\
	rm nzbget-latest-bin-linux.run &&\
	# cacert.pem fix from https://github.com/nzbget/nzbget/issues/784#issuecomment-931609658
	# curl -sL https://nzbget.net/info/cacert.pem -o ${APP_DIR}/cacert.pem &&\
        sed -i -e "s#^MainDir=.*#MainDir=/downloads#g" \
        	-e "s#^ScriptDir=.*#ScriptDir=/config/scripts#g" \
		${APP_DIR}/nzbget.conf &&\
        mkdir /{config,downloads} &&\
	chgrp -R 0 ${APP_DIR} /downloads /config &&\
	chmod -R g=u ${APP_DIR} /downloads /config &&\
	microdnf clean all

USER 1000

VOLUME /config

EXPOSE 6789

ENTRYPOINT ["./start.sh"]
