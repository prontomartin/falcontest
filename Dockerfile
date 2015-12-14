FROM centos:6.7
WORKDIR /opt

RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y python-pip
RUN yum install -y python-devel gcc git
RUN pip install --force-reinstall --upgrade cython
RUN pip install --force-reinstall --upgrade falcon
RUN pip install --upgrade gevent gunicorn
RUN mkdir /opt/falcon
RUN git clone https://github.com/falconry/falcon.git /opt/falcon/
RUN pip install /opt/falcon/.
RUN mkdir /opt/falcontest
RUN git clone https://github.com/prontomartin/falcontest.git /opt/falcontest/
#WORKDIR /opt/falcontest/
#RUN gunicorn -b 0.0.0.0:8000 next:app
