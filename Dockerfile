FROM python

LABEL maintainer="dimitri.bret@gmail.com"
LABEL description =  "CPLEX minimal instalation"

ARG COSDIR=/opt/CPLEX
ARG CPX_PYVERSION=3.7

RUN pip install pyomo numpy pandas matplotlib seaborn plotly

COPY /cplex/cplex_studio.bin /tmp/cplex_studio.bin
COPY /cplex/response.properties /tmp/response.properties

RUN chmod u+x /tmp/cplex_studio.bin
RUN /tmp/cplex_studio.bin -f /tmp/response.properties

RUN cd ${COSDIR}/cplex/python/${CPX_PYVERSION}/x86-64_linux && \
	python${CPX_PYVERSION} setup.py install

ENV CPX_VERSION ${CPX_VERSION}

RUN rm -rf /tmp
RUN rm -rf \
   ${COSDIR}/concert \
   ${COSDIR}/cpoptimizer \
   ${COSDIR}/doc \
   ${COSDIR}/opl \
   ${COSDIR}/python \
   ${COSDIR}/Uninstall \
   ${COSDIR}/cplex/examples \
   ${COSDIR}/cplex/include \
   ${COSDIR}/cplex/lib \
   ${COSDIR}/cplex/matlab \
   ${COSDIR}/cplex/readmeUNIX.html

RUN ls -d ${COSDIR}/cplex/python/* | grep -v ${CPX_PYVERSION} | xargs rm -rf
RUN echo "export PATH=${COSDIR}/cplex/bin/x86-64_linux" >> /root/.bashrc

# Default user is cplex
RUN adduser --disabled-password --gecos "" cplex 
USER cplex
WORKDIR /home/model

ENV JOB_NAME "run.sh"
ENV EXPERIENCE_NAME "EXP_1"

ENTRYPOINT python ${JOB_NAME} ${EXPERIENCE_NAME}
