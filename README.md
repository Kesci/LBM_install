# LBM_install

## 项目简介
[原始项目页面](https://ccsr.aori.u-tokyo.ac.jp/~lbm/sub/lbm_4.html)

 Linear Baroclinic Model 简称 LBM，LBM中包含的线性大气模型旨在通过消除动态大气过程中的非线性来帮助理解动态大气中复杂的反馈序列。该模型简化了动力学框架，结果易于解释。

 ## 项目由来
 使用需要去源网站向作者申请使用许可，本项目旨在在容器化持续集成中使用该模型协助内部科研效率。不可用于其他途径。

 ## 项目说明
 为在 ubuntu 20.04 系统下快速安装本模型软件，进行了如下配置修正与更改

 - 在 `Lmake.inc` 文件中设定了系统类型
 - 在 `model/bin/` 与 `/model/lib` 下保留编译所需的空文件夹
 - 修改 `model/src/sysdep/Makedef.linux` 中命令接口定义
 - 修改 `model/src/sysdep/Makefile` 加入 C 代码编译流程

##  安装说明
更多业务参数修改，如分辨率等，参考 Lmake.inc 文件，按顺序执行下列命令
```shell
sudo apt-get install build-essential
sudo apt-get install libc6-dev
sudo apt-get install zlib1g-dev libssl-dev
sudo apt-get install gfortran
sudo apt-get install libnetcdf-dev libnetcdff-dev
export LNHOME=~/ln_solver

```