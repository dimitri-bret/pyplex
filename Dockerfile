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

# Default user is cplex
RUN adduser --disabled-password --gecos "" cplex 
USER cplex
WORKDIR /home/cplex
COPY /cplex/run_model.sh /home/run_model.sh

ENV JOB_NAME "job"
ENV EXPERIENCE_NAME "EXP_1"

ENTRYPOINT  /home/run_model.sh ${JOB_NAME} ${EXPERIENCE_NAME}
