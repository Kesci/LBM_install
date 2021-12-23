FROM ubuntu:latest

MAINTAINER Widget_An <anchunyu@heywhale.com>

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

ENV LNHOME /opt/LBM_install
RUN apt-get update && apt-get -y upgrade && apt-get autoremove && apt-get autoclean
RUN apt-get install -y build-essential && apt-get -y install gfortran && apt-get -y install git
RUN cd opt && git clone https://github.com/WidgetA/LBM_install.git
RUN cd /opt/LBM_install/model/src/ && make lib
RUN apt-get install wget unzip -y && cd /opt/LBM_install/bs && wget https://file-1258430491.cos.ap-shanghai.myqcloud.com/lbm_data.zip && unzip lbm_data.zip && rm lbm_data.zip
RUN apt-get install wget -y && cd /opt && wget https://github.com/Reference-LAPACK/lapack/archive/refs/tags/v3.10.0.tar.gz && tar -zxvf v3.10.0.tar.gz

ENV LAPACK_HOME /opt/lapack-3.10.0
ENV GFORTRAN_CONVERT_UNIT 'big_endian'
RUN apt-get install -y python3
RUN cd /opt/lapack-3.10.0/ && cp make.inc.example make.inc && sed -i '/lib: lapacklib tmglib/alib: blaslib variants lapacklib tmglib' ./Makefile && sed -i '/lib: lapacklib tmglib/d' ./Makefile && make -j
RUN cd /opt/LBM_install/solver/util/ && make bs