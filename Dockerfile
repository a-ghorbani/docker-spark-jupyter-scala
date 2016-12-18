FROM aghorbani/spark-anaconda:2.0.2-3.4
MAINTAINER Asghar Ghorbani gorbani59@gmail.com

# Install Scala kernel for Jupyter 
RUN curl -L -o /usr/local/bin/coursier https://raw.githubusercontent.com/alexarchambault/coursier/e70c32f/coursier 
RUN chmod +x /usr/local/bin/coursier
RUN curl -L -o jupyter-scala  https://raw.githubusercontent.com/alexarchambault/jupyter-scala/18b507d/jupyter-scala 
RUN chmod +x jupyter-scala
RUN ./jupyter-scala

# Install R 
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y update
RUN yum install R -y


# Install Java 8u112 
RUN curl -LO "http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm" -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN rpm -i jdk-8u112-linux-x64.rpm
RUN rm jdk-8u112-linux-x64.rpm


# Install Toree 
RUN curl -L https://www.dropbox.com/s/q9o8u010mmvlq8g/toree-0.2.0.dev1.tar.gz?dl=0 -o toree-0.2.0.dev1.tar.gz
RUN /opt/anaconda3/bin/pip install toree-0.2.0.dev1.tar.gz
RUN /opt/anaconda3/bin/jupyter toree install --interpreters=PySpark,SQL,Scala,SparkR

# Install Visulization tools for Jupyter
RUN /opt/anaconda3/bin/conda install vega --channel conda-forge -y
RUN /opt/anaconda3/bin/conda install plotly -y

RUN yum install -y npm
RUN npm install -g bower
RUN /opt/anaconda3/bin/pip install jupyter_declarativewidgets
RUN /opt/anaconda3/bin/jupyter declarativewidgets quick-setup --sys-prefix

RUN /opt/anaconda3/bin/pip install jupyter_dashboards
RUN /opt/anaconda3/bin/jupyter dashboards quick-setup --sys-prefix

VOLUME /notebooks
WORKDIR /notebooks

ADD jupyter_notebook.sh /etc/jupyter_notebook.sh
CMD ["/etc/jupyter_notebook.sh"]

