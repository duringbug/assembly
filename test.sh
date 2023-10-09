# 注意运行前保存文件
docker cp /Volumes/TJF_YINGPAN/class/计算机系统/asm/mstore.s lecture01:/app && \
docker start asm01 && \
docker wait asm01 && \
docker logs asm01
