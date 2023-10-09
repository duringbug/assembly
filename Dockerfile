# 使用官方的Ubuntu 18.04作为基础镜像
FROM i386/ubuntu:18.04

# 更新包管理器并安装GCC 7.5.0编译器和32位支持
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y gcc-7 g++-7 gcc-7-multilib g++-7-multilib make && \
    rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 100

# 设置工作目录
WORKDIR /app

# 定义卷，并将其挂载到/app目录
VOLUME /app

# 指定容器启动时要执行的命令
CMD ["sh", "-c", "as -o mstore.o mstore.s && ld -o mstore mstore.o && ./mstore"]