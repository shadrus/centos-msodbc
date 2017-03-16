FROM centos:7.3.1611

RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo
RUN exit
RUN yum remove unixODBC-utf16 unixODBC-utf16-devel #to avoid conflicts
RUN yum -y update && yum clean all
RUN ACCEPT_EULA=Y yum -y install msodbcsql-13.1.4.0-1 mssql-tools-14.0.3.0-1 unixODBC-devel && yum clean all
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN source ~/.bashrc