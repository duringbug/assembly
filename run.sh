# 我的宿主机平台是 --platform linux/386，根据不同的平台需要切换
docker build --platform linux/386 -t duringbug/asm:1.0 . && \
# 绝对路径根据需要修改
docker run -v $(pwd):/app --platform linux/386 --name asm01 -d duringbug/asm:1.0
